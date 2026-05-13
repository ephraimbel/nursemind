import Foundation

// Curator-model procedure + reference entries (round 9 expansion).
// Sources: Open RN Skills + Maternal-Newborn (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), CDC + AAP + AHA + ACOG concept citations.

private let openrnSkR9p = CitationSource(
    id: "openrn_skills_round9",
    shortName: "Open RN Nursing Skills + Maternal-Newborn",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=fundal+NST+newborn+assessment",
    lastRetrieved: "2026-05-04"
)
private let openrnHar9 = CitationSource(
    id: "openrn_ha_round9_proc",
    shortName: "Open RN Health Alterations / Pediatric Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=labor+lochia+CHD+PALS",
    lastRetrieved: "2026-05-04"
)
private let openstaxR9p = CitationSource(
    id: "openstax_round9_proc",
    shortName: "OpenStax Maternal-Newborn / Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/maternal-newborn-nursing",
    lastRetrieved: "2026-05-04"
)
private let acogConceptR9 = CitationSource(
    id: "acog_round9",
    shortName: "ACOG / AWHONN obstetric guidelines (concept citation)",
    publisher: "American College of Obstetricians and Gynecologists",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-04"
)
private let ahaPalsConceptR9 = CitationSource(
    id: "aha_pals_round9",
    shortName: "AHA Pediatric Advanced Life Support (concept citation)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/en/courses/pediatric-advanced-life-support-pals",
    lastRetrieved: "2026-05-04"
)
private let aapConceptR9 = CitationSource(
    id: "aap_round9",
    shortName: "AAP Health Supervision and Newborn Care (concept citation)",
    publisher: "American Academy of Pediatrics",
    license: .factCitationOnly,
    url: "https://publications.aap.org/aapnews",
    lastRetrieved: "2026-05-04"
)

private let safetyR9 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let obProcR9 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion)
private let neoR9 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .safety)
private let chdRefR9 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)

// MARK: - Fundal Massage + Postpartum Assessment

public enum FundalMassageSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "fundal-massage",
        title: "Fundal massage + postpartum perineal / lochia assessment",
        subtitle: "BUBBLE-LE · uterine tone / position · pad weight · perineum",
        nclexTags: obProcR9,
        indications: AttributedProse(
            "Routine postpartum assessment after vaginal or cesarean delivery; identification and management of uterine atony (most common cause of immediate postpartum hemorrhage); guidance on contraception, breastfeeding, perineal care per primary source.",
            citationIDs: ["openrn_skills_round9", "openstax_round9_proc"]
        ),
        contraindications: AttributedProse(
            "Vigorous massage when uterus is well-contracted (firm) is unnecessary and uncomfortable; reposition / educate. Caution after C-section — incision pain; assess uterine tone with gentle palpation.",
            citationIDs: ["openrn_skills_round9"]
        ),
        equipment: [
            AttributedBullet("Clean gloves; perineal pad; weighing scale (1 g = 1 mL of blood for accurate quantification).", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Light source for perineal exam; flashlight if needed.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Documentation tool — postpartum assessment flowsheet.", citationIDs: ["openrn_skills_round9"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order (typically Q15 min × 1 hr, then Q30 min × 1 hr, then Q1 hr × 4, then per shift; varies by facility and risk).", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Privacy; explain procedure; pain control as needed.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Position — supine with knees flexed.", citationIDs: ["openrn_skills_round9"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + don gloves", body: "Clean gloves for perineal exam; standard precautions.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 2, title: "Empty bladder", body: "Assist to bathroom or in/out catheterize; full bladder displaces uterus and contributes to atony per primary source.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 3, title: "BUBBLE-LE assessment", body: "Breasts (engorgement, nipple condition, breastfeeding) · Uterus (tone, height in fingerbreadths above/below umbilicus, position midline vs deviated) · Bladder (distension, last void) · Bowel (sounds, flatus, BM) · Lochia (color, amount, clots) · Episiotomy / perineum (REEDA — Redness, Edema, Ecchymosis, Discharge, Approximation) · Lower extremities (DVT signs — Homan's, calf tenderness, edema; ambulation) · Emotional (bonding, baby blues, postpartum depression screen).", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 4, title: "Fundal palpation", body: "One hand at symphysis to support lower uterus; other hand cups fundus to assess. FIRM (well-contracted) vs BOGGY (atonic). Document height (e.g., \"firm, midline, 1 fingerbreadth below umbilicus\" = 1 FB ↓ U).", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 5, title: "Massage if boggy", body: "Cup fundus and massage in circular motion until firm. EXPRESS clots toward vagina with lower hand. STOP once firm — over-massage causes pain and uterine fatigue.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 6, title: "Quantify blood loss", body: "Weigh perineal pads (1 g = 1 mL); document quantitative blood loss (QBL). Soaking >1 pad in <1 hour = excessive bleeding per primary source.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 7, title: "Lochia assessment", body: "Rubra (bright red, days 1–3) → Serosa (pink/brown, days 4–10) → Alba (yellow/white, weeks 2–6). Foul odor or persistent rubra → endometritis. Bright red bleeding after rubra phase → retained products / atony.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 8, title: "Perineum / episiotomy", body: "Inspect for REEDA; assess hemorrhoids; teach ice / sitz baths / topical witch hazel; perineal cleansing front-to-back per primary source.", citationIDs: ["openrn_skills_round9"])
        ],
        postProcedure: [
            AttributedBullet("Reassess vital signs (early signs of bleeding can be subtle — tachycardia precedes hypotension).", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Pain reassessment; analgesia as needed.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Activate PPH protocol if bleeding excessive — fundal massage, oxytocin / methergine / carboprost, IV access, blood products per facility per primary source.", citationIDs: ["openrn_skills_round9"])
        ],
        documentation: [
            AttributedBullet("Fundus (firm/boggy, position, height); lochia (color, amount, clots, odor); perineum REEDA; QBL; education provided; emotional state.", citationIDs: ["openrn_skills_round9"])
        ],
        watchFor: [
            AttributedBullet("POSTPARTUM HEMORRHAGE — soaking pad in <1 hr; boggy fundus that does not respond to massage; tachycardia + falling BP; activate PPH protocol per primary source.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("ENDOMETRITIS — fever, foul lochia, uterine tenderness; cultures, IV antibiotics.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("VTE / DVT — postpartum is a hypercoagulable state; ambulation, mechanical / pharmacologic prophylaxis.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("POSTPARTUM DEPRESSION / PSYCHOSIS — screen with EPDS; safety planning if positive per primary source.", citationIDs: ["openrn_skills_round9"])
        ],
        citations: [openrnSkR9p, openstaxR9p, acogConceptR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Non-Stress Test (NST) Interpretation

public enum NSTInterpretationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "nst-interpretation",
        title: "Non-stress test (NST) setup and interpretation",
        subtitle: "External fetal monitoring · accelerations · category-based response",
        nclexTags: obProcR9,
        indications: AttributedProse(
            "Antepartum fetal well-being assessment in pregnancies at risk — diabetes, hypertension, post-dates, decreased fetal movement, IUGR, oligohydramnios, multiple gestation, prior stillbirth per primary source.",
            citationIDs: ["openrn_skills_round9", "acog_round9"]
        ),
        contraindications: AttributedProse(
            "None absolute. Active labor → use intrapartum monitoring instead. Uncomfortable supine positioning → switch to lateral.",
            citationIDs: ["openrn_skills_round9"]
        ),
        equipment: [
            AttributedBullet("External tocodynamometer (uterine activity) and ultrasound transducer (FHR); coupling gel; elastic belts.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Recliner or hospital bed allowing left-lateral or semi-Fowler's positioning.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Manual event marker (or patient handheld) to mark fetal movement.", citationIDs: ["openrn_skills_round9"])
        ],
        preProcedure: [
            AttributedBullet("Verify order; confirm gestational age (NST interpretable from ~28 weeks; criteria stricter <32 wk per primary source).", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Maternal vitals; ask about fetal movement, contractions, leaking, bleeding, recent food intake.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Position — left-lateral or semi-Fowler's (avoid supine — vena cava compression).", citationIDs: ["openrn_skills_round9"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Place transducers", body: "Tocodynamometer over fundus to detect contractions; ultrasound transducer over fetal back for clearest FHR signal. Adjust for clear continuous tracing.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 2, title: "Establish baseline", body: "Observe baseline FHR (110–160 bpm normal at term); note variability (absent / minimal / moderate / marked).", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 3, title: "Wait for accelerations", body: "Have patient mark fetal movement. Watch for accelerations — abrupt rise ≥15 bpm above baseline lasting ≥15 seconds in fetuses ≥32 weeks (10 × 10 in fetuses <32 wk) per primary source.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 4, title: "Reactive interpretation", body: "REACTIVE — ≥2 qualifying accelerations within 20 minutes (most common reassuring threshold). Some institutions use 40 minutes if quiet sleep cycle suspected per primary source.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 5, title: "Non-reactive response", body: "If no qualifying accelerations after 40 minutes → NON-REACTIVE; continue monitoring, reposition, consider VAS (vibroacoustic stimulation), and advance to BPP or contraction stress test per provider.", citationIDs: ["openrn_skills_round9"])
        ],
        postProcedure: [
            AttributedBullet("Document reactive vs non-reactive; baseline FHR, variability, accelerations, decelerations, contractions.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Communicate non-reassuring tracings to provider promptly.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Provide patient education on fetal movement counting; warning signs to call (decreased movement, contractions, bleeding, leaking, severe headache).", citationIDs: ["openrn_skills_round9"])
        ],
        documentation: [
            AttributedBullet("Date / time, gestational age, baseline FHR, variability, accelerations / decelerations / contractions, reactive vs non-reactive interpretation, follow-up plan, patient education.", citationIDs: ["openrn_skills_round9"])
        ],
        watchFor: [
            AttributedBullet("NON-REASSURING TRACING — decelerations (variable, late, prolonged), absent / minimal variability, fetal tachycardia or bradycardia; coordinate with provider per primary source.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("LATE DECELERATIONS — uteroplacental insufficiency; reposition, oxygen, IV fluid, stop oxytocin, notify provider immediately.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("VARIABLE DECELERATIONS — cord compression; reposition, amnioinfusion if intrapartum; assess for cord prolapse if rupture of membranes.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Quiet fetal sleep cycle — most common reason for non-reactive NST in healthy fetus; extend monitoring or VAS.", citationIDs: ["openrn_skills_round9"])
        ],
        citations: [openrnSkR9p, acogConceptR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Newborn Assessment

public enum NewbornAssessmentSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "newborn-assessment",
        title: "Newborn assessment (head-to-toe + gestational age)",
        subtitle: "Initial + transitional assessment · Ballard scale · vital signs",
        nclexTags: neoR9,
        indications: AttributedProse(
            "Initial assessment in delivery room (Apgar at 1 and 5 minutes); thorough head-to-toe within first 2 hours of life; gestational-age estimation (Ballard); ongoing transitional and routine well-newborn assessment per primary source.",
            citationIDs: ["openrn_skills_round9", "openstax_round9_proc"]
        ),
        contraindications: AttributedProse(
            "Delay non-emergency interventions during golden-hour skin-to-skin / breastfeeding when possible; resuscitation takes precedence.",
            citationIDs: ["openrn_skills_round9"]
        ),
        equipment: [
            AttributedBullet("Stethoscope (small bell + diaphragm); thermometer (axillary); BP cuff (newborn / preemie); pulse oximeter; weight scale; tape measure; reflex hammer; otoscope; ophthalmoscope.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Warmer or skin-to-skin contact with parent; warm receiving blankets.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Ballard / new-Ballard score chart for gestational-age estimation.", citationIDs: ["openrn_skills_round9"])
        ],
        preProcedure: [
            AttributedBullet("Hand hygiene; warmed hands; warm room; minimize unnecessary handling.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Identify with two identifiers (typically armband and matching parent band); confirm sex with provider order.", citationIDs: ["openrn_skills_round9"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Initial APGAR (1 and 5 min)", body: "Score 0–2 each: Appearance (color), Pulse, Grimace (reflex irritability), Activity (muscle tone), Respirations. 7–10 = normal, 4–6 = needs intervention, 0–3 = resuscitate.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 2, title: "Transitional vitals", body: "HR 110–160 (normal at rest; can be 80 sleeping or 180 crying), RR 30–60, axillary T 36.5–37.5°C; SpO2 — preductal (right hand) reaches >95% by 10 min per primary source.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 3, title: "Anthropometrics", body: "Weight (typical term 2500–4000 g), length (~50 cm), head circumference (~33–35 cm), chest circumference. Plot on growth chart.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 4, title: "Head-to-toe", body: "HEAD — fontanelles (soft, flat, anterior closes 12–18 mo, posterior 2 mo), molding, caput vs cephalohematoma, nasal patency, palate intact (cleft), suck reflex, root reflex. EYES — red reflex (rule out retinoblastoma / cataract). NECK — torticollis. CHEST — clear breath sounds, S1/S2 (murmur often transient), brachial + femoral pulses. ABD — soft, no masses (do NOT palpate suspected Wilms), 3-vessel umbilical cord, bowel sounds. GU — patent anus, urination, meconium passage within 24–48 hr; hypospadias / undescended testes; female labia. EXTREMITIES — Ortolani / Barlow for hip dysplasia, club foot, brachial plexus injury (Erb / Klumpke), clavicle fracture. SKIN — color, jaundice, mongolian spots, milia, erythema toxicum, stork bites. NEURO — primitive reflexes (Moro, palmar grasp, plantar grasp, stepping, Babinski present in newborns).", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 5, title: "Gestational-age (Ballard)", body: "Combine NEUROMUSCULAR (posture, square window, arm recoil, popliteal angle, scarf sign, heel-to-ear) and PHYSICAL (skin, lanugo, plantar surface, breast, eye/ear, genitals) maturity scores; plot on chart for gestational age.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 6, title: "Routine prophylaxis", body: "Erythromycin eye ointment, vitamin K IM, hepatitis B vaccine + HBIG if mother HBsAg positive per primary source.", citationIDs: ["openrn_skills_round9"]),
            ProcedureStep(number: 7, title: "Newborn screening", body: "Hearing screen (OAE / ABR); CCHD pre/postductal pulse-ox screen; metabolic screen (Guthrie card) at 24–48 hr per state.", citationIDs: ["openrn_skills_round9"])
        ],
        postProcedure: [
            AttributedBullet("Skin-to-skin with parent when stable; encourage early breastfeeding within first hour.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("Document complete assessment, gestational age, vital signs, prophylaxis, screens; communicate any abnormality to provider.", citationIDs: ["openrn_skills_round9"])
        ],
        documentation: [
            AttributedBullet("Apgar 1 and 5 min, weight, length, head circumference, vital signs, head-to-toe findings, gestational-age estimate, prophylaxis completed, screens done.", citationIDs: ["openrn_skills_round9"])
        ],
        watchFor: [
            AttributedBullet("RESPIRATORY DISTRESS — grunting, nasal flaring, retractions, cyanosis, tachypnea >60; oxygen, suction, NRP per primary source.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("HYPOTHERMIA → glucose / acid-base derangement; dry promptly, skin-to-skin or warmer.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("HYPOGLYCEMIA — jittery, lethargic, poor feeding; check glucose in at-risk infants (LGA, SGA, IDM, late preterm) per primary source.", citationIDs: ["openrn_skills_round9"]),
            AttributedBullet("JAUNDICE — appears in first 24 hours = pathologic (hemolytic disease) until proven otherwise; transcutaneous bilirubin or serum.", citationIDs: ["openrn_skills_round9"])
        ],
        citations: [openrnSkR9p, openstaxR9p, aapConceptR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Stages of Labor

public enum StagesOfLaborSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "stages-of-labor",
        title: "Stages of labor and cardinal movements",
        subtitle: "Stage 1 (latent / active / transition) · 2 · 3 · 4 · 7 cardinal movements",
        eyebrow: "REFERENCE · OB",
        nclexTags: obProcR9,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Labor is divided into 4 stages, with Stage 1 traditionally subdivided into latent, active, and transition phases. Modern definitions extend latent labor (cervical change <6 cm slower than once defined). The 7 cardinal movements describe the fetus's mechanical descent through the pelvis. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["acog_round9"]
            )),
            .keyValueTable(title: "Stage 1 — onset of labor to full cervical dilation (10 cm)", [
                KeyValueRow(key: "Latent phase (0–6 cm)", value: "Slow cervical change; can last hours-days, especially nulliparous; prolonged latent does NOT mean labor dysfunction by current definitions per primary source"),
                KeyValueRow(key: "Active phase (6–10 cm)", value: "Faster cervical change; typical >1 cm/hr in primigravidas, faster in multips; labor arrest defined by cervical change failure with adequate contractions"),
                KeyValueRow(key: "Transition (8–10 cm)", value: "Most intense; nausea / shaking / urge to push approaching"),
                KeyValueRow(key: "Nursing focus", value: "Hydration, position changes, support person, pain management, IV access if indicated, monitor FHR per stage")
            ]),
            .keyValueTable(title: "Stage 2 — full dilation to delivery of baby", [
                KeyValueRow(key: "Duration", value: "Up to 4 hours nulliparous (with epidural) or 3 hours without; up to 3 hours multiparous (with epidural) or 2 hours without per current ACOG per primary source"),
                KeyValueRow(key: "Pushing", value: "Spontaneous (mother's urge) preferred over coached for many; open-glottis; positions of choice"),
                KeyValueRow(key: "Nursing focus", value: "Continuous FHR; perineal support; coaching; preparation for delivery; warm compresses for perineum; positioning")
            ]),
            .keyValueTable(title: "Stage 3 — delivery of baby to delivery of placenta", [
                KeyValueRow(key: "Duration", value: "Typically 5–30 min; >30 min = retained placenta concern"),
                KeyValueRow(key: "Signs of separation", value: "Lengthening of cord, gush of blood, change in uterine contour"),
                KeyValueRow(key: "Active management", value: "Oxytocin 10 units IM or IV after delivery, controlled cord traction, fundal massage — REDUCES PPH risk per primary source"),
                KeyValueRow(key: "Nursing focus", value: "Monitor for hemorrhage; assess placenta for completeness")
            ]),
            .keyValueTable(title: "Stage 4 — first 1–4 hours postpartum", [
                KeyValueRow(key: "Focus", value: "Maternal hemodynamic stability, uterine tone, lochia, perineum, bonding, breastfeeding initiation"),
                KeyValueRow(key: "Assessments", value: "Fundus + lochia + vital signs Q15 min × 1 hr, then Q30 min × 1 hr per primary source"),
                KeyValueRow(key: "Hemorrhage risk", value: "Highest in this period; activate PPH protocol if soaking pad in <1 hr or boggy fundus refractory to massage")
            ]),
            .keyValueTable(title: "7 cardinal movements (vertex presentation)", [
                KeyValueRow(key: "1. Engagement", value: "Biparietal diameter passes through pelvic inlet"),
                KeyValueRow(key: "2. Descent", value: "Fetus moves downward through pelvis"),
                KeyValueRow(key: "3. Flexion", value: "Chin to chest as resistance increases"),
                KeyValueRow(key: "4. Internal rotation", value: "Occiput rotates from transverse to anterior (most common occiput-anterior)"),
                KeyValueRow(key: "5. Extension", value: "Head extends as it crowns under symphysis"),
                KeyValueRow(key: "6. External rotation (restitution)", value: "Head rotates back to align with shoulders"),
                KeyValueRow(key: "7. Expulsion", value: "Anterior shoulder, then posterior shoulder, then body delivers")
            ]),
            .bullets(title: "Nursing actions across labor", [
                AttributedBullet("Continuous or intermittent FHR monitoring per facility / risk per primary source.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Pain management — non-pharmacologic (positioning, hydrotherapy, breathing) and pharmacologic (IV opioids, epidural).", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("IV access for at-risk patients; PPH preparation in active labor; type / screen.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Document — cervical exams sparingly to reduce infection; FHR, contractions, vital signs, IV intake/output, pain, intervention timing.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("ACTIVE MANAGEMENT of stage 3 reduces PPH risk and is standard care per primary source.", citationIDs: ["acog_round9"])
            ])
        ],
        citations: [acogConceptR9, openrnHar9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lochia + Perineal Healing Reference

public enum LochiaReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "lochia-perineum-reference",
        title: "Lochia and perineal healing (postpartum)",
        subtitle: "Rubra → serosa → alba · REEDA · warning signs",
        eyebrow: "REFERENCE · POSTPARTUM",
        nclexTags: obProcR9,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Lochia is the normal postpartum vaginal discharge representing endometrial sloughing. Its progression through three phases over weeks is a quick bedside indicator of normal involution. Perineal healing (vaginal delivery) follows a predictable course; REEDA is a concise framework for serial assessment. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["acog_round9"]
            )),
            .keyValueTable(title: "Lochia phases", [
                KeyValueRow(key: "Lochia rubra (days 1–3)", value: "Bright red, fleshy odor; some small clots normal; estimate amount as scant / small / moderate / large by perineal pad saturation"),
                KeyValueRow(key: "Lochia serosa (days 4–10)", value: "Pinkish brown, watery; less volume"),
                KeyValueRow(key: "Lochia alba (days 10–14 → 6 wk)", value: "Yellow-white; minimal volume; tapers off"),
                KeyValueRow(key: "Cesarean lochia", value: "Often less in volume but follows the same color progression")
            ]),
            .keyValueTable(title: "Lochia AMOUNT estimation (perineal pad)", [
                KeyValueRow(key: "Scant", value: "1-inch or less stain on pad in 1 hour"),
                KeyValueRow(key: "Small / light", value: "≤4-inch stain in 1 hour"),
                KeyValueRow(key: "Moderate", value: "≤6-inch stain in 1 hour"),
                KeyValueRow(key: "Large / heavy", value: ">6-inch stain in 1 hour OR saturated pad in 2 hr"),
                KeyValueRow(key: "Quantitative blood loss (QBL)", value: "Weigh pads (1 g = 1 mL) for accurate documentation per primary source")
            ]),
            .keyValueTable(title: "REEDA — perineal / episiotomy assessment", [
                KeyValueRow(key: "R — Redness", value: "Mild redness expected days 1–3; persistent / spreading suggests infection"),
                KeyValueRow(key: "E — Edema", value: "Moderate edema typical first 24–48 hr; ice the first 24 hours"),
                KeyValueRow(key: "E — Ecchymosis", value: "Some bruising expected; expanding ecchymosis may indicate hematoma"),
                KeyValueRow(key: "D — Discharge", value: "Serous / serosanguineous typical; PURULENT or FOUL = infection"),
                KeyValueRow(key: "A — Approximation", value: "Suture line edges aligned; gaping or dehiscence requires provider notification")
            ]),
            .keyValueTable(title: "Perineal degree of laceration / episiotomy", [
                KeyValueRow(key: "First-degree", value: "Vaginal mucosa and perineal skin only"),
                KeyValueRow(key: "Second-degree", value: "Includes perineal muscles"),
                KeyValueRow(key: "Third-degree", value: "Extends through anal sphincter"),
                KeyValueRow(key: "Fourth-degree", value: "Through rectal mucosa")
            ]),
            .bullets(title: "Patient teaching for healing", [
                AttributedBullet("Ice pack to perineum for first 24 hours (in 15-min intervals); warm sitz baths after 24 hours per primary source.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Peri-bottle with warm water for cleansing front-to-back after voiding / BM; pat dry.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Topical anesthetic / witch hazel pads (e.g., Tucks) for comfort.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Stool softener (docusate) per primary source — first BM is uncomfortable; prevent straining and breakdown of suture line.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Pelvic-floor exercises (Kegels) once tolerated; pelvic-floor PT for 3rd / 4th degree per primary source.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Tampons / intercourse — defer until provider clears (typically 6 weeks).", citationIDs: ["openrn_ha_round9_proc"])
            ]),
            .bullets(title: "Warning signs to report", [
                AttributedBullet("Saturating >1 pad per hour OR passing clots larger than a golf ball — possible PPH; CALL.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Foul-smelling lochia, fever, pelvic pain — endometritis.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Sudden return of bright red bleeding after lochia has lightened — retained placental fragments.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Perineal increasing pain / swelling / discharge — hematoma or infection.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Severe headache, vision changes, RUQ pain — postpartum preeclampsia (can occur weeks after delivery) per primary source.", citationIDs: ["acog_round9"]),
                AttributedBullet("Calf pain / swelling, dyspnea — DVT / PE.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Mood concerns, intrusive thoughts about harming self / baby — postpartum depression / psychosis emergency per primary source.", citationIDs: ["openrn_ha_round9_proc"])
            ])
        ],
        citations: [acogConceptR9, openrnHar9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cyanotic vs Acyanotic CHD Reference

public enum CHDOverviewSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "chd-overview",
        title: "Congenital heart disease — cyanotic vs acyanotic overview",
        subtitle: "Mechanism · classic examples · ductal-dependent vs not",
        eyebrow: "REFERENCE · PEDIATRIC CARDIOLOGY",
        nclexTags: chdRefR9,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "Congenital heart disease (CHD) is broadly categorized by oxygenation pattern (cyanotic vs acyanotic) and by ductal dependency. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["aap_round9"]
            )),
            .keyValueTable(title: "Acyanotic CHD — left-to-right shunt or obstruction WITHOUT shunt", [
                KeyValueRow(key: "Atrial septal defect (ASD)", value: "Often asymptomatic in childhood; fixed split S2; pulmonary HTN late if untreated"),
                KeyValueRow(key: "Ventricular septal defect (VSD)", value: "Most common CHD; loud holosystolic murmur; CHF symptoms if large"),
                KeyValueRow(key: "Patent ductus arteriosus (PDA)", value: "Continuous \"machinery\" murmur; bounding pulses; CHF if large"),
                KeyValueRow(key: "Atrioventricular (endocardial cushion) defect", value: "Strongly associated with Down syndrome"),
                KeyValueRow(key: "Coarctation of aorta", value: "BP differential UE > LE; weak femoral pulses; can be ductal-dependent in critical neonatal form"),
                KeyValueRow(key: "Aortic / pulmonary stenosis", value: "Obstructive lesions; may need balloon valvuloplasty")
            ]),
            .keyValueTable(title: "Cyanotic CHD — right-to-left shunt or mixing", [
                KeyValueRow(key: "Tetralogy of Fallot (TOF)", value: "Most common cyanotic CHD beyond infancy; tet spells; staged repair"),
                KeyValueRow(key: "Transposition of great arteries (TGA)", value: "Most common cyanotic CHD presenting in first 24 hr; ductal-dependent; PGE1 + arterial switch"),
                KeyValueRow(key: "Truncus arteriosus", value: "Single great vessel arises from heart; CHF + cyanosis; surgical repair"),
                KeyValueRow(key: "Tricuspid atresia", value: "Absent tricuspid valve; ductal-dependent; staged repair"),
                KeyValueRow(key: "Total anomalous pulmonary venous return (TAPVR)", value: "Pulmonary veins drain to systemic circulation; cyanosis + pulmonary congestion"),
                KeyValueRow(key: "Hypoplastic left heart syndrome (HLHS)", value: "Underdeveloped left heart; ductal-dependent; staged Norwood / Glenn / Fontan or transplant")
            ]),
            .keyValueTable(title: "Ductal-dependent CHD (PGE1 = LIFE-SUSTAINING)", [
                KeyValueRow(key: "Ductal-dependent for PULMONARY blood flow", value: "Pulmonary atresia, severe TOF, tricuspid atresia"),
                KeyValueRow(key: "Ductal-dependent for SYSTEMIC blood flow", value: "HLHS, critical coarctation, interrupted aortic arch, critical aortic stenosis"),
                KeyValueRow(key: "Ductal-dependent for MIXING", value: "TGA without VSD or large ASD")
            ]),
            .bullets(title: "Newborn screening with pulse oximetry (CCHD)", [
                AttributedBullet("Pre-ductal (right hand) and post-ductal (foot) SpO2 measured ≥24 hr after birth.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Failed screen — SpO2 <90% in either; OR <95% in BOTH on 3 measures 1 hour apart; OR ≥3% difference between pre- and postductal on 3 measures per primary source.", citationIDs: ["aap_round9"]),
                AttributedBullet("Failed screen → echocardiography per primary source.", citationIDs: ["aap_round9"])
            ]),
            .bullets(title: "Nursing actions across CHD", [
                AttributedBullet("Coordinate emergent transfer to pediatric cardiac center for any neonate with cyanosis / CHF symptoms.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("ALPROSTADIL (PGE1) IV for any suspected ductal-dependent CHD until echo confirms anatomy; INTUBATION-READY (apnea risk).", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("In TOF tet spell — knee-chest position, oxygen, calm + comfort, morphine, IV fluids, phenylephrine if refractory per primary source.", citationIDs: ["aap_round9"]),
                AttributedBullet("Endocarditis prophylaxis for high-risk CHD per primary source — unrepaired cyanotic, prosthetic material first 6 months, residual defects adjacent to prosthetic, prior endocarditis.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Family — coordinate cardiology, social work, palliative care; pre- and post-surgical counseling.", citationIDs: ["openrn_ha_round9_proc"])
            ])
        ],
        citations: [aapConceptR9, openrnHar9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PALS Summary Reference

public enum PALSSummarySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pals-summary",
        title: "Pediatric Advanced Life Support (PALS) summary",
        subtitle: "BLS + arrest algorithms · weight-based dosing · concept reference",
        eyebrow: "REFERENCE · PEDIATRIC CRITICAL CARE",
        nclexTags: chdRefR9,
        sections: [
            .prose(title: "Source + framework", AttributedProse(
                "PALS protocols from the American Heart Association guide pediatric resuscitation. THIS IS A CONCEPT REFERENCE per primary source — for actual code response, follow the current AHA algorithms and your institutional protocol with PALS-trained team members.",
                citationIDs: ["aha_pals_round9"]
            )),
            .keyValueTable(title: "Pediatric BLS quick recall", [
                KeyValueRow(key: "Compression rate", value: "100–120/min for all ages"),
                KeyValueRow(key: "Compression depth", value: "≥1/3 anterior-posterior chest diameter (~1.5 in / 4 cm infant; ~2 in / 5 cm child)"),
                KeyValueRow(key: "Compression : ventilation (single rescuer)", value: "30 : 2 (all ages)"),
                KeyValueRow(key: "Compression : ventilation (two rescuers, child / infant)", value: "15 : 2"),
                KeyValueRow(key: "Pulse check site", value: "Brachial (infant), carotid or femoral (child)"),
                KeyValueRow(key: "Compression depth landmark", value: "Lower half of sternum")
            ]),
            .keyValueTable(title: "Pediatric arrest rhythms — algorithm summary", [
                KeyValueRow(key: "Asystole / PEA", value: "CPR + epinephrine 0.01 mg/kg IV/IO (max 1 mg) every 3–5 min; identify and treat reversible causes (Hs and Ts)"),
                KeyValueRow(key: "Pulseless VT / VF", value: "Defibrillate 2 J/kg → CPR 2 min → 4 J/kg → CPR + epinephrine + amiodarone 5 mg/kg or lidocaine 1 mg/kg"),
                KeyValueRow(key: "Bradycardia (HR <60 with poor perfusion)", value: "CPR; epinephrine if persists; atropine 0.02 mg/kg only for vagal-mediated AV block; pacing for refractory"),
                KeyValueRow(key: "SVT", value: "Vagal maneuvers → adenosine 0.1 mg/kg (max 6 mg) first dose, 0.2 mg/kg (max 12 mg) second dose; cardioversion 0.5–1 J/kg if unstable")
            ]),
            .keyValueTable(title: "Reversible causes (Hs and Ts)", [
                KeyValueRow(key: "Hs", value: "Hypovolemia, Hypoxia, Hydrogen ion (acidosis), Hypo/hyperkalemia, Hypoglycemia, Hypothermia"),
                KeyValueRow(key: "Ts", value: "Toxins, Tamponade (cardiac), Tension pneumothorax, Thrombosis (pulmonary or coronary), Trauma")
            ]),
            .keyValueTable(title: "Common PALS drug doses (weight-based)", [
                KeyValueRow(key: "Epinephrine (cardiac arrest)", value: "0.01 mg/kg IV/IO (1:10,000); 0.1 mg/kg ETT if no IV access"),
                KeyValueRow(key: "Atropine", value: "0.02 mg/kg IV/IO; min 0.1 mg, max 0.5 mg (child) / 1 mg (adolescent)"),
                KeyValueRow(key: "Amiodarone (VT/VF)", value: "5 mg/kg IV/IO bolus during arrest; max 300 mg single dose; can repeat to 15 mg/kg/day"),
                KeyValueRow(key: "Adenosine (SVT)", value: "0.1 mg/kg IV (max 6 mg) first dose; 0.2 mg/kg (max 12 mg) second dose"),
                KeyValueRow(key: "Defibrillation", value: "2 J/kg first; subsequent 4 J/kg or higher (max 10 J/kg or adult dose)"),
                KeyValueRow(key: "Cardioversion (synchronized)", value: "0.5–1 J/kg first; 2 J/kg second")
            ]),
            .bullets(title: "Resuscitation team principles", [
                AttributedBullet("CLOSED-LOOP communication; designated team leader; clear role assignment.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Use Broselow tape or weight-based reference for dosing — pediatric medication errors are common.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Family presence at code — supported by AHA when feasible with a designated family liaison.", citationIDs: ["aha_pals_round9"]),
                AttributedBullet("Debrief team after resuscitation — quality and emotional process.", citationIDs: ["openrn_ha_round9_proc"]),
                AttributedBullet("Stabilization and emergent transfer to pediatric ICU after ROSC.", citationIDs: ["openrn_ha_round9_proc"])
            ])
        ],
        citations: [ahaPalsConceptR9, openrnHar9],
        lastSourceFidelityReview: "2026-05-04"
    )
}
