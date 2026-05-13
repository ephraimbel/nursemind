import Foundation

// Curator-model drug entries (round 9 expansion — OB / L&D, peds emergency, peds chronic).
// Sources: openFDA SPL (CC0), Open RN Pharmacology + Maternal-Newborn (CC BY 4.0),
// CDC perinatal guidance (public domain), ACOG / AAP / AHA neonatal concept citations.

private let openfda = CitationSource(
    id: "openfda_round9",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR9 = CitationSource(
    id: "openrn_pharm_round9",
    shortName: "Open RN Nursing Pharmacology + Maternal-Newborn",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=tocolytic+oxytocic+surfactant+pediatric",
    lastRetrieved: "2026-05-04"
)
private let cdcR9 = CitationSource(
    id: "cdc_round9",
    shortName: "CDC perinatal + pediatric clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/maternal-infant-health/index.html",
    lastRetrieved: "2026-05-04"
)
private let specialtyR9 = CitationSource(
    id: "specialty_round9",
    shortName: "ACOG / AAP / AHA / SMFM concept citations",
    publisher: "ACOG · AAP · AHA · SMFM",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-04"
)

// MARK: - Betamethasone

public enum BetamethasoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "betamethasone",
        title: "Betamethasone",
        subtitle: "Celestone · antenatal corticosteroid · fetal lung maturity",
        category: "Glucocorticoid (antenatal)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting glucocorticoid"),
            KeyValueRow(key: "OB indication", value: "Antenatal corticosteroid 24 0/7–34 6/7 weeks (often extended to 36 6/7) per primary source"),
            KeyValueRow(key: "Dose / schedule", value: "12 mg IM × 2 doses 24 hours apart per primary source"),
            KeyValueRow(key: "Effect window", value: "Maximal benefit 24 hr–7 days after first dose")
        ],
        indications: AttributedProse(
            "Acceleration of fetal lung maturity in pregnancies at risk of preterm birth between 24 0/7 and 34 6/7 weeks of gestation; ACOG also supports a single course at 34 0/7–36 6/7 weeks at risk of preterm delivery within 7 days who have not received prior antenatal corticosteroids per primary source.",
            citationIDs: ["openfda_round9", "specialty_round9"]
        ),
        mechanism: AttributedProse(
            "Crosses placenta → induces fetal type II pneumocyte production of surfactant; reduces neonatal RDS, IVH, NEC, and mortality.",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Antenatal — IM", body: "12 mg IM × 2 doses 24 hours apart per primary source.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "Rescue course", body: "Single repeat course considered if first course given >7–14 days prior, at <34 weeks, and remain at risk of delivery within 7 days per primary source.", citationIDs: ["specialty_round9"])
        ],
        contraindications: AttributedProse(
            "Active untreated systemic infection (especially TB); chorioamnionitis (do not delay delivery for steroids in active infection); known hypersensitivity. Maternal diabetes is NOT a contraindication — adjust insulin per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("Maternal hyperglycemia — anticipate need for insulin titration in diabetics.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Pulmonary edema risk if combined with terbutaline/magnesium tocolysis and excessive IV fluids.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Repeated courses associated with reduced birth weight; limit per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Maternal infection — counsel about recognition.", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Maternal — hyperglycemia, leukocytosis, mild GI upset; pain at IM site. Fetal — generally well tolerated; effect on fetal HR variability transient.",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("Insulin / oral hypoglycemics — anticipate adjustment.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Tocolytics (terbutaline, magnesium) + steroid + IV fluids → pulmonary edema; restrict fluids.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("Administer deep IM (gluteal or vastus lateralis); aspirate before injection.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Document maternal vitals; check fetal heart rate after injection.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Anticipate insulin titration in diabetics; monitor blood glucose Q4–6h × 24–48 h per primary source.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Coordinate timing — second dose at 24 hours; maximal benefit when delivery occurs ≥24 hours after first dose.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "This medication helps your baby's lungs mature in case of early delivery. You will get two shots, 24 hours apart. Best benefit is 24 hours to 7 days after the first shot. Tell us if you feel less fetal movement, contractions, fever, or fluid leaking.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Terbutaline

public enum TerbutalineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "terbutaline",
        title: "Terbutaline",
        subtitle: "Beta-2 agonist · short-term tocolytic + asthma rescue",
        category: "Beta-2 agonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective β2-adrenergic agonist"),
            KeyValueRow(key: "OB use (off-label)", value: "Short-term tocolysis to delay preterm labor for fetal lung maturation or maternal transfer; ≤48–72 hours"),
            KeyValueRow(key: "Boxed warning (OB)", value: "Maternal cardiac death; do NOT use prolonged tocolysis (>48–72 hr) or oral / SQ outpatient maintenance per primary source"),
            KeyValueRow(key: "Other use", value: "Asthma exacerbation when albuterol unavailable")
        ],
        indications: AttributedProse(
            "Asthma exacerbation (rescue use); off-label short-term tocolysis to delay preterm labor for ≤48–72 hours to allow antenatal steroids and maternal transfer per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "Selective β2-adrenergic agonist → smooth-muscle relaxation in bronchi (bronchodilation) and uterus (uterine relaxation).",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Tocolysis (off-label)", body: "0.25 mg SQ every 20–30 min × ≤3 doses per primary source; STOP if maternal HR >130 bpm.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "Asthma rescue", body: "0.25 mg SQ; may repeat in 15–30 min if needed (max 0.5 mg in 4 hr).", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "Maternal cardiac disease (SVT, dysrhythmia, structural heart disease); uncontrolled diabetes (worsened hyperglycemia); pregnancy >34 weeks (no benefit); placental abruption / hemorrhage / chorioamnionitis (delivery indicated); known hypersensitivity.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("BOXED — maternal cardiac death with PROLONGED (>48–72 hr) or REPEATED courses; do NOT use oral or SQ outpatient maintenance per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Maternal tachycardia, hypotension, pulmonary edema (especially with concomitant magnesium and IV fluids).", citationIDs: ["openfda_round9"]),
            AttributedBullet("Hyperglycemia, hypokalemia.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Fetal — tachycardia.", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Maternal palpitations / tachycardia, tremor, anxiety, hyperglycemia, hypokalemia, headache, nausea.",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("Beta-blockers — antagonism.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Other sympathomimetics — additive cardiovascular effects.", citationIDs: ["openfda_round9"]),
            AttributedBullet("MAOIs — hypertensive reaction.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous maternal HR / BP monitoring; FHR monitoring; HOLD if maternal HR >130, chest pain, dyspnea, pulmonary edema signs per primary source.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Strict I&O; restrict IV fluids to reduce pulmonary edema risk especially with concurrent magnesium.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Trend potassium and glucose; replete K as needed.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Coordinate antenatal corticosteroids during the brief tocolytic window.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "This medicine slows your contractions for a short time so we can give a steroid for your baby's lungs. You may feel a fast heartbeat, tremor, or jitteriness — this is expected and short-lived. Tell us about chest pain, severe shortness of breath, or palpitations that don't settle.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Nifedipine (Tocolytic + OB HTN)

public enum NifedipineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "nifedipine",
        title: "Nifedipine",
        subtitle: "Procardia · calcium-channel blocker · tocolytic + severe OB HTN",
        category: "Dihydropyridine calcium-channel blocker",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dihydropyridine CCB"),
            KeyValueRow(key: "OB tocolysis", value: "Off-label preferred tocolytic in many institutions vs terbutaline / magnesium per primary source"),
            KeyValueRow(key: "OB severe HTN", value: "ACOG-accepted second-line agent for acute severe HTN in pregnancy / postpartum (after labetalol or hydralazine in some protocols) per primary source"),
            KeyValueRow(key: "Notable", value: "Avoid sublingual / immediate-release in non-OB hypertensive emergency — uncontrolled BP drop")
        ],
        indications: AttributedProse(
            "Hypertension (chronic management with extended-release form); off-label short-term tocolysis (24–48 hr) for preterm labor; off-label acute treatment of severe HTN in pregnancy / postpartum per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "Blocks L-type calcium channels in vascular and uterine smooth muscle → vasodilation, reduced contractility.",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Tocolysis (off-label)", body: "Loading 20 mg PO; may repeat 20 mg in 30 min if contractions persist (max 60 mg in 1 hour); maintenance 20 mg PO every 4–6 hours per primary source.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "Severe acute OB HTN (off-label)", body: "10 mg PO; if BP not improved, repeat 20 mg in 20 min, then 20 mg in 20 min if needed (max 50 mg in 1 hour) per primary source.", citationIDs: ["specialty_round9"]),
            DosingBlock(label: "Chronic HTN (ER)", body: "30–90 mg PO daily — extended-release only per primary source.", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; cardiogenic shock; hypotension; concurrent magnesium IV (can potentiate hypotension; OB protocols vary, monitor closely); severe aortic stenosis.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("Severe hypotension; fall risk; reflex tachycardia.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Pulmonary edema if combined with magnesium tocolysis and aggressive IV fluids.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Headache, flushing, peripheral edema (very common).", citationIDs: ["openfda_round9"]),
            AttributedBullet("AVOID sublingual / immediate-release for non-OB hypertensive emergencies — historically associated with stroke.", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Headache, flushing, dizziness, peripheral edema, hypotension, gingival hyperplasia (chronic), constipation.",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, macrolides, grapefruit) — RAISE nifedipine levels.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Strong CYP3A4 inducers (rifampin, phenytoin, carbamazepine, St. John's wort) — LOWER levels.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Magnesium IV — potentiates hypotension.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous BP / HR / FHR monitoring during acute use; HOLD for hypotension or maternal HR >130 per primary source.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Restrict IV fluids if combined with magnesium to avoid pulmonary edema.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Counsel pregnancy patient on lying lateral after dose; assess for OB HTN warning signs.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "Take with a full glass of water; avoid grapefruit. Lie on your side for 30–60 min after a dose for severe high blood pressure. Tell us about severe headache, vision changes, chest pain, or contractions returning.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Carboprost (Hemabate)

public enum CarboprostSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "carboprost",
        title: "Carboprost (15-methyl PGF2α)",
        subtitle: "Hemabate · prostaglandin uterotonic · postpartum hemorrhage",
        category: "Prostaglandin F2α analog (uterotonic)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic prostaglandin F2α analog"),
            KeyValueRow(key: "OB use", value: "Refractory uterine atony PPH after first-line oxytocin, methylergonovine"),
            KeyValueRow(key: "Route", value: "IM (deep muscle) — typically gluteal or thigh (NOT IV)"),
            KeyValueRow(key: "AVOID", value: "Asthma — bronchospasm risk")
        ],
        indications: AttributedProse(
            "Postpartum hemorrhage due to uterine atony unresponsive to first-line agents (oxytocin, methylergonovine); off-label second-trimester abortion / induction per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "Prostaglandin F2α analog → strong uterine smooth-muscle contraction → uterine compression of bleeding sites.",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Postpartum hemorrhage", body: "250 mcg (0.25 mg) IM deep into large muscle; may repeat every 15–90 min (max 8 doses / 2 mg total) per primary source.", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "ASTHMA (bronchospasm risk); active cardiac, pulmonary, renal, or hepatic disease; pelvic inflammatory disease; known hypersensitivity.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("BRONCHOSPASM in asthmatics — AVOID; methylergonovine is preferred alternative if no HTN per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Hypertension; vomiting; explosive diarrhea (common); fever (common — may mimic infection).", citationIDs: ["openfda_round9"]),
            AttributedBullet("Pulmonary edema, dysrhythmia, severe vasoconstriction (rare).", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, diarrhea (very common — premedicate), fever, chills, flushing, transient HTN, bronchospasm.",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("Other oxytocics — additive uterotonic effect (used in combination per protocol).", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("CONFIRM no asthma history before administration.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Premedicate with antiemetic and antidiarrheal per provider; have suction / bronchodilator at bedside.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Continuous BP / HR / SpO2; assess fundus, vaginal bleeding; weigh perineal pads.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Document each dose with time and response; coordinate with team for further interventions (Bakri balloon, surgery) if bleeding continues.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps stop bleeding by tightening the uterus. You may feel cramping, nausea, diarrhea, fever, or chills — these are common and short-lived. Tell us about wheezing or trouble breathing right away.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Methylergonovine (Methergine)

public enum MethylergonovineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "methylergonovine",
        title: "Methylergonovine",
        subtitle: "Methergine · ergot alkaloid uterotonic · PPH",
        category: "Ergot alkaloid uterotonic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Ergot alkaloid"),
            KeyValueRow(key: "OB use", value: "PPH due to uterine atony — second-line after oxytocin"),
            KeyValueRow(key: "Route", value: "IM preferred (or PO continuation) — IV only in life-threatening hemorrhage at provider discretion (severe HTN risk)"),
            KeyValueRow(key: "AVOID", value: "Hypertension — including chronic HTN, gestational HTN, preeclampsia")
        ],
        indications: AttributedProse(
            "Postpartum hemorrhage from uterine atony; postpartum subinvolution per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "Ergot alkaloid → direct uterine smooth-muscle contraction; also vasoconstrictor effect on systemic vasculature (HTN concern).",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "PPH (IM)", body: "0.2 mg IM; may repeat every 2–4 hours up to 5 doses per primary source.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "PO continuation", body: "0.2 mg PO every 6–8 hours × 2–7 days.", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "HYPERTENSION (any form — chronic, gestational, preeclampsia); pregnancy (only postpartum); concurrent strong CYP3A4 inhibitors (azoles, macrolides, HIV protease inhibitors); coronary artery disease; peripheral vascular disease; sepsis; hypersensitivity.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("Severe hypertension, stroke, MI — particularly with IV use or in patients with HTN per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Vasoconstriction worsens HTN, peripheral ischemia.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Uterine cramping (expected).", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Hypertension, headache, nausea, vomiting, abdominal cramping, chest pain, palpitations.",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, macrolides, HIV protease inhibitors) — risk of severe vasospasm; AVOID per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Other vasoconstrictors / sympathomimetics — additive effects.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("Verify NO HISTORY of HTN, preeclampsia, or current high BP before each dose.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("BP, pulse before and 15 min after each dose; HOLD and notify for SBP >140 / DBP >90 or significant rise per primary source.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Assess fundus, lochia, and bleeding response.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Counsel about cramping; provide analgesia.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps your uterus contract to control bleeding. You will feel strong cramping. Tell us about severe headache, chest pain, vision changes, or numbness/tingling — these can be warning signs of high blood pressure or a clot.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Misoprostol

public enum MisoprostolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "misoprostol",
        title: "Misoprostol",
        subtitle: "Cytotec · prostaglandin E1 · cervical ripening / PPH / NSAID-ulcer prevention",
        category: "Prostaglandin E1 analog",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "PGE1 analog"),
            KeyValueRow(key: "FDA-approved", value: "NSAID-induced ulcer prevention"),
            KeyValueRow(key: "Off-label OB", value: "Cervical ripening / labor induction; PPH; medical management of miscarriage; medical abortion"),
            KeyValueRow(key: "Boxed warning", value: "Pregnancy-loss risk — NEVER use for ulcer prevention in pregnant patients per primary source")
        ],
        indications: AttributedProse(
            "FDA-approved: prevention of NSAID-induced gastric ulcer. Off-label OB: cervical ripening / labor induction at term; medical management of early pregnancy loss; postpartum hemorrhage; medical abortion (per protocol with mifepristone) per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "PGE1 analog → cervical ripening (cervical softening + dilation); uterine smooth-muscle contraction; gastric mucosal protection (FDA indication).",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Cervical ripening / induction", body: "25 mcg PV every 3–6 hours; or 50–100 mcg PO every 4–6 hours per primary source.", citationIDs: ["specialty_round9"]),
            DosingBlock(label: "PPH", body: "600–1000 mcg PR (rectal) one-time per primary source.", citationIDs: ["specialty_round9"]),
            DosingBlock(label: "NSAID ulcer prevention", body: "200 mcg PO QID with food per primary source.", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "Pregnancy when used for NSAID prophylaxis (boxed warning — abortifacient); known hypersensitivity. Cervical ripening contraindicated with prior cesarean / uterine scar (uterine rupture risk) per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("Uterine tachysystole / hyperstimulation → fetal distress, uterine rupture; tocolytic at bedside; reduce dose / extend interval per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Uterine rupture in patients with prior cesarean or uterine scar — CONTRAINDICATED for cervical ripening per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Diarrhea, abdominal pain, nausea (common).", citationIDs: ["openfda_round9"]),
            AttributedBullet("Fever / chills (common with PPH dosing).", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, abdominal cramps, nausea, fever, chills, headache. OB — uterine tachysystole; rupture (rare).",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("Antacids (especially magnesium-containing) — worsen diarrhea.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Other oxytocics — additive uterotonic effect; SEPARATE oxytocin start by ≥4 hours after last vaginal misoprostol per primary source.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("CONFIRM no prior cesarean / uterine scar before cervical-ripening doses per primary source.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Continuous FHR + uterine activity monitoring during induction; STOP at uterine tachysystole or non-reassuring FHR; consider terbutaline tocolysis per primary source.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Counsel on diarrhea, fever, cramping, and timing of effects (3–6 hr for cervical change with PV dosing).", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Document confirmed pregnancy status + intended-purpose use carefully — REMS / state law considerations for medical-abortion use.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "This medicine softens the cervix and starts contractions. You may feel cramping, diarrhea, fever, or chills. Tell us about strong sustained contractions, heavy bleeding, or decreased fetal movement.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Alprostadil (PGE1 IV)

public enum AlprostadilSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "alprostadil",
        title: "Alprostadil (PGE1, IV)",
        subtitle: "Prostin VR · keeps ductus arteriosus OPEN in cyanotic CHD",
        category: "Prostaglandin E1 (IV)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic PGE1"),
            KeyValueRow(key: "Indication", value: "Maintain ductal patency in ductal-dependent congenital heart disease (until surgical correction)"),
            KeyValueRow(key: "Route", value: "Continuous IV infusion via central or large peripheral access"),
            KeyValueRow(key: "Common adverse effect", value: "APNEA — be prepared for intubation per primary source")
        ],
        indications: AttributedProse(
            "Temporary maintenance of ductus arteriosus patency in neonates with ductal-dependent congenital heart disease (e.g., HLHS, transposition, severe coarctation, pulmonary atresia, tricuspid atresia) until definitive surgical repair per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "PGE1 directly relaxes smooth muscle of the ductus arteriosus, maintaining patency that would otherwise close in the first hours-days of life.",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Initial", body: "0.05–0.1 mcg/kg/min IV continuous infusion; titrate to lowest effective dose (often 0.01–0.05 mcg/kg/min) per primary source.", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "Hyaline membrane disease / RDS (where ductal closure is desired); known hypersensitivity. Use cautiously in bleeding tendencies.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("APNEA — most common in first hour, in neonates <2 kg, and at high doses; intubation equipment IMMEDIATELY available; consider prophylactic intubation for transport per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Hypotension; flushing; bradycardia; tachycardia; seizure-like activity.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Hyperthermia; gastric outlet obstruction with prolonged use.", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Apnea (common), fever, flushing, bradycardia, hypotension, seizures, diarrhea.",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("Antiplatelets / anticoagulants — additive bleeding risk.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Sympathomimetics — may interact; cardiology will guide.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("INTUBATION-READY at all times during initiation and transport — apnea is common.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Continuous SpO2, HR, BP, respiratory rate; ABGs as ordered.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Use dedicated IV line (preferably central or large PIV); never infuse with incompatible solutions.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Coordinate emergent transfer to pediatric cardiac center.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "This medicine keeps a small connection in your baby's heart open until surgery. Apnea (pauses in breathing) is common — your baby is in a closely-monitored unit and we have everything ready to support breathing if needed.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Indomethacin

public enum IndomethacinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "indomethacin",
        title: "Indomethacin",
        subtitle: "Indocin · NSAID · PDA closure (neonates) + acute gout + tocolysis",
        category: "Non-selective NSAID",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-selective COX inhibitor (NSAID)"),
            KeyValueRow(key: "Indications", value: "Closure of hemodynamically significant PDA in preterm neonates; acute gout; off-label tocolysis (<32 weeks)"),
            KeyValueRow(key: "Notable", value: "AVOID after 30 weeks gestation for tocolysis — premature ductal closure + oligohydramnios per primary source"),
            KeyValueRow(key: "Adult use", value: "Acute gout flare 50 mg PO TID")
        ],
        indications: AttributedProse(
            "Closure of hemodynamically significant patent ductus arteriosus in preterm neonates (28–34 wk); acute gout; off-label short-term tocolysis (<32 weeks). Adult NSAID indication for inflammatory arthritis and acute gout per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "Non-selective COX-1/2 inhibition → reduced prostaglandin synthesis. In preterm PDA, prostaglandin reduction allows ductal closure.",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Neonatal PDA closure", body: "0.2 mg/kg IV initial; subsequent doses 0.1–0.25 mg/kg every 12–24 hours × 3 doses, dosing varies by postnatal age per primary source.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "Acute gout (adult)", body: "50 mg PO TID until pain resolves per primary source.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "OB tocolysis (off-label, <32 wk)", body: "50 mg PO loading; then 25 mg PO every 4–6 hours × ≤48 hours per primary source.", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "Active GI bleeding / ulcer; significant renal impairment; history of NSAID hypersensitivity (anaphylaxis or asthma); CABG perioperative period; pregnancy ≥30 weeks (premature ductal closure, oligohydramnios) per primary source; neonatal active bleeding, NEC, severe renal dysfunction.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("BOXED — increased CV thrombotic risk and GI bleeding in adult use.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Neonatal — IVH, NEC, renal dysfunction, oliguria — coordinate with neonatology.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Aspirin sensitivity; bronchospasm.", citationIDs: ["openfda_round9"]),
            AttributedBullet("OB tocolysis after 30 weeks → premature ductal closure, oligohydramnios.", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "GI upset, headache, dizziness; in neonates — oliguria, transient renal dysfunction, IVH, NEC, hyponatremia.",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("ACEi / ARB / diuretics — \"triple whammy\" AKI risk in adults.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Anticoagulants / antiplatelets — bleeding risk.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Lithium / methotrexate — raised levels.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("Neonatal: monitor UOP, electrolytes, creatinine, platelets; assess for bleeding, abdominal distension (NEC) per primary source.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("OB tocolysis: amniotic-fluid index check before initiation and every 48–72 hours; STOP if oligohydramnios per primary source.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Adult: take with food; assess for GI symptoms; avoid in renal impairment and dehydration.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "Take with food and a full glass of water. Tell us about black/tarry stools, persistent stomach pain, leg swelling, or chest pain. For pregnancy use: this medicine is only for early preterm labor; we will not use after 30 weeks.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Surfactant (Poractant alfa)

public enum SurfactantSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "surfactant",
        title: "Surfactant (poractant alfa / beractant)",
        subtitle: "Curosurf / Survanta · neonatal RDS · intratracheal",
        category: "Pulmonary surfactant",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Exogenous pulmonary surfactant (animal-derived)"),
            KeyValueRow(key: "Indication", value: "Neonatal RDS — prevention or rescue"),
            KeyValueRow(key: "Route", value: "Intratracheal via ETT (or LISA — less-invasive surfactant administration)"),
            KeyValueRow(key: "Notable", value: "Often dramatic clinical improvement within minutes; may need ventilator setting reduction quickly")
        ],
        indications: AttributedProse(
            "Prevention of neonatal RDS in high-risk preterm infants (≤32 weeks); rescue treatment of established neonatal RDS per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "Replaces endogenous surfactant deficient in preterm lungs → reduces alveolar surface tension → improves lung compliance, decreases atelectasis, improves oxygenation.",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Poractant alfa (Curosurf) — initial", body: "2.5 mL/kg (200 mg/kg) intratracheal; up to 2 additional doses of 1.25 mL/kg (100 mg/kg) every 12 hours if persistent RDS per primary source.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "Beractant (Survanta) — initial", body: "4 mL/kg (100 mg/kg phospholipids) intratracheal; up to 4 doses in first 48 hours per primary source.", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "Known hypersensitivity to surfactant components (bovine or porcine).",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("Transient bradycardia, oxygen desaturation, ETT obstruction during administration — be prepared to manage.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Pulmonary hemorrhage (rare).", citationIDs: ["openfda_round9"]),
            AttributedBullet("Rapid improvement in lung compliance — ventilator settings may need quick down-titration to avoid pneumothorax / hyperoxia per primary source.", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Transient bradycardia, oxygen desaturation, ETT obstruction, pulmonary hemorrhage (rare).",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("None significant — local intratracheal administration.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("Verify ETT placement (CXR confirmation) before administration.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Position infant per protocol (typically various positions during administration to distribute surfactant).", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Continuous monitoring of HR, SpO2, BP; STOP and ventilate if significant bradycardia / desaturation.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Anticipate rapid improvement — communicate with respiratory therapist for ventilator setting changes; AVOID suctioning for 1–2 hours post-dose unless ETT obstructed per primary source.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps your baby's lungs work better. We give it through the breathing tube. Your baby may need less ventilator support quickly afterward, which is a good sign.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Somatropin (Growth Hormone)

public enum SomatropinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "somatropin",
        title: "Somatropin (recombinant human growth hormone)",
        subtitle: "Genotropin / Norditropin / Humatrope · GHD + select short-stature conditions",
        category: "Recombinant growth hormone",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant human GH"),
            KeyValueRow(key: "Indications", value: "GH deficiency (peds + adult), Turner syndrome, Prader-Willi, SGA without catch-up, idiopathic short stature, chronic kidney disease, AIDS-wasting"),
            KeyValueRow(key: "Route", value: "SQ daily (or weekly with newer long-acting forms)"),
            KeyValueRow(key: "Boxed warning (Prader-Willi)", value: "Sudden death in obese / severely respiratory-impaired Prader-Willi patients per primary source")
        ],
        indications: AttributedProse(
            "Pediatric — growth hormone deficiency, Turner syndrome, Noonan syndrome, Prader-Willi, SGA without catch-up by age 2, idiopathic short stature, CKD-related short stature. Adult — GH deficiency, AIDS-wasting per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "Recombinant equivalent of human GH → stimulates IGF-1 production in liver and tissues → linear bone growth, increased lean body mass, decreased adiposity.",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Pediatric GHD", body: "0.16–0.24 mg/kg/week SQ in daily divided doses per primary source.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "Adult GHD", body: "0.15–0.30 mg SQ daily; titrate to IGF-1 level.", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "Active malignancy; severe respiratory impairment in Prader-Willi (boxed); proliferative diabetic retinopathy; closed epiphyses (for height-promoting use); critical illness (acute respiratory failure, multiple trauma); hypersensitivity per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("BOXED — sudden death in obese / respiratory-impaired Prader-Willi patients; assess for sleep apnea / respiratory infection before initiation per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("New malignancy risk in pediatric cancer survivors — coordinate with oncology.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Glucose intolerance / diabetes; intracranial hypertension; SCFE (slipped capital femoral epiphysis); scoliosis progression; pancreatitis (peds).", citationIDs: ["openfda_round9"]),
            AttributedBullet("Adrenal insufficiency may be unmasked — monitor cortisol if symptomatic.", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Injection-site reactions, headache, edema, arthralgia / myalgia, hyperglycemia, lipoatrophy at injection site.",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("Glucocorticoids — antagonize growth-promoting effects.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Estrogens — may reduce GH effect in some patients.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Insulin — may need higher doses with GH therapy.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("Teach SQ injection technique to patient / caregiver; rotate sites (thigh, abdomen, upper arm).", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Refrigerate; some products stable at room temperature for limited time per labeling.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Trend IGF-1, glucose, A1c, thyroid function periodically per primary source.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Annual height/weight in pediatrics; assess for hip / knee pain (SCFE), back pain (scoliosis), sudden vision change (intracranial HTN).", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "Inject under the skin at the same time daily. Rotate injection sites. Tell us about persistent headache, vision changes, hip/knee pain, sudden limp, severe abdominal pain, or new lumps. Get blood tests as scheduled.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Phenobarbital

public enum PhenobarbitalSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "phenobarbital",
        title: "Phenobarbital",
        subtitle: "Long-acting barbiturate · status epilepticus + neonatal seizures",
        category: "Barbiturate antiepileptic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting barbiturate"),
            KeyValueRow(key: "Indications", value: "Status epilepticus (after benzo + AED failure), neonatal seizures, alcohol withdrawal, sedation"),
            KeyValueRow(key: "Therapeutic range", value: "15–40 mcg/mL"),
            KeyValueRow(key: "Notable", value: "Significant respiratory depression risk; intubation backup essential")
        ],
        indications: AttributedProse(
            "Generalized tonic-clonic and partial seizures (chronic); status epilepticus (refractory); neonatal seizures; status epilepticus in pediatrics; sedation; alcohol-withdrawal seizure prophylaxis (per institutional protocols) per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "GABA-A receptor potentiation (prolongs chloride channel opening) → CNS depression and seizure suppression.",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Status epilepticus (adult)", body: "15–20 mg/kg IV at ≤50–100 mg/min per primary source.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "Neonatal seizures", body: "20 mg/kg IV loading; additional 10–20 mg/kg if seizures persist; maintenance 3–5 mg/kg/day per primary source.", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic disease; porphyria; respiratory depression; hypersensitivity to barbiturates.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("Profound respiratory depression — particularly with rapid IV push or in combination with benzodiazepines; have airway support ready per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Hypotension — slow IV push and avoid in hemodynamically unstable patients without support.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Strong CYP450 inducer — many drug interactions.", citationIDs: ["openfda_round9"]),
            AttributedBullet("DRESS syndrome, SJS/TEN.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Long half-life (~80–100 hr in adults, longer in neonates) — accumulation risk.", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Sedation (very common), respiratory depression, hypotension, ataxia, dizziness, hyperactivity / paradoxical agitation in children and elderly, rash.",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("CYP450 INDUCER — markedly REDUCES levels of warfarin, OCPs, DOACs, calcineurin inhibitors, opioids, many AEDs (lamotrigine), corticosteroids, antifungals.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Other CNS depressants (opioids, benzodiazepines, alcohol) — additive respiratory depression / sedation.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Valproate — raises phenobarbital level; monitor.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous SpO2, ETCO2, cardiac monitor during IV loading; intubation equipment immediately available.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Slow IV push (≤50–100 mg/min); fast push → hypotension and respiratory arrest.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Trough levels at steady state (typically 2–3 weeks after start in adults due to long half-life).", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Counsel about contraception — induces OCP metabolism; backup method needed.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "This medicine controls seizures but causes drowsiness. Take exactly as prescribed; do not stop suddenly. Use a backup birth-control method. Tell every provider you take this — it changes how many other medications work. Avoid alcohol and other sedatives. Call us about new rash, fever, or breathing problems.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hydroxyurea

public enum HydroxyureaSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hydroxyurea",
        title: "Hydroxyurea",
        subtitle: "Hydrea · Droxia · sickle cell + chronic myeloproliferative neoplasms",
        category: "Antimetabolite (myelosuppressive)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Ribonucleotide reductase inhibitor"),
            KeyValueRow(key: "SCD use", value: "REDUCES vaso-occlusive crisis frequency, ACS, hospitalizations, mortality per primary source"),
            KeyValueRow(key: "Mechanism in SCD", value: "Increases fetal hemoglobin (HbF) production"),
            KeyValueRow(key: "Boxed warnings", value: "Myelosuppression; secondary malignancies; embryofetal toxicity")
        ],
        indications: AttributedProse(
            "Sickle cell disease (vaso-occlusive crisis prevention); chronic myeloproliferative neoplasms (essential thrombocythemia, polycythemia vera, chronic myelogenous leukemia); HIV (rarely now) per primary source.",
            citationIDs: ["openfda_round9"]
        ),
        mechanism: AttributedProse(
            "Inhibits ribonucleotide reductase → reduces DNA synthesis. In SCD specifically, induces fetal hemoglobin (HbF) which interferes with HbS polymerization → fewer sickled cells and vaso-occlusive events.",
            citationIDs: ["openfda_round9"]
        ),
        dosing: [
            DosingBlock(label: "Sickle cell (adult)", body: "Initial 15 mg/kg PO daily; titrate by 5 mg/kg every 8 weeks to maximum tolerated (typically 25–35 mg/kg) per primary source.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "Sickle cell (peds ≥9 mo)", body: "Initial 20 mg/kg PO daily; titrate per primary source.", citationIDs: ["openfda_round9"]),
            DosingBlock(label: "MPN", body: "15–20 mg/kg PO daily; titrate to platelet / hematocrit goal.", citationIDs: ["openfda_round9"])
        ],
        contraindications: AttributedProse(
            "Severe bone-marrow suppression (ANC <2000, platelets <80, Hgb <4.5); known hypersensitivity. Caution in severe renal / hepatic impairment.",
            citationIDs: ["openfda_round9"]
        ),
        warnings: [
            AttributedBullet("BOXED — myelosuppression (anemia, leukopenia, thrombocytopenia); monitor CBC every 2 weeks during titration, then monthly per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("BOXED — secondary leukemia, skin cancer with prolonged use; sun protection; annual skin exam.", citationIDs: ["openfda_round9"]),
            AttributedBullet("BOXED — embryofetal toxicity; effective contraception during therapy and 6 mo (female) or 1 yr (male) after per primary source.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Cutaneous vasculitic toxicity (leg ulcers); GI symptoms.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Live vaccines — AVOID.", citationIDs: ["openfda_round9"])
        ],
        adverseReactions: AttributedProse(
            "Bone-marrow suppression, GI upset, mucositis, alopecia, skin pigmentation changes, leg ulcers, hyperpigmentation of nails, fatigue.",
            citationIDs: ["openfda_round9"]
        ),
        drugInteractions: [
            AttributedBullet("Other myelosuppressives — additive cytopenia.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Live vaccines — AVOID.", citationIDs: ["openfda_round9"]),
            AttributedBullet("Antiretrovirals (didanosine, stavudine) — additive pancreatitis.", citationIDs: ["openfda_round9"])
        ],
        nursingImplications: [
            AttributedBullet("CBC + reticulocyte every 2 weeks during titration, then monthly; HOLD for ANC <2000 or platelets <80,000 per primary source.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Counsel adherence — daily dosing for life; benefit takes ~3 months to fully develop.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Sun protection daily; annual skin exam; document any new lesion.", citationIDs: ["openrn_pharm_round9"]),
            AttributedBullet("Pregnancy / contraception planning; pause for surgery and conception planning per provider.", citationIDs: ["openrn_pharm_round9"])
        ],
        patientTeaching: AttributedProse(
            "Take every day, even when feeling well — full benefit takes about 3 months. Get blood tests as scheduled. Use sunscreen daily. Use reliable birth control during and for months after stopping. Tell us about fever, infection, persistent leg ulcers, or new skin lesions. Wash hands after handling capsules; pregnant household members should not handle.",
            citationIDs: ["openrn_pharm_round9"]
        ),
        citations: [openfda, openrnPharmR9, specialtyR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}
