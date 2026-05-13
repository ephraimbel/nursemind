import Foundation

// Curator-model diagnosis entries (round 19 — OB/repro + GU + nephro + ortho/MSK + women's psych).

private let openrnDxR19 = CitationSource(
    id: "openrn_dx_round19",
    shortName: "Open RN Health Alterations + Maternity",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=ob+gu+nephrology+orthopedics",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR19 = CitationSource(
    id: "specialty_dx_round19",
    shortName: "ACOG / AUA / KDIGO / NOF / NIAMS / APA concept citations",
    publisher: "ACOG · AUA · KDIGO · NOF · NIAMS · APA",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-04"
)

private let obR19 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let guR19 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination)
private let renalR19 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination)
private let mskR19 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .mobility)
private let psychR19 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood)

public enum CervicalInsufficiencySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cervical-insufficiency",
        title: "Cervical insufficiency",
        subtitle: "Painless cervical dilation 2nd trimester · cerclage + progesterone · serial cervical length",
        nclexTags: obR19,
        definition: AttributedProse(
            "Painless cervical dilation + effacement in second trimester (16–28 weeks) leading to recurrent pregnancy loss / preterm birth without contractions. Diagnosis based on history (≥1 prior 2nd-trimester loss) + serial cervical length monitoring + clinical findings per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Structural / functional weakness of cervix → premature shortening + dilation. Risk factors — prior cervical surgery (LEEP, conization), DES exposure, congenital anomalies, prior cervical trauma, multiple gestation, infection / inflammation.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("Often ASYMPTOMATIC initially — found on routine ultrasound or ED visit with advanced dilation.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Vague pelvic pressure, low backache, increased vaginal discharge (mucus, blood-tinged), bulging membranes on speculum.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("History of prior 2nd-trimester loss or preterm birth without inciting events.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Cervical length <25 mm before 24 weeks on TVUS in singleton pregnancy with prior preterm history per primary source.", citationIDs: ["specialty_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Transvaginal ultrasound — cervical length <25 mm before 24 weeks (especially with prior 2nd-trimester loss / preterm birth) per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Speculum exam — visible dilation / bulging membranes (advanced).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Workup precipitants — culture for chorioamnionitis if infection suspected; STI screening.", citationIDs: ["openrn_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Reproductive history — prior 2nd-trimester losses, cervical procedures.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Cervical length monitoring schedule — q2 weeks 16–24 weeks per high-risk indication per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Coordinate maternal-fetal medicine + multidisciplinary team.", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("CERCLAGE — surgical placement at 12–14 weeks for history-indicated; rescue at advanced dilation per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("VAGINAL PROGESTERONE 200 mg PV daily 16–36 weeks for short cervix (CL <25 mm) without prior PTB per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("17-OHPC IM weekly historically; recently withdrawn in US; decisions individualized per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Activity restriction debated — bed rest NOT proven to help + carries risks; limit per individual case.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Avoid intercourse + heavy lifting + smoking.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Antenatal steroids 24–34 weeks for fetal lung maturity if preterm delivery imminent.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Multidisciplinary — MFM + neonatology + L+D + social work + mental health.", citationIDs: ["specialty_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("CHORIOAMNIONITIS — fever + uterine tenderness + maternal/fetal tachycardia; urgent delivery + abx.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("PREMATURE RUPTURE OF MEMBRANES — emergent management; tocolytics + steroids + abx + delivery planning.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("CERCLAGE complications — suture migration, ROM, infection, bleeding.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Mental health support — anxiety + grief from prior losses common.", citationIDs: ["openrn_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PROMSampleR19 {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "premature-rupture-of-membranes",
        title: "Premature rupture of membranes (PROM / PPROM)",
        subtitle: "Rupture before labor · PPROM <37 wks expectant + abx + steroids · chorio risk",
        nclexTags: obR19,
        definition: AttributedProse(
            "Rupture of amniotic membranes before onset of labor. Term PROM = at or after 37 weeks; preterm PROM (PPROM) = before 37 weeks. PPROM accounts for ~30% of preterm births. Management balances infection risk against prematurity risk per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — ascending infection (often subclinical chorioamnionitis), enzymatic remodeling of membranes, mechanical stress, polyhydramnios, multiple gestation, smoking, prior PROM. Loss of amniotic fluid → cord compression risk + infection.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("Sudden gush or continuous trickle of clear / yellow / blood-tinged fluid from vagina.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Patients sometimes confuse with urinary leakage — confirm with sterile speculum.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Fever, tachycardia (maternal + fetal), uterine tenderness suggest chorioamnionitis.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Cord prolapse — emergent — seen / palpated cord.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Risk factors — prior PROM, infections, polyhydramnios, multiple gestation, smoking, low SES.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("STERILE SPECULUM — pooling of fluid in posterior fornix; AVOID digital exam unless delivery imminent (infection risk).", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Nitrazine pH paper — turns blue (alkaline amniotic fluid) — false-positive with blood / semen / BV.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Ferning — dried fluid on slide; characteristic pattern.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Commercial assays (AmniSure, ROM Plus) — high accuracy.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Ultrasound — oligohydramnios supports diagnosis.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("GBS culture if not recent.", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Confirm diagnosis BEFORE digital exam to minimize infection risk.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Continuous EFM + maternal vital signs + fetal heart rate.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Assess cord prolapse — emergent if any concern.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Coordinate MFM + neonatology + L+D for PPROM.", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("TERM PROM (≥37 wks) — induction with oxytocin OR await spontaneous labor 12–24 hours; GBS prophylaxis if positive per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("PPROM 34–36 6/7 — typically deliver; case-by-case expectant if very early in window per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("PPROM 24–33 6/7 — EXPECTANT MANAGEMENT — antenatal corticosteroids (betamethasone) + magnesium sulfate <32 wks for neuroprotection + 7-day latency abx (ampicillin + erythromycin OR azithromycin) + serial labs / EFM per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("PPROM <24 wks — counsel poor neonatal prognosis + risks; individualized expectant vs delivery per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("AVOID digital exams unless delivery imminent (infection risk).", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("AMNIOINFUSION for cord compression / variable decelerations selected.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("GBS prophylaxis intrapartum if positive or unknown.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Mental health support — anxiety + grief common.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("CHORIOAMNIONITIS — fever + uterine tenderness + maternal/fetal tachycardia; broad-spectrum abx + delivery per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("CORD PROLAPSE — emergent C-section; manual elevation of presenting part; knee-chest / Trendelenburg position en route per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("ABRUPTION — increased risk; vaginal bleeding + pain + fetal distress.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Pulmonary hypoplasia + fetal deformations — prolonged oligohydramnios.", citationIDs: ["openrn_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ErectileDysfunctionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "erectile-dysfunction",
        title: "Erectile dysfunction (ED)",
        subtitle: "Multifactorial — vascular + neuro + endo + psych · CV risk marker · PDE5 + lifestyle first-line",
        nclexTags: guR19,
        definition: AttributedProse(
            "Persistent inability to attain or maintain erection sufficient for satisfactory sexual performance, lasting ≥3 months. Affects ~30 million US men; prevalence rises with age. Frequently first sign of CV disease in men <60 — cardiovascular workup recommended per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — vascular (endothelial dysfunction → reduced cavernosal blood flow), neurogenic (autonomic dysfunction, prostatectomy, MS, DM), endocrine (low T, hyperprolactinemia), drug-related (SSRIs, antihypertensives, opioids), psychogenic (anxiety, depression), structural (Peyronie's).",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("Inability to achieve / maintain erection for satisfactory intercourse ≥3 months.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Loss of nighttime / morning erections suggests organic cause (vs psychogenic, which preserves these).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Comorbidities — CV disease, diabetes, hypogonadism, depression, BPH, sleep apnea.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Medication review — SSRIs, β-blockers, thiazides, spironolactone, opioids, alcohol, recreational substances.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Quality of life impact — relationship, mental health.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical history + IIEF-5 questionnaire for severity assessment.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Workup — fasting glucose / A1c, lipid panel, total testosterone (morning, fasting), TSH, prolactin per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("CV risk assessment (ASCVD risk; consider exercise stress test in symptomatic).", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Specialist tests if needed — penile Doppler, NPT, intracavernosal injection test (refractory).", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("CV risk — ED is independent CV risk marker; aggressive risk modification.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Identify reversible causes — drug review, smoking cessation, alcohol moderation, weight loss, exercise.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Mental health + relationship — therapy as adjunct.", citationIDs: ["openrn_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("LIFESTYLE — smoking cessation, exercise, weight loss, alcohol moderation, mediterranean diet — improves ED + CV risk per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("PDE5 INHIBITORS first-line — sildenafil, tadalafil, vardenafil, avanafil; CONTRAINDICATED with nitrates per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Testosterone replacement only if confirmed hypogonadism (low T + symptoms); not for normal-T ED per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("VACUUM ERECTION DEVICE — non-pharmacologic alternative.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("INTRACAVERNOSAL injection (alprostadil) — second-line for PDE5i failure.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("PENILE PROSTHESIS — refractory; surgical implant.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Sex therapy / couples counseling — adjunct.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Address underlying — DM control, BP control, depression treatment, drug substitution.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("CV DISEASE marker — work up CV risk in any man with new-onset ED, especially <60 per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("PDE5i + NITRATES = life-threatening hypotension; document + counsel.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("PRIAPISM (>4 hr) — emergent; tissue ischemia.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Hypogonadism workup — fatigue, decreased libido, depression, body composition; testosterone replacement only if confirmed.", citationIDs: ["specialty_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum OABSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "overactive-bladder",
        title: "Overactive bladder (OAB)",
        subtitle: "Urgency ± urge incontinence + frequency · behavioral first-line · mirabegron / oxybutynin · botulinum + nerve stim refractory",
        nclexTags: guR19,
        definition: AttributedProse(
            "Symptom syndrome of urinary urgency (with or without urge incontinence), usually with frequency + nocturia, in absence of UTI / other identifiable cause. Affects ~17% of US adults; impacts quality of life significantly per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Detrusor overactivity → involuntary contractions during storage phase → urgency. Multifactorial — neurogenic (MS, Parkinson's, SCI), idiopathic, post-stroke, BPH-related, dietary triggers, fluid management.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("URGENCY — sudden compelling need to void; hallmark of OAB.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Urinary frequency >8 daytime voids; nocturia ≥1 awakening.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Urge incontinence — leakage with urgency; OAB \"wet\" vs \"dry\".", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Triggers — running water, cold weather, key-in-door, stress.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Quality of life impact — social isolation, sleep disruption, depression.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis — symptom-based after exclusion of UTI / hematuria / structural / neurogenic causes per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Urinalysis + culture — rule out infection.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Bladder diary 3 days — documents frequency + volume + triggers.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Post-void residual — rule out incomplete emptying.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Urodynamics — for refractory / mixed / atypical cases.", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Symptom severity (OAB-q score) + quality of life impact.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Reversible causes — UTI, polyuria from DM / DI, medications (diuretics).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Cognitive status (anticholinergic appropriateness).", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("BEHAVIORAL FIRST-LINE — fluid + caffeine + alcohol modification, bladder training (timed voids + delayed voiding), pelvic floor muscle exercises (Kegels), weight loss per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("MIRABEGRON (β3 agonist) — preferred in elderly / cognitively at-risk vs anticholinergics per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Anticholinergics — oxybutynin (IR / ER / patch), tolterodine, solifenacin, darifenacin; Beers caution; anticholinergic burden additive per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Topical vaginal estrogen — postmenopausal women with GSM-related urgency.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("ONABOTULINUM TOXIN A — intradetrusor injection for refractory; risk of urinary retention requiring CIC per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Sacral neuromodulation (InterStim) — refractory OAB / non-obstructive retention.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Posterior tibial nerve stimulation (PTNS) — alternative neuromodulation.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Treat comorbid OSA — improves nocturia.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("URINARY RETENTION on anticholinergic / botox; post-void residual monitoring; CIC if needed.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("ANTICHOLINERGIC BURDEN in elderly — cognitive decline, falls, dry mouth, constipation; minimize.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("UTI from urinary stasis or CIC.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("MIXED INCONTINENCE (urge + stress) — different management; full evaluation.", citationIDs: ["specialty_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum SUISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "stress-urinary-incontinence",
        title: "Stress urinary incontinence (SUI)",
        subtitle: "Leakage with cough / sneeze / exertion · pelvic floor first-line · pessary + sling for refractory",
        nclexTags: guR19,
        definition: AttributedProse(
            "Involuntary leakage of urine with effort / exertion / sneezing / coughing — pressure transmission exceeds urethral resistance. Most common urinary incontinence in younger women; common postpartum + post-menopause + post-prostatectomy in men per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Loss of urethral support from weakened pelvic floor muscles + connective tissue → urethral hypermobility OR intrinsic sphincter deficiency → urethral closure pressure cannot resist increased intra-abdominal pressure.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("Leakage with cough / sneeze / laugh / exercise / lifting / change of position.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("NO urgency component (vs OAB urge incontinence).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Risk factors — vaginal childbirth, obesity, chronic cough, smoking, advancing age, menopause, prostatectomy in men, pelvic surgery, neuromuscular disease.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Mixed incontinence (SUI + OAB) — common; treat both components.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical history + cough stress test (visual leakage with cough).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Urinalysis + post-void residual + bladder diary.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Q-tip test — urethral hypermobility evaluation.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Urodynamics for refractory / mixed / planned surgery.", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity (1-hour pad test, leakage frequency).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Reversible factors — weight, smoking, chronic cough, constipation.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Treatment goals + expectations — surgical vs conservative; quality of life.", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("PELVIC FLOOR MUSCLE EXERCISES (Kegels) — first-line; daily 3 sets × 10 contractions; supervised PT improves outcomes per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("WEIGHT LOSS — every 5–10% reduces leakage.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Topical vaginal estrogen — postmenopausal; improves urethral mucosa.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("PESSARY — vaginal device supporting urethrovaginal junction; non-surgical option.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("BIOFEEDBACK + PT — supervised pelvic floor rehabilitation.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("MIDURETHRAL SLING (TVT, TOT) — surgical gold standard; high success rate per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Burch colposuspension — alternative surgical.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Periurethral bulking agents — minimally invasive option.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("DULOXETINE (in some countries) — pharmacologic option.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Address constipation, smoking, chronic cough.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("MESH SLING complications — vaginal exposure, dyspareunia, urinary retention; FDA labeled mesh complications per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("MIXED INCONTINENCE — addressing only stress component leaves urge unaddressed; full evaluation.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("UTI from urinary stasis (less in pure SUI).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Quality of life + sexual health — significant; address routinely.", citationIDs: ["openrn_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AcuteGNSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "glomerulonephritis",
        title: "Acute glomerulonephritis (post-strep + others)",
        subtitle: "Hematuria + RBC casts + HTN + edema + AKI · IgA vs PSGN · supportive + treat underlying",
        nclexTags: renalR19,
        definition: AttributedProse(
            "Inflammation of glomeruli causing acute nephritic syndrome — hematuria, RBC casts, hypertension, edema, AKI. Common causes — post-streptococcal GN (children), IgA nephropathy (most common worldwide), ANCA-associated, lupus nephritis, anti-GBM, rapidly progressive GN per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Immune-mediated glomerular injury → endothelial damage + capillary leak + glomerular inflammation → hematuria + proteinuria + reduced GFR. Subtypes have distinct mechanisms — IgA deposits, anti-GBM antibodies, immune complex deposition (PSGN), pauci-immune (ANCA).",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("NEPHRITIC SYNDROME — hematuria (\"cola-colored\" urine), RBC casts on micro, hypertension, edema (often periorbital), oliguria, AKI.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("PSGN — child 1–3 weeks after strep pharyngitis or pyoderma; typically self-limited.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("IgA nephropathy — synpharyngitic gross hematuria within days of URI; recurrent.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Vasculitis (ANCA, anti-GBM) — pulmonary-renal syndrome with hemoptysis + dyspnea + AKI; rapid progression.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Lupus nephritis — multisystem features + low complement.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Urinalysis + microscopy — hematuria, dysmorphic RBCs, RBC casts, proteinuria.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Spot urine PCR; serum creatinine + BUN + electrolytes.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Serologies — ASO (PSGN), C3 / C4 (low in PSGN, lupus, MPGN; normal in IgA, ANCA), ANA / anti-dsDNA (lupus), ANCA, anti-GBM, hepatitis B / C, HIV.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("RENAL BIOPSY — definitive for type of GN; light + IF + EM.", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("AKI severity + need for renal replacement.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("BP control + fluid status.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Identify systemic disease (lupus, vasculitis, anti-GBM) — guides specific therapy.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Pulmonary involvement (RPGN with pulmonary hemorrhage) — emergency.", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("PSGN — supportive — fluid + sodium restriction, BP control (ACEi / ARB / loops), treat strep if active per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("IgA nephropathy — RAS blockade, BP control, fish oil; immunosuppression for high-risk per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Lupus nephritis — class III/IV — induction with steroids + cyclophosphamide OR mycophenolate; maintenance per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("ANCA-associated vasculitis — induction with rituximab OR cyclophosphamide + high-dose steroids; plasmapheresis selected per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Anti-GBM — emergent plasmapheresis + cyclophosphamide + steroids per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("HEMODIALYSIS for severe AKI / hyperkalemia / fluid overload / uremia.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Long-term — BP control, RAS blockade, control proteinuria, monitor renal function.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("RAPIDLY PROGRESSIVE GN — emergent biopsy + immunosuppression to preserve renal function.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("PULMONARY-RENAL SYNDROME (anti-GBM, ANCA) — emergent plasmapheresis + immunosuppression; ICU.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("HYPERTENSIVE EMERGENCY — IV antihypertensives.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Long-term progression — many GNs cause CKD; nephrology follow-up + RAS blockade.", citationIDs: ["openrn_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum IgANephropathySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "iga-nephropathy",
        title: "IgA nephropathy (Berger disease)",
        subtitle: "Most common GN worldwide · synpharyngitic hematuria · RAS blockade + selective immunosuppression",
        nclexTags: renalR19,
        definition: AttributedProse(
            "Most common primary glomerulonephritis worldwide — IgA immune complex deposition in glomerular mesangium → variable clinical presentation from asymptomatic hematuria to rapidly progressive GN. ~30–40% progress to ESRD over decades per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Galactose-deficient IgA1 → autoantibody formation → IgA-IgG immune complexes deposit in mesangium → mesangial cell proliferation + matrix expansion + complement activation → glomerular injury.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("SYNPHARYNGITIC GROSS HEMATURIA — visible hematuria within days of URI / GI infection / exercise; classic presentation in young adults.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Asymptomatic microscopic hematuria + proteinuria — found incidentally.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Nephritic syndrome — hematuria, RBC casts, HTN, edema; sometimes nephrotic-range proteinuria.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Henoch-Schönlein purpura (HSP / IgA vasculitis) — IgA nephropathy with palpable purpura, abdominal pain, arthralgia (often pediatric).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Risk factors — Asian / Pacific Islander / Caucasian descent; family history.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("RENAL BIOPSY — required for definitive diagnosis; mesangial IgA deposits on immunofluorescence; mesangial proliferation on light microscopy per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Urinalysis — hematuria, dysmorphic RBCs, proteinuria; quantify with spot UPCR.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Serum IgA elevated in 50% — supportive but not diagnostic.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Normal complement (vs PSGN, lupus).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Oxford MEST-C score — pathologic prognostic indicators.", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Risk stratification — proteinuria >1 g/day, eGFR decline, HTN — high-risk progression.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("BP control + RAS blockade.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Coordinate nephrology long-term.", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("ACE INHIBITOR / ARB — first-line for proteinuria + BP control; goal proteinuria <0.5 g/day per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("BP target <130/80; SGLT2 inhibitors (dapagliflozin) for proteinuria + CKD per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Sparsentan (dual ETA + AT1 antagonist) — recently approved for IgAN proteinuria reduction per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Targeted-release budesonide (Tarpeyo / Nefecon) — reduces IgA proteinuria per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("CORTICOSTEROIDS — for high-risk progression despite RAS blockade; KDIGO 2021 guidelines per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Other immunosuppression (mycophenolate, cyclophosphamide) — refractory / RPGN per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Lifestyle — smoking cessation, weight management, sodium restriction, fish oil.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("HSP — supportive; steroids selected; renal involvement guides treatment.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Renal transplant — recurrence common (~30%).", citationIDs: ["specialty_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("RPGN (rapidly progressive crescentic) — aggressive immunosuppression + plasmapheresis selected.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("PROGRESSION TO ESRD — 30–40% over decades; control proteinuria + BP key.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("RECURRENCE post-transplant — ~30% but graft loss less common.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("HSP nephritis in pediatrics — long-term renal follow-up.", citationIDs: ["openrn_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ADPKDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "adpkd",
        title: "Autosomal dominant polycystic kidney disease (ADPKD)",
        subtitle: "PKD1 / PKD2 mutations · cyst growth · HTN + hematuria + flank pain · TOLVAPTAN slows progression",
        nclexTags: renalR19,
        definition: AttributedProse(
            "Most common inherited kidney disease — autosomal dominant mutations in PKD1 (85%, more severe) or PKD2 → progressive bilateral kidney cysts → chronic kidney disease → ESRD by age 60–80 in most patients. ~50% of children of affected parent inherit per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Mutations in polycystin-1 / -2 → ciliary dysfunction in tubular epithelium → cyst formation + growth → progressive parenchymal destruction + fibrosis → CKD. Extra-renal — liver cysts, intracranial aneurysms, cardiac valve abnormalities, diverticulosis.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic until 30–40s; hypertension is earliest finding.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Flank / abdominal pain, hematuria, kidney stones, recurrent UTIs.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Palpable kidneys + abdominal mass in advanced disease.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Liver cysts (massive in some); diverticulosis; mitral valve prolapse; intracranial aneurysms 5–10%.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("CKD progression — fatigue, edema, anemia, electrolyte abnormalities.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Renal ultrasound — number + size of cysts; age-adjusted (Ravine criteria) or genetic testing per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("CT or MRI — TKV (total kidney volume) for prognostication; cyst characterization.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Genetic testing — confirms diagnosis especially atypical / pediatric / no family history; useful for living kidney donor screening.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Mayo classification (1A–1E) by TKV + age — predicts progression risk.", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("BP control — slows progression + reduces aneurysm rupture.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Family screening + genetic counseling.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Intracranial aneurysm screening — MRA in family history of SAH / aneurysm OR personal history of intracranial / aortic aneurysm per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Coordinate nephrology + cardiology + genetic counseling + transplant team.", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("BP CONTROL — ACEi / ARB target <120/80 in young adults; <130/80 elderly per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("TOLVAPTAN — V2 receptor antagonist; slows TKV growth + eGFR decline in high-risk patients per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Tolvaptan — REMS for hepatotoxicity monitoring; LFTs monthly first 18 months per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("HIGH FLUID INTAKE 2.5–3 L/day — suppresses ADH → suppresses cyst growth (lower-grade evidence).", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Low-sodium diet; moderate protein restriction.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Pain management — non-opioid first; cyst aspiration / sclerotherapy / nephrectomy for refractory.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("UTI / pyelonephritis treatment — lipophilic abx (TMP-SMX, fluoroquinolones) penetrate cysts.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Stone management — preventive hydration, alkalinization, dietary modification.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Renal transplant — preferred RRT modality; living donor evaluation.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("AVOID nephrotoxic NSAIDs + aminoglycosides; intracranial aneurysm avoid stimulants + vigorous Valsalva.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("INTRACRANIAL ANEURYSM RUPTURE — sudden severe headache; emergent CT + neurosurgery; family history triggers screening.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("CYST RUPTURE / HEMORRHAGE — sudden flank pain + gross hematuria; usually self-limited.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("CYST INFECTION — fever + flank pain; lipophilic abx weeks.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("HEPATIC CYST complications — pain, infection, biliary obstruction.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Tolvaptan hepatotoxicity — symptoms requiring discontinuation.", citationIDs: ["specialty_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum DiabeticNephropathySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "diabetic-nephropathy",
        title: "Diabetic kidney disease (DKD)",
        subtitle: "Leading cause of ESRD · albuminuria + eGFR decline · ACEi/ARB + SGLT2 + finerenone",
        nclexTags: renalR19,
        definition: AttributedProse(
            "Chronic kidney disease attributable to diabetes mellitus — leading cause of ESRD in US (~40%). Characterized by albuminuria + eGFR decline + characteristic histopathology (glomerular hypertrophy, mesangial expansion, Kimmelstiel-Wilson nodules) per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Hyperglycemia + advanced glycation + RAAS overactivation + hemodynamic changes + oxidative stress + inflammation → glomerular hypertrophy → hyperfiltration → mesangial expansion → glomerulosclerosis + tubulointerstitial fibrosis → CKD progression.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic until late stages; routine screening detects early.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Albuminuria — initial hyperfiltration → microalbuminuria (30–300 mg/g UACR) → macroalbuminuria (>300).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("eGFR decline — eventual progression to ESRD.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Hypertension (very common); fluid retention; uremic symptoms (advanced CKD).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Concomitant diabetic complications — retinopathy (often coexistent), neuropathy, CV disease.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Annual screening in T1DM after 5 years + T2DM at diagnosis — UACR + eGFR per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("UACR ≥30 mg/g on 2 of 3 samples confirms albuminuria.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Renal biopsy — uncertain etiology / atypical course (e.g., red cell casts, rapid eGFR decline, no retinopathy in T1DM).", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Differentiate from non-diabetic kidney disease — younger onset / rapid decline / no retinopathy / hematuria suggest alternative.", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Glycemic control — A1c target individualized (typically <7% non-elderly, less strict elderly).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("BP control — target <130/80 (KDIGO).", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("CV risk modification — statin, antiplatelet selected.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Coordinate diabetes + nephrology + cardiology + dietitian + diabetes educator.", citationIDs: ["openrn_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("ACEi / ARB — first-line for albuminuria + HTN; reduces progression + CV events per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("SGLT2 INHIBITORS (dapagliflozin, empagliflozin, canagliflozin) — reduces eGFR decline + CV events + HF; recommended in T2DM + CKD per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("FINERENONE (non-steroidal MRA) — added benefit on top of RAS blockade in DKD with proteinuria per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("GLP-1 receptor agonists (semaglutide, liraglutide) — CV + renal benefit; weight loss; A1c control per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("METFORMIN — first-line if eGFR ≥30; lower dose 30–45.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Manage CKD complications — anemia (ESA), bone-mineral disease (vitamin D, phosphate binders), hyperkalemia (patiromer), acidosis (bicarbonate).", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Statin for CV risk; aspirin selectively.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Dietary — sodium restriction; avoid excess protein + potassium / phosphate per stage.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Smoking cessation; weight loss + exercise.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Renal replacement preparation — vascular access timing + transplant evaluation in stages 4–5.", citationIDs: ["specialty_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("HYPERKALEMIA on RAS blockade + MRA + SGLT2; potassium binders if needed; never stop these critical drugs without specialty input.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("ACUTE eGFR drop 10–25% on RAS / SGLT2 initiation — usually expected hemodynamic effect; do not discontinue if stable.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("EUGLYCEMIC DKA on SGLT2 — counsel sick-day rules; stop if intercurrent illness.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("CV mortality — leading cause of death in DKD; aggressive CV risk reduction.", citationIDs: ["openrn_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PostmenopausalOsteoporosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "postmenopausal-osteoporosis",
        title: "Postmenopausal osteoporosis",
        subtitle: "Estrogen loss + bone loss · DEXA + FRAX · bisphosphonate / denosumab / teriparatide · fall prevention",
        nclexTags: mskR19,
        definition: AttributedProse(
            "Skeletal disorder of compromised bone strength → increased fracture risk. Diagnosed by T-score ≤-2.5 on DEXA (lumbar spine, total hip, or femoral neck) OR fragility fracture (hip / vertebra). Postmenopausal women highest prevalence due to estrogen deficiency + age per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Estrogen deficiency → increased osteoclast activity + decreased osteoblast → trabecular bone loss; aging adds cortical loss. Net resorption > formation → reduced BMD + microarchitectural deterioration → fragility fractures.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("Asymptomatic until fracture — \"silent disease\"; routine DEXA screening recommended.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Fragility fractures — vertebral compression (height loss, kyphosis, back pain), hip, distal radius (Colles), proximal humerus.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Risk factors — age, female, postmenopausal, low body weight, family history of hip fracture, smoking, alcohol >3 drinks/day, chronic steroid use, hyperthyroidism, malabsorption, hypogonadism, immobility.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Secondary osteoporosis — Cushing's, hyperparathyroidism, hyperthyroidism, celiac, IBD, MM, chronic kidney + liver disease.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DEXA T-score ≤-2.5 OR fragility fracture per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Z-score (age-matched) <-2.0 → consider secondary causes.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("FRAX score — 10-year fracture probability; treat if hip ≥3% or major osteoporotic ≥20% per NOF per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Workup secondary causes — calcium, vitamin D 25-OH, PTH, TSH, SPEP / UPEP, celiac panel, 24-hour urine calcium.", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Fracture risk stratification (DEXA + FRAX); identify reversible factors.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Fall risk assessment + home safety.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Vitamin D + calcium adequacy; lifestyle factors.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Coordinate primary care + endocrinology + gynecology + dietitian + PT.", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("CALCIUM 1000–1200 mg/day + VITAMIN D 800–1000 IU daily — diet preferred per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("WEIGHT-BEARING + RESISTANCE EXERCISE 30 min most days; balance training (Tai Chi).", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("BISPHOSPHONATES first-line — alendronate / risedronate / ibandronate PO; zoledronic acid IV per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("DENOSUMAB SQ q6 months — particularly in CKD or bisphosphonate-intolerant; never stop without bridge per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("TERIPARATIDE / ABALOPARATIDE — anabolic agents; severe osteoporosis or refractory; max 2 years.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("ROMOSOZUMAB — anti-sclerostin; severe osteoporosis / high fracture risk; 12-month course per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("SERMs (raloxifene) — alternative; reduces vertebral fractures + breast cancer risk; VTE risk.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("HRT — for women with vasomotor symptoms + osteoporosis prevention; not first-line for osteoporosis alone per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Smoking cessation + alcohol moderation.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("FALL PREVENTION — STEADI bundle, vision check, footwear, home safety, vestibular eval, vitamin D.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Drug holiday after 3–5 years of bisphosphonate in low-risk; continue 5–10 years if high-risk per primary source.", citationIDs: ["specialty_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("VERTEBRAL COMPRESSION FRACTURE — sudden back pain after minor activity; X-ray + MRI; calcitonin / kyphoplasty / vertebroplasty selected.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("HIP FRACTURE — high mortality (~20% at 1 year); surgical repair within 24–48 hours preferred; multidisciplinary geriatric care per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("ONJ + atypical femur fracture — rare but serious complications of antiresorptive therapy.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("DENOSUMAB DISCONTINUATION REBOUND — multiple vertebral fractures; bridge with bisphosphonate.", citationIDs: ["specialty_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum KneeOASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "knee-oa",
        title: "Knee osteoarthritis (OA)",
        subtitle: "Cartilage degeneration · pain + stiffness · weight + exercise + topical NSAID + selective joint replacement",
        nclexTags: mskR19,
        definition: AttributedProse(
            "Most common form of arthritis; degenerative joint disease characterized by cartilage loss, subchondral bone sclerosis, osteophyte formation, synovial inflammation. Knee OA leading cause of disability in older adults. Multifactorial — age, weight, prior trauma, genetics per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Cartilage breakdown > synthesis → subchondral bone exposure + remodeling + osteophyte formation + synovial inflammation → joint pain + reduced range of motion + functional decline.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("Insidious knee pain — worsens with activity, improves with rest; gel phenomenon (stiffness after rest <30 min).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Crepitus, decreased ROM, malalignment (varus more than valgus), effusions, Baker cysts.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Functional limitations — stair climbing, prolonged standing, kneeling.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Risk factors — age, female, obesity, prior injury, occupational squatting / heavy labor, family history.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis — typical history + exam; X-ray confirms (joint space narrowing, osteophytes, subchondral sclerosis, cysts).", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Differentiate from inflammatory arthritis (RA) — morning stiffness >1 hour, multiple joints, systemic features.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("MRI rarely needed — for surgical planning or atypical / refractory cases.", citationIDs: ["openrn_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain severity + functional impact (WOMAC / KOOS).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Comorbidities — CV / GI / renal for NSAID safety.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Falls risk + ambulation aids.", citationIDs: ["openrn_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("NON-PHARMACOLOGIC FIRST-LINE — patient education, exercise (aerobic + strengthening + range), weight loss (every 5 kg = significant pain reduction), bracing, assistive devices per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("TOPICAL NSAIDS — first-line pharmacologic; lower systemic side effects than oral.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("ORAL NSAIDS — adjunct; lowest dose × shortest time; GI / CV / renal monitoring.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("ACETAMINOPHEN — limited evidence; second-line.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("INTRAARTICULAR CORTICOSTEROIDS — short-term flares; limit to ≤4 / year per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("INTRAARTICULAR HYALURONIC ACID — controversial efficacy; not strongly recommended.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("TRAMADOL or DULOXETINE — selected; opioids generally avoided per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("TOTAL KNEE REPLACEMENT — refractory severe + functional limitation; high satisfaction (~85%) per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Acupuncture, Tai Chi, yoga — moderate evidence as adjuncts.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("AVOID glucosamine / chondroitin — limited efficacy.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Multidisciplinary — PT, OT, occupational evaluation.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("DELAYED REFERRAL FOR REPLACEMENT — significant disability + failed conservative; orthopedic consultation.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("CHRONIC NSAID adverse effects — GI, CV, renal; PPI cover; monitor.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("FALLS from gait disturbance — assess + intervene.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("PAIN MANAGEMENT — multimodal; opioid avoidance.", citationIDs: ["specialty_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum LowBackPainSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "low-back-pain",
        title: "Low back pain (acute + chronic)",
        subtitle: "RED FLAGS first · most non-specific mechanical · stay active + heat + NSAID · imaging only if red flags",
        nclexTags: mskR19,
        definition: AttributedProse(
            "Pain in lumbar / sacral region — acute (<6 weeks), subacute (6–12 weeks), chronic (>12 weeks). Most cases (~85%) are non-specific mechanical — self-limited. Critical to identify red flags (cauda equina, fracture, malignancy, infection) requiring urgent workup per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — myofascial strain, disc degeneration / herniation, facet joint arthropathy, spinal stenosis, sacroiliac joint dysfunction, nerve root impingement, vertebral fracture, infection, malignancy.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("Aching / stiffness in lower back; can radiate to buttocks / posterior thigh; worse with movement / improved with rest typical for mechanical.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("RED FLAGS — saddle anesthesia / urinary retention / fecal incontinence / new bilateral leg weakness (CAUDA EQUINA — emergent), fever / IV drug use / immunosuppression (infection), trauma + osteoporosis (fracture), age >50 with weight loss / malignancy history (cancer), morning stiffness >1 hr (inflammatory).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Sciatica — radicular pain L4-S1 distribution + positive straight-leg-raise.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Spinal stenosis — neurogenic claudication (pain with extension, relief with flexion / sitting).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Most non-specific — no anatomic source identified; functional + behavioral factors.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical history + exam — focus on red flags.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("AVOID imaging in non-specific LBP <6 weeks WITHOUT red flags — does not improve outcomes + may cause harm per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("MRI for — cauda equina, neurologic deficit, infection, malignancy, refractory >6 weeks, surgical candidate per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("X-ray — fracture suspicion, osteoporosis screening.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Labs — selective; ESR / CRP if infection / malignancy suspected.", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("RED FLAGS — emergent if cauda equina; urgent if fracture / infection / malignancy.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Functional impact + work / disability planning.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Psychosocial factors — yellow flags (catastrophizing, fear-avoidance, depression).", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("STAY ACTIVE — bed rest harmful; gentle activity + return to work as tolerated per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("NON-PHARMACOLOGIC FIRST-LINE — heat / cold, exercise (yoga, Tai Chi), spinal manipulation (acute), massage, acupuncture, mindfulness-based stress reduction per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("TOPICAL / ORAL NSAIDS first-line pharmacologic; counsel risks per comorbidities.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Skeletal muscle relaxants (cyclobenzaprine, tizanidine) short-term selected.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("AVOID OPIOIDS routine; reserve for severe refractory short-term per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Chronic LBP — multidisciplinary rehabilitation + cognitive-behavioral therapy + exercise; SNRIs (duloxetine) selected.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Epidural steroid injection — selected radiculopathy short-term relief.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Surgery — refractory neurologic deficit / cauda equina / spinal instability / fracture / malignancy per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Address yellow flags — depression treatment, fear-avoidance education, work modification.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("CAUDA EQUINA — saddle anesthesia + bilateral leg weakness + bladder / bowel dysfunction; EMERGENT MRI + neurosurgical decompression per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("VERTEBRAL OSTEOMYELITIS / EPIDURAL ABSCESS — fever + IV drug use / endocarditis / immunosuppression; emergent MRI + abx + surgery.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("PATHOLOGIC FRACTURE / MALIGNANCY — age >50 + weight loss / cancer history + night pain; imaging.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("CHRONIC OPIOID DEPENDENCY — risk of long-term LBP management; multimodal alternatives preferred.", citationIDs: ["specialty_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum SpinalStenosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "spinal-stenosis",
        title: "Lumbar spinal stenosis",
        subtitle: "Neurogenic claudication · pain with extension · flexion relief · PT first · laminectomy if severe",
        nclexTags: mskR19,
        definition: AttributedProse(
            "Narrowing of spinal canal / lateral recesses / neural foramina compressing neural elements (cauda equina, nerve roots). Most common in older adults; degenerative cause from disc + facet + ligament hypertrophy. Hallmark — neurogenic claudication per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Degenerative disc disease + facet osteoarthropathy + ligamentum flavum hypertrophy + spondylolisthesis → narrowing of spinal canal → mechanical compression + venous congestion of cauda equina with extension → neurogenic claudication.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("NEUROGENIC CLAUDICATION — bilateral / unilateral leg pain + paresthesias + weakness with walking / extension; RELIEVED by FORWARD FLEXION (sitting, leaning over shopping cart).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Differentiate from VASCULAR CLAUDICATION — relieved by stopping (regardless of position); affected by pulses + ABI.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Back pain often less prominent than leg symptoms.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Neuro exam often normal; positive Romberg, decreased deep tendon reflexes possible.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Severe — bowel / bladder dysfunction (cauda equina syndrome) emergent.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical history + exam — neurogenic claudication is hallmark.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("MRI lumbar spine — confirms; canal diameter + degree of narrowing per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("CT myelogram — alternative if MRI contraindicated.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("ABI to rule out PAD if vascular claudication suspected.", citationIDs: ["specialty_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Functional impact — walking distance, stair climbing.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Cauda equina symptoms — saddle anesthesia + bowel / bladder dysfunction = emergency.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Comorbidity assessment for surgical candidacy.", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("CONSERVATIVE FIRST-LINE — physical therapy (flexion-based exercises, postural training, core strengthening), aerobic conditioning (cycling > walking), NSAIDs per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Activity modification — avoid prolonged standing / extension; lean forward when walking.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Walking aid — cane, walker, shopping cart for support during ambulation.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Epidural steroid injection — selected; transient symptom relief.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Gabapentin / pregabalin — neuropathic pain component selected.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("LAMINECTOMY ± fusion — refractory severe stenosis + functional limitation; better leg symptom relief than back per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Interspinous spacer devices — selected; less invasive option.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Multidisciplinary — physiatry + spine surgery + pain management.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("CAUDA EQUINA — saddle anesthesia + bowel/bladder dysfunction + bilateral leg weakness; EMERGENT MRI + decompression per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("VASCULAR CLAUDICATION mimic — ABI screening + vascular evaluation if suspicious.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("PROGRESSION over years — most patients stable; some progress requiring surgery.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("DECONDITIONING from activity restriction — encourage exercise program adapted to symptoms.", citationIDs: ["openrn_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PMDDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pmdd",
        title: "Premenstrual dysphoric disorder (PMDD)",
        subtitle: "Severe luteal-phase mood symptoms · functional impairment · SSRI luteal or continuous · OCPs",
        nclexTags: psychR19,
        definition: AttributedProse(
            "Severe variant of PMS — recurrent affective + somatic symptoms in late luteal phase, resolving within days of menses onset, with significant functional / interpersonal impairment. DSM-5 disorder; affects ~3–8% of menstruating women per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Heightened sensitivity to normal ovarian hormone cycling — affects serotonin + GABA neurotransmission. Not from abnormal hormone levels but from variable CNS response to physiologic fluctuations.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("AFFECTIVE — marked depression, hopelessness, anxiety, irritability, mood lability, anger.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("BEHAVIORAL — decreased interest, difficulty concentrating, lethargy, appetite + sleep changes, sense of being overwhelmed.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("SOMATIC — breast tenderness, bloating, headache, joint / muscle pain.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Pattern — symptoms in last week of luteal phase + improve within few days of menses + minimal / absent in first week post-menses.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Functional impairment — work, relationships, daily activities — marked + clinically significant.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5 — ≥5 symptoms (≥1 affective) in most cycles for ≥1 year + functional impairment + 2 cycles of prospective daily symptom rating per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("DAILY SYMPTOM RATING (e.g., DRSP) for 2 cycles confirms cyclic pattern + rules out underlying mood disorder.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Differentiate from MDD / bipolar (no menstrual cycle pattern), PMS (less severe), perimenopause.", citationIDs: ["openrn_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Suicide risk assessment — increased perimenstrual.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Comorbid depression / anxiety + substance use.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Reproductive plans + contraceptive considerations.", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("SSRI FIRST-LINE — fluoxetine, sertraline, paroxetine; can be CONTINUOUS or LUTEAL-PHASE-ONLY (cycle days 14–28) per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("COMBINED ORAL CONTRACEPTIVES — drospirenone-containing 24/4 (Yaz) FDA-approved for PMDD per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("CBT — adjunctive; evidence-based; addresses coping + cognitive distortions.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("LIFESTYLE — aerobic exercise, sleep hygiene, calcium 1200 mg, vitamin B6 50–100 mg, reducing caffeine + alcohol per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("GnRH agonist (leuprolide) + add-back HRT — refractory; severe.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Bilateral oophorectomy — last resort refractory severe.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Avoid use of evening primrose oil, St. John's wort routinely (limited evidence + drug interactions).", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Patient education + symptom diary + family / partner involvement.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("SUICIDE risk perimenstrual — direct assessment + safety planning.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("BIPOLAR + PMDD overlap — antidepressant alone may worsen bipolar; mood stabilizer + careful monitoring.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Distinguish from premenstrual exacerbation of MDD / anxiety — different treatment approach.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Pregnancy planning — SSRIs continued in many cases; collaborative decision; avoid valproate.", citationIDs: ["specialty_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum FrozenShoulderSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "frozen-shoulder",
        title: "Adhesive capsulitis (frozen shoulder)",
        subtitle: "Painful → stiff → resolving phases · 1–3 years · DM + thyroid risk · PT + intraarticular steroid",
        nclexTags: mskR19,
        definition: AttributedProse(
            "Idiopathic shoulder disorder characterized by progressive pain + restriction of both active + passive ROM in glenohumeral joint, due to capsular thickening + contraction. Three phases — painful (freezing) → stiff (frozen) → resolving (thawing); 1–3 year course typical per primary source.",
            citationIDs: ["openrn_dx_round19", "specialty_dx_round19"]
        ),
        pathophysiology: AttributedProse(
            "Inflammatory + fibrotic process in glenohumeral capsule + ligaments → coracohumeral ligament + rotator interval thickening + contracture → loss of capsular volume + ROM. Often idiopathic; secondary to immobilization, surgery, trauma, DM, thyroid disorders.",
            citationIDs: ["openrn_dx_round19"]
        ),
        presentation: [
            AttributedBullet("PAINFUL (freezing) phase — 2–9 months — increasing pain + decreasing ROM, especially external rotation.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("STIFF (frozen) phase — 4–12 months — pain decreases, stiffness peaks; severe ROM restriction.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("RESOLVING (thawing) phase — 5–24 months — gradual return of ROM; pain minimal.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Loss of BOTH active + passive ROM (vs rotator cuff tear which preserves passive).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Risk factors — age 40–60, female, DIABETES (~20% lifetime risk in DM), thyroid disease, prolonged immobilization, post-surgery, prior shoulder trauma.", citationIDs: ["openrn_dx_round19"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — typical phasic course + exam findings of restricted active + passive ROM.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("X-ray — usually normal; rules out OA / fracture.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("MRI — capsular thickening + axillary recess obliteration; usually not necessary.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Diagnostic injection — local anesthetic differentiates frozen shoulder from rotator cuff disease.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Workup associated conditions — A1c, TSH for new-onset.", citationIDs: ["openrn_dx_round19"])
        ],
        priorityAssessments: [
            AttributedBullet("Phase identification — guides treatment intensity.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Functional impact (DASH, ASES scores).", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Comorbidities — diabetes control + thyroid.", citationIDs: ["specialty_dx_round19"])
        ],
        commonInterventions: [
            AttributedBullet("PHYSICAL THERAPY — ROM-preserving home + supervised; gentle stretching first; aggressive in stiff phase per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("INTRAARTICULAR CORTICOSTEROID INJECTION — most effective in painful phase; short-term symptom relief; combined with PT per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("HYDRODILATATION — pressure expansion of capsule; selected.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Oral NSAIDs — symptomatic; pain in painful phase.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Manipulation under anesthesia (MUA) OR arthroscopic capsular release — refractory; persistent stiffness > 6 months despite conservative per primary source.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Optimize DIABETES + THYROID control — improves outcomes.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("Patient education on phasic course + duration — sets realistic expectations.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("Multidisciplinary — orthopedics + PT + endocrinology if comorbid DM / thyroid.", citationIDs: ["openrn_dx_round19"])
        ],
        watchFor: [
            AttributedBullet("MISSED ROTATOR CUFF TEAR — preserved passive ROM despite limited active; MRI if exam ambiguous.", citationIDs: ["openrn_dx_round19"]),
            AttributedBullet("DIABETIC FROZEN SHOULDER — more severe, prolonged, refractory; may need surgical release.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("CONTRALATERAL SHOULDER — ~20% develop frozen shoulder on opposite side; counsel.", citationIDs: ["specialty_dx_round19"]),
            AttributedBullet("PERSISTENT FUNCTIONAL DEFICIT — chronic mild ROM restriction in some despite resolution.", citationIDs: ["openrn_dx_round19"])
        ],
        citations: [openrnDxR19, specialtyDxR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}
