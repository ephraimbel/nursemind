import Foundation

// Curator-model procedures + reference (round 23 — OB emergencies + maternal early warning + genetic screening + anemia + labor stages).

private let openrnPRR23 = CitationSource(
    id: "openrn_pr_round23",
    shortName: "Open RN Maternity",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/maternal/",
    lastRetrieved: "2026-05-12"
)
private let cdcPRR23 = CitationSource(
    id: "cdc_pr_round23",
    shortName: "CDC + ACOG + AAP guidance",
    publisher: "CDC · ACOG · AAP",
    license: .publicDomain,
    url: "https://www.cdc.gov/maternal-mortality/",
    lastRetrieved: "2026-05-12"
)
private let specialtyPRR23 = CitationSource(
    id: "specialty_pr_round23",
    shortName: "ACOG + SMFM + USPSTF concept citations",
    publisher: "ACOG · SMFM · USPSTF",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-12"
)

private let procTagsR23 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR23 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum ShoulderDystociaDrillSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "shoulder-dystocia-drill",
        title: "Shoulder dystocia management drill (HELPERR)",
        subtitle: "OB EMERGENCY · McRoberts + suprapubic first · sequential maneuvers · time stamp · meticulous documentation",
        nclexTags: procTagsR23,
        indications: AttributedProse(
            "Shoulder dystocia at delivery — anterior shoulder fails to deliver after head with gentle downward traction. Time-critical OB emergency; delay >5 minutes increases neonatal hypoxic injury per primary source.",
            citationIDs: ["specialty_pr_round23"]
        ),
        contraindications: AttributedProse(
            "No contraindications to maneuvers — required emergency response. Some maneuvers (Zavanelli) reserved for refractory cases.",
            citationIDs: ["specialty_pr_round23"]
        ),
        equipment: [
            AttributedBullet("Bed with adjustable height + headboard.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Stool / step for assistant providing suprapubic pressure.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Mayo stand with shoulder dystocia kit (gloves, lubricant, additional staff).", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Neonatal resuscitation equipment + warmer + team activated.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Documentation tools — time-stamped checklist; audio recording sometimes used in simulation.", citationIDs: ["specialty_pr_round23"])
        ],
        preProcedure: [
            AttributedBullet("CALL FOR HELP — additional nurses, anesthesia, neonatology, additional providers.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Document time of head delivery; subsequent times of each maneuver + delivery.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Identify team roles — primary provider, recorder, suprapubic pressure, leg holders, neonatal team.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("AVOID FUNDAL PRESSURE — worsens impaction + risk of uterine rupture.", citationIDs: ["specialty_pr_round23"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "H — Help / call team", body: "Activate emergency response immediately; additional providers, anesthesia, neonatal team. Note time of head delivery.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 2, title: "E — Evaluate for episiotomy", body: "Consider episiotomy if perineum tight (creates space for internal maneuvers); not routine.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 3, title: "L — Legs (McRoberts)", body: "Sharply hyperflex maternal hips against abdomen — FLATTENS lumbar lordosis; rotates pubic symphysis cephalad; resolves ~40% per primary source.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 4, title: "P — Pressure (suprapubic)", body: "Assistant applies SUPRAPUBIC pressure (NOT fundal) — downward + lateral toward fetal back to dislodge anterior shoulder; combined with McRoberts resolves >80% per primary source.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 5, title: "E — Enter (Rubin maneuver)", body: "Provider's hand into vagina; pressure on POSTERIOR aspect of anterior shoulder to ADDUCT it + rotate to oblique diameter.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 6, title: "R — Rotational (Wood's screw)", body: "Pressure on ANTERIOR aspect of POSTERIOR shoulder + clockwise rotation 180° to bring posterior to anterior position.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 7, title: "R — Remove posterior arm", body: "Sweep posterior arm across fetal chest + deliver; SINGLE most effective maneuver after McRoberts + SPP fail (~70-80% per primary source). Risk of humerus fracture.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 8, title: "Last resorts", body: "GASKIN (all-fours) — patient on hands + knees, gravity helps; ZAVANELLI — push head back + emergent cesarean; SYMPHYSIOTOMY — rare; ABDOMINAL RESCUE.", citationIDs: ["specialty_pr_round23"])
        ],
        postProcedure: [
            AttributedBullet("Document — time of head delivery, each maneuver attempted in order with times, time of body delivery, team members, neonatal status.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Cord gases — document oxygenation status.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Neonatal exam — brachial plexus (Erb's ~50%), clavicle / humerus fractures, Apgars.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Maternal — assess for hemorrhage (atony common after dystocia), cervical / vaginal lacerations, perineal injury.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("DEBRIEF team — within hours; identify lessons + emotional impact.", citationIDs: ["specialty_pr_round23"])
        ],
        documentation: [
            AttributedBullet("Time-stamped sequence of maneuvers + team members + roles per primary source.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Estimated fetal weight, gestational age, risk factors.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Episiotomy if performed; cord gases; neonatal exam; Apgars at 1, 5, 10 min.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Maternal complications + estimated blood loss + lacerations / repair.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Counseling provided + plans for future delivery.", citationIDs: ["specialty_pr_round23"])
        ],
        watchFor: [
            AttributedBullet("HYPOXIC-ISCHEMIC ENCEPHALOPATHY — duration of shoulder dystocia >5 min raises risk; therapeutic hypothermia consideration.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("BRACHIAL PLEXUS INJURY — Erb's palsy ~50% of dystocia cases; document neonatal exam; pediatric neuro / surgical consult if persistent.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("CLAVICLE / HUMERUS FRACTURE — common; usually heal well.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("MATERNAL POSTPARTUM HEMORRHAGE — uterine atony from prolonged labor / dystocia; aggressive prophylactic uterotonics.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("LITIGATION risk — meticulous documentation essential per primary source; SIM training improves outcomes.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("RECURRENCE — modest in subsequent pregnancy; counsel; consider planned cesarean for severe prior + estimated macrosomia.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("STAFF DEBRIEFING — emotional support + lessons learned.", citationIDs: ["specialty_pr_round23"])
        ],
        citations: [openrnPRR23, cdcPRR23, specialtyPRR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ECVSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "external-cephalic-version",
        title: "External cephalic version (ECV)",
        subtitle: "37+ weeks for breech / transverse · success ~50-60% · tocolytic + epidural · IV ready · monitor FHR · post-Rh prophylaxis",
        nclexTags: procTagsR23,
        indications: AttributedProse(
            "Conversion of breech or transverse fetal presentation to vertex by external manipulation, performed at ≥37 weeks gestation. Success ~50-60%; reduces cesarean rate when successful per primary source. Patient counseling on risks + benefits.",
            citationIDs: ["specialty_pr_round23"]
        ),
        contraindications: AttributedProse(
            "Absolute — placenta previa, abruption, prior classical cesarean, prior uterine rupture, multifetal pregnancy, severe oligohydramnios, fetal anomaly, NRFHR, ROM, active labor, contraindication to vaginal delivery. Relative — fetal growth restriction, severe maternal hypertension, prior low transverse cesarean (most centers OK).",
            citationIDs: ["specialty_pr_round23"]
        ),
        equipment: [
            AttributedBullet("Continuous EFM (FHR + tocodynamometry).", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Ultrasound for confirming presentation + placenta + fetal status.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("IV access; tocolytic medication (terbutaline 0.25 mg SC); regional anesthesia (epidural / spinal often used).", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("OR ready in case emergent cesarean needed.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("RhoGAM available for Rh-negative patients.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Bed with Trendelenburg capability; pillows for positioning.", citationIDs: ["openrn_pr_round23"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders, consent, gestational age (≥37 weeks usually), allergies, NPO status (since OR backup).", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Recent ultrasound — fetal position, EFW, AFI, placental location, cord position.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("NST baseline — reassuring tracing required before proceeding.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Type + screen / crossmatch; CBC; IV access × 2 large-bore.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Tocolytic — terbutaline 0.25 mg SC 15-30 min before procedure to relax uterus.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Position — semi-Fowler with slight Trendelenburg + lateral tilt; comfort positioning.", citationIDs: ["openrn_pr_round23"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Final ultrasound", body: "Confirm presentation, placenta, AFI, FHR baseline, cord position; ensure no fetal anomaly + adequate fluid.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 2, title: "NST", body: "20-min reactive NST before proceeding; abnormal = postpone or cesarean.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 3, title: "Tocolysis", body: "Terbutaline 0.25 mg SC 15-30 min before — relaxes uterus; magnesium sulfate alternative; epidural / spinal often added (improves success).", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 4, title: "Position + lubricant", body: "Patient semi-Fowler + Trendelenburg + lateral tilt; abundant ultrasound gel on abdomen for hand-gliding.", citationIDs: ["openrn_pr_round23"]),
            ProcedureStep(number: 5, title: "Forward roll", body: "Two providers — one disengages buttocks from pelvis; other lifts head down + rotates fetus in direction it's already facing (forward roll if back is up, backward if back down).", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 6, title: "Backward roll if forward fails", body: "Try opposite direction if forward roll unsuccessful.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 7, title: "Monitor", body: "Continuous FHR + uterine monitoring throughout; STOP for prolonged deceleration / bradycardia / pain / discomfort intolerable.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 8, title: "Post-procedure assessment", body: "Confirm new presentation by US; reactive NST × 30-60 min post-procedure; count fetal movements.", citationIDs: ["specialty_pr_round23"])
        ],
        postProcedure: [
            AttributedBullet("Continuous FHR monitoring × 30-60 min post-procedure.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("RhoGAM 300 mcg IM if Rh-negative — regardless of success.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Document — pre-procedure presentation + AFI + FHR; tocolytic + anesthesia used; success / failure; post-procedure presentation; complications.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("If successful — discharge; continue routine prenatal; spontaneous reversion possible (rare).", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("If unsuccessful — schedule cesarean delivery (typically 39 weeks); counsel.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Counsel — continue fetal kick counts, return for decreased movement, contractions, ROM, bleeding.", citationIDs: ["specialty_pr_round23"])
        ],
        documentation: [
            AttributedBullet("Pre + post procedure presentation, AFI, FHR baseline + variability, tocolytic + anesthesia, success / failure, complications, RhoGAM if applicable.", citationIDs: ["specialty_pr_round23"])
        ],
        watchFor: [
            AttributedBullet("EMERGENT CESAREAN — placental abruption, NRFHR, persistent bradycardia (~0.5-1% require emergent cesarean) — OR availability essential per primary source.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("UMBILICAL CORD ENTANGLEMENT — uncommon but possible; close FHR monitoring.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("FETAL-MATERNAL HEMORRHAGE — Kleihauer-Betke if concern; additional RhoGAM if >30 mL FMH.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("PROM — defer ECV; cesarean if confirmed.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("PATIENT DISCOMFORT — significant pain common; epidural improves tolerance + success.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("FAILED ECV — schedule cesarean; counsel realistic outcomes; some institutions offer repeat ECV at next visit.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Spontaneous reversion to breech after successful ECV — uncommon (<5%); reassess at next visit.", citationIDs: ["specialty_pr_round23"])
        ],
        citations: [openrnPRR23, cdcPRR23, specialtyPRR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum BishopScoreSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "bishop-score",
        title: "Bishop score for cervical readiness for induction",
        subtitle: "Predicts induction success · 5 components scored 0-3 · ≥8 favorable · <6 = cervical ripening first · misoprostol / dinoprostone / Foley",
        nclexTags: procTagsR23,
        indications: AttributedProse(
            "Pre-induction cervical assessment to predict likelihood of successful labor induction → vaginal delivery. Guides decision between immediate oxytocin vs cervical ripening first per primary source.",
            citationIDs: ["specialty_pr_round23"]
        ),
        contraindications: AttributedProse(
            "No contraindications to assessment itself. Cervical exam contraindicated if placenta previa or severe vaginal bleeding without imaging.",
            citationIDs: ["specialty_pr_round23"]
        ),
        equipment: [
            AttributedBullet("Sterile gloves + lubricant.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Good lighting; comfortable patient positioning.", citationIDs: ["openrn_pr_round23"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders + indication for induction.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Hand hygiene; don sterile gloves.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Position dorsal lithotomy or supine with legs separated; comfort + privacy.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Confirm presenting part + verify no contraindications to vaginal exam (placenta previa, severe bleeding without imaging).", citationIDs: ["specialty_pr_round23"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Cervical dilation", body: "Closed = 0; 1-2 cm = 1; 3-4 cm = 2; ≥5 cm = 3.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 2, title: "Cervical effacement", body: "0-30% = 0; 40-50% = 1; 60-70% = 2; ≥80% = 3.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 3, title: "Fetal station", body: "-3 = 0; -2 = 1; -1 to 0 = 2; +1 to +2 = 3.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 4, title: "Cervical consistency", body: "Firm = 0; Medium = 1; Soft = 2; (no 3 score for consistency).", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 5, title: "Cervical position", body: "Posterior = 0; Mid = 1; Anterior = 2; (no 3 score for position).", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 6, title: "Total score (0-13)", body: "Sum of 5 components. ≥8 = favorable; 6-7 = intermediate; <6 = unfavorable per primary source.", citationIDs: ["specialty_pr_round23"]),
            ProcedureStep(number: 7, title: "Apply", body: "≥8 → start oxytocin without ripening; <6 → cervical ripening agent first (misoprostol, dinoprostone, Foley balloon).", citationIDs: ["specialty_pr_round23"])
        ],
        postProcedure: [
            AttributedBullet("Document Bishop score components + total + clinical decision.", citationIDs: ["openrn_pr_round23"]),
            AttributedBullet("Reassess after cervical ripening to determine readiness for oxytocin.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("Counsel patient on plan + expected timeline.", citationIDs: ["specialty_pr_round23"])
        ],
        documentation: [
            AttributedBullet("Date / time of exam; individual scores for each component; total Bishop score; decision (proceed to oxytocin vs cervical ripening); subsequent reassessments after ripening.", citationIDs: ["specialty_pr_round23"])
        ],
        watchFor: [
            AttributedBullet("UNFAVORABLE Bishop (<6) — cervical ripening first per primary source.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("MISOPROSTOL — 25 mcg PV q3-6h or 50 mcg PO q4h; off-label but standard; cheaper + as effective.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("DINOPROSTONE — Cervidil / Prepidil; FDA-approved; more expensive.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("FOLEY BALLOON — mechanical ripening; no medication; safe in TOLAC; effective.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("CONTRAINDICATIONS to misoprostol / dinoprostone — prior cesarean (TOLAC), uterine surgery, NRFHR; use Foley balloon instead.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("UTERINE TACHYSYSTOLE / hyperstimulation — common with prostaglandins; remove insert + terbutaline 0.25 mg SC.", citationIDs: ["specialty_pr_round23"]),
            AttributedBullet("FAILED INDUCTION — defined variably; some protocols allow 12-24 hrs of oxytocin + ROM before declaring failure.", citationIDs: ["specialty_pr_round23"])
        ],
        citations: [openrnPRR23, cdcPRR23, specialtyPRR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum MEOWSSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "maternal-early-warning",
        title: "Maternal early warning systems (MEOWS / MEWS)",
        subtitle: "Track maternal vitals · trigger criteria for escalation · prevent maternal mortality · address racial disparities",
        eyebrow: "REFERENCE · OBSTETRICS",
        nclexTags: refTagsR23,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Maternal early warning systems (MEOWS in UK; Maternal Early Warning Trigger MEWT or Maternal Early Warning Criteria MEWC in US) — vital sign + clinical surveillance tools to identify deteriorating pregnant / postpartum patients early. Address contribution of preventable maternal mortality. Used antepartum, intrapartum, postpartum × 6 weeks per primary source.",
                citationIDs: ["specialty_pr_round23"]
            )),
            .keyValueTable(title: "Common trigger criteria (CMQCC + UK MEOWS)", [
                KeyValueRow(key: "Systolic BP", value: "<90 OR >160 mmHg"),
                KeyValueRow(key: "Diastolic BP", value: ">100 mmHg"),
                KeyValueRow(key: "Heart rate", value: "<50 OR >120 bpm"),
                KeyValueRow(key: "Respiratory rate", value: "<10 OR >24/min"),
                KeyValueRow(key: "Oxygen saturation", value: "<95% on room air"),
                KeyValueRow(key: "Temperature", value: "<36 OR ≥38°C / ≥100.4°F"),
                KeyValueRow(key: "Urine output", value: "<35 mL/hr × 2 hrs"),
                KeyValueRow(key: "Maternal agitation, confusion, unresponsiveness", value: "ANY = trigger"),
                KeyValueRow(key: "Patient with HTN reporting headache or SOB", value: "= trigger")
            ]),
            .bullets(title: "Trigger response protocol", [
                AttributedBullet("ANY trigger criteria → IMMEDIATE provider notification (not delayed for routine rounds) per primary source.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Provider bedside evaluation within timeframe (often <60 min, sometimes faster for severe).", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Sepsis screening if fever / tachycardia / hypotension / respiratory distress.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("MASSIVE TRANSFUSION PROTOCOL if severe hemorrhage / hypotension.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Hypertension protocol if BP ≥160/110 — labetalol / hydralazine / nifedipine + magnesium for severe preeclampsia.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Common maternal deteriorations preventable with early warning", [
                AttributedBullet("HEMORRHAGE — uterine atony, retained products, lacerations, coagulopathy.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("HYPERTENSIVE EMERGENCIES — severe preeclampsia → eclampsia, stroke.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("VENOUS THROMBOEMBOLISM — DVT, PE; pregnancy + postpartum hypercoagulable.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("SEPSIS — chorioamnionitis, endometritis, urosepsis, mastitis.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("CARDIOMYOPATHY — peripartum; suspect with dyspnea, edema, fatigue out of proportion.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("AMNIOTIC FLUID EMBOLISM — sudden cardiopulmonary collapse intrapartum.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Implementation principles (CMQCC + ACOG)", [
                AttributedBullet("Use validated MEW score / criteria — CMQCC, MEWT, NHS MEOWS.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("EHR-integrated alerts when triggers met.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Clear ESCALATION protocols + provider response timeframes.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Staff TRAINING + simulation; in-situ drills.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("REGULAR audit of triggers + response times + outcomes.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Address RACIAL DISPARITIES — Black women 3-4× higher maternal mortality; bias affects recognition + response per primary source.", citationIDs: ["cdc_pr_round23"]),
                AttributedBullet("LISTEN to PATIENT — \"something is wrong\" is a trigger; address dismissal patterns.", citationIDs: ["cdc_pr_round23"])
            ]),
            .bullets(title: "Postpartum surveillance × 6 weeks", [
                AttributedBullet("Postpartum mortality occurs throughout — extends beyond inpatient period; 33% of maternal deaths occur 1-12 months postpartum per CDC per primary source.", citationIDs: ["cdc_pr_round23"]),
                AttributedBullet("Early postpartum visit (1-3 weeks) for high-risk patients.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Comprehensive postpartum visit (4-12 weeks) — physical, mental health, contraception, breastfeeding, transition to primary care.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("MENTAL HEALTH screening — postpartum depression / anxiety / PTSD.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Sepsis, VTE, cardiomyopathy, eclampsia can present weeks postpartum — counsel warning signs to call.", citationIDs: ["specialty_pr_round23"])
            ])
        ],
        citations: [openrnPRR23, cdcPRR23, specialtyPRR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PrenatalGeneticScreeningSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "prenatal-genetic-screening",
        title: "Prenatal genetic screening + diagnosis",
        subtitle: "Carrier screening preconception · cfDNA 10+ wks NIPT · NT 11-14 wks · second-tri quad screen · diagnostic CVS / amnio for high-risk",
        eyebrow: "REFERENCE · OBSTETRICS",
        nclexTags: refTagsR23,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Prenatal genetic screening + diagnosis informs reproductive decision-making + pregnancy management. Distinguish SCREENING (probability) from DIAGNOSTIC (definitive). All pregnant patients should be offered both per ACOG. Genetic counseling for positive screens or carrier status per primary source.",
                citationIDs: ["specialty_pr_round23"]
            )),
            .keyValueTable(title: "Carrier screening (preconception / 1st trimester)", [
                KeyValueRow(key: "Universal", value: "Cystic fibrosis, spinal muscular atrophy, hemoglobinopathies (sickle cell, thalassemia)"),
                KeyValueRow(key: "Ethnic-based / risk", value: "Tay-Sachs (Ashkenazi Jewish, French Canadian), Canavan (Ashkenazi), beta-thalassemia (Mediterranean), sickle cell (African / Mediterranean), familial dysautonomia (Ashkenazi)"),
                KeyValueRow(key: "Expanded panels", value: "100-300+ recessive conditions; offered universally now; cost varies; insurance coverage variable")
            ]),
            .keyValueTable(title: "First trimester screening (10-14 weeks)", [
                KeyValueRow(key: "cfDNA / NIPT", value: "Cell-free DNA — screens trisomies 21/18/13, sex chromosome aneuploidies; >99% sensitivity for T21; SCREENING test (positive needs confirmation)"),
                KeyValueRow(key: "Nuchal translucency (NT)", value: "Ultrasound 11-14 weeks; thickened NT (>3 mm) = increased risk T21 / cardiac defects / other"),
                KeyValueRow(key: "First trimester combined", value: "NT + maternal serum PAPP-A + free β-hCG; integrated risk")
            ]),
            .keyValueTable(title: "Second trimester screening (15-22 weeks)", [
                KeyValueRow(key: "Quad screen", value: "AFP + hCG + estriol + inhibin A; screens T21 / T18 / NTDs"),
                KeyValueRow(key: "Maternal serum AFP", value: "Elevated = NTDs (anencephaly, spina bifida); decreased = T21"),
                KeyValueRow(key: "Anatomy ultrasound", value: "Comprehensive at 18-22 weeks; structural anomalies; placental position; AFI; gestational age confirmation; sex determination")
            ]),
            .keyValueTable(title: "Diagnostic testing (definitive)", [
                KeyValueRow(key: "Chorionic villus sampling (CVS)", value: "10-13 weeks; transabdominal or transcervical; ~1% miscarriage risk; karyotype + microarray + specific gene tests"),
                KeyValueRow(key: "Amniocentesis", value: "≥15 weeks; transabdominal; ~0.1-0.3% miscarriage risk; karyotype + microarray + AFP / AChE for NTDs"),
                KeyValueRow(key: "Indications", value: "Positive screen, advanced maternal age, prior chromosomal abnormality, structural anomaly on US, parental chromosomal abnormality, family history specific genetic disease"),
                KeyValueRow(key: "Chromosomal microarray", value: "Standard with both CVS + amnio; detects microdeletions / duplications missed by karyotype")
            ]),
            .bullets(title: "Counseling principles", [
                AttributedBullet("PRE-test counseling — informed consent, options, what tests can + can't tell, implications of results, choices if abnormal.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Patient autonomy — accept or decline ANY testing without judgment.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Cultural + religious sensitivity in discussion + decisions.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Genetic counselor referral for positive results, abnormalities, complex family history.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("MFM consultation for major fetal anomalies.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Mental health support — anxiety + grief common with abnormal results.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Special situations", [
                AttributedBullet("ADVANCED MATERNAL AGE (≥35) — increased aneuploidy risk; offer all screening + diagnostic options; cfDNA highly sensitive.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("PRIOR CHILD with chromosomal abnormality — slightly increased recurrence (1% T21); diagnostic offered.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("STRUCTURAL ANOMALY on US — diagnostic testing + microarray; specialty referral.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("PARENTAL CARRIERS — IVF with PGT for known recessive (cystic fibrosis), translocations.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("CONSANGUINITY — increased recessive disease risk; expanded carrier panel + counseling.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Limitations + caveats", [
                AttributedBullet("cfDNA — SCREENING; positive should be confirmed with diagnostic CVS / amnio; false-positive ~1-5%.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("cfDNA — does NOT detect all genetic conditions (only specific aneuploidies + microdeletions); does NOT detect structural anomalies.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("CARRIER SCREENING — does not detect all variants; some risk remains even with negative screen.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("ANATOMY ULTRASOUND — sensitivity for major anomalies ~70-90%; not all anomalies visible.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("DIAGNOSTIC tests — small but real procedure-related miscarriage risk.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("RESULTS interpretation — variants of uncertain significance (VUS) common; counseling complex.", citationIDs: ["specialty_pr_round23"])
            ])
        ],
        citations: [openrnPRR23, cdcPRR23, specialtyPRR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AnemiaPregnancyManagementSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "anemia-of-pregnancy",
        title: "Anemia of pregnancy — workup + management",
        subtitle: "Iron deficiency most common · Hb cutoffs differ trimester · oral iron alternate-day · IV iron for refractory · postpartum follow-up",
        eyebrow: "REFERENCE · OBSTETRICS",
        nclexTags: refTagsR23,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Anemia affects ~1/3 of pregnant women globally + ~25% of US women postpartum. Iron deficiency most common cause; folate / B12 / hemoglobinopathy / hemolysis less common. Both maternal + fetal consequences (LBW, preterm, postpartum depression, fatigue, hemorrhage tolerance reduced) per primary source.",
                citationIDs: ["specialty_pr_round23"]
            )),
            .keyValueTable(title: "Hemoglobin cutoffs in pregnancy", [
                KeyValueRow(key: "1st trimester", value: "<11 g/dL = anemia"),
                KeyValueRow(key: "2nd trimester", value: "<10.5 g/dL = anemia"),
                KeyValueRow(key: "3rd trimester", value: "<11 g/dL = anemia"),
                KeyValueRow(key: "Postpartum", value: "<10 g/dL = anemia"),
                KeyValueRow(key: "Severe", value: "Hb <8 g/dL — IV iron + transfusion consideration")
            ]),
            .bullets(title: "Workup of anemia in pregnancy", [
                AttributedBullet("ROUTINE — CBC at first prenatal visit + 24-28 weeks per primary source.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Confirmed anemia → ferritin + iron studies + reticulocyte count + B12 + folate + hemoglobin electrophoresis (if at-risk ethnic group).", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("MICROCYTIC anemia (MCV <80) — iron deficiency most likely; thalassemia / hemoglobinopathy if ferritin normal + microcytic.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("MACROCYTIC anemia (MCV >100) — B12 / folate / pernicious; check homocysteine + MMA.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("NORMOCYTIC anemia — anemia of chronic disease, mixed iron + B12 / folate, hemoglobinopathy, recent acute blood loss.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Iron deficiency anemia (most common)", [
                AttributedBullet("FERRITIN <30 ng/mL — diagnostic of iron deficiency in pregnancy (some use <50).", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("ORAL IRON — first-line; ferrous sulfate 65-200 mg elemental iron daily / alternate-day with vitamin C; alternate-day better tolerated + absorbed per primary source.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("RECHECK Hb / ferritin at 4-6 weeks; expect 1-2 g/dL rise per month.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("IV IRON (ferric carboxymaltose, iron sucrose, iron isomaltoside) — refractory oral, severe deficiency, malabsorption, intolerance, late pregnancy needing rapid repletion per primary source.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("BLOOD TRANSFUSION — severe symptomatic anemia (Hb <7 g/dL), hemodynamic instability, near-term with anticipated PPH risk.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Folate / B12 deficiency", [
                AttributedBullet("FOLATE — universal preconception 400-800 mcg/day prevents NTDs; 4 mg/day for high-risk; treatment 1-5 mg/day for deficiency.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("B12 — supplementation if deficient; checked + replaced before folate alone (mask risk).", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Hemoglobinopathies", [
                AttributedBullet("Hemoglobin electrophoresis — if at-risk ethnic groups (African, Mediterranean, Southeast Asian, Middle Eastern); identifies sickle cell trait / disease, alpha + beta thalassemia trait / disease per primary source.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Partner testing if abnormal maternal result; genetic counseling.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Pregnancy management with hemoglobinopathies — MFM consult, hydroxyurea (sickle cell — selected), folic acid, hydration, transfusion as needed.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Postpartum anemia", [
                AttributedBullet("Common — average blood loss vaginal delivery 500 mL, cesarean 1000 mL.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("CONTINUE oral iron 3-6 months postpartum; check Hb at 6 weeks.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("IV iron for severe / persistent / poor PO tolerance.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("BREASTFEEDING — iron requirements lower than pregnancy; supplementation + dietary OK.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Address postpartum depression risk — anemia contributes; mental health screening.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Pediatric prevention", [
                AttributedBullet("Maternal iron repletion preconception + during pregnancy reduces infant iron deficiency.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Delayed cord clamping (30-60 sec) at term + preterm — improves neonatal iron stores.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Breastfed infants — iron supplementation 4 mg/kg/day starting 4 months until iron-rich solids.", citationIDs: ["specialty_pr_round23"])
            ])
        ],
        citations: [openrnPRR23, cdcPRR23, specialtyPRR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum LaborStagesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "labor-progress-stages",
        title: "Stages of labor — expected progression",
        subtitle: "4 stages · friedman vs Zhang curves · arrest vs protraction · 2nd stage 2-3 hrs typical · 3rd stage active management",
        eyebrow: "REFERENCE · OBSTETRICS",
        nclexTags: refTagsR23,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Labor divided into 4 stages with characteristic patterns of progression. Modern Zhang curves (vs older Friedman) emphasize SLOWER expected dilation in early labor. Arrest of labor diagnosed only after adequate trial in active phase. Distinguish protracted from arrest from normal variation per primary source.",
                citationIDs: ["specialty_pr_round23"]
            )),
            .keyValueTable(title: "Four stages", [
                KeyValueRow(key: "Stage 1 — onset of labor to full dilation", value: "Latent phase (cervical effacement + slow dilation 0-6 cm) + active phase (rapid dilation 6-10 cm)"),
                KeyValueRow(key: "Stage 2 — full dilation to delivery of baby", value: "Pushing stage; nulliparous 2-3 hrs (3-4 hrs with epidural); multiparous 1-2 hrs (2-3 hrs with epidural)"),
                KeyValueRow(key: "Stage 3 — delivery of baby to delivery of placenta", value: "Active management 5-10 min; expectant management up to 30 min normal"),
                KeyValueRow(key: "Stage 4 — first 2 hours postpartum", value: "Recovery; close monitoring of vitals, lochia, fundus, perineum")
            ]),
            .bullets(title: "Stage 1 — Latent phase (0-6 cm)", [
                AttributedBullet("Cervical effacement + early dilation; can last 6-20 hours; often slow + variable per primary source.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Per Zhang 2010 data — average dilation only 0.5-1 cm/hr in latent phase.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("AVOID interventions in early labor — at-home labor management often appropriate; admit when active phase begins to reduce cesarean.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Patient comfort — position changes, hydration, ambulation, hydrotherapy, support person.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Continuous EFM not required for low-risk; intermittent auscultation per ACOG.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Stage 1 — Active phase (6-10 cm)", [
                AttributedBullet("Cervical dilation accelerates ≥1 cm/hr in nulliparous; ≥1.5 cm/hr in multiparous (some references).", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("ARREST of labor — diagnosed only after ≥6 cm dilation + ROM + 4 hrs of adequate contractions WITHOUT cervical change OR 6 hrs of inadequate contractions WITHOUT change per ACOG (allows more time vs old definition).", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("PROTRACTED labor — slow but progressing; observation + augmentation rather than cesarean.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Augmentation — oxytocin + amniotomy if appropriate.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Continuous EFM commonly initiated; intermittent auscultation acceptable for low-risk per primary source.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Stage 2 — Delivery", [
                AttributedBullet("PROLONGED 2nd stage criteria — nulliparous >3 hrs without epidural / >4 hrs with epidural; multiparous >2 hrs without / >3 hrs with epidural; ACOG criteria — does NOT mandate intervention if progress + maternal-fetal status reassuring.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Pushing techniques — coached vs uncoached; delayed pushing (Laboring Down) vs immediate; outcomes similar.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Position — upright, lateral, hands-knees, squatting; lithotomy NOT required.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Operative vaginal delivery (forceps / vacuum) — for prolonged 2nd stage with maternal exhaustion / NRFHR + station +2 or below; risks of OVD include trauma, brachial plexus, perineal injury.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Episiotomy — selective (not routine); spontaneous lacerations heal better than midline episiotomies.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Stage 3 — Placental delivery", [
                AttributedBullet("ACTIVE MANAGEMENT — uterotonic immediately after delivery (oxytocin 10 units IM or 20 units in 1 L IV LR), controlled cord traction, fundal massage; reduces postpartum hemorrhage by ~50% per primary source.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Signs of placental separation — uterine rise + firmness, gush of blood, cord lengthening, fetal pole through introitus.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Expectant management — up to 30 min generally normal; >30 min = retained placenta; manual removal under anesthesia.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Inspect placenta for completeness — missing cotyledon = retained tissue; manual exam + curettage.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("Inspect cord — three vessels (2 arteries + 1 vein); single umbilical artery = increased anomaly risk.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Stage 4 — Recovery (first 2 hrs postpartum)", [
                AttributedBullet("Vital signs q15 min × 1 hr then q30 min × 1 hr.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("FUNDUS check — should be firm, midline, at umbilicus; fundal massage if boggy.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("LOCHIA RUBRA — bright red discharge; large clots / saturating pad in <1 hr = hemorrhage.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("PERINEUM — assess lacerations, edema, hematoma, ice pack for comfort.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("BLADDER — encourage voiding; full bladder displaces uterus + increases bleeding.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("BREASTFEEDING — initiate skin-to-skin within first hour; latch help; counsel.", citationIDs: ["specialty_pr_round23"])
            ]),
            .bullets(title: "Risk factors for abnormal labor", [
                AttributedBullet("MATERNAL — older age, obesity, short stature, prior cesarean, gestational diabetes, hypertensive disorders.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("FETAL — macrosomia, malpresentation, asynclitism.", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("ANATOMIC — pelvic abnormalities (rare in modern obstetrics but possible).", citationIDs: ["specialty_pr_round23"]),
                AttributedBullet("INDUCED labor — slower progression; allow more time before declaring failed induction (12-24 hrs of oxytocin + ROM per primary source).", citationIDs: ["specialty_pr_round23"])
            ])
        ],
        citations: [openrnPRR23, cdcPRR23, specialtyPRR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}
