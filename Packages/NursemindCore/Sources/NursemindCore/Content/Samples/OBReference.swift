import Foundation

// Curated OB reference entries — Open RN Maternity Nursing (CC BY 4.0) and CDC
// public-domain content. Pre-launch tier-A review pending for high-risk
// items (PPH, preeclampsia, fetal HR).

private let openrnMaternity = CitationSource(
    id: "openrn_maternity",
    shortName: "Open RN Maternity Nursing — Postpartum & Antepartum chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmaternal/?s=postpartum+hemorrhage+preeclampsia",
    lastRetrieved: "2026-05-04"
)

private let cdcPregnancy = CitationSource(
    id: "cdc_pregnancy",
    shortName: "CDC — Hear Her Maternal Warning Signs",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/hearher/maternal-warning-signs/index.html",
    lastRetrieved: "2026-05-04"
)

private let cdcHearHerHypertension = CitationSource(
    id: "cdc_hypertension_pregnancy",
    shortName: "CDC — Hypertensive Disorders in Pregnancy",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/maternal-mortality/php/data-research/hypertensive-disorders.html",
    lastRetrieved: "2026-05-04"
)

// MARK: - Maternal Vital Signs

public enum MaternalVitalSignsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "maternal-vital-signs",
        title: "Maternal vital signs in pregnancy",
        subtitle: "Normal physiologic shifts and red flags by trimester",
        eyebrow: "REFERENCE · OB",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .prose(title: "Why pregnancy vitals differ", AttributedProse("Pregnancy creates physiologic shifts that change what's normal. Heart rate rises 10–20 bpm by the third trimester. Blood pressure typically drops mid-pregnancy then returns to baseline. Applying non-pregnant ranges leads to missed compensation and missed warning signs.", citationIDs: ["openrn_maternity"])),
            .keyValueTable(title: "Heart rate (resting, beats/min)", [
                KeyValueRow(key: "Pre-pregnancy baseline", value: "60–100"),
                KeyValueRow(key: "First trimester", value: "70–95 (~10 bpm rise)"),
                KeyValueRow(key: "Second trimester", value: "80–100"),
                KeyValueRow(key: "Third trimester", value: "85–110 (peak ~10–20 bpm above baseline)"),
                KeyValueRow(key: "Postpartum (first 24 hr)", value: "Bradycardia common (50–70) — autotransfusion of uterine blood")
            ]),
            .keyValueTable(title: "Blood pressure (mmHg)", [
                KeyValueRow(key: "First trimester", value: "Near baseline"),
                KeyValueRow(key: "Mid-pregnancy nadir (~20–24 weeks)", value: "Drops 5–10 mmHg systolic, more diastolic"),
                KeyValueRow(key: "Third trimester", value: "Returns toward baseline"),
                KeyValueRow(key: "Hypertension threshold", value: "≥140/90 on two occasions ≥4 hr apart"),
                KeyValueRow(key: "Severe hypertension", value: "≥160/110 — treat urgently")
            ]),
            .keyValueTable(title: "Respiratory rate", [
                KeyValueRow(key: "Pre-pregnancy", value: "12–20 breaths/min"),
                KeyValueRow(key: "Pregnancy", value: "16–24 (subjective dyspnea common from progesterone-driven hyperventilation)")
            ]),
            .bullets(title: "Maternal red flags — escalate", [
                AttributedBullet("Severe hypertension (≥160/110) — risk of stroke; treat with IV labetalol or hydralazine per protocol.", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("Headache that won't go away or vision changes (spots, blur, flashing lights) — concern for preeclampsia.", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("Sudden swelling of face/hands; rapid weight gain (>2 lb/week) in second/third trimester.", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("RUQ or epigastric pain — concern for HELLP / hepatic distention.", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("Decreased fetal movement (count <10 movements in 2 hr after 28 weeks).", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Heavy vaginal bleeding (saturating a pad in <1 hr) — placental abruption, previa, postpartum hemorrhage.", citationIDs: ["cdc_pregnancy"]),
                AttributedBullet("Chest pain, severe shortness of breath at rest — VTE, pulmonary edema, peripartum cardiomyopathy.", citationIDs: ["cdc_pregnancy"])
            ]),
            .prose(title: "Postpartum vitals", AttributedProse("Bradycardia (50–70 bpm) is normal in the first 24 hr postpartum from autotransfusion as the uterus involutes. Tachycardia (>100) is NOT — it's an early sign of postpartum hemorrhage before BP drops. Always investigate.", citationIDs: ["openrn_maternity"]))
        ],
        citations: [openrnMaternity, cdcPregnancy, cdcHearHerHypertension],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Preeclampsia

public enum PreeclampsiaReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "preeclampsia",
        title: "Preeclampsia",
        subtitle: "Hypertensive disorder of pregnancy — assessment and escalation",
        eyebrow: "REFERENCE · OB",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .prose(title: "Definition", AttributedProse("New-onset hypertension (≥140/90 on two occasions ≥4 hr apart) plus either proteinuria OR end-organ dysfunction (low platelets, elevated liver enzymes, kidney injury, pulmonary edema, neurologic symptoms) after 20 weeks gestation.", citationIDs: ["cdc_hypertension_pregnancy"])),
            .bullets(title: "Severe-features criteria — any one is severe", [
                AttributedBullet("BP ≥160/110 on two occasions ≥4 hr apart (or sooner if treated).", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("Platelets <100,000.", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("Liver enzymes ≥2× upper limit of normal, OR severe persistent RUQ/epigastric pain.", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("Serum creatinine >1.1 mg/dL or doubling from baseline.", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("Pulmonary edema.", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("New cerebral or visual symptoms (severe headache, vision changes, altered mentation).", citationIDs: ["cdc_hypertension_pregnancy"])
            ]),
            .bullets(title: "Nursing assessment priorities", [
                AttributedBullet("BP every 15 min during severe hypertension; otherwise every 1–4 hr per protocol.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Deep tendon reflexes (DTRs) — hyperreflexia or clonus precedes seizure (eclampsia).", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Urine output — oliguria (<30 mL/hr or <500 mL/24 hr) suggests worsening renal involvement.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Proteinuria via dipstick or 24-hr collection.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Headache, vision changes, RUQ pain — CNS or hepatic worsening.", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("Fetal heart rate monitoring — uteroplacental insufficiency lowers FHR variability.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Daily weights — rapid gain suggests fluid retention.", citationIDs: ["openrn_maternity"])
            ]),
            .bullets(title: "Common medications", [
                AttributedBullet("Magnesium sulfate IV: seizure prophylaxis. Loading dose typically 4–6 g IV over 20–30 min, then 1–2 g/hr maintenance per facility protocol.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Antihypertensives for severe BP: IV labetalol, IV hydralazine, or oral nifedipine immediate-release.", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("Calcium gluconate at the bedside — antidote for magnesium toxicity.", citationIDs: ["openrn_maternity"])
            ]),
            .bullets(title: "Magnesium toxicity — watch for", [
                AttributedBullet("Loss of patellar reflexes (typically at serum Mg ~10 mg/dL).", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Respiratory depression (RR <12) — concerning at Mg ~12 mg/dL.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Cardiac arrest at Mg ~25 mg/dL.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Therapeutic range typically 4–7 mg/dL. Stop infusion and notify provider for any toxicity sign; calcium gluconate is the antidote.", citationIDs: ["openrn_maternity"])
            ]),
            .prose(title: "Definitive treatment", AttributedProse("Delivery of the placenta is the only definitive treatment. Timing balances maternal severity, gestational age, and fetal status. Severe features at any gestational age typically prompt delivery; mild preeclampsia at term also prompts delivery.", citationIDs: ["openrn_maternity"]))
        ],
        citations: [openrnMaternity, cdcHearHerHypertension],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Postpartum Hemorrhage

public enum PostpartumHemorrhageReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "postpartum-hemorrhage",
        title: "Postpartum hemorrhage (PPH)",
        subtitle: "Recognize early — uterine atony is the leading cause",
        eyebrow: "REFERENCE · OB",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .prose(title: "Definition", AttributedProse("Cumulative blood loss ≥1000 mL OR blood loss accompanied by signs of hypovolemia within 24 hours of birth, regardless of route. The leading cause of preventable maternal death worldwide.", citationIDs: ["cdc_pregnancy"])),
            .keyValueTable(title: "Causes — the 4 T's", [
                KeyValueRow(key: "Tone (~70%)", value: "Uterine atony — the most common cause"),
                KeyValueRow(key: "Trauma (~20%)", value: "Cervical, vaginal, or perineal lacerations; uterine rupture"),
                KeyValueRow(key: "Tissue (~10%)", value: "Retained placental fragments"),
                KeyValueRow(key: "Thrombin (<1%)", value: "Coagulopathy (DIC, inherited)")
            ]),
            .bullets(title: "Early recognition — assess every 15 min postpartum", [
                AttributedBullet("Fundus: should be firm, midline, at or below umbilicus. Boggy fundus = atony. Massage immediately.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Lochia: saturating a pad in <1 hr is excessive. Quantify (weigh pads — 1 g = 1 mL).", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Vital signs: tachycardia precedes hypotension. HR >110 in postpartum patient is concerning even with normal BP.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Skin: cool, clammy, pale — late sign of hypovolemia.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Mental status: anxiety, restlessness — early signs of hypoperfusion.", citationIDs: ["openrn_maternity"])
            ]),
            .numberedSteps(title: "Initial actions for atony", [
                "Fundal massage — firm, two-handed, with bladder empty.",
                "Empty bladder (full bladder displaces uterus and prevents contraction). Insert straight cath if needed.",
                "Call for help — notify provider, charge nurse, blood bank.",
                "Establish two large-bore IVs (≥18 gauge); start IV fluids.",
                "Administer uterotonic per orders (oxytocin first-line; methergine, hemabate, or misoprostol next).",
                "Send labs: CBC, type and crossmatch, fibrinogen, coags.",
                "Quantify blood loss continuously (weigh pads, drapes, sponges).",
                "Prepare for OR if bleeding doesn't respond to medical management."
            ], citationIDs: ["openrn_maternity"]),
            .keyValueTable(title: "Uterotonic ladder (per orders, contraindications matter)", [
                KeyValueRow(key: "Oxytocin (Pitocin)", value: "First-line. 10–40 units in 500–1000 mL IV fluid; or 10 units IM. NO contraindications other than allergy."),
                KeyValueRow(key: "Methergine (methylergonovine)", value: "0.2 mg IM. AVOID in hypertension or preeclampsia (can spike BP)."),
                KeyValueRow(key: "Hemabate (carboprost / 15-methyl PGF2α)", value: "0.25 mg IM, may repeat every 15–90 min up to 8 doses. AVOID in asthma (bronchospasm)."),
                KeyValueRow(key: "Misoprostol (Cytotec)", value: "800–1000 mcg PR or 600 mcg PO. No major contraindications.")
            ]),
            .bullets(title: "Massive transfusion considerations", [
                AttributedBullet("Activate massive transfusion protocol when blood loss >1500 mL or hemodynamically unstable.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Typical ratio targets: 1:1:1 PRBC : FFP : platelets.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Watch for citrate toxicity (hypocalcemia) with rapid transfusion — calcium replacement may be needed.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Tranexamic acid (TXA) within 3 hours of bleeding onset reduces mortality.", citationIDs: ["openrn_maternity"])
            ])
        ],
        citations: [openrnMaternity, cdcPregnancy],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Fetal Heart Rate Categories

public enum FetalHeartRateSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "fetal-heart-rate",
        title: "Fetal heart rate categories (NICHD)",
        subtitle: "Category I, II, III interpretation and nursing actions",
        eyebrow: "REFERENCE · OB",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .prose(title: "Why these categories matter", AttributedProse("The NICHD three-tier system standardizes FHR interpretation. Category I is reassuring (continue routine care). Category II is the broad indeterminate middle (needs evaluation and intrauterine resuscitation). Category III is non-reassuring (prepare for expedited delivery).", citationIDs: ["openrn_maternity"])),
            .keyValueTable(title: "FHR baseline", [
                KeyValueRow(key: "Normal range", value: "110–160 bpm"),
                KeyValueRow(key: "Bradycardia", value: "<110 bpm for ≥10 min"),
                KeyValueRow(key: "Tachycardia", value: ">160 bpm for ≥10 min"),
                KeyValueRow(key: "Variability — moderate (normal)", value: "6–25 bpm fluctuation"),
                KeyValueRow(key: "Variability — minimal", value: "≤5 bpm — concerning"),
                KeyValueRow(key: "Variability — absent", value: "Undetectable — non-reassuring")
            ]),
            .bullets(title: "Category I — reassuring (all four required)", [
                AttributedBullet("Baseline 110–160 bpm.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Moderate variability (6–25 bpm).", citationIDs: ["openrn_maternity"]),
                AttributedBullet("No late or variable decelerations.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Accelerations may or may not be present (presence is reassuring).", citationIDs: ["openrn_maternity"])
            ]),
            .bullets(title: "Category III — non-reassuring (any one)", [
                AttributedBullet("Absent baseline variability AND recurrent late decelerations.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Absent baseline variability AND recurrent variable decelerations.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Absent baseline variability AND bradycardia.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Sinusoidal pattern — concerning for fetal anemia.", citationIDs: ["openrn_maternity"])
            ]),
            .prose(title: "Category II — indeterminate", AttributedProse("Anything not Category I or III. Most tracings spend time here. Action: evaluate cause, intrauterine resuscitation, and frequent reassessment. Persistent Cat II requires escalation.", citationIDs: ["openrn_maternity"])),
            .keyValueTable(title: "Decelerations — quick recognition", [
                KeyValueRow(key: "Early", value: "Mirror contraction, nadir at peak. Cause: head compression. Reassuring."),
                KeyValueRow(key: "Late", value: "Onset after contraction starts, nadir after peak. Cause: uteroplacental insufficiency. Concerning."),
                KeyValueRow(key: "Variable", value: "Abrupt drop, V/U/W shape, often unrelated to contraction. Cause: cord compression. Action depends on depth/duration."),
                KeyValueRow(key: "Prolonged", value: "≥2 min but <10 min. Investigate cause urgently.")
            ]),
            .numberedSteps(title: "Intrauterine resuscitation — bundle of interventions", [
                "Reposition mother — left lateral first, then right or knee-chest.",
                "Increase IV fluid bolus (typically 500 mL LR).",
                "Stop oxytocin if running.",
                "Apply oxygen 10 L via non-rebreather (use is debated; per facility protocol).",
                "Notify provider.",
                "Sterile vaginal exam — assess for cord prolapse, rapid dilation/descent.",
                "Prepare for expedited delivery if pattern doesn't resolve."
            ], citationIDs: ["openrn_maternity"])
        ],
        citations: [openrnMaternity],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Postpartum Assessment (BUBBLE-LE)

public enum PostpartumAssessmentSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "postpartum-assessment-bubblele",
        title: "Postpartum assessment — BUBBLE-LE",
        subtitle: "Systematic head-to-toe for the first 24–48 hours",
        eyebrow: "REFERENCE · OB",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort),
        sections: [
            .prose(title: "Why a structured exam", AttributedProse("Postpartum changes happen fast. A consistent mnemonic (BUBBLE-LE) keeps the assessment thorough at every shift, on every patient, regardless of route of delivery.", citationIDs: ["openrn_maternity"])),
            .keyValueTable(title: "BUBBLE-LE", [
                KeyValueRow(key: "B — Breasts", value: "Soft → filling → engorged. Assess for cracking, redness, mastitis (unilateral, fever, flu-like). Latch quality if breastfeeding."),
                KeyValueRow(key: "U — Uterus (fundus)", value: "Day 0: at umbilicus. Descends ~1 fingerbreadth/day. Firm, midline. Boggy = atony."),
                KeyValueRow(key: "B — Bladder", value: "Should be empty before fundal exam. Distended bladder displaces uterus. Postvoid residual <100 mL."),
                KeyValueRow(key: "B — Bowels", value: "First BM by ~day 3. Assess for distention, hemorrhoids."),
                KeyValueRow(key: "L — Lochia", value: "Rubra (red, days 1–3) → serosa (pink/brown, days 4–10) → alba (yellow/white, weeks 2–6). Saturating pad in <1 hr is excessive."),
                KeyValueRow(key: "E — Episiotomy / perineum (or C-section incision)", value: "REEDA: Redness, Edema, Ecchymosis, Discharge, Approximation."),
                KeyValueRow(key: "L — Lower extremities", value: "Homan's sign is unreliable. Better: assess for unilateral calf pain, swelling, warmth, redness. DVT risk is elevated postpartum."),
                KeyValueRow(key: "E — Emotional / Edema", value: "Postpartum blues common (peak day 3–5). Postpartum depression / psychosis screening. Generalized edema typically resolves over 1–2 weeks.")
            ]),
            .bullets(title: "Postpartum red flags — call provider", [
                AttributedBullet("Boggy fundus that doesn't firm with massage; saturating pad in <1 hr.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Severe headache, vision changes, severe RUQ pain — late preeclampsia (can occur up to 6 weeks postpartum).", citationIDs: ["cdc_hypertension_pregnancy"]),
                AttributedBullet("Fever ≥38°C / 100.4°F after the first 24 hr — endometritis, mastitis, wound infection.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Unilateral calf pain or swelling — DVT.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Chest pain or sudden shortness of breath — PE, peripartum cardiomyopathy.", citationIDs: ["cdc_pregnancy"]),
                AttributedBullet("Foul-smelling lochia.", citationIDs: ["openrn_maternity"]),
                AttributedBullet("Thoughts of harming self or baby — postpartum psychosis is a psychiatric emergency.", citationIDs: ["openrn_maternity"])
            ])
        ],
        citations: [openrnMaternity, cdcPregnancy, cdcHearHerHypertension],
        lastSourceFidelityReview: "2026-05-04"
    )
}
