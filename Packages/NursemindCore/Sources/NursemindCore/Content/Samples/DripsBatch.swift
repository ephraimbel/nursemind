import Foundation

// Curator-model continuous infusion entries.
// Per Apple 1.4.2: drip-rate calculators are CUT from v1; entries display
// reference dose ranges from openFDA SPL only — no patient-specific dose computation.
// Sources: openFDA Drug Label API (CC0) — set IDs verified 2026-05-04.
// Nursing implications drawn from Open RN Nursing Pharmacology (CC BY 4.0).

private let openrnPharmDrips = CitationSource(
    id: "openrn_pharm_drips",
    shortName: "Open RN Nursing Pharmacology, 2nd ed.",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=continuous+infusion+drip+titration",
    lastRetrieved: "2026-05-04"
)

private let ismpDrips = CitationSource(
    id: "ismp_high_alert_drips",
    shortName: "ISMP List of High-Alert Medications in Acute Care",
    detail: "Concept citation only",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Dopamine drip

public enum DopamineDripSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_dopamine_drip",
            shortName: "FDA SPL — Dopamine Hydrochloride in Dextrose",
            detail: "SET ID: 08f23f6e-150d-45ea-098e-f2edf64c21a1",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "dopamine-drip",
            title: "Dopamine drip",
            subtitle: "Endogenous catecholamine — dose-dependent receptor activity",
            category: "Vasopressor / Inotrope",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Catecholamine — dopaminergic, β-1, α-1 agonist"),
                KeyValueRow(key: "Onset (IV)", value: "Within 5 minutes"),
                KeyValueRow(key: "Half-life", value: "≈2 minutes"),
                KeyValueRow(key: "Pre-mixed bag", value: "400 mg / 250 mL or 800 mg / 500 mL D5W")
            ],
            indications: AttributedProse(
                "Correction of hemodynamic imbalances present in shock states due to myocardial infarction, trauma, endotoxic septicemia, open-heart surgery, renal failure, and chronic cardiac decompensation as in congestive failure.",
                citationIDs: ["openfda_dopamine_drip"]
            ),
            mechanism: AttributedProse(
                "Dose-dependent receptor activation: low doses (1–5 mcg/kg/min) activate dopaminergic receptors causing renal and mesenteric vasodilation; intermediate doses (5–10 mcg/kg/min) add beta-1 stimulation increasing heart rate and contractility; high doses (>10 mcg/kg/min) add alpha-1 stimulation causing vasoconstriction and increased systemic vascular resistance.",
                citationIDs: ["openfda_dopamine_drip"]
            ),
            dosing: [
                DosingBlock(label: "Reference dose range (per FDA SPL)", body: "Initiate at 2 to 5 mcg/kg/min IV; titrate per provider order to clinical response. Higher doses (up to 50 mcg/kg/min) may be required in severe shock — beyond standard ranges, alternative vasopressor strategies are typically considered.", citationIDs: ["openfda_dopamine_drip"]),
                DosingBlock(label: "Dilution", body: "Pre-mixed dextrose bags are commercially available; if compounding, dilute in compatible solution per facility protocol.", citationIDs: ["openfda_dopamine_drip"]),
                DosingBlock(label: "Discontinuation", body: "Taper rather than abruptly discontinue to avoid rebound hypotension.", citationIDs: ["openfda_dopamine_drip"])
            ],
            contraindications: AttributedProse(
                "Pheochromocytoma; uncorrected tachyarrhythmias or ventricular fibrillation.",
                citationIDs: ["openfda_dopamine_drip"]
            ),
            warnings: [
                AttributedBullet("Extravasation causes severe tissue necrosis — phentolamine is the antidote. Prefer central line; if peripheral access is the only option, use a large vein, monitor site closely, and have phentolamine immediately available.", citationIDs: ["openfda_dopamine_drip"]),
                AttributedBullet("Tachyarrhythmias — particularly at higher doses.", citationIDs: ["openfda_dopamine_drip"]),
                AttributedBullet("Increased myocardial oxygen demand — caution in active ischemia.", citationIDs: ["openfda_dopamine_drip"]),
                AttributedBullet("Correct hypovolemia before initiating — dopamine is not a substitute for volume resuscitation.", citationIDs: ["openfda_dopamine_drip"])
            ],
            adverseReactions: AttributedProse(
                "Tachycardia, ectopic beats, anginal pain, palpitations, hypotension, vasoconstriction, dyspnea, headache, nausea, vomiting, gangrene of the extremities at high doses or with extravasation.",
                citationIDs: ["openfda_dopamine_drip"]
            ),
            drugInteractions: [
                AttributedBullet("MAO inhibitors — substantially potentiate effect; reduce dose to 1/10 of usual.", citationIDs: ["openfda_dopamine_drip"]),
                AttributedBullet("Tricyclic antidepressants — potentiated effect.", citationIDs: ["openfda_dopamine_drip"]),
                AttributedBullet("Phenytoin IV — may cause hypotension and bradycardia when given to a patient on dopamine.", citationIDs: ["openfda_dopamine_drip"]),
                AttributedBullet("Halogenated anesthetics — risk of ventricular arrhythmias.", citationIDs: ["openfda_dopamine_drip"])
            ],
            nursingImplications: [
                AttributedBullet("Independent double-check before initiation and any rate change (ISMP high-alert).", citationIDs: ["ismp_high_alert_drips"]),
                AttributedBullet("Continuous cardiac monitoring; arterial line preferred for accurate BP titration at higher doses.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Central line preferred. If peripheral, monitor IV site every 15–30 minutes for blanching, coolness, or pain — extravasation is an emergency.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Phentolamine 5–10 mg in 10–15 mL saline injected SQ around extravasation site within 12 hours.", citationIDs: ["openfda_dopamine_drip"]),
                AttributedBullet("Trend MAP, HR, urine output, and mental status.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Use an infusion pump — never gravity drip.", citationIDs: ["openrn_pharm_drips"])
            ],
            patientTeaching: AttributedProse(
                "Tell the nurse if you have chest pain, headache, or any pain or change in temperature at the IV site.",
                citationIDs: ["openrn_pharm_drips"]
            ),
            citations: [openfda, openrnPharmDrips, ismpDrips],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Dobutamine drip

public enum DobutamineDripSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_dobutamine",
            shortName: "FDA SPL — Dobutamine in Dextrose",
            detail: "SET ID: 3418aa46-2d9a-39f3-e063-6294a90a2961",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "dobutamine-drip",
            title: "Dobutamine drip",
            subtitle: "Selective β-1 agonist · inotrope",
            category: "Inotrope",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Synthetic catecholamine — β-1 selective"),
                KeyValueRow(key: "Onset (IV)", value: "1–2 minutes"),
                KeyValueRow(key: "Half-life", value: "≈2 minutes"),
                KeyValueRow(key: "Pre-mixed bag", value: "250 or 500 mg / 250 mL D5W")
            ],
            indications: AttributedProse(
                "Inotropic support for short-term treatment of cardiac decompensation due to depressed contractility resulting from organic heart disease or cardiac surgical procedures.",
                citationIDs: ["openfda_dobutamine"]
            ),
            mechanism: AttributedProse(
                "Direct-acting beta-1 adrenergic receptor agonist that increases cardiac contractility and cardiac output with relatively little change in heart rate or systemic vascular resistance at typical doses.",
                citationIDs: ["openfda_dobutamine"]
            ),
            dosing: [
                DosingBlock(label: "Reference dose range (per FDA SPL)", body: "2.5 to 20 mcg/kg/min IV continuous infusion; titrate to clinical response. Doses up to 40 mcg/kg/min may be used in severe heart failure but are associated with increased adverse effects.", citationIDs: ["openfda_dobutamine"]),
                DosingBlock(label: "Concurrent medications", body: "Often combined with norepinephrine or dopamine when both vasoconstriction and inotropy are needed.", citationIDs: ["openfda_dobutamine"]),
                DosingBlock(label: "Discontinuation", body: "Taper to avoid rebound decompensation.", citationIDs: ["openfda_dobutamine"])
            ],
            contraindications: AttributedProse(
                "Idiopathic hypertrophic subaortic stenosis (IHSS) — outflow obstruction worsened by inotropes.",
                citationIDs: ["openfda_dobutamine"]
            ),
            warnings: [
                AttributedBullet("Increased heart rate and ectopic activity — may precipitate or exacerbate ventricular ectopy.", citationIDs: ["openfda_dobutamine"]),
                AttributedBullet("Increased myocardial oxygen demand — caution in active ischemia or recent MI.", citationIDs: ["openfda_dobutamine"]),
                AttributedBullet("Correct hypovolemia before initiation.", citationIDs: ["openfda_dobutamine"]),
                AttributedBullet("Modest hypotension can occur, particularly in volume-depleted patients.", citationIDs: ["openfda_dobutamine"])
            ],
            adverseReactions: AttributedProse(
                "Increased heart rate, increased blood pressure (or hypotension), ectopic beats, palpitations, anginal pain, dyspnea, headache, nausea, phlebitis at infusion site.",
                citationIDs: ["openfda_dobutamine"]
            ),
            drugInteractions: [
                AttributedBullet("Beta-blockers — antagonize dobutamine effect.", citationIDs: ["openfda_dobutamine"]),
                AttributedBullet("Halogenated anesthetics — risk of ventricular arrhythmias.", citationIDs: ["openfda_dobutamine"]),
                AttributedBullet("Concomitant nitroprusside — may produce greater cardiac output increase than either alone.", citationIDs: ["openfda_dobutamine"])
            ],
            nursingImplications: [
                AttributedBullet("Independent double-check before initiation and any rate change (ISMP high-alert).", citationIDs: ["ismp_high_alert_drips"]),
                AttributedBullet("Continuous cardiac monitoring; arterial line preferred.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Trend MAP, HR, cardiac output (if available), urine output, and signs of perfusion.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Less risk of severe extravasation injury than dopamine, but still use a large vein and monitor site.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Use an infusion pump — never gravity drip.", citationIDs: ["openrn_pharm_drips"])
            ],
            patientTeaching: AttributedProse(
                "Tell the nurse if you have chest pain, palpitations, or feel your heart beating differently.",
                citationIDs: ["openrn_pharm_drips"]
            ),
            citations: [openfda, openrnPharmDrips, ismpDrips],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Nitroglycerin drip

public enum NitroglycerinDripSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_nitroglycerin_drip",
            shortName: "FDA SPL — Nitroglycerin in Dextrose Injection",
            detail: "SET ID: 3f2c9570-a544-1982-e063-6294a90a3067",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "nitroglycerin-drip",
            title: "Nitroglycerin drip",
            subtitle: "Vasodilator — venous > arterial",
            category: "Vasodilator",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Organic nitrate — vasodilator"),
                KeyValueRow(key: "Onset (IV)", value: "Within 1 minute"),
                KeyValueRow(key: "Half-life", value: "1–4 minutes"),
                KeyValueRow(key: "Pre-mixed bag", value: "25, 50, 100 mg / 250 mL D5W (PVC-free tubing required)")
            ],
            indications: AttributedProse(
                "Treatment of perioperative hypertension; control of congestive heart failure in the setting of acute myocardial infarction; treatment of angina pectoris in patients who have not responded to sublingual nitroglycerin and beta-blockers; induction of intraoperative hypotension.",
                citationIDs: ["openfda_nitroglycerin_drip"]
            ),
            mechanism: AttributedProse(
                "Releases nitric oxide, activating guanylate cyclase, increasing intracellular cGMP, and producing smooth muscle relaxation. Predominantly venous vasodilation at low doses (decreasing preload); arterial dilation at higher doses (decreasing afterload). Coronary vasodilation also occurs.",
                citationIDs: ["openfda_nitroglycerin_drip"]
            ),
            dosing: [
                DosingBlock(label: "Reference dose range (per FDA SPL)", body: "Initiate at 5 mcg/min; titrate by 5 mcg/min every 3–5 minutes to clinical response. If no response at 20 mcg/min, increase by 10 mcg/min every 3–5 minutes; doses up to 200 mcg/min may be required.", citationIDs: ["openfda_nitroglycerin_drip"]),
                DosingBlock(label: "Tubing requirement", body: "Use non-PVC (polyethylene) tubing — PVC absorbs nitroglycerin, reducing delivered dose by up to 80%.", citationIDs: ["openfda_nitroglycerin_drip"]),
                DosingBlock(label: "Tolerance", body: "Tolerance develops with continuous infusion; may require higher doses or a nitrate-free interval.", citationIDs: ["openfda_nitroglycerin_drip"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity; severe anemia; closed-angle glaucoma; head trauma or cerebral hemorrhage (cerebral vasodilation increases ICP); concurrent PDE-5 inhibitors (sildenafil, tadalafil, vardenafil) within 24–48 hours — life-threatening hypotension; soluble guanylate cyclase stimulators (riociguat).",
                citationIDs: ["openfda_nitroglycerin_drip"]
            ),
            warnings: [
                AttributedBullet("Severe hypotension — particularly in patients with right ventricular infarction or volume depletion.", citationIDs: ["openfda_nitroglycerin_drip"]),
                AttributedBullet("Reflex tachycardia — may worsen ischemia in some patients.", citationIDs: ["openfda_nitroglycerin_drip"]),
                AttributedBullet("Methemoglobinemia at high doses or with prolonged use — cyanosis unresponsive to oxygen.", citationIDs: ["openfda_nitroglycerin_drip"]),
                AttributedBullet("Headache is common, often dose-limiting; usually responds to acetaminophen.", citationIDs: ["openfda_nitroglycerin_drip"])
            ],
            adverseReactions: AttributedProse(
                "Headache (very common), hypotension, dizziness, tachycardia, flushing, nausea, vomiting, methemoglobinemia (rare), tolerance with continuous use.",
                citationIDs: ["openfda_nitroglycerin_drip"]
            ),
            drugInteractions: [
                AttributedBullet("PDE-5 inhibitors (sildenafil, tadalafil, vardenafil) — life-threatening hypotension; absolute contraindication.", citationIDs: ["openfda_nitroglycerin_drip"]),
                AttributedBullet("Other antihypertensives — additive hypotension.", citationIDs: ["openfda_nitroglycerin_drip"]),
                AttributedBullet("Heparin — nitroglycerin may decrease heparin's anticoagulant effect; monitor PTT.", citationIDs: ["openfda_nitroglycerin_drip"])
            ],
            nursingImplications: [
                AttributedBullet("Independent double-check before initiation and any rate change (ISMP high-alert).", citationIDs: ["ismp_high_alert_drips"]),
                AttributedBullet("Continuous cardiac monitoring; arterial line preferred for higher doses.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("USE NON-PVC TUBING — premixed nitroglycerin bags from manufacturer come with appropriate tubing; do not substitute.", citationIDs: ["openfda_nitroglycerin_drip"]),
                AttributedBullet("Trend BP every 5–15 minutes during titration; assess pain (chest pain) before and after titration.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Headache is expected; offer acetaminophen and reassurance — do not stop the drip for headache alone.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Screen for PDE-5 inhibitor use BEFORE initiation — many patients on sildenafil for PAH, not just for ED.", citationIDs: ["openfda_nitroglycerin_drip"]),
                AttributedBullet("Use an infusion pump — never gravity drip.", citationIDs: ["openrn_pharm_drips"])
            ],
            patientTeaching: AttributedProse(
                "You will likely have a headache during this medication — that is expected and usually means the medication is working. Tell the nurse about chest pain, severe lightheadedness, or any erection-aiding medication you have taken.",
                citationIDs: ["openrn_pharm_drips"]
            ),
            citations: [openfda, openrnPharmDrips, ismpDrips],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Nicardipine drip

public enum NicardipineDripSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_nicardipine",
            shortName: "FDA SPL — Nicardipine Hydrochloride Injection",
            detail: "SET ID: 0eb7d839-63d9-4b51-bf7b-4a8fde6339b5",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "nicardipine-drip",
            title: "Nicardipine drip",
            subtitle: "Cardene IV — dihydropyridine calcium channel blocker",
            category: "Antihypertensive",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Dihydropyridine calcium channel blocker"),
                KeyValueRow(key: "Onset (IV)", value: "5–15 minutes"),
                KeyValueRow(key: "Half-life", value: "≈2 hours (terminal)"),
                KeyValueRow(key: "Pre-mixed bag", value: "20 or 40 mg / 200 mL")
            ],
            indications: AttributedProse(
                "Short-term treatment of hypertension when oral therapy is not feasible or desirable; for prompt initiation of antihypertensive action with continued titration.",
                citationIDs: ["openfda_nicardipine"]
            ),
            mechanism: AttributedProse(
                "Calcium channel blocker selective for vascular smooth muscle, producing peripheral arterial vasodilation with little effect on cardiac contractility or AV nodal conduction. Reduces systemic vascular resistance and blood pressure.",
                citationIDs: ["openfda_nicardipine"]
            ),
            dosing: [
                DosingBlock(label: "Reference dose range (per FDA SPL)", body: "Initiate at 5 mg/hr IV; titrate by 2.5 mg/hr every 5–15 minutes (rapid titration) or every 15 minutes (gradual titration). Maximum 15 mg/hr.", citationIDs: ["openfda_nicardipine"]),
                DosingBlock(label: "Conversion to oral", body: "When transitioning to oral nicardipine, give the first oral dose 1 hour BEFORE discontinuing the infusion to maintain BP control.", citationIDs: ["openfda_nicardipine"]),
                DosingBlock(label: "Site rotation", body: "Phlebitis is common — rotate peripheral IV site every 12 hours per package labeling, OR use central line.", citationIDs: ["openfda_nicardipine"])
            ],
            contraindications: AttributedProse(
                "Advanced aortic stenosis — vasodilation reduces afterload-dependent coronary perfusion.",
                citationIDs: ["openfda_nicardipine"]
            ),
            warnings: [
                AttributedBullet("Hypotension — particularly in volume-depleted patients.", citationIDs: ["openfda_nicardipine"]),
                AttributedBullet("Reflex tachycardia.", citationIDs: ["openfda_nicardipine"]),
                AttributedBullet("Phlebitis — peripheral site infusion is associated with frequent infusion-site irritation.", citationIDs: ["openfda_nicardipine"]),
                AttributedBullet("Caution in heart failure — though effects on contractility are minimal, significant afterload reduction may not be tolerated in all patients.", citationIDs: ["openfda_nicardipine"]),
                AttributedBullet("Hepatic and renal impairment — start at lower doses and titrate carefully.", citationIDs: ["openfda_nicardipine"])
            ],
            adverseReactions: AttributedProse(
                "Headache, hypotension, tachycardia, nausea, vomiting, flushing, peripheral edema, phlebitis at infusion site.",
                citationIDs: ["openfda_nicardipine"]
            ),
            drugInteractions: [
                AttributedBullet("CYP3A4 inhibitors (cimetidine) increase nicardipine levels.", citationIDs: ["openfda_nicardipine"]),
                AttributedBullet("Cyclosporine — nicardipine increases cyclosporine levels; monitor.", citationIDs: ["openfda_nicardipine"]),
                AttributedBullet("Other antihypertensives — additive effect.", citationIDs: ["openfda_nicardipine"]),
                AttributedBullet("Beta-blockers — additive negative inotropy and bradycardia possible.", citationIDs: ["openfda_nicardipine"])
            ],
            nursingImplications: [
                AttributedBullet("Independent double-check before initiation and any rate change (ISMP high-alert).", citationIDs: ["ismp_high_alert_drips"]),
                AttributedBullet("Continuous cardiac monitoring; arterial line preferred for accurate BP titration.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Rotate peripheral IV site every 12 hours OR use central line.", citationIDs: ["openfda_nicardipine"]),
                AttributedBullet("Trend BP every 5–15 minutes during titration; goal MAP per provider order.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Bridge to oral therapy: give oral dose 1 hour before discontinuing infusion.", citationIDs: ["openfda_nicardipine"]),
                AttributedBullet("Use an infusion pump — never gravity drip.", citationIDs: ["openrn_pharm_drips"])
            ],
            patientTeaching: AttributedProse(
                "Tell the nurse if you feel lightheaded, your heart races, or you have pain at the IV site.",
                citationIDs: ["openrn_pharm_drips"]
            ),
            citations: [openfda, openrnPharmDrips, ismpDrips],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Labetalol drip

public enum LabetalolDripSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_labetalol",
            shortName: "FDA SPL — Labetalol Hydrochloride Injection",
            detail: "SET ID: 1b96ddc9-d0c3-488a-a113-66491fd3d899",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "labetalol-drip",
            title: "Labetalol drip",
            subtitle: "Combined α/β-blocker · safe in pregnancy",
            category: "Antihypertensive",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Combined α-1 / non-selective β-blocker"),
                KeyValueRow(key: "Onset (IV)", value: "2–5 minutes"),
                KeyValueRow(key: "Half-life", value: "≈5.5 hours"),
                KeyValueRow(key: "Pregnancy", value: "Preferred IV antihypertensive in obstetrics")
            ],
            indications: AttributedProse(
                "Control of severe hypertension. The IV form is used when prompt and effective blood pressure reduction is required, including in hypertensive emergencies and severe pregnancy-related hypertension.",
                citationIDs: ["openfda_labetalol"]
            ),
            mechanism: AttributedProse(
                "Selective alpha-1 adrenergic blockade combined with non-selective beta-adrenergic blockade. The ratio of alpha to beta blockade is approximately 1:7 with IV administration. Reduces blood pressure without reflex tachycardia.",
                citationIDs: ["openfda_labetalol"]
            ),
            dosing: [
                DosingBlock(label: "Reference dose — bolus", body: "20 mg slow IV push over 2 minutes; may repeat 40 mg in 10 minutes, then 80 mg every 10 minutes (max cumulative 300 mg).", citationIDs: ["openfda_labetalol"]),
                DosingBlock(label: "Reference dose — continuous infusion", body: "0.5 to 2 mg/min continuous infusion; titrate to clinical response.", citationIDs: ["openfda_labetalol"]),
                DosingBlock(label: "Position", body: "Patient must remain supine during and for several hours after IV administration due to orthostatic hypotension.", citationIDs: ["openfda_labetalol"])
            ],
            contraindications: AttributedProse(
                "Bronchial asthma; overt cardiac failure; greater than first-degree heart block; cardiogenic shock; severe bradycardia; conditions associated with severe and prolonged hypotension.",
                citationIDs: ["openfda_labetalol"]
            ),
            warnings: [
                AttributedBullet("Bronchospasm — though more selective than non-selective beta-blockers, still relative contraindication in asthma.", citationIDs: ["openfda_labetalol"]),
                AttributedBullet("Heart failure — may precipitate or worsen heart failure.", citationIDs: ["openfda_labetalol"]),
                AttributedBullet("Severe bradycardia or heart block.", citationIDs: ["openfda_labetalol"]),
                AttributedBullet("Orthostatic hypotension — keep patient supine for 3 hours after IV administration.", citationIDs: ["openfda_labetalol"]),
                AttributedBullet("May mask hypoglycemic symptoms and prolong hypoglycemia in diabetics.", citationIDs: ["openfda_labetalol"]),
                AttributedBullet("Withdrawal phenomenon (rebound HTN, angina, MI) — taper to discontinue.", citationIDs: ["openfda_labetalol"])
            ],
            adverseReactions: AttributedProse(
                "Hypotension (especially orthostatic), bradycardia, dizziness, fatigue, nausea, vomiting, scalp tingling (transient), bronchospasm, heart block, heart failure exacerbation.",
                citationIDs: ["openfda_labetalol"]
            ),
            drugInteractions: [
                AttributedBullet("Calcium channel blockers (especially verapamil, diltiazem) — additive bradycardia, AV block, hypotension.", citationIDs: ["openfda_labetalol"]),
                AttributedBullet("Other antihypertensives — additive effect.", citationIDs: ["openfda_labetalol"]),
                AttributedBullet("Halogenated anesthetics — synergistic myocardial depression.", citationIDs: ["openfda_labetalol"]),
                AttributedBullet("Tricyclic antidepressants — increased risk of tremor.", citationIDs: ["openfda_labetalol"])
            ],
            nursingImplications: [
                AttributedBullet("Continuous cardiac monitoring; arterial line preferred for infusion titration.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Patient must remain supine during and for at least 3 hours after IV administration — fall risk from orthostatic hypotension.", citationIDs: ["openfda_labetalol"]),
                AttributedBullet("Trend BP every 5 minutes during initial dosing/titration.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Assess for bronchospasm (wheezing, dyspnea), bradycardia, signs of heart failure.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("In pregnancy: continuous fetal monitoring; this is the preferred IV antihypertensive for severe pregnancy hypertension.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Use an infusion pump for continuous infusion.", citationIDs: ["openrn_pharm_drips"])
            ],
            patientTeaching: AttributedProse(
                "Stay flat on your back during this medication and for several hours after — your blood pressure can drop suddenly when you sit up. Tell the nurse if you have wheezing, chest pain, or feel your heart slowing down.",
                citationIDs: ["openrn_pharm_drips"]
            ),
            citations: [openfda, openrnPharmDrips],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Nitroprusside drip

public enum NitroprussideDripSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_nitroprusside",
            shortName: "FDA SPL — Sodium Nitroprusside Injection",
            detail: "SET ID: 01841345-bed3-458f-8e99-911fbd286512",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "nitroprusside-drip",
            title: "Nitroprusside drip",
            subtitle: "Sodium nitroprusside · arterial + venous vasodilator",
            category: "Antihypertensive",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Direct vasodilator (releases NO)"),
                KeyValueRow(key: "Onset (IV)", value: "Within seconds"),
                KeyValueRow(key: "Half-life", value: "<10 minutes"),
                KeyValueRow(key: "Reconstitution", value: "50 mg in 250 mL D5W; protect from light")
            ],
            indications: AttributedProse(
                "Immediate reduction of blood pressure in hypertensive crisis; production of controlled hypotension during anesthesia to reduce surgical bleeding; treatment of acute heart failure.",
                citationIDs: ["openfda_nitroprusside"]
            ),
            mechanism: AttributedProse(
                "Releases nitric oxide, producing direct dilation of both arterial and venous smooth muscle. Decreases preload (venous dilation) and afterload (arterial dilation). Onset is within seconds; effect dissipates within minutes of stopping the infusion.",
                citationIDs: ["openfda_nitroprusside"]
            ),
            dosing: [
                DosingBlock(label: "Reference dose range (per FDA SPL)", body: "Initiate at 0.3 mcg/kg/min; titrate every few minutes. Average effective dose 3 mcg/kg/min. Maximum 10 mcg/kg/min for short periods only.", citationIDs: ["openfda_nitroprusside"]),
                DosingBlock(label: "Light protection", body: "Protect bag and tubing from light — wrap in opaque material; nitroprusside is light-sensitive.", citationIDs: ["openfda_nitroprusside"]),
                DosingBlock(label: "Discoloration", body: "Solution should be faint brownish; bright orange, dark blue, or green indicates degradation — discard.", citationIDs: ["openfda_nitroprusside"])
            ],
            contraindications: AttributedProse(
                "Compensatory hypertension (e.g., AV shunt or coarctation); high-output heart failure; congenital optic atrophy; tobacco amblyopia; treatment of acute heart failure associated with reduced peripheral vascular resistance.",
                citationIDs: ["openfda_nitroprusside"]
            ),
            warnings: [
                AttributedBullet("BOXED WARNING: Excessive hypotension; cyanide toxicity at high doses or in renal impairment; methemoglobinemia.", citationIDs: ["openfda_nitroprusside"]),
                AttributedBullet("Cyanide toxicity — risk increases with rates above 2 mcg/kg/min for prolonged periods, in hepatic or renal impairment. Symptoms: tachyphylaxis, lactic acidosis, mental status changes.", citationIDs: ["openfda_nitroprusside"]),
                AttributedBullet("Hydroxocobalamin or sodium thiosulfate is the cyanide antidote.", citationIDs: ["openfda_nitroprusside"]),
                AttributedBullet("Increased intracranial pressure — caution in patients with elevated ICP.", citationIDs: ["openfda_nitroprusside"]),
                AttributedBullet("Coronary steal — may worsen myocardial ischemia in some patients with CAD.", citationIDs: ["openfda_nitroprusside"])
            ],
            adverseReactions: AttributedProse(
                "Profound hypotension (most common), tachycardia, sweating, nausea, abdominal pain, headache, restlessness. Serious: cyanide toxicity (lactic acidosis, altered mental status), methemoglobinemia, increased ICP.",
                citationIDs: ["openfda_nitroprusside"]
            ),
            drugInteractions: [
                AttributedBullet("Other antihypertensives — additive hypotension.", citationIDs: ["openfda_nitroprusside"]),
                AttributedBullet("PDE-5 inhibitors — additive severe hypotension.", citationIDs: ["openfda_nitroprusside"])
            ],
            nursingImplications: [
                AttributedBullet("Independent double-check before initiation and any rate change (ISMP high-alert).", citationIDs: ["ismp_high_alert_drips"]),
                AttributedBullet("Arterial line MANDATORY for accurate, continuous BP monitoring.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Wrap bag and tubing with opaque material — light-sensitive degradation.", citationIDs: ["openfda_nitroprusside"]),
                AttributedBullet("Monitor for cyanide toxicity — especially with infusion >2 mcg/kg/min beyond 24 hours, in renal impairment. Trend lactate, mental status, mixed venous saturation.", citationIDs: ["openfda_nitroprusside"]),
                AttributedBullet("Hydroxocobalamin available for cyanide antidote per facility protocol.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Use only an infusion pump — never gravity drip.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Discontinue immediately if BP drops below goal; effect dissipates within minutes.", citationIDs: ["openrn_pharm_drips"])
            ],
            patientTeaching: AttributedProse(
                "Tell the nurse if you have a headache, feel confused, your vision changes, or you have pain in your stomach.",
                citationIDs: ["openrn_pharm_drips"]
            ),
            citations: [openfda, openrnPharmDrips, ismpDrips],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Amiodarone drip

public enum AmiodaroneDripSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_amiodarone_drip",
            shortName: "FDA SPL — Amiodarone Hydrochloride Injection",
            detail: "SET ID: 0a28ae25-7cc4-4ac0-a2ba-7820fb93e25c",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "amiodarone-drip",
            title: "Amiodarone drip",
            subtitle: "Class III antiarrhythmic — IV continuous infusion",
            category: "Antiarrhythmic",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Class III antiarrhythmic (multiple actions)"),
                KeyValueRow(key: "Onset (IV)", value: "Minutes (rate control); hours (rhythm control)"),
                KeyValueRow(key: "Half-life", value: "Days to weeks (very long)"),
                KeyValueRow(key: "Pre-mixed bag", value: "150 mg / 100 mL or 450 mg / 250 mL D5W")
            ],
            indications: AttributedProse(
                "Initiation of treatment and prophylaxis of frequently recurring ventricular fibrillation and hemodynamically unstable ventricular tachycardia in patients refractory to other therapy. Adjunct in management of atrial arrhythmias.",
                citationIDs: ["openfda_amiodarone_drip"]
            ),
            mechanism: AttributedProse(
                "Multiple electrophysiologic effects: prolongs action potential duration (Class III), but also exhibits Class I (Na channel block), Class II (beta-blockade), and Class IV (Ca channel block) properties. Slows AV nodal conduction, decreases sinus node automaticity, prolongs QT interval.",
                citationIDs: ["openfda_amiodarone_drip"]
            ),
            dosing: [
                DosingBlock(label: "Reference loading dose (per FDA SPL)", body: "150 mg IV over 10 minutes (15 mg/min), followed by 360 mg IV over the next 6 hours (1 mg/min), then 540 mg IV over the remaining 18 hours (0.5 mg/min). Total first-day dose typically 1050 mg.", citationIDs: ["openfda_amiodarone_drip"]),
                DosingBlock(label: "Maintenance", body: "0.5 mg/min continuous IV infusion (720 mg/24 hr) until oral therapy can be substituted.", citationIDs: ["openfda_amiodarone_drip"]),
                DosingBlock(label: "Cardiac arrest (per ACLS protocol)", body: "300 mg IV/IO push for VF/pulseless VT; may repeat 150 mg once.", citationIDs: ["openfda_amiodarone_drip"]),
                DosingBlock(label: "Tubing", body: "Use non-PVC tubing for infusions longer than 2 hours; PVC tubing leaches DEHP plasticizer.", citationIDs: ["openfda_amiodarone_drip"]),
                DosingBlock(label: "Central line preferred", body: "Concentrations >2 mg/mL should be administered via central line to avoid phlebitis.", citationIDs: ["openfda_amiodarone_drip"])
            ],
            contraindications: AttributedProse(
                "Cardiogenic shock; marked sinus bradycardia; second- or third-degree AV block (without pacemaker); known hypersensitivity, including iodine; severe sinoatrial node dysfunction.",
                citationIDs: ["openfda_amiodarone_drip"]
            ),
            warnings: [
                AttributedBullet("BOXED WARNING: Pulmonary toxicity, hepatotoxicity, pro-arrhythmic effects (torsades, exacerbation of arrhythmia).", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Hypotension during loading — slow the infusion rate; provide fluids and vasopressors as needed.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Bradycardia and AV block.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("QT prolongation and torsades de pointes — particularly with hypokalemia, hypomagnesemia, other QT-prolonging drugs.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Pulmonary toxicity, including ARDS — monitor for new dyspnea, cough, pulmonary infiltrates.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Hepatotoxicity — monitor LFTs.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Thyroid dysfunction — both hypo- and hyperthyroidism; iodine content interferes with thyroid hormone production.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Photosensitivity and corneal microdeposits with chronic use.", citationIDs: ["openfda_amiodarone_drip"])
            ],
            adverseReactions: AttributedProse(
                "Hypotension (most common during loading), bradycardia, AV block, fever, nausea, vomiting, hepatic enzyme elevation, pulmonary toxicity, thyroid dysfunction. With chronic use: corneal deposits, photosensitivity, blue-gray skin discoloration.",
                citationIDs: ["openfda_amiodarone_drip"]
            ),
            drugInteractions: [
                AttributedBullet("Warfarin — amiodarone potentiates warfarin effect; reduce warfarin dose by 30–50% and monitor INR.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Digoxin — increases digoxin levels; reduce digoxin dose by 50% and monitor.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Other QT-prolonging drugs — additive risk of torsades.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Beta-blockers and calcium channel blockers — additive bradycardia, AV block, hypotension.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("CYP3A4 substrates (statins, cyclosporine) — amiodarone increases their levels.", citationIDs: ["openfda_amiodarone_drip"])
            ],
            nursingImplications: [
                AttributedBullet("Independent double-check before initiation and any rate change (ISMP high-alert).", citationIDs: ["ismp_high_alert_drips"]),
                AttributedBullet("Continuous cardiac monitoring; trend QTc — hold for QTc >500 ms.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Central line preferred for concentrations >2 mg/mL; if peripheral, large vein, monitor for phlebitis.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Use non-PVC tubing for infusions >2 hours.", citationIDs: ["openfda_amiodarone_drip"]),
                AttributedBullet("Maintain potassium ≥4 and magnesium ≥2 to reduce torsades risk.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Trend BP, HR, LFTs, TFTs, chest x-ray as ordered.", citationIDs: ["openrn_pharm_drips"]),
                AttributedBullet("Use only an infusion pump.", citationIDs: ["openrn_pharm_drips"])
            ],
            patientTeaching: AttributedProse(
                "Tell the nurse if you have new shortness of breath, cough, chest pain, lightheadedness, or any unusual changes. This medication can affect many parts of your body and you will need ongoing monitoring.",
                citationIDs: ["openrn_pharm_drips"]
            ),
            citations: [openfda, openrnPharmDrips, ismpDrips],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}
