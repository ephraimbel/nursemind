import Foundation

// OB drug reference entries — Open RN Maternity Nursing (CC BY 4.0), openFDA
// labels (public domain). All dosing presented as ranges with verify-per-protocol
// framing. Tier-A RN review pending pre-launch for high-stakes OB dosing
// (oxytocin titration, magnesium loading, uterotonic ladder).

private let openrnOB = CitationSource(
    id: "openrn_ob_drugs",
    shortName: "Open RN Maternity Nursing — Pharmacology chapter",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmaternal/?s=oxytocin+magnesium+uterotonic",
    lastRetrieved: "2026-05-04"
)

private let fdaOBLabels = CitationSource(
    id: "fda_ob_labels",
    shortName: "FDA Drug Labels — OB-Indicated drugs (DailyMed)",
    detail: "FDA Structured Product Labeling for oxytocin, magnesium sulfate, methergine, hemabate",
    publisher: "U.S. Food & Drug Administration",
    license: .publicDomain,
    url: "https://dailymed.nlm.nih.gov/dailymed/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Oxytocin OB Protocols

public enum OxytocinOBSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "oxytocin-ob-protocols",
        title: "Oxytocin (Pitocin) — OB protocols",
        subtitle: "Labor augmentation vs postpartum hemorrhage — different doses, same drug",
        eyebrow: "REFERENCE · OB",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies),
        sections: [
            .prose(title: "Same drug, different protocols", AttributedProse("Oxytocin is a high-alert medication used for two very different purposes: titrated infusion to induce or augment labor (low-dose, careful uterine monitoring) and high-dose for postpartum hemorrhage (atony reversal). The two protocols are not interchangeable; understanding the difference is core to safe OB nursing.", citationIDs: ["openrn_ob_drugs"])),
            .keyValueTable(title: "Labor augmentation / induction (antepartum)", [
                KeyValueRow(key: "Concentration", value: "Typically 30 units in 500 mL NS or LR (0.06 units/mL) — facility protocol-specific"),
                KeyValueRow(key: "Starting dose", value: "0.5–2 milliunits/min (mU/min)"),
                KeyValueRow(key: "Titration", value: "Increase 1–2 mU/min every 30–60 minutes per facility protocol"),
                KeyValueRow(key: "Max", value: "Typically 20 mU/min; rarely up to 40 mU/min with careful monitoring"),
                KeyValueRow(key: "Goal", value: "Adequate contractions: 3–5 in 10 minutes, lasting 60–90 sec, with normotensive resting tone, reassuring fetal heart rate")
            ]),
            .keyValueTable(title: "Postpartum hemorrhage (PPH)", [
                KeyValueRow(key: "Concentration (IV)", value: "10–40 units in 500–1000 mL crystalloid; given as fast-running infusion"),
                KeyValueRow(key: "IM dose", value: "10 units IM if no IV access"),
                KeyValueRow(key: "Common protocols", value: "10 units in 500 mL wide open after delivery; or 20–40 units in 1 L LR titrated to fundal tone"),
                KeyValueRow(key: "Onset", value: "IM ~3–5 min; IV ~1 min; immediate uterine contraction"),
                KeyValueRow(key: "Goal", value: "Firm, well-contracted uterus and reduced bleeding")
            ]),
            .keyValueTable(title: "Tachysystole — uterine over-stimulation", [
                KeyValueRow(key: "Definition", value: ">5 contractions in 10 minutes averaged over 30 min, OR contractions >2 min long"),
                KeyValueRow(key: "Action — Cat I tracing", value: "Reposition, IV fluid bolus, decrease oxytocin or stop infusion"),
                KeyValueRow(key: "Action — Cat II/III tracing", value: "Stop oxytocin, IV bolus, oxygen, reposition, notify provider; consider terbutaline 0.25 mg SubQ as tocolytic"),
                KeyValueRow(key: "Restart criteria", value: "Per protocol after FHR returns to Cat I and uterine activity normalizes")
            ]),
            .bullets(title: "Nursing assessment during oxytocin infusion (labor)", [
                AttributedBullet("Continuous external or internal fetal heart rate monitoring (EFM).", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Continuous uterine activity monitoring (tocodynamometer or IUPC).", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Vital signs every 15–30 min during titration; every 1 hr stable.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Strict I&O — water intoxication risk with prolonged high-dose infusion (oxytocin has antidiuretic effect).", citationIDs: ["fda_ob_labels"]),
                AttributedBullet("Pain assessment + epidural function.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Immediate availability of: terbutaline (tocolysis), magnesium sulfate (tocolysis), code cart, OR access for emergent C-section.", citationIDs: ["openrn_ob_drugs"])
            ]),
            .bullets(title: "Nursing assessment during oxytocin for PPH", [
                AttributedBullet("Continuous fundal massage AND oxytocin together — neither alone is enough.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Quantified blood loss — weigh pads, drapes, sponges (1 g = 1 mL).", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Vital signs every 5–15 min during active hemorrhage.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Bladder care — empty bladder; full bladder displaces uterus and prevents contraction.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Be prepared to escalate to second-line uterotonics (methylergonovine, hemabate, misoprostol) if bleeding continues despite oxytocin maximization.", citationIDs: ["openrn_ob_drugs"])
            ]),
            .bullets(title: "Watch-fors", [
                AttributedBullet("Tachysystole (>5/10 min) — most common adverse effect during induction.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Fetal heart rate changes (decelerations, decreased variability) — stop infusion; intrauterine resuscitation.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Uterine rupture — sudden cessation of contractions, severe abdominal pain, fetal bradycardia, vaginal bleeding; emergent.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Water intoxication — confusion, seizure, hyponatremia; long-duration high-dose infusion in dilute IV fluid is the setup.", citationIDs: ["fda_ob_labels"]),
                AttributedBullet("Hypotension with rapid IV bolus — give as continuous infusion, not bolus, antepartum.", citationIDs: ["fda_ob_labels"])
            ])
        ],
        citations: [openrnOB, fdaOBLabels],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Magnesium Sulfate OB Protocols

public enum MagnesiumOBSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "magnesium-ob-protocols",
        title: "Magnesium sulfate — OB protocols",
        subtitle: "Preeclampsia/eclampsia + tocolysis — same drug, different reasons",
        eyebrow: "REFERENCE · OB",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .neurologicalRegulation),
        sections: [
            .prose(title: "Two distinct OB indications", AttributedProse("Magnesium sulfate is given to OB patients for: (1) seizure prophylaxis and treatment in preeclampsia/eclampsia, and (2) short-term tocolysis (delaying preterm labor 48 hours for steroid window). It is also used for fetal neuroprotection in anticipated delivery <32 weeks. The protocols overlap but the dosing endpoints and toxicity surveillance are tightly nursing-managed.", citationIDs: ["openrn_ob_drugs"])),
            .keyValueTable(title: "Preeclampsia / eclampsia — seizure prevention & treatment", [
                KeyValueRow(key: "Loading dose", value: "4–6 g IV over 20–30 min (typically 4 g in 100 mL NS/LR)"),
                KeyValueRow(key: "Maintenance", value: "1–2 g/hr IV continuous"),
                KeyValueRow(key: "Eclamptic seizure (active)", value: "2–4 g IV bolus over 5 min if seizure persists despite maintenance; can repeat × 1"),
                KeyValueRow(key: "Duration", value: "Typically 24 hours postpartum, or per provider"),
                KeyValueRow(key: "Therapeutic level", value: "4–7 mg/dL serum magnesium")
            ]),
            .keyValueTable(title: "Tocolysis (preterm labor delay)", [
                KeyValueRow(key: "Loading", value: "4–6 g IV over 20 min"),
                KeyValueRow(key: "Maintenance", value: "1–3 g/hr IV continuous"),
                KeyValueRow(key: "Duration", value: "Typically 12–48 hours — long enough for antenatal corticosteroid window"),
                KeyValueRow(key: "Goal", value: "Decrease uterine contractions; allow time for steroid-induced fetal lung maturity")
            ]),
            .keyValueTable(title: "Toxicity surveillance — by serum level", [
                KeyValueRow(key: "Therapeutic", value: "4–7 mg/dL — preserves DTRs, RR ≥12, urine output ≥30 mL/hr"),
                KeyValueRow(key: "Loss of patellar reflex", value: "~10 mg/dL — first toxicity sign"),
                KeyValueRow(key: "Respiratory depression", value: "~12 mg/dL — RR <12 concerning"),
                KeyValueRow(key: "Cardiac arrest", value: "~25 mg/dL — emergency"),
                KeyValueRow(key: "ANTIDOTE", value: "Calcium gluconate 1 g IV over 3 minutes — keep at the bedside")
            ]),
            .bullets(title: "Nursing assessment every 1–2 hours during infusion", [
                AttributedBullet("Deep tendon reflexes (typically patellar) — should be present; loss is the earliest sign of toxicity.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Respiratory rate — should be ≥12; RR <12 is a stop-and-call indicator.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Urine output — should be ≥30 mL/hr (mag is excreted by kidneys; oliguria → magnesium accumulates → toxicity).", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Level of consciousness — increasing somnolence can be early.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("BP, HR, FHR (if antepartum).", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Magnesium level — typically every 4–6 hours during continuous infusion.", citationIDs: ["openrn_ob_drugs"])
            ]),
            .bullets(title: "Bedside safety bundle", [
                AttributedBullet("Calcium gluconate 1 g IV pre-positioned at the bedside as the antidote — count it as part of safe-for-infusion checklist.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Pump with high-alert dose limits set; double-check rate and concentration with second nurse.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Do NOT bolus more than ordered — boluses cause hypotension and cardiac effects.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Continuous cardiac and respiratory monitoring during loading dose; continuous SpO₂ is a low-cost safety net.", citationIDs: ["openrn_ob_drugs"])
            ]),
            .bullets(title: "If toxicity occurs", [
                AttributedBullet("STOP the infusion.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Notify provider immediately.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Give calcium gluconate 1 g IV over 3 minutes.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Support respiration — BVM if RR severely depressed; have intubation supplies available.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Continuous cardiac monitoring; STAT magnesium level.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Document time of recognition, intervention, and patient response.", citationIDs: ["openrn_ob_drugs"])
            ])
        ],
        citations: [openrnOB, fdaOBLabels],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Postpartum Uterotonic Ladder

public enum UterotonicLadderSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "uterotonic-ladder",
        title: "Postpartum uterotonic ladder",
        subtitle: "Methylergonovine, carboprost, misoprostol — when, what, contraindications",
        eyebrow: "REFERENCE · OB",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies),
        sections: [
            .prose(title: "Why the ladder matters", AttributedProse("When oxytocin alone doesn't control postpartum hemorrhage from atony, every minute of delay before the next agent is blood lost. Each second-line uterotonic has specific contraindications — picking the wrong agent can worsen the patient's condition. Knowing the ladder cold is core OB safety practice.", citationIDs: ["openrn_ob_drugs"])),
            .keyValueTable(title: "Methylergonovine (Methergine)", [
                KeyValueRow(key: "Dose", value: "0.2 mg IM single dose; may repeat every 2–4 hr if needed (max ~5 doses typical)"),
                KeyValueRow(key: "Onset", value: "IM 2–5 min; IV is contraindicated (extreme hypertension)"),
                KeyValueRow(key: "Mechanism", value: "Ergot alkaloid — direct uterine smooth muscle contraction"),
                KeyValueRow(key: "AVOID in", value: "ANY hypertension (acute or chronic), preeclampsia, eclampsia. Severe vasoconstriction → stroke or MI risk"),
                KeyValueRow(key: "Watch for", value: "Dramatic BP rise, headache, nausea, chest pain — call provider STAT for any of these"),
                KeyValueRow(key: "Continued PO", value: "0.2 mg PO every 6 hr × 24 hr after IM may be ordered for ongoing atony")
            ]),
            .keyValueTable(title: "Carboprost / Hemabate (15-methyl PGF2α)", [
                KeyValueRow(key: "Dose", value: "0.25 mg IM; may repeat every 15–90 min, max 8 doses (2 mg total)"),
                KeyValueRow(key: "Onset", value: "5–15 minutes IM; can be given intramyometrially by provider for direct uterine effect"),
                KeyValueRow(key: "Mechanism", value: "Prostaglandin F2α — strong uterine contraction"),
                KeyValueRow(key: "AVOID in", value: "Asthma (BRONCHOSPASM risk), pulmonary hypertension, severe cardiac, hepatic, or renal disease"),
                KeyValueRow(key: "Watch for", value: "Bronchospasm (auscultate before and after), nausea/vomiting/diarrhea (very common — pre-medicate), fever (transient), tachycardia, hypertension"),
                KeyValueRow(key: "Pre-meds typically", value: "Antiemetic (ondansetron) and antidiarrheal at the bedside; many institutions give them prophylactically")
            ]),
            .keyValueTable(title: "Misoprostol (Cytotec) — for OB", [
                KeyValueRow(key: "PPH dose", value: "800–1000 mcg PR (preferred for unconscious or vomiting patients), OR 600 mcg PO"),
                KeyValueRow(key: "Onset", value: "PO 8–11 min; PR 11–14 min — slower than IM agents"),
                KeyValueRow(key: "Mechanism", value: "Synthetic PGE1 analog — uterine contraction"),
                KeyValueRow(key: "AVOID in", value: "Allergy. No major cardiac/asthma contraindications — broad usability"),
                KeyValueRow(key: "Watch for", value: "Fever (very common, often >38.5°C — different from infection), shivering, GI upset, mild hypertension"),
                KeyValueRow(key: "Off-label note", value: "FDA-approved for ulcer prophylaxis; PPH use is widely accepted but off-label — institutional protocol typically authorizes it")
            ]),
            .bullets(title: "Sequence of escalation (after fundal massage + oxytocin maximized)", [
                AttributedBullet("Step 1 (always first): Fundal massage + bladder empty + oxytocin running.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Step 2: If patient has NO hypertension → methylergonovine 0.2 mg IM. If hypertensive → SKIP to step 3.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Step 3: If patient has NO asthma → carboprost 0.25 mg IM. If asthmatic → SKIP to step 4.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Step 4: Misoprostol 800–1000 mcg PR — universally available, fewest contraindications.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Concurrent: tranexamic acid (TXA) 1 g IV within 3 hr of bleeding onset — reduces mortality.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("If still bleeding — surgical interventions (Bakri balloon, B-Lynch suture, uterine artery embolization, hysterectomy).", citationIDs: ["openrn_ob_drugs"])
            ]),
            .bullets(title: "Universal nursing safety", [
                AttributedBullet("Verify allergies AND known conditions (HTN, asthma, cardiac, renal) before each agent.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Time-stamp every dose and every assessment of fundal tone, lochia, vitals.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Quantified blood loss (QBL) — weigh pads, drapes, blood-soaked items.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Two large-bore IVs ASAP; type & screen / crossmatch.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Activate massive transfusion protocol at >1500 mL or hemodynamic instability.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Family update — keep them informed; provide a designated support person.", citationIDs: ["openrn_ob_drugs"])
            ])
        ],
        citations: [openrnOB, fdaOBLabels],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Antenatal Corticosteroids

public enum AntenatalCorticosteroidsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "antenatal-corticosteroids",
        title: "Antenatal corticosteroids — fetal lung maturity",
        subtitle: "Betamethasone / dexamethasone for preterm labor 24–34 weeks",
        eyebrow: "REFERENCE · OB",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies),
        sections: [
            .prose(title: "Why steroids before preterm birth", AttributedProse("Antenatal corticosteroids accelerate fetal lung surfactant production. Given to mothers anticipated to deliver between 24 and 34 weeks (and now 34–36⁶ in some criteria), they reduce neonatal RDS, intraventricular hemorrhage, and mortality. The benefit window peaks 24 hr after second dose and lasts ~7 days.", citationIDs: ["openrn_ob_drugs"])),
            .keyValueTable(title: "Betamethasone (preferred)", [
                KeyValueRow(key: "Dose", value: "12 mg IM (suspension), 2 doses 24 hours apart"),
                KeyValueRow(key: "Total course", value: "2 doses; rescue course can be considered if delivery hasn't occurred and risk persists ≥7 days later"),
                KeyValueRow(key: "Site", value: "Deep IM — vastus lateralis or ventrogluteal"),
                KeyValueRow(key: "Onset of fetal benefit", value: "Begins at 24 hours after first dose; maximum benefit 24 hr after second dose")
            ]),
            .keyValueTable(title: "Dexamethasone (alternative)", [
                KeyValueRow(key: "Dose", value: "6 mg IM, 4 doses 12 hours apart"),
                KeyValueRow(key: "Use when", value: "Betamethasone unavailable; equivalent fetal benefit"),
                KeyValueRow(key: "Site", value: "Deep IM")
            ]),
            .bullets(title: "Indications", [
                AttributedBullet("Anticipated preterm delivery between 24 and 34 weeks gestation.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Late-preterm 34 to 36⁶ weeks if delivery anticipated within 7 days AND no prior course.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Preterm rupture of membranes (PROM) at <34 weeks.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Threatened preterm labor.", citationIDs: ["openrn_ob_drugs"])
            ]),
            .bullets(title: "Maternal effects to monitor", [
                AttributedBullet("Hyperglycemia — especially in diabetic mothers; monitor blood sugars more frequently for 1–7 days.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Mild fluid retention.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Mood changes, insomnia.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Transient leukocytosis (do not mistake for infection).", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Suppression of fetal heart rate variability transiently — known steroid effect, not pathologic.", citationIDs: ["openrn_ob_drugs"])
            ]),
            .bullets(title: "Patient teaching", [
                AttributedBullet("Reason: helps baby's lungs mature in case of early delivery.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Two doses 24 hours apart; benefits begin around the second dose and continue for about a week.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Side effects are mild and short-term — temporary blood sugar rise, sleep disruption.", citationIDs: ["openrn_ob_drugs"]),
                AttributedBullet("Continue to alert team about contractions, leakage, bleeding, decreased fetal movement.", citationIDs: ["openrn_ob_drugs"])
            ])
        ],
        citations: [openrnOB, fdaOBLabels],
        lastSourceFidelityReview: "2026-05-04"
    )
}
