import Foundation

// Curator-model procedures + reference (round 19 — OB/repro + bone health + nephrology + women's health).

private let openrnPRR19 = CitationSource(
    id: "openrn_pr_round19",
    shortName: "Open RN Maternity + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/maternal/",
    lastRetrieved: "2026-05-04"
)
private let specialtyPRR19 = CitationSource(
    id: "specialty_pr_round19",
    shortName: "ACOG / NAMS / KDIGO / NOF / AUGS concept citations",
    publisher: "ACOG · NAMS · KDIGO · NOF · AUGS",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-04"
)

private let procTagsR19 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR19 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum NSTSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "non-stress-test",
        title: "Non-stress test (NST) + biophysical profile",
        subtitle: "Antenatal fetal surveillance · reactive vs non-reactive · BPP for non-reactive",
        nclexTags: procTagsR19,
        indications: AttributedProse(
            "Antenatal fetal surveillance in pregnancies at increased risk of stillbirth — postdates, hypertensive disorders, diabetes, growth restriction, decreased fetal movement, multiple gestation. Typically initiated at 32–34 weeks; weekly to biweekly per primary source.",
            citationIDs: ["specialty_pr_round19"]
        ),
        contraindications: AttributedProse(
            "No absolute contraindications; relative — preterm prior to viability without management plan.",
            citationIDs: ["specialty_pr_round19"]
        ),
        equipment: [
            AttributedBullet("Electronic fetal monitor (EFM) with external Doppler + tocodynamometer.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Comfortable position (semi-Fowler / left lateral); pillows + blanket.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("BP cuff + maternal vital signs equipment.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Ultrasound for biophysical profile (BPP) if non-reactive NST.", citationIDs: ["specialty_pr_round19"])
        ],
        preProcedure: [
            AttributedBullet("Patient empties bladder; light snack 30 min before may improve fetal activity.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Position semi-Fowler with left lateral tilt to prevent supine hypotension.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Maternal vital signs baseline; document gestational age + indication.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Counsel patient — non-invasive, ~20–40 min, watch for fetal movement.", citationIDs: ["openrn_pr_round19"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Apply EFM", body: "Apply external ultrasound transducer over palpated fetal heart location + tocodynamometer over fundus. Verify good FHR + uterine activity tracing.", citationIDs: ["openrn_pr_round19"]),
            ProcedureStep(number: 2, title: "Maternal markers", body: "Maternal BP + HR; document any contractions reported.", citationIDs: ["openrn_pr_round19"]),
            ProcedureStep(number: 3, title: "Continuous monitoring 20–40 min", body: "Observe FHR baseline (110–160), variability (moderate 6–25 bpm), accelerations (≥15 bpm × 15 sec for term; ≥10 bpm × 10 sec for <32 wks), decelerations (note types).", citationIDs: ["specialty_pr_round19"]),
            ProcedureStep(number: 4, title: "Vibroacoustic stimulation if no accelerations", body: "Acoustic device 1–3 sec on maternal abdomen near fetal head — may stimulate accelerations in sleeping fetus.", citationIDs: ["specialty_pr_round19"]),
            ProcedureStep(number: 5, title: "Interpret", body: "REACTIVE — ≥2 accelerations of ≥15 bpm × 15 sec in 20 min (≥10 bpm × 10 sec for <32 wks). NON-REACTIVE — does not meet criteria after 40 min — proceed to BPP per primary source.", citationIDs: ["specialty_pr_round19"]),
            ProcedureStep(number: 6, title: "BPP if non-reactive", body: "Modified or full BPP — ultrasound for fetal breathing movements, gross body movements, fetal tone, amniotic fluid index. Score 8–10 = reassuring; 4–6 = concerning; ≤4 = consider delivery per primary source.", citationIDs: ["specialty_pr_round19"])
        ],
        postProcedure: [
            AttributedBullet("Document FHR + uterine activity; maternal vital signs.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Schedule next surveillance per indication.", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("Counsel — call for decreased fetal movement, contractions, ROM, bleeding.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("If non-reactive / abnormal — coordinate provider + escalate per facility protocol.", citationIDs: ["openrn_pr_round19"])
        ],
        documentation: [
            AttributedBullet("Indication, gestational age, FHR baseline + variability + accelerations + decelerations, contractions, BPP score (if performed), interpretation.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Provider notification + plan.", citationIDs: ["openrn_pr_round19"])
        ],
        watchFor: [
            AttributedBullet("RECURRENT VARIABLE / LATE / PROLONGED DECELERATIONS — fetal compromise; immediate provider notification + intrauterine resuscitation (left lateral, IV fluids, O2, terbutaline if tachysystole).", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("BRADYCARDIA <100 sustained — emergent intervention.", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("MINIMAL / ABSENT VARIABILITY — reassess; consider acidemia / hypoxia.", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("Decreased fetal movement reported — count kicks; if persistent decline → urgent evaluation.", citationIDs: ["openrn_pr_round19"])
        ],
        citations: [openrnPRR19, specialtyPRR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum DEXASample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "dexa-scan",
        title: "DEXA bone densitometry",
        subtitle: "T-score for postmenopausal women / men >50 · Z-score for younger / pediatric · USPSTF screening",
        nclexTags: procTagsR19,
        indications: AttributedProse(
            "Bone mineral density assessment for osteoporosis diagnosis + fracture risk assessment + monitoring response to therapy. USPSTF — all women ≥65; postmenopausal <65 with FRAX-equivalent risk; men with risk factors per primary source.",
            citationIDs: ["specialty_pr_round19"]
        ),
        contraindications: AttributedProse(
            "Pregnancy (relative — minimal radiation but avoided); recent contrast / barium / nuclear medicine study (1 week wait); severe kyphosis / spine hardware (interpret carefully) per primary source.",
            citationIDs: ["specialty_pr_round19"]
        ),
        equipment: [
            AttributedBullet("DEXA scanner (lumbar spine + hip, sometimes distal forearm).", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("Comfortable supine position; positioning aids.", citationIDs: ["openrn_pr_round19"])
        ],
        preProcedure: [
            AttributedBullet("Counsel patient — non-invasive, painless, low radiation (~10% chest X-ray dose), 10–30 min.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Avoid metal jewelry; loose-fitting clothing without zippers / metal at scan area.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Hold calcium supplements 24 hours before to avoid GI overlay artifact.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Pregnancy screen — NOT performed in pregnancy.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Wait 1 week after contrast / nuclear medicine.", citationIDs: ["openrn_pr_round19"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Position patient", body: "Supine on table; legs supported; spine straight.", citationIDs: ["openrn_pr_round19"]),
            ProcedureStep(number: 2, title: "Lumbar spine scan", body: "Lumbar L1–L4 scan; technologist positions + scans 1–2 min.", citationIDs: ["specialty_pr_round19"]),
            ProcedureStep(number: 3, title: "Hip scan", body: "Bilateral hip — femoral neck + total hip; positioner internal rotation; scan 1–2 min.", citationIDs: ["specialty_pr_round19"]),
            ProcedureStep(number: 4, title: "Distal forearm if indicated", body: "When spine + hip not interpretable (severe spine arthritis / hardware) OR hyperparathyroidism (cortical bone).", citationIDs: ["specialty_pr_round19"]),
            ProcedureStep(number: 5, title: "Interpretation", body: "T-SCORE — comparison to young adult reference (peak BMD); ≤-2.5 = osteoporosis, -1.0 to -2.4 = osteopenia, ≥-1.0 = normal. Z-SCORE — age-matched; <-2.0 = below expected for age. FRAX score combined with risk factors per primary source.", citationIDs: ["specialty_pr_round19"])
        ],
        postProcedure: [
            AttributedBullet("Patient resumes normal activity immediately; no recovery required.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Results interpretation by clinician within 1–2 weeks.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Treatment decisions per T-score + FRAX + clinical context.", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("Counsel — repeat 1–2 years if treated; 2–5 years if low-risk per individual.", citationIDs: ["specialty_pr_round19"])
        ],
        documentation: [
            AttributedBullet("Indication, sites scanned, T-score + Z-score per site, prior comparison if available, FRAX score, recommendations.", citationIDs: ["openrn_pr_round19"])
        ],
        watchFor: [
            AttributedBullet("ARTIFACTS — vertebral fractures, severe arthritis, calcified aorta, surgical hardware can falsely raise T-score; review images carefully + use forearm if needed.", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("Z-SCORE <-2.0 — secondary osteoporosis workup (Cushing's, hyperparathyroidism, hyperthyroidism, malignancy, malabsorption).", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("Vertebral compression fracture on lateral imaging — diagnostic of osteoporosis even with normal T-score.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("PRADIATION exposure — minimal but consider in pregnancy + young patients; avoid unnecessary scans.", citationIDs: ["openrn_pr_round19"])
        ],
        citations: [openrnPRR19, specialtyPRR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum EndometrialBiopsySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "endometrial-biopsy",
        title: "Endometrial biopsy",
        subtitle: "Office Pipelle aspiration · postmenopausal bleeding + abnormal uterine bleeding workup",
        nclexTags: procTagsR19,
        indications: AttributedProse(
            "Workup of abnormal uterine bleeding — postmenopausal bleeding (most common indication; 10–15% endometrial cancer risk), heavy / prolonged perimenopausal bleeding, intermenstrual bleeding, atypical glandular cells on cervical screening, surveillance of complex endometrial hyperplasia / Lynch syndrome per primary source.",
            citationIDs: ["specialty_pr_round19"]
        ),
        contraindications: AttributedProse(
            "Pregnancy (perform pregnancy test); pelvic infection (treat first); cervical stenosis (may need dilation); severe coagulopathy; relative — anticoagulation (hold per protocol) per primary source.",
            citationIDs: ["specialty_pr_round19"]
        ),
        equipment: [
            AttributedBullet("Speculum, light source, sponge stick, cervical tenaculum, tissue forceps.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Pipelle endometrial sampling device (most common); other options — Vabra aspirator, Tao brush, hysteroscopy with directed biopsy.", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("Lubricating gel; antiseptic solution.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Specimen container with formalin; pathology requisition.", citationIDs: ["openrn_pr_round19"])
        ],
        preProcedure: [
            AttributedBullet("Pregnancy test mandatory; rule out pregnancy.", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("Counsel — brief discomfort during sampling (cramps); office procedure ~5 min.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Pre-medication — ibuprofen 400–800 mg 30 min before reduces cramping per primary source.", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("Empty bladder; lithotomy position with chaperone present.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Hold anticoagulants per protocol; correct coagulopathy.", citationIDs: ["specialty_pr_round19"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Speculum + cervical inspection", body: "Insert sterile speculum; visualize cervix; cleanse with antiseptic.", citationIDs: ["openrn_pr_round19"]),
            ProcedureStep(number: 2, title: "Cervical stabilization", body: "Tenaculum on anterior cervical lip if cervix mobile / posterior; counsel \"sharp pinch.\"", citationIDs: ["openrn_pr_round19"]),
            ProcedureStep(number: 3, title: "Sound uterus (selective)", body: "Uterine sound determines depth + direction (typically 6–10 cm); not always needed if cervix patent.", citationIDs: ["specialty_pr_round19"]),
            ProcedureStep(number: 4, title: "Insert Pipelle", body: "Pass through cervix to fundus; pull back inner piston to create suction; rotate + sweep entire endometrial cavity 3–4 times to obtain adequate sample per primary source.", citationIDs: ["specialty_pr_round19"]),
            ProcedureStep(number: 5, title: "Place specimen", body: "Withdraw Pipelle; expel sample into formalin container; label specimen; send to pathology.", citationIDs: ["openrn_pr_round19"]),
            ProcedureStep(number: 6, title: "Inspect for bleeding", body: "Remove tenaculum; apply pressure if active bleeding; remove speculum.", citationIDs: ["openrn_pr_round19"])
        ],
        postProcedure: [
            AttributedBullet("Patient may feel cramps + light spotting × 24–48 hours; ibuprofen / acetaminophen for discomfort.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Pelvic rest 24 hours — no intercourse / tampons / douching.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Return for fever, severe pain, heavy bleeding, foul discharge.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("Results 1–2 weeks; communicate within reasonable timeframe.", citationIDs: ["openrn_pr_round19"])
        ],
        documentation: [
            AttributedBullet("Indication, anesthesia / pre-medication, technique used, depth + adequacy of sample, complications, follow-up plan.", citationIDs: ["openrn_pr_round19"])
        ],
        watchFor: [
            AttributedBullet("UTERINE PERFORATION — rare; sudden severe pain + bleeding + signs of peritoneal injury; emergent evaluation.", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("INFECTION — fever / pelvic pain / discharge within 1–2 weeks; abx + workup.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("VASOVAGAL — supine + IV fluids if needed; usually self-limited.", citationIDs: ["openrn_pr_round19"]),
            AttributedBullet("INADEQUATE SAMPLE / NEGATIVE BUT BLEEDING PERSISTS — repeat OR proceed to hysteroscopy + dilation + curettage per primary source.", citationIDs: ["specialty_pr_round19"]),
            AttributedBullet("MALIGNANCY POSITIVE — gynecologic oncology referral promptly.", citationIDs: ["specialty_pr_round19"])
        ],
        citations: [openrnPRR19, specialtyPRR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum FHRMonitoringSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "maternal-fetal-monitoring",
        title: "Intrapartum fetal heart rate monitoring",
        subtitle: "Categories I/II/III · NICHD framework · accelerations + decelerations + variability",
        eyebrow: "REFERENCE · OBSTETRICS",
        nclexTags: refTagsR19,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "NICHD-standardized intrapartum electronic fetal monitoring (EFM) interpretation. Three-tier system (Categories I, II, III) guides response. Continuous EFM standard for high-risk; intermittent auscultation acceptable for low-risk per primary source.",
                citationIDs: ["specialty_pr_round19"]
            )),
            .keyValueTable(title: "FHR baseline + variability", [
                KeyValueRow(key: "Normal baseline", value: "110–160 bpm, sustained ≥10 min"),
                KeyValueRow(key: "Tachycardia", value: ">160 bpm × ≥10 min — fever, infection, hypoxia, drugs (terbutaline), maternal anxiety"),
                KeyValueRow(key: "Bradycardia", value: "<110 bpm × ≥10 min — head compression, hypoxia, congenital heart block"),
                KeyValueRow(key: "Variability — absent", value: "Undetectable amplitude — concerning; hypoxia / acidemia"),
                KeyValueRow(key: "Variability — minimal", value: "≤5 bpm — fetal sleep, sedation, hypoxia, prematurity"),
                KeyValueRow(key: "Variability — moderate", value: "6–25 bpm — REASSURING normal"),
                KeyValueRow(key: "Variability — marked", value: ">25 bpm — uncommon; placental abnormalities"),
                KeyValueRow(key: "Sinusoidal", value: "Smooth undulating waveform — fetal anemia, severe hypoxia — abnormal")
            ]),
            .keyValueTable(title: "Accelerations + decelerations", [
                KeyValueRow(key: "Acceleration", value: "Abrupt FHR rise ≥15 bpm × ≥15 sec (≥10 bpm × ≥10 sec for <32 wks) — REASSURING fetal well-being"),
                KeyValueRow(key: "Early deceleration", value: "Symmetric, mirror UC; nadir at peak of UC — head compression — BENIGN"),
                KeyValueRow(key: "Variable deceleration", value: "Abrupt onset/resolution; varying timing/depth — UMBILICAL CORD COMPRESSION — common"),
                KeyValueRow(key: "Late deceleration", value: "Smooth, symmetric, nadir AFTER peak of UC — UTEROPLACENTAL INSUFFICIENCY — concerning"),
                KeyValueRow(key: "Prolonged deceleration", value: "≥2 min but <10 min — concerning; uterine tachysystole, cord prolapse, abruption")
            ]),
            .keyValueTable(title: "NICHD Categories", [
                KeyValueRow(key: "Category I (REASSURING)", value: "All present: baseline 110–160; moderate variability; NO late / variable decels; accelerations may be present or absent. Continue monitoring."),
                KeyValueRow(key: "Category II (INDETERMINATE)", value: "Most tracings; not Cat I or III. Includes minimal / marked variability, recurrent variables / lates with mod variability, prolonged decels. INTRAUTERINE RESUSCITATION + reassessment."),
                KeyValueRow(key: "Category III (ABNORMAL)", value: "Recurrent late or variable decels with absent variability; bradycardia with absent variability; sinusoidal pattern. EXPEDITE DELIVERY (often emergency cesarean).")
            ]),
            .bullets(title: "Intrauterine resuscitation (Cat II / III)", [
                AttributedBullet("Reposition mother — left lateral OR knee-chest if cord prolapse suspected.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Stop oxytocin if running.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("IV bolus 500–1000 mL crystalloid.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("100% O2 via non-rebreather (controversial — limit to specific situations).", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Vaginal exam — assess cord prolapse + cervical exam + fetal scalp stimulation (acceleration response = reassuring).", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Tocolytic for tachysystole — terbutaline 0.25 mg SQ × 1.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Treat hypotension — vasopressor + position + fluids.", citationIDs: ["openrn_pr_round19"]),
                AttributedBullet("Fetal scalp stimulation OR amnioinfusion for variable decelerations.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Notify provider + prepare for OR if Cat III persistent.", citationIDs: ["specialty_pr_round19"])
            ]),
            .bullets(title: "Documentation + escalation", [
                AttributedBullet("Document baseline, variability, accelerations, decelerations, contractions q15 min in active first stage / q5 min in second stage.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Communicate Cat II / III findings to provider promptly.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Cat III + failed resuscitation → emergent cesarean delivery decision.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Tachysystole — >5 contractions in 10 min averaged over 30 min; halt oxytocin; intrauterine resuscitation.", citationIDs: ["specialty_pr_round19"])
            ])
        ],
        citations: [openrnPRR19, specialtyPRR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum MenopauseHRTSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "menopause-hrt",
        title: "Menopause + hormone therapy decision making",
        subtitle: "NAMS 2022 · vasomotor + GU symptoms · individualized risk + benefit · TIMING + DURATION matter",
        eyebrow: "REFERENCE · WOMEN'S HEALTH",
        nclexTags: refTagsR19,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Menopause = 12 months amenorrhea (mean age 51); transition + symptoms span ~7 years average. Hormone therapy (HT) effective for vasomotor symptoms + GSM + bone preservation. Benefit-risk varies by age + time-since-menopause + dose + route + duration per NAMS 2022 per primary source.",
                citationIDs: ["specialty_pr_round19"]
            )),
            .bullets(title: "Symptoms of menopause + perimenopause", [
                AttributedBullet("Vasomotor — hot flashes (~75% of women), night sweats — most disruptive symptom.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Genitourinary syndrome of menopause (GSM) — vaginal dryness, dyspareunia, dysuria, recurrent UTI.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Sleep disturbance, mood changes (often depression / anxiety), brain fog, fatigue.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Bone loss, increased CV + metabolic risk, joint aches, weight + body composition changes.", citationIDs: ["openrn_pr_round19"])
            ]),
            .bullets(title: "Hormone therapy candidacy", [
                AttributedBullet("CONSIDER HT — moderate-severe vasomotor / GSM symptoms; premature menopause / surgical menopause until average menopause age; osteoporosis prevention in selected per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("\"Window of opportunity\" — initiation <60 years AND within 10 years of menopause = best benefit-risk per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("AVOID HT in — known / suspected breast cancer history, estrogen-dependent malignancy, prior VTE / stroke / MI, severe hepatic disease, undiagnosed bleeding, pregnancy.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Vaginal low-dose estrogen — generally safe even in breast cancer history (per oncologist).", citationIDs: ["specialty_pr_round19"])
            ]),
            .keyValueTable(title: "HT regimens by uterus + symptoms", [
                KeyValueRow(key: "Uterus + systemic estrogen", value: "ALWAYS combine with progestin (norethindrone, micronized progesterone) or use combined patch — endometrial cancer protection"),
                KeyValueRow(key: "Hysterectomy + systemic estrogen", value: "Estrogen monotherapy acceptable (oral, patch, gel)"),
                KeyValueRow(key: "GSM ONLY (vaginal symptoms)", value: "Low-dose vaginal estrogen (cream, ring, tablet) — minimally absorbed; long-term safe; no progestin needed"),
                KeyValueRow(key: "Vasomotor without VTE/CV history", value: "Oral OR transdermal — transdermal preferred if elevated VTE / metabolic risk"),
                KeyValueRow(key: "Vasomotor + intolerant / contraindicated", value: "SSRIs (paroxetine FDA-approved), SNRIs, gabapentin, oxybutynin, clonidine, fezolinetant (NK3 antagonist 2023)")
            ]),
            .bullets(title: "Benefits + risks (NAMS 2022)", [
                AttributedBullet("BENEFITS — vasomotor relief, GSM treatment, bone preservation, possible CV reduction (initiated <60 / <10 years post-menopause), reduction in colorectal cancer.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("RISKS — VTE / stroke (oral > transdermal), breast cancer (combined estrogen + progestin >5 years), endometrial cancer (UNOPPOSED estrogen + uterus), gallbladder disease.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Absolute risks small in healthy women starting <60 / <10 yr post-menopause.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Reassess annually — duration + indication + ongoing benefit.", citationIDs: ["specialty_pr_round19"])
            ]),
            .bullets(title: "Non-hormonal alternatives", [
                AttributedBullet("Lifestyle — layered clothing, fan, avoid triggers (alcohol, spicy food, hot environments), weight management, exercise, mindfulness / CBT.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("SSRIs / SNRIs — paroxetine 7.5 mg FDA-approved for hot flashes; venlafaxine, escitalopram per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Gabapentin / pregabalin — nighttime hot flashes + sleep.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Fezolinetant (Veozah) — neurokinin-3 receptor antagonist; FDA-approved 2023 for moderate-severe vasomotor; non-hormonal per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("CBT for menopausal symptoms — evidence-based; sleep + mood improvement.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("AVOID compounded bioidentical \"BHRT\" — not FDA-regulated, unproven safety.", citationIDs: ["specialty_pr_round19"])
            ]),
            .bullets(title: "GSM-specific management", [
                AttributedBullet("Vaginal moisturizers + lubricants (water / silicone-based) — first-line.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Low-dose vaginal estrogen — gold standard for GSM; safe long-term in most women.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Vaginal DHEA (prasterone) — alternative.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Oral ospemifene — selective ER modulator for dyspareunia; alternative to vaginal estrogen.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Pelvic floor PT — adjunctive for dyspareunia + pelvic floor dysfunction.", citationIDs: ["specialty_pr_round19"])
            ])
        ],
        citations: [openrnPRR19, specialtyPRR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CKDStagingR19Sample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ckd-staging-management",
        title: "CKD staging + KDIGO management",
        subtitle: "eGFR + UACR · stage + cause-based management · dialysis + transplant planning",
        eyebrow: "REFERENCE · NEPHROLOGY",
        nclexTags: refTagsR19,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "CKD = abnormalities of kidney structure / function present >3 months. KDIGO classification — eGFR + albuminuria categories (G1-G5, A1-A3) → \"heat map\" for risk stratification. Management directed at slowing progression + addressing complications + planning RRT per primary source.",
                citationIDs: ["specialty_pr_round19"]
            )),
            .keyValueTable(title: "GFR (G) categories", [
                KeyValueRow(key: "G1", value: "≥90 mL/min/1.73m² with abnormal markers (proteinuria, structural)"),
                KeyValueRow(key: "G2", value: "60–89 mL/min/1.73m² with abnormal markers"),
                KeyValueRow(key: "G3a", value: "45–59 mL/min/1.73m² (mild-moderate)"),
                KeyValueRow(key: "G3b", value: "30–44 mL/min/1.73m² (moderate-severe)"),
                KeyValueRow(key: "G4", value: "15–29 mL/min/1.73m² (severe; nephrology referral mandatory)"),
                KeyValueRow(key: "G5", value: "<15 mL/min/1.73m² (kidney failure; ESRD)")
            ]),
            .keyValueTable(title: "Albuminuria (A) categories", [
                KeyValueRow(key: "A1 — Normal-mild", value: "UACR <30 mg/g"),
                KeyValueRow(key: "A2 — Moderately increased", value: "UACR 30–300 mg/g"),
                KeyValueRow(key: "A3 — Severely increased", value: "UACR >300 mg/g")
            ]),
            .bullets(title: "BP + RAS blockade", [
                AttributedBullet("Target BP <120 systolic per SPRINT / KDIGO 2021 (most patients) — use SBP from standardized measurement per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("ACE inhibitor OR ARB — first-line for HTN + albuminuria; reduces progression + CV events.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Avoid combining ACEi + ARB — additive hyperkalemia + AKI without benefit.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Acceptable initial 10–25% eGFR drop on RAS initiation — do not discontinue if stable.", citationIDs: ["specialty_pr_round19"])
            ]),
            .bullets(title: "Disease-modifying therapy", [
                AttributedBullet("SGLT2 INHIBITORS (dapagliflozin, empagliflozin) — DM + CKD + non-DM proteinuric CKD; dramatic protection per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("FINERENONE — non-steroidal MRA; T2DM + CKD with proteinuria on RAS — added benefit per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("GLP-1 RA — T2DM + CKD; CV + renal benefit + weight loss.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Adequate glycemic control in DM (A1c target individualized).", citationIDs: ["specialty_pr_round19"])
            ]),
            .bullets(title: "Anemia + bone / mineral disorder", [
                AttributedBullet("Anemia — iron + ESA when Hgb <10 (target 10–11); HIF-PHI (roxadustat, daprodustat) emerging.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("CKD-MBD — phosphate (target normal), calcium, PTH; phosphate binders (sevelamer, lanthanum, calcium acetate); calcitriol / paricalcitol; cinacalcet for severe SHPT per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Vitamin D deficiency replacement (cholecalciferol).", citationIDs: ["specialty_pr_round19"])
            ]),
            .bullets(title: "Other complications + lifestyle", [
                AttributedBullet("Acidosis — sodium bicarbonate when HCO3 <22.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Hyperkalemia — patiromer, sodium zirconium (avoid stopping life-saving RAS drugs).", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("CV risk — statin (ASCVD calculator); aspirin selectively.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Avoid nephrotoxins — NSAIDs, IV contrast (use alternatives), aminoglycosides.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Vaccination — influenza annually, pneumococcal, hepatitis B, COVID, shingles.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Lifestyle — sodium <2 g/day, moderate protein (avoid excess), exercise, smoking cessation, weight management.", citationIDs: ["openrn_pr_round19"])
            ]),
            .bullets(title: "Renal replacement preparation (G4-G5)", [
                AttributedBullet("Nephrology referral when G4 OR rapid decline OR proteinuria + CV risk per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Dialysis education + modality selection (HD, PD, home HD).", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("AV fistula creation 6–12 months before HD initiation when feasible (\"Fistula First\").", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Transplant evaluation — pre-emptive transplant ideal; living donor preferred.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Goals of care + advance directives — especially elderly + comorbid.", citationIDs: ["openrn_pr_round19"])
            ])
        ],
        citations: [openrnPRR19, specialtyPRR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum FallsFractureSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "fall-fracture-prevention",
        title: "Falls + fragility fracture prevention",
        subtitle: "STEADI bundle · medication review · vision + footwear + home + exercise + vitamin D",
        eyebrow: "REFERENCE · GERIATRICS",
        nclexTags: refTagsR19,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Falls are leading cause of injury in adults ≥65; ~25% fall yearly; 5% result in fracture. CDC STEADI (Stopping Elderly Accidents Deaths + Injuries) bundle systematizes prevention. Multifactorial — intrinsic + extrinsic risks per primary source.",
                citationIDs: ["specialty_pr_round19"]
            )),
            .bullets(title: "STEADI 3-step approach", [
                AttributedBullet("SCREEN — Stay Independent questionnaire OR direct ask \"have you fallen in past year / feel unsteady / worry about falling?\"", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("ASSESS — Timed Up + Go Test (≥12 sec abnormal); 30-second chair stand; 4-stage balance test.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("INTERVENE — modifiable risk factor reduction bundle.", citationIDs: ["specialty_pr_round19"])
            ]),
            .bullets(title: "Intrinsic risk factor modification", [
                AttributedBullet("MEDICATIONS — review for falls-risk meds (benzos, antihistamines, opioids, sedatives, anticholinergics, antihypertensives, hypoglycemics); deprescribe per Beers / STOPP per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("VISION — annual eye exam; treat cataracts; counsel multifocal glasses on stairs.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("VESTIBULAR / BALANCE — vestibular rehabilitation; treat BPPV.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("VITAMIN D — 800–1000 IU daily reduces falls in deficient.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Cardiac — orthostatic hypotension management; arrhythmia evaluation.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Cognitive — dementia screening; care planning.", citationIDs: ["openrn_pr_round19"]),
                AttributedBullet("Continence — bladder management to reduce nocturnal awakenings.", citationIDs: ["openrn_pr_round19"]),
                AttributedBullet("Foot health — footwear (low heel, non-slip), foot pain, deformity treatment.", citationIDs: ["specialty_pr_round19"])
            ]),
            .bullets(title: "Extrinsic / environmental modification", [
                AttributedBullet("HOME SAFETY — remove throw rugs, secure loose carpets, adequate lighting, grab bars in bathroom, raised toilet seats, stair handrails, non-slip tub mats per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Footwear — proper-fitting, low-heel, non-slip; avoid slippers / loose footwear.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Mobility aids — cane, walker fitted by PT.", citationIDs: ["openrn_pr_round19"]),
                AttributedBullet("Pet hazards — leashes, chair stability.", citationIDs: ["openrn_pr_round19"])
            ]),
            .bullets(title: "Exercise + balance", [
                AttributedBullet("TAI CHI — strongest evidence for falls reduction; group classes available widely per primary source.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("OTAGO Exercise Programme — home-based; falls reduction.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Resistance training + aerobic exercise — improve strength + cardiac function.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Balance + functional exercises — daily.", citationIDs: ["openrn_pr_round19"])
            ]),
            .bullets(title: "Fragility fracture prevention", [
                AttributedBullet("DEXA + FRAX risk assessment + osteoporosis treatment as indicated (bisphosphonate / denosumab / teriparatide / romosozumab).", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Calcium 1000–1200 mg/day + Vitamin D 800–1000 IU daily.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Hip protectors — selected high-risk (e.g., nursing home).", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Treatment after fragility fracture — \"FLS — Fracture Liaison Service\" model improves second fracture prevention.", citationIDs: ["specialty_pr_round19"])
            ]),
            .bullets(title: "Post-fall management", [
                AttributedBullet("Comprehensive evaluation — cause + injury + functional status + risk factors.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Address fear of falling — psychological + functional impact.", citationIDs: ["openrn_pr_round19"]),
                AttributedBullet("Multidisciplinary — PT, OT, social work, palliative as appropriate.", citationIDs: ["openrn_pr_round19"]),
                AttributedBullet("Hip fracture — surgical repair within 24–48 hours preferred; geriatric co-management.", citationIDs: ["specialty_pr_round19"]),
                AttributedBullet("Document — fall details, injuries, root cause analysis, interventions.", citationIDs: ["openrn_pr_round19"])
            ])
        ],
        citations: [openrnPRR19, specialtyPRR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}
