import Foundation

// Curator-model drug entries (round 23 — OB pharmacology + supplements + migraine).

private let openfdaR23 = CitationSource(
    id: "openfda_round23",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-12"
)
private let openrnPharmR23 = CitationSource(
    id: "openrn_pharm_round23",
    shortName: "Open RN Pharmacology + Maternity",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-12"
)
private let cdcR23 = CitationSource(
    id: "cdc_round23",
    shortName: "CDC + ACOG + AAN concept citations",
    publisher: "CDC · ACOG · AAN",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-12"
)
private let specialtyR23 = CitationSource(
    id: "specialty_round23",
    shortName: "ACOG + USPSTF + AHA pregnancy + AAN headache",
    publisher: "ACOG · USPSTF · AHA · AAN",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical-information/practice-bulletins",
    lastRetrieved: "2026-05-12"
)

public enum LabetalolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "labetalol",
        title: "Labetalol (Trandate, Normodyne)",
        subtitle: "α + β blocker · pregnancy HTN first-line · IV for hypertensive emergency · IDEAL in pregnancy + aortic dissection",
        category: "Combined α + β adrenergic blocker",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Mixed α1 + β1/β2 adrenergic blocker (β > α at oral; α > β at IV)"),
            KeyValueRow(key: "Use", value: "Pregnancy HTN (first-line); hypertensive urgency / emergency; pheochromocytoma; aortic dissection (with HR control); chronic HTN"),
            KeyValueRow(key: "IV dose", value: "10-20 mg IV bolus q10 min OR 0.5-2 mg/min infusion; max 300 mg total"),
            KeyValueRow(key: "PO dose", value: "100-400 mg BID-TID; titrate"),
            KeyValueRow(key: "Watch", value: "Bradycardia, bronchospasm, orthostatic hypotension, mask hypoglycemia in DM"),
            KeyValueRow(key: "Pregnancy", value: "Category C — but FIRST-LINE for HTN in pregnancy per ACOG")
        ],
        indications: AttributedProse(
            "Severe hypertension in pregnancy / preeclampsia / eclampsia (FIRST-LINE per ACOG); chronic hypertension in pregnancy; hypertensive urgency / emergency; pheochromocytoma (after α-blockade); aortic dissection (with HR control); chronic HTN per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Combined α1 + β1/β2 adrenergic blockade. Oral β:α ratio ~3:1; IV β:α ratio ~7:1. Reduces SVR (α blockade) without reflex tachycardia (β blockade). Maintains cardiac output + uteroplacental perfusion (key in pregnancy).",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Pregnancy HTN urgency / preeclampsia (IV)", body: "10-20 mg IV bolus over 2 min; if inadequate response in 10 min → 20-40 mg q10 min × max 300 mg total per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "IV continuous infusion (severe)", body: "0.5-2 mg/min IV; titrate to BP; max 300 mg total cumulative dose.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Chronic HTN (PO)", body: "Start 100 mg PO BID; titrate by 100 mg every 2-3 days; usual 200-400 mg PO BID-TID; max 2400 mg/day.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Pediatric (≥1 year)", body: "0.2-1 mg/kg IV bolus q10 min OR 0.4-3 mg/kg/hr infusion; per primary source.", citationIDs: ["specialty_round23"])
        ],
        contraindications: AttributedProse(
            "Severe bradycardia, sick sinus syndrome (without pacemaker), 2nd/3rd degree AV block, decompensated heart failure, severe asthma / bronchospasm, cardiogenic shock, hypersensitivity per primary source.",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("BRADYCARDIA — common; hold for HR <50; atropine for severe.", citationIDs: ["openfda_round23"]),
            AttributedBullet("BRONCHOSPASM — caution in asthma / COPD; β2 blockade despite combined α/β; alternative agents preferred in severe airway disease.", citationIDs: ["openfda_round23"]),
            AttributedBullet("MASK HYPOGLYCEMIA SYMPTOMS in DM — counsel + monitor glucose; especially in T1DM.", citationIDs: ["openfda_round23"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — slowly stand; supine 3 hrs after IV dose.", citationIDs: ["openfda_round23"]),
            AttributedBullet("HEART FAILURE — caution; can worsen acute decompensation; bridge in chronic HF treatment.", citationIDs: ["openfda_round23"]),
            AttributedBullet("BREASTFEEDING — passes into breast milk; observe infant for bradycardia / hypoglycemia.", citationIDs: ["specialty_round23"]),
            AttributedBullet("WITHDRAWAL — abrupt cessation can cause rebound HTN + ischemia; taper.", citationIDs: ["openfda_round23"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, orthostatic hypotension, dizziness, fatigue, depression, sexual dysfunction, bronchospasm, hyperglycemia, mask hypoglycemia, scalp tingling (IV), hepatotoxicity (rare).",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("Other antihypertensives — additive hypotension.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Calcium channel blockers (verapamil, diltiazem) — additive bradycardia + AV block.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Insulin / oral hypoglycemics — masks hypoglycemia; monitor glucose.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Cocaine — paradoxical worsening due to unopposed α stimulation; avoid in cocaine HTN.", citationIDs: ["specialty_round23"]),
            AttributedBullet("MAOIs — exaggerated pressor responses.", citationIDs: ["openfda_round23"])
        ],
        nursingImplications: [
            AttributedBullet("PREGNANCY — first-line for HTN per ACOG; safer than ACE inhibitors / ARBs (teratogenic) per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("IV ADMINISTRATION — bolus over 2 min; supine for 3 hrs after; continuous BP / HR monitoring; arterial line for severe HTN.", citationIDs: ["specialty_round23"]),
            AttributedBullet("HOLD parameters — HR <50, SBP <100; notify provider.", citationIDs: ["openrn_pharm_round23"]),
            AttributedBullet("MONITOR — orthostatic BP, HR, mental status; glucose in DM; FHR + uterine activity in pregnancy.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PREECLAMPSIA — labetalol or hydralazine first-line for severe BP; magnesium sulfate for seizure prophylaxis.", citationIDs: ["specialty_round23"]),
            AttributedBullet("AORTIC DISSECTION — labetalol ideal because controls both HR + BP; pair with nitroprusside if needed.", citationIDs: ["specialty_round23"]),
            AttributedBullet("Smart pump for IV; second-nurse verification for high-alert use.", citationIDs: ["openfda_round23"])
        ],
        patientTeaching: AttributedProse(
            "This medicine lowers your blood pressure. Stand up slowly to avoid dizziness. If you have diabetes, check your sugar more often — this can hide low sugar warning signs. Don't stop suddenly — taper as directed. Tell us about wheezing, slow heartbeat, fainting, or unusual fatigue. Safe in pregnancy.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum MethyldopaSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "methyldopa",
        title: "Methyldopa (Aldomet)",
        subtitle: "Central α2 agonist · pregnancy HTN safe alternative · sedation + depression + hepatitis · slow onset",
        category: "Central α2 adrenergic agonist (centrally acting antihypertensive)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Central α2 agonist; lowers sympathetic outflow"),
            KeyValueRow(key: "Use", value: "Chronic hypertension in pregnancy (one of few safe agents); historical 1st-line, now 3rd-line outside pregnancy"),
            KeyValueRow(key: "Dose", value: "250 mg PO BID-TID; titrate; max 3 g/day"),
            KeyValueRow(key: "Watch", value: "Sedation, depression, drug-induced lupus, hemolytic anemia (positive Coombs), hepatitis"),
            KeyValueRow(key: "Pregnancy", value: "Category B — long safety history; preferred for chronic HTN in pregnancy")
        ],
        indications: AttributedProse(
            "Chronic hypertension in pregnancy (one of few agents with extensive safety data); historical first-line antihypertensive — now 3rd-line outside pregnancy due to side effect profile; alternative for hypertensive urgency in selected patients per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Converted to α-methylnorepinephrine in CNS → activates central α2 receptors → reduces sympathetic outflow → lowers SVR + BP. Onset 4-6 hrs (slow); duration 24 hrs.",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Pregnancy HTN", body: "Start 250 mg PO BID; titrate by 250 mg q1-2 days; usual 500 mg-2 g PO daily in 2-4 divided doses per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Chronic HTN (non-pregnant)", body: "Start 250 mg PO BID-TID; usual 500 mg-2 g daily; max 3 g/day; rarely first-line outside pregnancy.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "IV (rarely used)", body: "250-500 mg IV q6h slow infusion; available but not commonly used.", citationIDs: ["openfda_round23"])
        ],
        contraindications: AttributedProse(
            "Active hepatic disease, history of methyldopa-related liver disease, MAOI use, hypersensitivity per primary source.",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("DRUG-INDUCED LUPUS — positive ANA + arthralgia; reversible on discontinuation.", citationIDs: ["specialty_round23"]),
            AttributedBullet("HEMOLYTIC ANEMIA — positive direct Coombs (~10-20% of users); clinical hemolysis in <1%; check baseline + periodically.", citationIDs: ["openfda_round23"]),
            AttributedBullet("HEPATOTOXICITY — including fulminant hepatic failure; check baseline LFTs + at 6-12 weeks; discontinue if elevated.", citationIDs: ["openfda_round23"]),
            AttributedBullet("CNS effects — sedation (very common, dose-related), depression, dizziness, headache, mental clouding.", citationIDs: ["openfda_round23"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — counsel slow position changes.", citationIDs: ["openfda_round23"]),
            AttributedBullet("WITHDRAWAL — taper; abrupt cessation rebound HTN.", citationIDs: ["openfda_round23"]),
            AttributedBullet("CROSS-MATCH INTERFERENCE — false-positive Coombs may complicate emergency transfusion; alert blood bank.", citationIDs: ["specialty_round23"])
        ],
        adverseReactions: AttributedProse(
            "Sedation (very common), depression, dizziness, headache, dry mouth, orthostatic hypotension, sexual dysfunction, drug-induced lupus, hemolytic anemia, hepatitis, eosinophilia, parkinsonism (rare).",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("Other antihypertensives — additive hypotension.", citationIDs: ["openfda_round23"]),
            AttributedBullet("MAOIs — concurrent contraindicated.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Iron salts — reduces methyldopa absorption; separate by 2+ hrs.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Lithium — potentiates lithium toxicity.", citationIDs: ["openfda_round23"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC + LFTs + Coombs; repeat at 6-12 weeks; discontinue if abnormal trends.", citationIDs: ["specialty_round23"]),
            AttributedBullet("EXPECT SEDATION — counsel; avoid driving until tolerance; bedtime dosing reduces daytime sedation.", citationIDs: ["openfda_round23"]),
            AttributedBullet("MONITOR — BP, orthostatics, mood, jaundice / dark urine signs; pregnancy → FHR + uterine activity.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PREGNANCY — typically chosen for chronic HTN; long-term safety established.", citationIDs: ["specialty_round23"]),
            AttributedBullet("Counsel — depression risk; mood monitoring; slow position changes.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Alert blood bank — Coombs positive may interfere with crossmatch.", citationIDs: ["specialty_round23"])
        ],
        patientTeaching: AttributedProse(
            "This medicine lowers blood pressure. It often makes people sleepy at first — take at bedtime to help. Stand up slowly. Tell us about depression, yellow eyes/skin, dark urine, or unusual fatigue. Safe in pregnancy. Don't stop suddenly.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum DoxylaminePyridoxineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "doxylamine-pyridoxine",
        title: "Doxylamine + pyridoxine (Diclegis, Bonjesta)",
        subtitle: "First-line for nausea/vomiting of pregnancy + hyperemesis · Cat A · synergistic combination · drowsiness common",
        category: "Antihistamine + vitamin B6 combination (antiemetic, pregnancy-specific)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "H1 antihistamine (doxylamine) + vitamin B6 (pyridoxine)"),
            KeyValueRow(key: "Use", value: "Nausea + vomiting of pregnancy (NVP); hyperemesis gravidarum (first-line per ACOG)"),
            KeyValueRow(key: "Dose", value: "Diclegis 10-20-30 mg/day (delayed-release); Bonjesta extended-release; OTC equivalents (B6 + doxylamine separately) effective + cheaper"),
            KeyValueRow(key: "Pregnancy", value: "Category A — extensively studied; safe in 1st trimester")
        ],
        indications: AttributedProse(
            "Nausea + vomiting of pregnancy (NVP) — first-line per ACOG. Hyperemesis gravidarum (severe NVP). FDA-approved combination drug; OTC equivalents (vitamin B6 + Unisom) effective + much cheaper per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Doxylamine (1st-gen H1 antihistamine) — central + peripheral histamine blockade in vomiting center; antiemetic. Pyridoxine (vitamin B6) — cofactor in neurotransmitter synthesis; antiemetic mechanism not fully understood but proven effective. Combination synergistic.",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Diclegis (delayed-release)", body: "Start 2 tablets at bedtime (10/10 mg each = 20/20 mg); if inadequate, add 1 tablet morning + 1 tablet afternoon (max 4 tablets/day = 40/40 mg) per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Bonjesta (extended-release)", body: "1 tablet (20/20 mg) PO at bedtime; max 2 tablets/day per primary source.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "OTC alternative (cheaper)", body: "Pyridoxine 25 mg PO TID + Unisom (doxylamine 25 mg) ½-1 tablet at bedtime per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Severe / hospital admission", body: "IV ondansetron + IV doxylamine (or oral doxylamine + IV B6) + IV fluids + thiamine.", citationIDs: ["specialty_round23"])
        ],
        contraindications: AttributedProse(
            "MAOI use, hypersensitivity. Caution — narrow-angle glaucoma, urinary retention, severe asthma, GI/GU obstruction.",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("DROWSINESS — common (doxylamine); counsel against driving / operating machinery; avoid alcohol.", citationIDs: ["openfda_round23"]),
            AttributedBullet("ANTICHOLINERGIC effects — dry mouth, constipation, urinary retention; less common than 1st-gen.", citationIDs: ["openfda_round23"]),
            AttributedBullet("CHILDREN — not for use in children outside specific indications.", citationIDs: ["openfda_round23"]),
            AttributedBullet("OPERATING heavy machinery — avoid until response known.", citationIDs: ["openfda_round23"]),
            AttributedBullet("MAOI — contraindicated; serotonin / hypertensive crisis.", citationIDs: ["openfda_round23"]),
            AttributedBullet("INADEQUATE response — escalate to ondansetron / metoclopramide / promethazine; rule out alternative diagnoses (gastroenteritis, UTI, thyroid, gallbladder).", citationIDs: ["specialty_round23"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness (very common), fatigue, dry mouth, headache, dizziness, constipation, urinary retention, blurred vision, paradoxical excitement (rare in elderly / children).",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("CNS depressants (alcohol, benzodiazepines, opioids) — additive sedation.", citationIDs: ["openfda_round23"]),
            AttributedBullet("MAOIs — contraindicated.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Anticholinergics (antihistamines, TCAs, antipsychotics) — additive anticholinergic burden.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Other antiemetics — synergistic; combined therapy for severe NVP.", citationIDs: ["specialty_round23"])
        ],
        nursingImplications: [
            AttributedBullet("FIRST-LINE for NVP per ACOG; lifestyle modifications (small frequent meals, dry crackers, ginger, avoid triggers) before pharmacologic.", citationIDs: ["specialty_round23"]),
            AttributedBullet("OTC equivalent — pyridoxine 25 mg + Unisom (doxylamine) - significantly cheaper; counsel.", citationIDs: ["specialty_round23"]),
            AttributedBullet("BEDTIME DOSING reduces daytime sedation.", citationIDs: ["openfda_round23"]),
            AttributedBullet("ESCALATION — if inadequate, add ondansetron (effective + safe in pregnancy per studies); metoclopramide; promethazine.", citationIDs: ["specialty_round23"]),
            AttributedBullet("HYPEREMESIS GRAVIDARUM — IV fluids + thiamine + multimodal antiemetics; monitor weight + electrolytes + ketones.", citationIDs: ["specialty_round23"]),
            AttributedBullet("WERNICKE encephalopathy prevention — thiamine BEFORE glucose / dextrose in malnourished hyperemesis.", citationIDs: ["specialty_round23"])
        ],
        patientTeaching: AttributedProse(
            "Take this at bedtime to help with morning nausea — it can make you sleepy. The OTC version (vitamin B6 + Unisom) works just as well and costs less. Eat small frequent dry meals; avoid triggers. Tell us if you can't keep fluids down — you may need IV fluids.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum RhoGAMSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "rh-immune-globulin",
        title: "Rh(D) immune globulin (RhoGAM, MicRhoGAM)",
        subtitle: "Prevents Rh sensitization · 28 wks gestation + within 72h delivery + after sensitizing event · 300 mcg standard, 50 mcg micro",
        category: "Anti-D (Rh-negative) immune globulin",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anti-D IgG immune globulin"),
            KeyValueRow(key: "Use", value: "PREVENT maternal Rh isoimmunization in Rh-negative women carrying Rh-positive fetuses"),
            KeyValueRow(key: "Routine doses", value: "28 weeks gestation; within 72 hours of delivery if newborn Rh+; after any sensitizing event"),
            KeyValueRow(key: "Dose", value: "300 mcg IM (standard RhoGAM); 50 mcg IM (MicRhoGAM for early loss)"),
            KeyValueRow(key: "Watch", value: "Test for fetomaternal hemorrhage if >30 mL — additional doses needed")
        ],
        indications: AttributedProse(
            "Prevention of Rh isoimmunization in Rh-negative woman exposed to Rh-positive fetal blood — routine 28 weeks; within 72 hours of delivery if newborn Rh-positive; after sensitizing events (spontaneous / induced abortion, ectopic, amniocentesis, CVS, abdominal trauma, antepartum hemorrhage, ECV) per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Passive immunization with anti-D IgG → coats Rh-positive fetal red cells in maternal circulation → suppresses maternal IgG production against D antigen → prevents future Rh-positive fetus alloimmunization (hemolytic disease of newborn).",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Routine antepartum", body: "300 mcg IM at 28 weeks gestation (regardless of paternal Rh status, since false-positive paternal results) per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Postpartum (if newborn Rh+)", body: "300 mcg IM within 72 hours of delivery per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "After sensitizing event (>13 weeks)", body: "300 mcg IM within 72 hours; recheck Kleihauer-Betke / flow cytometry for large fetomaternal hemorrhage; additional doses (10 mcg per mL fetal blood) if >30 mL FMH.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Early pregnancy loss / ectopic <13 weeks", body: "MicRhoGAM 50 mcg IM (sufficient for smaller fetal blood volume) per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Other sensitizing events", body: "Amniocentesis, CVS, ECV, abdominal trauma, antepartum hemorrhage, threatened abortion — 300 mcg IM within 72 hrs.", citationIDs: ["specialty_round23"])
        ],
        contraindications: AttributedProse(
            "Rh-positive recipient (no benefit, but no harm); IgA deficiency with anti-IgA antibodies (anaphylaxis risk — use alternative formulation); known prior anaphylaxis to immune globulin per primary source.",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("IM ONLY — never IV (some formulations specifically labeled IV — check product); deltoid OR ventrogluteal.", citationIDs: ["openfda_round23"]),
            AttributedBullet("INJECTION SITE pain + swelling common.", citationIDs: ["openfda_round23"]),
            AttributedBullet("FEVER + chills (rare); allergic reactions (rare).", citationIDs: ["openfda_round23"]),
            AttributedBullet("FETAL-MATERNAL HEMORRHAGE (FMH) testing — Kleihauer-Betke or flow cytometry for any antepartum hemorrhage / abdominal trauma / >300 mcg FMH suspected; additional 10 mcg per mL fetal blood per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("DOCUMENTATION — verify Rh-negative status before administration; document lot, dose, site, time per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("RH-NEGATIVE patient already alloimmunized (anti-D antibodies present) — RhoGAM not effective; refer maternal-fetal medicine for IUT consideration.", citationIDs: ["specialty_round23"])
        ],
        adverseReactions: AttributedProse(
            "Injection site pain + swelling, fever, headache, chills, fatigue, mild flu-like symptoms; rare allergic / anaphylactic reactions; very rare hemolysis (cross-reactive D antigen variants).",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("Live vaccines — defer 3 months after RhoGAM; passive antibodies neutralize live vaccine response.", citationIDs: ["openfda_round23"]),
            AttributedBullet("MMR + varicella vaccines — defer until 3 months post-RhoGAM if vaccinating postpartum.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Other antibody-containing products — generally compatible.", citationIDs: ["openfda_round23"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY Rh-negative status of mother before giving — antepartum + postpartum.", citationIDs: ["specialty_round23"]),
            AttributedBullet("VERIFY newborn Rh-positive status before postpartum dose; DO NOT give if newborn is Rh-negative (no need).", citationIDs: ["specialty_round23"]),
            AttributedBullet("ANTIBODY SCREEN before each dose — positive = already alloimmunized; refer MFM.", citationIDs: ["specialty_round23"]),
            AttributedBullet("28-WEEK ANTEPARTUM dose — unconditional regardless of paternal Rh; within 72 hrs of delivery if newborn Rh+ (NOT EVERY pregnancy needs postpartum dose — only Rh-positive newborn).", citationIDs: ["specialty_round23"]),
            AttributedBullet("KLEIHAUER-BETKE for suspected large FMH (abruption, trauma); >30 mL = additional doses (10 mcg per mL fetal blood).", citationIDs: ["specialty_round23"]),
            AttributedBullet("DOCUMENT — lot number, expiration, route, site, time + indication.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Counsel — passive antibody given to protect future pregnancies; not for current.", citationIDs: ["openrn_pharm_round23"])
        ],
        patientTeaching: AttributedProse(
            "Your blood type is Rh-negative. If your baby is Rh-positive, your body could make antibodies that would attack future Rh-positive babies. This shot prevents that. You'll get one at 28 weeks of pregnancy and within 3 days of delivery if your baby is Rh-positive. Safe + commonly used.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum FerrousSulfateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ferrous-sulfate",
        title: "Ferrous sulfate (oral iron)",
        subtitle: "First-line iron deficiency anemia · take with vitamin C · separate from antacids · alternate-day dosing better tolerated",
        category: "Iron supplement (oral)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Oral iron supplement (ferrous salt — sulfate, gluconate, fumarate)"),
            KeyValueRow(key: "Use", value: "Iron deficiency anemia; iron deficiency without anemia; pregnancy iron supplementation"),
            KeyValueRow(key: "Dose", value: "Adult IDA — 65-200 mg elemental iron PO daily / alternate days; pregnancy 30-60 mg daily prevention"),
            KeyValueRow(key: "Note", value: "ALTERNATE-DAY dosing improves absorption + tolerability (Stoffel 2017); take with vit C; SEPARATE from calcium / antacids / dairy / coffee / tea by 2 hrs")
        ],
        indications: AttributedProse(
            "Treatment of iron deficiency anemia (most common nutritional deficiency worldwide). Iron deficiency without anemia (low ferritin). Iron supplementation in pregnancy + chronic blood loss + chronic disease per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Replenishes iron stores → restores hemoglobin synthesis. Absorbed primarily in duodenum + proximal jejunum; absorption enhanced by gastric acid + vitamin C; reduced by phytates, polyphenols (tea), calcium, hepcidin (induced by oral iron itself — basis for alternate-day dosing).",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Adult IDA — traditional", body: "65 mg elemental iron PO TID (e.g., ferrous sulfate 325 mg = 65 mg elemental); often poorly tolerated.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Adult IDA — alternate-day (recommended)", body: "60-120 mg elemental iron PO ONCE every other day per primary source; better absorption + less GI side effects per Stoffel et al 2017.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Pregnancy prevention", body: "27-30 mg elemental iron daily (in prenatal vitamin) per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Pregnancy IDA treatment", body: "60-200 mg elemental iron daily / alternate days; with vitamin C.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Pediatric IDA", body: "3-6 mg/kg/day elemental iron PO; max 150 mg/day per primary source.", citationIDs: ["specialty_round23"])
        ],
        contraindications: AttributedProse(
            "Hemochromatosis, hemosiderosis, hemolytic anemia (without iron deficiency), thalassemia (unless documented coexistent IDA), hypersensitivity per primary source.",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("GI INTOLERANCE — nausea, abdominal pain, constipation, diarrhea, dark stools (expected); common cause of nonadherence.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ALTERNATE-DAY DOSING significantly improves tolerability + absorption per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("DARK STOOLS expected — distinguish from melena; fecal occult blood test may be falsely positive.", citationIDs: ["openfda_round23"]),
            AttributedBullet("CHILDREN — keep out of reach; iron toxicity in pediatric ingestion is severe (deferoxamine antidote for severe).", citationIDs: ["openfda_round23"]),
            AttributedBullet("INADEQUATE response — verify adherence, dose, absorption (celiac, atrophic gastritis, PPI-related); IV iron alternative.", citationIDs: ["specialty_round23"]),
            AttributedBullet("RECHECK CBC + ferritin at 4-6 weeks; expect hemoglobin rise 1-2 g/dL/month; continue 3-6 months after Hb normalized to replete stores.", citationIDs: ["specialty_round23"])
        ],
        adverseReactions: AttributedProse(
            "GI — nausea, vomiting, abdominal pain, constipation, diarrhea; dark stools (expected); tooth discoloration with liquid forms; iron toxicity in overdose; iron overload with chronic high-dose use.",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("CALCIUM, ANTACIDS, DAIRY — reduce absorption; separate by 2+ hrs.", citationIDs: ["openfda_round23"]),
            AttributedBullet("PPIs / H2 BLOCKERS — reduced gastric acid → reduced iron absorption.", citationIDs: ["openfda_round23"]),
            AttributedBullet("TETRACYCLINE, FLUOROQUINOLONES, LEVOTHYROXINE, BISPHOSPHONATES — chelation; separate by 2+ hrs.", citationIDs: ["openfda_round23"]),
            AttributedBullet("VITAMIN C (ascorbic acid 250-500 mg) — enhances absorption; take together.", citationIDs: ["specialty_round23"]),
            AttributedBullet("COFFEE, TEA (polyphenols) — reduce absorption; avoid within 1 hour.", citationIDs: ["specialty_round23"])
        ],
        nursingImplications: [
            AttributedBullet("ALTERNATE-DAY single morning dose with vitamin C — superior to TID for absorption + tolerability per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("EMPTY STOMACH (1 hr before meals) — best absorption; with food if GI intolerance (~60% absorption loss).", citationIDs: ["specialty_round23"]),
            AttributedBullet("SEPARATE from calcium / antacids / dairy / coffee / tea by 2+ hrs.", citationIDs: ["specialty_round23"]),
            AttributedBullet("Counsel on dark stools (expected); manage constipation with hydration + fiber + stool softener.", citationIDs: ["openfda_round23"]),
            AttributedBullet("RECHECK Hb / ferritin at 4-6 weeks; continue 3-6 months after normalization to replenish stores.", citationIDs: ["specialty_round23"]),
            AttributedBullet("IV IRON if oral inadequate — iron sucrose, ferric gluconate, iron carboxymaltose, iron isomaltoside; faster repletion + better in malabsorption / CKD / refractory IDA.", citationIDs: ["specialty_round23"]),
            AttributedBullet("WORKUP cause of IDA — colonoscopy / EGD in postmenopausal women + men >50 to rule out GI malignancy.", citationIDs: ["specialty_round23"])
        ],
        patientTeaching: AttributedProse(
            "Take this with a vitamin C source (orange juice, tablet) and an empty stomach if you can — that's when it absorbs best. Take it every other day instead of every day — actually works better. Wait 2 hours before / after calcium, antacids, dairy, coffee, or tea. Your stools will turn black — that's normal. Constipation is common — drink water + fiber. We'll recheck your blood in 4-6 weeks.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum FolicAcidSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "folic-acid",
        title: "Folic acid (vitamin B9, folate)",
        subtitle: "NTD prevention pre-conception · methotrexate rescue · folate-deficiency anemia · methylated form for MTHFR",
        category: "Water-soluble vitamin (folate)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Vitamin B9 (folate); essential for DNA synthesis + methylation"),
            KeyValueRow(key: "Use", value: "Neural tube defect prevention (preconception → 1st trimester); folate deficiency anemia; methotrexate rescue; chronic hemolysis support"),
            KeyValueRow(key: "Dose", value: "Routine pregnancy prevention 400-800 mcg/day; high-risk 4 mg/day; deficiency 1-5 mg/day"),
            KeyValueRow(key: "Watch", value: "Mask B12 deficiency (corrects megaloblastic anemia but not neuro damage)")
        ],
        indications: AttributedProse(
            "Prevention of neural tube defects (NTDs) — start ≥1 month preconception through 1st trimester; treatment of folate deficiency anemia; methotrexate rescue (leucovorin / folinic acid for cytotoxic uses; folic acid for chronic low-dose); chronic hemolytic anemias (sickle cell, thalassemia) per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Folate (reduced active form) → cofactor for one-carbon transfers — DNA + RNA synthesis (purines, pyrimidines), methionine synthesis (methylation), red cell production. Deficiency → megaloblastic anemia + ineffective hematopoiesis + NTDs in pregnancy.",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Routine NTD prevention (preconception → 1st tri)", body: "400-800 mcg/day PO starting ≥1 month before conception per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "High-risk NTD prevention", body: "4 mg/day PO starting ≥1 month preconception (prior NTD pregnancy, anti-epileptic drugs, T1DM, obesity, malabsorption) per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Folate deficiency anemia", body: "1-5 mg/day PO × 4 months (until repletion + RBC turnover) per primary source.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Methotrexate rescue (chronic low-dose)", body: "1 mg/day PO continuous OR 5 mg/week single dose (NOT on MTX day) per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Pediatric prevention", body: "0.1-0.4 mg/day PO; higher for risk factors.", citationIDs: ["openfda_round23"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — monotherapy in pernicious anemia / B12 deficiency (corrects anemia but not neurologic deficit); always check B12 before treating macrocytic anemia per primary source.",
            citationIDs: ["specialty_round23"]
        ),
        warnings: [
            AttributedBullet("MASKS B12 DEFICIENCY — folate corrects megaloblastic anemia but NOT neurologic damage; pernicious anemia neurologic deficits progress; ALWAYS check B12 + treat together if both deficient per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("MTHFR polymorphism — common; reduced ability to convert folic acid → 5-MTHF (active form); some recommend L-methylfolate for prevention, evidence emerging.", citationIDs: ["specialty_round23"]),
            AttributedBullet("HIGH-DOSE LONG-TERM — generally safe; possible association with cancer (controversial, mixed evidence).", citationIDs: ["specialty_round23"]),
            AttributedBullet("METHOTREXATE — folic acid taken on non-MTX days reduces side effects without reducing efficacy; folinic acid (leucovorin) for cytotoxic doses.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ANTI-EPILEPTIC DRUGS — phenytoin, carbamazepine, valproate, phenobarbital → folate depletion; supplement.", citationIDs: ["specialty_round23"])
        ],
        adverseReactions: AttributedProse(
            "Generally well-tolerated. Rare — nausea, bitter taste, sleep disturbance, mild skin rash. High-dose hypersensitivity reactions (rare).",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("METHOTREXATE — folate decreases efficacy of cytotoxic methotrexate; coordinate with prescriber.", citationIDs: ["openfda_round23"]),
            AttributedBullet("ANTI-EPILEPTIC DRUGS — folate may reduce phenytoin levels; monitor.", citationIDs: ["openfda_round23"]),
            AttributedBullet("TRIMETHOPRIM, SULFASALAZINE — folate antagonists; supplement during chronic use.", citationIDs: ["openfda_round23"]),
            AttributedBullet("SULFAMETHOXAZOLE — folate antagonist (though clinical effect modest).", citationIDs: ["openfda_round23"])
        ],
        nursingImplications: [
            AttributedBullet("PRECONCEPTION counseling — start folic acid 400-800 mcg/day at least 1 month before conception per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PRENATAL VITAMINS contain 0.4-1 mg folic acid; check + adjust for high-risk patients.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ALWAYS check B12 before treating macrocytic anemia with folate alone — masks B12 deficiency neurologic damage.", citationIDs: ["specialty_round23"]),
            AttributedBullet("METHOTREXATE patients — folic acid 1 mg/day continuous OR 5 mg/week; counsel.", citationIDs: ["specialty_round23"]),
            AttributedBullet("CHRONIC HEMOLYSIS (sickle cell, thalassemia, hereditary spherocytosis) — chronic supplementation 1-5 mg/day.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ANTI-EPILEPTIC drug users + alcoholism + malabsorption — supplement; check folate level + CBC.", citationIDs: ["specialty_round23"])
        ],
        patientTeaching: AttributedProse(
            "If you might get pregnant, take this every day — it prevents serious birth defects of the brain + spine. Start before pregnancy, not after you find out. Safe to take with most medications. If you're on methotrexate for arthritis, this also reduces side effects.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CyanocobalaminSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cyanocobalamin",
        title: "Cyanocobalamin (vitamin B12)",
        subtitle: "B12 deficiency · pernicious anemia · veganism · post-bariatric · IM if malabsorption · oral high-dose effective most",
        category: "Water-soluble vitamin (B12, cobalamin)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Vitamin B12 (cobalamin); essential for DNA synthesis + methylation + myelin"),
            KeyValueRow(key: "Use", value: "B12 deficiency (pernicious anemia, malabsorption, veganism, post-bariatric); high-dose for nutritional deficiency"),
            KeyValueRow(key: "Routes", value: "IM (1 mg standard); intranasal (Nascobal); oral high-dose (1-2 mg/day) effective for most including pernicious anemia"),
            KeyValueRow(key: "Watch", value: "Replete BEFORE folic acid in macrocytic anemia (avoid neuro damage); methylcobalamin alternative for MTHFR")
        ],
        indications: AttributedProse(
            "Vitamin B12 deficiency — pernicious anemia (autoimmune intrinsic factor deficiency), atrophic gastritis, malabsorption (Crohn's, celiac), strict vegan diet (>1 year), post-bariatric / gastrectomy, terminal ileum disease / resection, prolonged PPI / H2 blocker / metformin per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Cyanocobalamin (synthetic) → converted to active forms (methylcobalamin + adenosylcobalamin) → cofactors for one-carbon metabolism (DNA / RNA synthesis), homocysteine → methionine, fatty acid metabolism, myelination. Deficiency → megaloblastic anemia + neuropathy + cognitive impairment.",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Pernicious anemia / IF deficiency / severe", body: "1000 mcg IM daily × 1 week → weekly × 4 weeks → monthly lifelong; OR 1-2 mg PO daily (effective even in pernicious anemia per several trials) per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Dietary deficiency / vegan", body: "1000 mcg PO daily OR 2500 mcg PO weekly OR 1000 mcg IM monthly per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Maintenance (after repletion)", body: "1000 mcg IM monthly OR 1-2 mg PO daily per primary source.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Intranasal (Nascobal)", body: "500 mcg in one nostril weekly maintenance.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Pediatric", body: "0.5-1 mg IM weekly × several weeks then monthly maintenance.", citationIDs: ["specialty_round23"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to cobalt / cyanocobalamin; Leber's hereditary optic neuropathy (controversial — cyanide moiety theoretical concern; methylcobalamin alternative). Caution — folate deficiency without B12 workup (mask risk).",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("REPLETE B12 BEFORE FOLIC ACID in macrocytic anemia — folate alone corrects anemia but NOT B12-related neurologic damage; permanent if delayed per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ORAL HIGH-DOSE effective even in pernicious anemia (1-2% absorbed via passive diffusion despite IF deficiency); only need IM if cannot tolerate PO or refractory.", citationIDs: ["specialty_round23"]),
            AttributedBullet("METHYLMALONIC ACID (MMA) + HOMOCYSTEINE — sensitive markers when B12 borderline (200-400); both elevated in true B12 deficiency.", citationIDs: ["specialty_round23"]),
            AttributedBullet("METHYLCOBALAMIN — alternative for MTHFR polymorphism + Leber's; consider for non-responders.", citationIDs: ["specialty_round23"]),
            AttributedBullet("WORKUP cause — pernicious anemia (anti-IF + anti-parietal cell antibodies), atrophic gastritis, malabsorption.", citationIDs: ["specialty_round23"]),
            AttributedBullet("Monitor — Hb, MCV (normalizes 2-3 months); methylmalonic acid; reticulocyte response; neurologic improvement.", citationIDs: ["specialty_round23"])
        ],
        adverseReactions: AttributedProse(
            "Generally well-tolerated. Rare — nausea, headache, dizziness, anaphylaxis (very rare), hypokalemia (with rapid repletion of severe megaloblastic anemia), gout flare, CHF exacerbation (severe deficiency repletion).",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("METFORMIN — long-term reduces B12 absorption; periodic B12 monitoring + supplementation.", citationIDs: ["openfda_round23"]),
            AttributedBullet("PPIs / H2 blockers — long-term reduces B12 absorption.", citationIDs: ["openfda_round23"]),
            AttributedBullet("COLCHICINE, NEOMYCIN — reduce absorption.", citationIDs: ["openfda_round23"]),
            AttributedBullet("FOLIC ACID — masks B12 deficiency anemia but not neuro damage; check + treat both.", citationIDs: ["specialty_round23"])
        ],
        nursingImplications: [
            AttributedBullet("CHECK B12 + folate together when working up macrocytic anemia.", citationIDs: ["specialty_round23"]),
            AttributedBullet("BORDERLINE B12 (200-400) — methylmalonic acid + homocysteine to confirm true deficiency.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ORAL high-dose effective for most including pernicious anemia — first-line per primary source; reserve IM for refractory / NPO / severe neurologic deficit.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PERNICIOUS ANEMIA — autoimmune; lifelong replacement; screen other autoimmune (thyroid, T1DM); annual B12 + Hb.", citationIDs: ["specialty_round23"]),
            AttributedBullet("VEGAN counseling — B12 supplement essential after >1 year strict vegan; otherwise neuropathy + anemia 5-10 years later.", citationIDs: ["specialty_round23"]),
            AttributedBullet("BARIATRIC SURGERY — lifelong B12 supplementation post-RYGB / sleeve.", citationIDs: ["specialty_round23"]),
            AttributedBullet("METFORMIN long-term users — annual B12 check + supplement if needed.", citationIDs: ["specialty_round23"])
        ],
        patientTeaching: AttributedProse(
            "Your body needs vitamin B12 for healthy nerves, blood, and brain. Take this daily by mouth — works for almost everyone, even those who don't absorb well. If you're vegan, take it for life. If you have pernicious anemia or had stomach surgery, you need it for life. Tell us about numbness, tingling, balance problems, or memory issues — these can be B12 nerve damage.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AspirinLowDoseSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "aspirin-low-dose",
        title: "Aspirin low-dose (81 mg, baby aspirin)",
        subtitle: "Preeclampsia prevention 12-28 wks · secondary CV prevention · USPSTF 40-59 selective primary CV · stop pre-procedure",
        category: "Antiplatelet (low-dose aspirin)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cyclooxygenase inhibitor / antiplatelet (low-dose)"),
            KeyValueRow(key: "Use", value: "Preeclampsia prevention (high-risk); secondary CV prevention; selective primary CV (USPSTF age 40-59 with risk); colorectal cancer (off-label)"),
            KeyValueRow(key: "Dose", value: "81 mg PO daily (some 162 mg for ASA-resistant); preeclampsia prevention 81-162 mg starting 12-16 weeks"),
            KeyValueRow(key: "Watch", value: "GI bleeding, hemorrhagic stroke; HOLD 5-7 days pre-elective surgery (NOT for stent / acute MI)"),
            KeyValueRow(key: "Note", value: "Distinct from FULL-DOSE aspirin (325-650 mg) for fever / acute pain")
        ],
        indications: AttributedProse(
            "Preeclampsia prevention in high-risk pregnancy (ACOG, USPSTF — start 12-28 weeks); secondary cardiovascular prevention (post-MI, prior stroke / TIA, established CAD, peripheral vascular); USPSTF selective primary CV prevention age 40-59 with ≥10% 10-year CV risk + low bleeding risk; colorectal cancer prevention (off-label, USPSTF 50-59) per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Irreversibly acetylates platelet cyclooxygenase-1 (COX-1) → blocks thromboxane A2 synthesis → reduces platelet aggregation. Effect lasts platelet lifespan (~10 days). Anti-inflammatory effect at higher doses (full dose). Possible role in preeclampsia via vascular endothelial function modulation.",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Preeclampsia prevention (high-risk)", body: "81-162 mg PO daily starting 12-28 weeks (ideally 12-16 weeks); continue through delivery per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Secondary CV prevention", body: "81 mg PO daily lifelong (or 162 mg for ASA resistance / severe high-risk per primary source).", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Primary CV prevention (USPSTF selective)", body: "81 mg PO daily age 40-59 with ≥10% 10-year CV risk + low bleeding risk + shared decision-making per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Acute MI / acute coronary syndrome", body: "162-325 mg chewable PO immediately (FULL-DOSE form; not low-dose) per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Pediatric (Kawasaki)", body: "Aspirin 30-50 mg/kg/day acute, then 3-5 mg/kg/day; specialty.", citationIDs: ["specialty_round23"])
        ],
        contraindications: AttributedProse(
            "Active GI bleeding / peptic ulcer; hemophilia / severe coagulopathy; aspirin / NSAID allergy with severe reactions (Samter's triad — asthma + nasal polyps + ASA sensitivity); children with viral illness (Reye syndrome); 3rd trimester pregnancy (>30 weeks — premature ductus closure) per primary source.",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("GI BLEEDING — most common serious adverse effect; PPI co-prescription for high-risk; H. pylori test + treat; counsel signs.", citationIDs: ["specialty_round23"]),
            AttributedBullet("HEMORRHAGIC STROKE — slightly increased risk; balance against ischemic protection.", citationIDs: ["specialty_round23"]),
            AttributedBullet("REYE SYNDROME — children with viral illness (influenza, varicella); avoid ASA in children for fever; alternative acetaminophen / ibuprofen.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PERIOPERATIVE — generally HOLD 5-7 days pre-elective surgery; CONTINUE in cardiac surgery / recent stent / acute MI per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PREGNANCY — safe at low dose 1st-2nd trimester; AVOID after 30 weeks (premature ductus arteriosus closure).", citationIDs: ["specialty_round23"]),
            AttributedBullet("ASA RESISTANCE — clinical phenomenon; consider 162 mg or alternative; ASA + clopidogrel for selected.", citationIDs: ["specialty_round23"]),
            AttributedBullet("USPSTF 2022 — primary CV prevention age 60+ NOT recommended (bleeding risk outweighs benefit); secondary prevention always continued.", citationIDs: ["specialty_round23"])
        ],
        adverseReactions: AttributedProse(
            "GI bleeding, gastritis, dyspepsia, easy bruising, hemorrhagic stroke (small absolute increase), tinnitus (high-dose), allergic reactions, Reye syndrome (children), Samter's triad (asthma exacerbation in sensitive).",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("ANTICOAGULANTS (warfarin, DOACs, heparin) — additive bleeding risk; combine cautiously.", citationIDs: ["openfda_round23"]),
            AttributedBullet("OTHER ANTIPLATELETS (clopidogrel, ticagrelor) — DAPT for selected indications; bleeding risk.", citationIDs: ["specialty_round23"]),
            AttributedBullet("OTHER NSAIDS — additive GI bleed; ibuprofen blocks ASA cardioprotective effect (timing matters).", citationIDs: ["openfda_round23"]),
            AttributedBullet("ACE INHIBITORS — modest reduction in efficacy.", citationIDs: ["openfda_round23"]),
            AttributedBullet("METHOTREXATE — increased toxicity; avoid concurrent.", citationIDs: ["openfda_round23"])
        ],
        nursingImplications: [
            AttributedBullet("CONFIRM low-dose form — 81 mg (\"baby aspirin\") different from full-dose 325 mg; some patients confused.", citationIDs: ["openrn_pharm_round23"]),
            AttributedBullet("PREECLAMPSIA — ACOG + USPSTF recommend 81 mg daily 12-28 weeks for high-risk (prior preeclampsia, multifetal, chronic HTN, T1/T2 DM, renal disease, autoimmune); continue through delivery per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("HIGH-RISK PREGNANCY ASSESSMENT — should be done in 1st trimester; start ASA early.", citationIDs: ["specialty_round23"]),
            AttributedBullet("COUNSEL bleeding signs — black stools, hematemesis, easy bruising, prolonged bleeding from cuts.", citationIDs: ["specialty_round23"]),
            AttributedBullet("HOLD 5-7 days BEFORE elective surgery; continue if stent <1 year or acute MI <3 months.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ENTERIC-coated form available; some prefer for GI tolerability; absorption similar.", citationIDs: ["openfda_round23"])
        ],
        patientTeaching: AttributedProse(
            "This is the small \"baby\" aspirin (81 mg) — different from full-strength (325 mg) for fever. Take it daily. If your stools turn black, you vomit blood, or you bruise easily — call us. Don't stop before surgery without checking — we'll tell you when. If you're pregnant + high-risk for preeclampsia, you'll start at 12-16 weeks.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum SumatriptanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sumatriptan",
        title: "Sumatriptan (Imitrex)",
        subtitle: "Triptan acute migraine · 5-HT1B/1D agonist · vasoconstriction · contraindicated CAD/uncontrolled HTN/hemiplegic/basilar migraine",
        category: "5-HT1B/1D receptor agonist (triptan, antimigraine)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Triptan — 5-HT1B/1D receptor agonist"),
            KeyValueRow(key: "Use", value: "Acute migraine + cluster headache; NOT for chronic suppression / prevention"),
            KeyValueRow(key: "Dose (oral)", value: "50-100 mg PO at onset; may repeat in 2 hrs; max 200 mg/24 hr"),
            KeyValueRow(key: "Other forms", value: "SC 6 mg (faster); intranasal 5-20 mg; max 12 mg SC / 40 mg IN per 24 hr"),
            KeyValueRow(key: "Contraindicated", value: "Coronary artery disease, uncontrolled HTN, hemiplegic / basilar migraine, recent ergotamine, MAOI, peripheral vascular disease"),
            KeyValueRow(key: "Watch", value: "Chest tightness (often non-cardiac), serotonin syndrome with SSRI/SNRI, medication-overuse headache")
        ],
        indications: AttributedProse(
            "Acute migraine attack treatment (with or without aura); cluster headache acute treatment (SC form). NOT for migraine prevention or chronic suppression per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Selective 5-HT1B/1D receptor agonist → vasoconstriction of intracranial extracerebral vessels + inhibition of trigeminal neurogenic inflammation + central pain modulation. Onset 30 min PO / 10 min SC; peak 2 hrs; T1/2 2 hrs.",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Oral", body: "50-100 mg PO at headache onset; may repeat in 2 hours; max 200 mg/24 hr per primary source.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Subcutaneous", body: "6 mg SC; may repeat in 1 hour; max 12 mg/24 hr; faster onset (10 min) per primary source.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Intranasal", body: "5-20 mg per nostril at onset; may repeat in 2 hours; max 40 mg/24 hr per primary source.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Cluster headache", body: "6 mg SC at onset; specific cluster indication.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Pediatric (≥6 years for IN)", body: "Per product label; specialty input recommended.", citationIDs: ["specialty_round23"])
        ],
        contraindications: AttributedProse(
            "ISCHEMIC HEART DISEASE (angina, prior MI, documented CAD); uncontrolled HTN; CEREBROVASCULAR disease; PERIPHERAL vascular disease; HEMIPLEGIC migraine; BASILAR migraine; severe hepatic impairment; recent (<24h) ergotamine / dihydroergotamine; recent (<24h) other triptan; MAOI use within 2 weeks per primary source.",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("CV RISK — angina, MI, stroke, sudden cardiac death (rare); ECG + risk factor screening before first dose in patients with CV risk per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("CHEST TIGHTNESS — common, usually non-cardiac (often muscular / esophageal); but evaluate cardiac if persistent / severe.", citationIDs: ["specialty_round23"]),
            AttributedBullet("SEROTONIN SYNDROME — risk with SSRI / SNRI / MAOI / lithium / TCAs; counsel + monitor.", citationIDs: ["specialty_round23"]),
            AttributedBullet("HEMIPLEGIC + BASILAR MIGRAINE — contraindicated; risk of stroke + permanent neurologic damage.", citationIDs: ["specialty_round23"]),
            AttributedBullet("MEDICATION-OVERUSE HEADACHE — limit triptan use to ≤9 days/month; counsel.", citationIDs: ["specialty_round23"]),
            AttributedBullet("CARDIAC RISK FACTORS — DM, smoking, obesity, family history, age, postmenopausal — assess before first dose; consider ECG / stress test.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PREGNANCY — Category C; limited data; alternative analgesics preferred 1st-line in pregnancy.", citationIDs: ["specialty_round23"])
        ],
        adverseReactions: AttributedProse(
            "Chest tightness / pressure (common), flushing, paresthesias, neck pain, fatigue, dizziness, dry mouth, nausea, somnolence, hot flashes, atypical chest pain, very rare MI / stroke / arrhythmia, serotonin syndrome.",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated within 2 weeks; serotonin syndrome / hypertensive crisis.", citationIDs: ["openfda_round23"]),
            AttributedBullet("SSRI / SNRI / TCA / lithium — serotonin syndrome risk; monitor.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ERGOTAMINE / dihydroergotamine — vasospasm; do NOT use within 24 hrs.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Other triptans — do NOT combine within 24 hrs.", citationIDs: ["openfda_round23"]),
            AttributedBullet("CYP1A2 inhibitors / inducers — minor effect.", citationIDs: ["openfda_round23"])
        ],
        nursingImplications: [
            AttributedBullet("CV ASSESSMENT — risk factors + recent ECG before first dose if patient has any CV risk per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("EARLY ADMINISTRATION at headache onset — maximum efficacy; avoid waiting until severe.", citationIDs: ["specialty_round23"]),
            AttributedBullet("LIMIT to ≤9 days/month — medication-overuse headache risk; counsel + diary.", citationIDs: ["specialty_round23"]),
            AttributedBullet("Counsel CHEST TIGHTNESS expected (most non-cardiac); evaluate if persistent / radiating / severe.", citationIDs: ["specialty_round23"]),
            AttributedBullet("DOCUMENT migraine type — hemiplegic / basilar migraine = contraindicated.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ALTERNATIVE acute migraine — NSAIDs (ibuprofen, naproxen), acetaminophen, anti-emetics (metoclopramide), gepants (rimegepant, ubrogepant), ditans (lasmiditan).", citationIDs: ["specialty_round23"]),
            AttributedBullet("PREVENTIVE for chronic migraine (≥4/month) — topiramate, propranolol, amitriptyline, CGRP monoclonals (erenumab, fremanezumab, galcanezumab), botulinum toxin A.", citationIDs: ["specialty_round23"])
        ],
        patientTeaching: AttributedProse(
            "Take this AT THE FIRST SIGN of migraine — works best early, less well after pain peaks. Don't use more than 9 days a month — overuse causes more headaches. Tell us right away about chest pain that doesn't go away, jaw pain, severe arm pain, or feeling like a heart attack. Don't take if you've used another migraine triptan or ergot in the past 24 hours.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum TopiramateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "topiramate",
        title: "Topiramate (Topamax)",
        subtitle: "Antiepileptic + migraine prophy + weight loss · slow titration to avoid CNS effects · word-finding · kidney stones · TERATOGEN",
        category: "Antiepileptic drug (multi-mechanism); migraine prophylaxis; off-label weight loss",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Antiepileptic; multiple mechanisms (Na channel block, GABA enhancement, glutamate inhibition, carbonic anhydrase inhibition)"),
            KeyValueRow(key: "Use", value: "Migraine prophylaxis; epilepsy (focal + tonic-clonic); off-label weight loss (Qsymia combined with phentermine)"),
            KeyValueRow(key: "Dose", value: "Migraine — start 25 mg QHS, titrate to 50-100 mg BID; Epilepsy 100-400 mg/day; SLOW titration"),
            KeyValueRow(key: "Watch", value: "Cognitive side effects, word-finding, paresthesias, kidney stones, metabolic acidosis, pregnancy CATEGORY D (cleft palate + low birth weight)")
        ],
        indications: AttributedProse(
            "Migraine prophylaxis (FDA-approved); epilepsy — focal + tonic-clonic seizures + Lennox-Gastaut + adjunctive; off-label weight loss (Qsymia combination); cluster headache prevention; alcohol use disorder; bulimia; binge eating disorder per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Multiple mechanisms — voltage-gated Na+ channel inhibition, enhanced GABA-A activity, glutamate AMPA / kainate receptor antagonism, carbonic anhydrase inhibition (mild). Net effect — neuronal hyperexcitability reduction + appetite suppression + glaucoma / kidney stone risk.",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Migraine prophylaxis", body: "Start 25 mg QHS week 1; increase by 25 mg/week to 50 mg BID; max 100 mg BID per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Epilepsy (adult focal / TC)", body: "Start 25-50 mg/day; titrate by 25-50 mg/week to 200-400 mg/day in 2 divided doses per primary source.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Pediatric epilepsy (≥2 years)", body: "Start 1-3 mg/kg/day; titrate to 5-9 mg/kg/day; specialty.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Weight loss (Qsymia — phentermine/topiramate)", body: "Start 3.75/23 mg AM; titrate to 7.5/46 → 15/92 mg AM; FDA-approved; see Qsymia PI.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Renal adjustment", body: "Reduce by 50% for CrCl <70.", citationIDs: ["openfda_round23"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — pregnancy (Category D — cleft palate, growth restriction; CATEGORY X for Qsymia); hepatic impairment; renal insufficiency; nephrolithiasis history; metabolic acidosis; concurrent CAIs per primary source.",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("PREGNANCY — Category D; cleft palate + cleft lip + low birth weight + small-for-gestational-age; counsel + reliable contraception; pregnancy registry per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("COGNITIVE EFFECTS — \"Dopamax\" — word-finding difficulty, slowed processing, confusion, depression; common; SLOW TITRATION minimizes; reversible with discontinuation or dose reduction.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PARESTHESIAS — fingers + toes; common; usually mild + tolerated.", citationIDs: ["specialty_round23"]),
            AttributedBullet("KIDNEY STONES — calcium phosphate; hydration + alkalinization may help; counsel.", citationIDs: ["specialty_round23"]),
            AttributedBullet("METABOLIC ACIDOSIS — non-anion gap; check bicarbonate periodically; chronic metabolic acidosis can affect bone density.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ACUTE ANGLE-CLOSURE GLAUCOMA — RARE but serious; eye pain + vision change; emergent eye exam + discontinue.", citationIDs: ["specialty_round23"]),
            AttributedBullet("HYPERTHERMIA + ANHIDROSIS in pediatric — caution in heat; monitor.", citationIDs: ["specialty_round23"]),
            AttributedBullet("SUICIDAL IDEATION (FDA boxed for AEDs) — monitor mood.", citationIDs: ["specialty_round23"])
        ],
        adverseReactions: AttributedProse(
            "Cognitive (word-finding, slowed processing), paresthesias, fatigue, weight loss (often desired), nausea, kidney stones, metabolic acidosis, depression, suicidal ideation, anhidrosis / hyperthermia, acute glaucoma, hypokalemia.",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("Other CAIs (acetazolamide, zonisamide) — additive metabolic acidosis + kidney stones.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Oral contraceptives — reduces ethinyl estradiol levels at doses >200 mg/day; backup contraception.", citationIDs: ["openfda_round23"]),
            AttributedBullet("CNS depressants (alcohol, sedatives) — additive sedation + cognitive effects.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Phenytoin, carbamazepine — induce topiramate metabolism (lower levels).", citationIDs: ["openfda_round23"]),
            AttributedBullet("Lithium — topiramate may decrease lithium levels.", citationIDs: ["openfda_round23"])
        ],
        nursingImplications: [
            AttributedBullet("SLOW TITRATION — start low, go slow; minimizes cognitive side effects; counsel patience.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PREGNANCY counseling — reliable contraception; pregnancy testing before start; pregnancy registry; consider alternatives if pregnancy possible.", citationIDs: ["specialty_round23"]),
            AttributedBullet("HYDRATION 2-3 L/day — kidney stone prevention; consider potassium citrate if recurrent.", citationIDs: ["specialty_round23"]),
            AttributedBullet("BICARBONATE periodically — check for metabolic acidosis; bone density risk if chronic.", citationIDs: ["specialty_round23"]),
            AttributedBullet("MONITOR mood + suicidal ideation; cognitive function; weight; word-finding.", citationIDs: ["specialty_round23"]),
            AttributedBullet("Counsel — \"Dopamax\" cognitive effects often improve over weeks; reduce dose if intolerable; switch agent if persistent.", citationIDs: ["specialty_round23"]),
            AttributedBullet("BACKUP CONTRACEPTION at doses >200 mg/day — reduces OCP efficacy.", citationIDs: ["specialty_round23"]),
            AttributedBullet("DON'T abruptly discontinue if used for epilepsy — taper.", citationIDs: ["openfda_round23"])
        ],
        patientTeaching: AttributedProse(
            "Start at a low dose and increase slowly — this reduces brain fog. You may have trouble finding words at first; this usually improves. Drink lots of water — kidney stones are a side effect. Tell us about depression, suicidal thoughts, eye pain or vision changes (emergent), or symptoms of a kidney stone. Don't get pregnant on this — it can cause birth defects. Use birth control.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ClonidineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "clonidine",
        title: "Clonidine (Catapres, Kapvay)",
        subtitle: "Central α2 agonist · HTN urgency + ADHD + opioid withdrawal + hot flashes · WITHDRAWAL HTN crisis · sedation",
        category: "Central α2 adrenergic agonist",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Central α2 agonist; reduces sympathetic outflow"),
            KeyValueRow(key: "Use", value: "Hypertension (incl. urgency); ADHD; opioid / nicotine withdrawal; menopausal hot flashes; off-label tics, anxiety, PTSD nightmares"),
            KeyValueRow(key: "Dose (HTN)", value: "PO 0.1-0.3 mg BID-TID; transdermal weekly; HTN urgency 0.1-0.2 mg PO loading + 0.1 mg q1h"),
            KeyValueRow(key: "Watch", value: "Sedation, dry mouth, REBOUND HYPERTENSION on abrupt withdrawal (taper essential), bradycardia, syncope"),
            KeyValueRow(key: "ADHD", value: "Kapvay extended-release; pediatric ≥6 years; Tenex (guanfacine) similar")
        ],
        indications: AttributedProse(
            "Hypertension (acute + chronic; resistant HTN); HTN urgency (PO loading); ADHD (Kapvay extended-release; alternative to stimulants); opioid + nicotine withdrawal symptom management; menopausal hot flashes; off-label — Tourette tics, anxiety, PTSD nightmares per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Central α2 receptor agonist → reduces sympathetic outflow from CNS → decreased SVR + HR + BP. Also presynaptic α2 inhibits norepinephrine release. Reduces noradrenergic tone — useful for autonomic withdrawal symptoms.",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Chronic HTN (oral)", body: "Start 0.1 mg PO BID; titrate by 0.1 mg/week; usual 0.2-0.6 mg/day in 2-3 divided doses; max 2.4 mg/day per primary source.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "Hypertensive urgency (oral loading)", body: "0.1-0.2 mg PO + 0.1 mg PO q1h until response or max 0.7 mg total per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Transdermal patch", body: "Catapres-TTS: 0.1, 0.2, 0.3 mg/day — apply weekly; rotate sites.", citationIDs: ["openfda_round23"]),
            DosingBlock(label: "ADHD (Kapvay ER)", body: "Start 0.1 mg PO QHS; titrate weekly to 0.2-0.4 mg/day in 2 divided doses; max 0.4 mg/day per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Opioid withdrawal", body: "0.1-0.2 mg PO q4-8h PRN; titrate to BP / symptoms; max 1.2 mg/day per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Menopausal hot flashes", body: "0.05-0.1 mg PO BID OR transdermal weekly per primary source.", citationIDs: ["specialty_round23"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — sick sinus syndrome, severe bradycardia, recent MI, cerebrovascular insufficiency, pheochromocytoma (paradoxical HTN possible) per primary source.",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("REBOUND HYPERTENSION — abrupt discontinuation → sympathetic surge + severe HTN crisis (life-threatening); ALWAYS taper over 2-4 days per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("SEDATION — common; counsel against driving; bedtime dosing reduces daytime sedation.", citationIDs: ["openfda_round23"]),
            AttributedBullet("BRADYCARDIA — hold for HR <50; AV block possible.", citationIDs: ["openfda_round23"]),
            AttributedBullet("DRY MOUTH — very common; counsel hydration / sugar-free gum / lozenges.", citationIDs: ["openfda_round23"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — slow position changes; falls risk in elderly.", citationIDs: ["openfda_round23"]),
            AttributedBullet("DEPRESSION — caution in patients with depression history; can worsen mood.", citationIDs: ["openfda_round23"]),
            AttributedBullet("PEDIATRIC ADHD — monitor BP / HR; bradycardia + hypotension possible; QTc prolongation rare; do NOT abrupt discontinue per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("BREASTFEEDING — passes to milk; alternatives preferred.", citationIDs: ["openfda_round23"])
        ],
        adverseReactions: AttributedProse(
            "Sedation, dry mouth, dizziness, fatigue, depression, sexual dysfunction, orthostatic hypotension, bradycardia, AV block, rebound HTN, constipation, nausea, transdermal site reactions.",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("Beta-blockers — additive bradycardia + AV block; rebound HTN worse if both stopped.", citationIDs: ["openfda_round23"]),
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_round23"]),
            AttributedBullet("TCAs — may reduce antihypertensive effect of clonidine.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Alcohol — additive CNS depression.", citationIDs: ["openfda_round23"]),
            AttributedBullet("Methylphenidate / amphetamines (ADHD combination) — generally OK but monitor BP / HR.", citationIDs: ["specialty_round23"])
        ],
        nursingImplications: [
            AttributedBullet("EMPHASIZE non-discontinuation without taper — REBOUND HTN crisis; counsel + label.", citationIDs: ["specialty_round23"]),
            AttributedBullet("BEDTIME dosing reduces daytime sedation; transdermal smoother BP control over week.", citationIDs: ["openfda_round23"]),
            AttributedBullet("MONITOR — BP, HR, orthostatics, mood, sedation; BP / HR before each dose initial.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PEDIATRIC ADHD — alternative to stimulants; especially with anxiety + tics; sleep aid effect; BP / HR monitoring.", citationIDs: ["specialty_round23"]),
            AttributedBullet("OPIOID WITHDRAWAL — adjunct to MAT; reduces autonomic symptoms (sweating, BP, HR); not for cravings.", citationIDs: ["specialty_round23"]),
            AttributedBullet("MENOPAUSAL HOT FLASHES — useful when HRT contraindicated (breast cancer); modest efficacy.", citationIDs: ["specialty_round23"]),
            AttributedBullet("TRANSDERMAL — rotate sites; remove old patch before new; counsel skin reactions.", citationIDs: ["openfda_round23"])
        ],
        patientTeaching: AttributedProse(
            "This medicine lowers blood pressure + has multiple uses. NEVER stop suddenly — your blood pressure can dangerously rebound. Always taper. Side effects: sleepy + dry mouth common, especially first weeks. Stand up slowly. Tell us about slow heartbeat, fainting, or worsening depression.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CholecalciferolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cholecalciferol",
        title: "Cholecalciferol (vitamin D3)",
        subtitle: "Vitamin D supplementation · D3 preferred over D2 · 1000-2000 IU/day routine · 50,000 IU weekly for deficiency",
        category: "Vitamin D supplementation (vitamin D3)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Fat-soluble vitamin (D3 — cholecalciferol; preferred over D2 / ergocalciferol for raising 25-OH D)"),
            KeyValueRow(key: "Use", value: "Vitamin D deficiency / insufficiency; rickets prevention; osteoporosis; CKD-MBD adjunct"),
            KeyValueRow(key: "Daily dose", value: "Routine adult 1000-2000 IU/day; pediatric 400-1000 IU/day; pregnancy 600-2000 IU/day"),
            KeyValueRow(key: "Replacement", value: "50,000 IU weekly × 6-8 weeks for deficiency, then maintenance"),
            KeyValueRow(key: "Watch", value: "Hypercalcemia at very high doses; calcitriol vs cholecalciferol — different agents")
        ],
        indications: AttributedProse(
            "Vitamin D deficiency (25-OH D <20 ng/mL) + insufficiency (20-30 ng/mL); rickets (children) + osteomalacia (adults); osteoporosis adjunct (with calcium + bisphosphonate); pregnancy + lactation; CKD-mineral bone disorder adjunct (with calcitriol if active form needed); fall prevention in elderly per primary source.",
            citationIDs: ["specialty_round23", "openfda_round23"]
        ),
        mechanism: AttributedProse(
            "Cholecalciferol (D3) → hydroxylated in liver → 25-OH D (storage form) → hydroxylated in kidney → 1,25(OH)2 D (calcitriol — active form) → binds vitamin D receptor → enhanced intestinal calcium + phosphate absorption + bone remodeling + immune modulation.",
            citationIDs: ["openfda_round23"]
        ),
        dosing: [
            DosingBlock(label: "Routine adult supplementation", body: "1000-2000 IU PO daily per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Pediatric routine", body: "400 IU/day infants 0-1 year (AAP); 600-1000 IU/day children + adolescents per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Pregnancy / lactation", body: "600-2000 IU/day; some evidence higher doses (4000 IU) safe + improve outcomes per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Vitamin D deficiency replacement", body: "50,000 IU PO weekly × 6-8 weeks → maintenance 1000-2000 IU/day per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Severe deficiency (25-OH <10)", body: "50,000 IU PO weekly × 8-12 weeks → 1000-2000 IU/day OR daily 5000-10,000 IU per primary source.", citationIDs: ["specialty_round23"]),
            DosingBlock(label: "Maintenance after replacement", body: "1000-2000 IU/day; recheck level at 3 months.", citationIDs: ["specialty_round23"])
        ],
        contraindications: AttributedProse(
            "Hypercalcemia, hypervitaminosis D, malabsorption (use higher doses or active form); hypersensitivity. Caution — granulomatous disease (sarcoidosis, TB — increased calcitriol production); active urinary calculi.",
            citationIDs: ["openfda_round23"]
        ),
        warnings: [
            AttributedBullet("HYPERCALCEMIA at very high doses (>10,000 IU/day chronic); rare with standard supplementation; monitor calcium periodically with high-dose replacement.", citationIDs: ["specialty_round23"]),
            AttributedBullet("D3 (cholecalciferol) PREFERRED over D2 (ergocalciferol) — better raises + sustains 25-OH D levels per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("CALCITRIOL (active form) — DIFFERENT agent; reserved for ESRD / hypoparathyroidism / pseudohypoparathyroidism / VDDR; rapid hypercalcemia risk.", citationIDs: ["specialty_round23"]),
            AttributedBullet("ROUTINE SCREENING — controversial (USPSTF: I statement insufficient evidence); selective in symptomatic / risk-factor patients.", citationIDs: ["specialty_round23"]),
            AttributedBullet("OSTEOPOROSIS — vitamin D + calcium + bisphosphonate together; D alone insufficient.", citationIDs: ["specialty_round23"]),
            AttributedBullet("CKD STAGES 4-5 — measure both 25-OH D + 1,25(OH)2 D; supplement both forms typically needed.", citationIDs: ["specialty_round23"])
        ],
        adverseReactions: AttributedProse(
            "Generally well-tolerated. Hypercalcemia, hypercalciuria, kidney stones, nausea, vomiting, weakness, polyuria (with toxicity); rare hypersensitivity.",
            citationIDs: ["openfda_round23"]
        ),
        drugInteractions: [
            AttributedBullet("PHENYTOIN, PHENOBARBITAL, CARBAMAZEPINE — induce vitamin D catabolism; higher doses needed.", citationIDs: ["openfda_round23"]),
            AttributedBullet("CHOLESTYRAMINE, BILE ACID SEQUESTRANTS, ORLISTAT — reduce absorption.", citationIDs: ["openfda_round23"]),
            AttributedBullet("THIAZIDE diuretics — additive hypercalcemia risk; monitor.", citationIDs: ["openfda_round23"]),
            AttributedBullet("CALCIUM supplementation — synergistic; combine for bone health.", citationIDs: ["specialty_round23"]),
            AttributedBullet("DIGOXIN — hypercalcemia from vitamin D excess potentiates digoxin toxicity.", citationIDs: ["openfda_round23"])
        ],
        nursingImplications: [
            AttributedBullet("CHECK 25-OH D level for symptomatic patients OR risk factors (elderly, dark skin, obesity, malabsorption, chronic disease, low sun exposure, anti-epileptic drugs) per primary source.", citationIDs: ["specialty_round23"]),
            AttributedBullet("CHOLECALCIFEROL (D3) preferred — raises 25-OH D more reliably than ergocalciferol (D2).", citationIDs: ["specialty_round23"]),
            AttributedBullet("RECHECK 25-OH D at 3 months after starting replacement; adjust dose to maintain ≥30 ng/mL.", citationIDs: ["specialty_round23"]),
            AttributedBullet("OSTEOPOROSIS — combine with calcium 1000-1200 mg/day + bisphosphonate / denosumab for treatment.", citationIDs: ["specialty_round23"]),
            AttributedBullet("FALL PREVENTION in elderly — vitamin D 800-1000 IU/day reduces falls per Cochrane.", citationIDs: ["specialty_round23"]),
            AttributedBullet("COUNSEL — sun exposure (15-20 min/day to face / arms) + dietary sources (fatty fish, fortified milk / cereal); supplements often needed in northern latitudes / dark skin / obesity / elderly.", citationIDs: ["specialty_round23"]),
            AttributedBullet("PEDIATRIC RICKETS prevention — 400 IU/day in all infants from birth (AAP); breastfed infants particularly; formula-fed already supplemented.", citationIDs: ["specialty_round23"])
        ],
        patientTeaching: AttributedProse(
            "Take this with food (better absorbed since it's fat-soluble). Daily is fine. Most adults need 1000-2000 IU/day. If you live in a northern area, have dark skin, are overweight, or are over 65, you likely need more sun exposure or a higher dose. Recheck blood level in 3 months. Don't take more than 4000 IU/day routinely without checking.",
            citationIDs: ["openrn_pharm_round23"]
        ),
        citations: [openfdaR23, openrnPharmR23, cdcR23, specialtyR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}
