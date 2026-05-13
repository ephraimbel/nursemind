import Foundation

// Curator-model drug entries — second openFDA batch.
// Source: openFDA Drug Label API (CC0) — set IDs verified live 2026-05-04.
// Nursing implications drawn from Open RN Nursing Pharmacology (CC BY 4.0).

private let openrnPharm2 = CitationSource(
    id: "openrn_pharmacology_book_2",
    shortName: "Open RN Nursing Pharmacology, 2nd ed.",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=respiratory+gi+psychiatric",
    lastRetrieved: "2026-05-04"
)

private let ismp2 = CitationSource(
    id: "ismp_high_alert_2024_v3",
    shortName: "ISMP List of High-Alert Medications in Acute Care",
    detail: "Concept citation only",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Hydralazine

public enum HydralazineSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_hydralazine",
            shortName: "FDA SPL — Hydralazine Hydrochloride Injection",
            detail: "SET ID: 15b0f03b-b5a2-c49d-e063-6394a90a5b15",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "hydralazine",
            title: "Hydralazine",
            subtitle: "Direct arterial vasodilator",
            category: "Antihypertensive",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Direct-acting peripheral vasodilator (arterial)"),
                KeyValueRow(key: "Onset (IV)", value: "5–20 minutes"),
                KeyValueRow(key: "Half-life", value: "≈3–7 hours"),
                KeyValueRow(key: "Common forms", value: "20 mg/mL ampule (IV); 10, 25, 50, 100 mg tablets (PO)")
            ],
            indications: AttributedProse(
                "Treatment of essential hypertension; severe hypertension when oral therapy is not feasible. Also used in pregnancy-related severe hypertension and as an adjunct in heart failure (often combined with isosorbide dinitrate).",
                citationIDs: ["openfda_hydralazine"]
            ),
            mechanism: AttributedProse(
                "Direct relaxation of arterial smooth muscle, producing peripheral vasodilation and reduced systemic vascular resistance. Has minimal effect on venous capacitance vessels. Reflex sympathetic activation produces tachycardia and increased cardiac output.",
                citationIDs: ["openfda_hydralazine"]
            ),
            dosing: [
                DosingBlock(label: "Severe hypertension (adult)", body: "10 to 20 mg IV slow push every 4–6 hours as needed; titrate based on response.", citationIDs: ["openfda_hydralazine"]),
                DosingBlock(label: "Pregnancy-related severe hypertension", body: "5 to 10 mg IV every 20–30 minutes per protocol; titrate to BP goal.", citationIDs: ["openfda_hydralazine"]),
                DosingBlock(label: "Oral", body: "10 mg PO four times daily, titrated based on response (max typically 300 mg/day).", citationIDs: ["openfda_hydralazine"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity to hydralazine; coronary artery disease (reflex tachycardia worsens ischemia); mitral valvular rheumatic heart disease.",
                citationIDs: ["openfda_hydralazine"]
            ),
            warnings: [
                AttributedBullet("Reflex tachycardia and increased myocardial oxygen demand — may precipitate angina or MI in CAD patients.", citationIDs: ["openfda_hydralazine"]),
                AttributedBullet("Drug-induced lupus syndrome with chronic high-dose use — fever, joint pain, rash; reversible on discontinuation.", citationIDs: ["openfda_hydralazine"]),
                AttributedBullet("Hypotension and headache common.", citationIDs: ["openfda_hydralazine"]),
                AttributedBullet("Sodium and water retention — may require concurrent diuretic.", citationIDs: ["openfda_hydralazine"])
            ],
            adverseReactions: AttributedProse(
                "Headache (very common), tachycardia, palpitations, hypotension, flushing, nausea, vomiting, peripheral edema. Less common: drug-induced lupus, peripheral neuropathy.",
                citationIDs: ["openfda_hydralazine"]
            ),
            drugInteractions: [
                AttributedBullet("Other antihypertensives — additive hypotension.", citationIDs: ["openfda_hydralazine"]),
                AttributedBullet("MAO inhibitors — potentiated hypotension.", citationIDs: ["openfda_hydralazine"]),
                AttributedBullet("NSAIDs — reduce antihypertensive effect.", citationIDs: ["openfda_hydralazine"])
            ],
            nursingImplications: [
                AttributedBullet("Continuous BP and HR monitoring after IV doses; check BP at 5, 10, 15, 30 minutes after.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Be alert for reflex tachycardia in patients with CAD — assess for chest pain, ECG changes.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Often combined with a beta-blocker (to blunt reflex tachycardia) and a diuretic (to prevent fluid retention).", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Position changes slowly to prevent orthostatic hypotension.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Monitor for drug-induced lupus signs with chronic use — joint pain, rash, fever; ANA can be checked.", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "Headache is common with this medication, especially when starting. Stand up slowly to avoid lightheadedness. Tell your provider if you have chest pain, joint pain, rash, or unusual fatigue.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Mannitol

public enum MannitolSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_mannitol",
            shortName: "FDA SPL — Mannitol (Osmitrol) Injection",
            detail: "SET ID: 0d914965-7001-45cb-ba51-d7c5964b05bc",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "mannitol",
            title: "Mannitol",
            subtitle: "Osmotic diuretic",
            category: "Osmotic diuretic",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Osmotic diuretic"),
                KeyValueRow(key: "Onset (IV)", value: "Diuresis 1–3 hours; reduction in ICP within 15 minutes"),
                KeyValueRow(key: "Half-life", value: "≈100 minutes"),
                KeyValueRow(key: "Common forms", value: "20% or 25% solution; in-line filter required")
            ],
            indications: AttributedProse(
                "Reduction of intracranial pressure and treatment of cerebral edema; reduction of intraocular pressure; promotion of diuresis in acute oliguric renal failure (oliguric phase) before established renal failure; promotion of urinary excretion of toxic substances.",
                citationIDs: ["openfda_mannitol"]
            ),
            mechanism: AttributedProse(
                "Osmotically active in the bloodstream — pulls fluid from interstitial and intracellular compartments into the vascular space. In the kidney, mannitol is filtered but not reabsorbed; this increases the osmolality of the renal tubular fluid, causing osmotic diuresis. Reduces ICP by drawing water out of brain tissue.",
                citationIDs: ["openfda_mannitol"]
            ),
            dosing: [
                DosingBlock(label: "Cerebral edema / increased ICP (adult)", body: "0.25 to 1 g/kg IV bolus over 5–15 minutes; may repeat every 4–6 hours per provider order.", citationIDs: ["openfda_mannitol"]),
                DosingBlock(label: "Oliguric AKI prevention or treatment", body: "12.5 to 25 g IV trial dose; if urine output increases to 30–50 mL/hr, may continue.", citationIDs: ["openfda_mannitol"]),
                DosingBlock(label: "Filtration", body: "Use an in-line filter (typically 5 micron) — mannitol can crystallize.", citationIDs: ["openfda_mannitol"])
            ],
            contraindications: AttributedProse(
                "Anuria; severe pulmonary edema; severe dehydration; active intracranial bleeding (except during craniotomy); progressive renal damage despite mannitol use.",
                citationIDs: ["openfda_mannitol"]
            ),
            warnings: [
                AttributedBullet("Crystallizes at low temperatures — warm the solution and use in-line filter; inspect for crystals before infusion.", citationIDs: ["openfda_mannitol"]),
                AttributedBullet("Volume overload and pulmonary edema — particularly in patients with heart failure.", citationIDs: ["openfda_mannitol"]),
                AttributedBullet("Electrolyte derangements — hypokalemia, hypernatremia (early), hyponatremia (later as water shifts), hypocalcemia.", citationIDs: ["openfda_mannitol"]),
                AttributedBullet("Rebound increased ICP if mannitol crosses a disrupted blood-brain barrier.", citationIDs: ["openfda_mannitol"]),
                AttributedBullet("Renal impairment — dose-related risk of acute kidney injury at high cumulative doses.", citationIDs: ["openfda_mannitol"])
            ],
            adverseReactions: AttributedProse(
                "Headache, nausea, vomiting, dizziness, polyuria, electrolyte disturbances, volume overload, pulmonary edema, AKI at high cumulative doses.",
                citationIDs: ["openfda_mannitol"]
            ),
            drugInteractions: [
                AttributedBullet("Other diuretics — additive electrolyte and volume effects.", citationIDs: ["openfda_mannitol"]),
                AttributedBullet("Nephrotoxic agents (aminoglycosides, contrast) — additive renal risk.", citationIDs: ["openfda_mannitol"]),
                AttributedBullet("Lithium — increased renal lithium excretion.", citationIDs: ["openfda_mannitol"])
            ],
            nursingImplications: [
                AttributedBullet("Use an in-line filter; inspect bag for crystals before and during infusion.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Strict hourly intake and output; trend serum osmolality, electrolytes, renal function.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Continuous neuro checks for ICP indication — pupil response, GCS, motor function.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Insert urinary catheter for accurate output measurement during treatment.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Keep serum osmolality below 320 mOsm/kg to minimize AKI risk.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Monitor for pulmonary edema — lung sounds, work of breathing, SpO2.", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "You will urinate a large volume after this medication; the team will monitor closely. Tell the nurse if you feel short of breath, lightheaded, or develop a severe headache.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Famotidine

public enum FamotidineSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_famotidine",
            shortName: "FDA SPL — Famotidine Injection",
            detail: "SET ID: 1fdf16e5-145d-4c19-a318-fc6c10794b50",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "famotidine",
            title: "Famotidine",
            subtitle: "Pepcid · H2 receptor antagonist",
            category: "H2 blocker",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Histamine-2 receptor antagonist"),
                KeyValueRow(key: "Onset (IV)", value: "Within 1 hour"),
                KeyValueRow(key: "Half-life", value: "≈3 hours"),
                KeyValueRow(key: "Common forms", value: "10 mg/mL (IV); 10, 20, 40 mg tablets (PO)")
            ],
            indications: AttributedProse(
                "Treatment of duodenal ulcer and gastric ulcer; gastroesophageal reflux disease; pathologic hypersecretory conditions (Zollinger-Ellison); stress-ulcer prophylaxis in critically ill patients.",
                citationIDs: ["openfda_famotidine"]
            ),
            mechanism: AttributedProse(
                "Reversibly blocks histamine H2 receptors on gastric parietal cells, reducing gastric acid secretion (basal and stimulated). Less potent acid suppression than PPIs but rapid onset.",
                citationIDs: ["openfda_famotidine"]
            ),
            dosing: [
                DosingBlock(label: "Adult IV", body: "20 mg IV every 12 hours.", citationIDs: ["openfda_famotidine"]),
                DosingBlock(label: "Adult PO", body: "20 to 40 mg PO once daily at bedtime, or 20 mg PO twice daily.", citationIDs: ["openfda_famotidine"]),
                DosingBlock(label: "Renal dose adjustment", body: "Dose reduction required for CrCl <50 mL/min — typically 50% reduction.", citationIDs: ["openfda_famotidine"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity to famotidine or other H2 blockers.",
                citationIDs: ["openfda_famotidine"]
            ),
            warnings: [
                AttributedBullet("Renal impairment — adjust dose to prevent CNS adverse effects.", citationIDs: ["openfda_famotidine"]),
                AttributedBullet("CNS effects — confusion, agitation, seizures, particularly in elderly with renal impairment.", citationIDs: ["openfda_famotidine"]),
                AttributedBullet("May mask symptoms of gastric malignancy — rule out malignancy before chronic therapy.", citationIDs: ["openfda_famotidine"])
            ],
            adverseReactions: AttributedProse(
                "Generally well-tolerated. Headache, dizziness, constipation or diarrhea. Rare: thrombocytopenia, hepatic dysfunction, CNS effects (confusion, agitation) particularly in elderly.",
                citationIDs: ["openfda_famotidine"]
            ),
            drugInteractions: [
                AttributedBullet("Reduces absorption of pH-dependent drugs (atazanavir, dasatinib, certain azoles).", citationIDs: ["openfda_famotidine"]),
                AttributedBullet("Far fewer CYP-mediated interactions than cimetidine.", citationIDs: ["openfda_famotidine"])
            ],
            nursingImplications: [
                AttributedBullet("Generally well-tolerated; minimal monitoring needed.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Renal dose adjustment essential — verify CrCl before chronic dosing.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Assess for CNS changes in elderly with reduced renal function.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Educate on bedtime dosing for nocturnal acid suppression.", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "Take as prescribed; bedtime dose helps overnight acid control. Tell your provider if you develop persistent abdominal pain, weight loss, or trouble swallowing — these may need further evaluation.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Tamsulosin

public enum TamsulosinSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_tamsulosin",
            shortName: "FDA SPL — Tamsulosin Hydrochloride",
            detail: "SET ID: 00097e78-9c04-4e62-8260-ddb50e9a6a93",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "tamsulosin",
            title: "Tamsulosin",
            subtitle: "Flomax · α-1A selective adrenergic blocker",
            category: "Alpha blocker",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Selective alpha-1A adrenergic antagonist"),
                KeyValueRow(key: "Onset", value: "Hours; full effect over weeks"),
                KeyValueRow(key: "Half-life", value: "9–13 hours"),
                KeyValueRow(key: "Common forms", value: "0.4 mg capsule")
            ],
            indications: AttributedProse(
                "Treatment of signs and symptoms of benign prostatic hyperplasia (BPH). Also used off-label as medical expulsive therapy for distal ureteral stones.",
                citationIDs: ["openfda_tamsulosin"]
            ),
            mechanism: AttributedProse(
                "Selective alpha-1A adrenergic blocker. Relaxes smooth muscle of the prostate and bladder neck, improving urinary flow rate and reducing BPH symptoms. Selectivity for the prostate alpha-1A receptors minimizes systemic vasodilatory effects compared to non-selective alpha blockers.",
                citationIDs: ["openfda_tamsulosin"]
            ),
            dosing: [
                DosingBlock(label: "BPH (adult)", body: "0.4 mg PO once daily, approximately 30 minutes after the same meal each day.", citationIDs: ["openfda_tamsulosin"]),
                DosingBlock(label: "Dose escalation", body: "If 0.4 mg is inadequate after 2–4 weeks, may increase to 0.8 mg PO once daily.", citationIDs: ["openfda_tamsulosin"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity to tamsulosin.",
                citationIDs: ["openfda_tamsulosin"]
            ),
            warnings: [
                AttributedBullet("Orthostatic hypotension and syncope, especially with first dose, dose increase, or combined with PDE-5 inhibitors.", citationIDs: ["openfda_tamsulosin"]),
                AttributedBullet("Intraoperative floppy iris syndrome (IFIS) — alert ophthalmologists before cataract surgery; effect persists despite discontinuation.", citationIDs: ["openfda_tamsulosin"]),
                AttributedBullet("Priapism — rare; instruct patient to seek immediate care if erection lasts >4 hours.", citationIDs: ["openfda_tamsulosin"])
            ],
            adverseReactions: AttributedProse(
                "Dizziness, abnormal ejaculation (decreased or absent), nasal congestion, rhinitis, asthenia, back pain. Less common: orthostatic hypotension, syncope, priapism.",
                citationIDs: ["openfda_tamsulosin"]
            ),
            drugInteractions: [
                AttributedBullet("CYP3A4 inhibitors (ketoconazole, ritonavir) — increase tamsulosin levels; avoid concomitant strong inhibitors.", citationIDs: ["openfda_tamsulosin"]),
                AttributedBullet("Other alpha blockers — additive hypotension.", citationIDs: ["openfda_tamsulosin"]),
                AttributedBullet("PDE-5 inhibitors — additive hypotension; use cautiously.", citationIDs: ["openfda_tamsulosin"]),
                AttributedBullet("Cimetidine — modestly increases tamsulosin levels.", citationIDs: ["openfda_tamsulosin"])
            ],
            nursingImplications: [
                AttributedBullet("Take with the same meal each day for consistent absorption.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Counsel on first-dose orthostatic hypotension — sit before standing, especially in the morning.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Document tamsulosin use in chart — IFIS during cataract surgery is a major safety event for ophthalmology.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Assess for symptom improvement — urinary stream, frequency, urgency, hesitancy, residual volume.", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "Take at the same time daily, after the same meal. Stand up slowly, especially after the first dose. Tell every eye doctor that you take this medication — important if you ever need cataract surgery. Seek emergency care for an erection lasting more than 4 hours.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Sodium Bicarbonate

public enum SodiumBicarbonateSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_sodium_bicarbonate",
            shortName: "FDA SPL — Sodium Bicarbonate Injection",
            detail: "SET ID: 068db1fe-0346-48f1-8d2f-8488d7331106",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "sodium-bicarbonate",
            title: "Sodium bicarbonate",
            subtitle: "Alkalinizing agent · NaHCO₃",
            category: "Alkalinizing agent",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Systemic alkalinizer / electrolyte"),
                KeyValueRow(key: "Onset (IV)", value: "Immediate"),
                KeyValueRow(key: "Common forms", value: "8.4% (1 mEq/mL) or 4.2% (0.5 mEq/mL); ampules and pre-mixed bags")
            ],
            indications: AttributedProse(
                "Treatment of metabolic acidosis (severe or with associated hyperkalemia); urinary alkalinization for selected toxic ingestions; tricyclic antidepressant overdose with QRS widening; hyperkalemia (intracellular shift); cardiac arrest in select scenarios per ACLS.",
                citationIDs: ["openfda_sodium_bicarbonate"]
            ),
            mechanism: AttributedProse(
                "Provides bicarbonate to neutralize hydrogen ions, raising blood pH and serum bicarbonate. Also promotes intracellular potassium shift in the setting of hyperkalemia.",
                citationIDs: ["openfda_sodium_bicarbonate"]
            ),
            dosing: [
                DosingBlock(label: "Severe metabolic acidosis (adult)", body: "Initial 1 mEq/kg IV bolus; subsequent doses based on ABG and clinical response. Goal pH 7.20–7.30 (do not over-correct).", citationIDs: ["openfda_sodium_bicarbonate"]),
                DosingBlock(label: "TCA overdose with QRS > 100 ms", body: "1 to 2 mEq/kg IV bolus, may repeat; goal QRS narrowing and arterial pH 7.45–7.55.", citationIDs: ["openfda_sodium_bicarbonate"]),
                DosingBlock(label: "Hyperkalemia (adjunct)", body: "50 to 100 mEq IV over 30 minutes; particularly useful when acidotic.", citationIDs: ["openfda_sodium_bicarbonate"]),
                DosingBlock(label: "Cardiac arrest (per AHA ACLS — select scenarios only)", body: "Routine use NOT recommended; consider 1 mEq/kg IV for hyperkalemia, TCA overdose, or prolonged arrest with severe acidosis per protocol.", citationIDs: ["openfda_sodium_bicarbonate"])
            ],
            contraindications: AttributedProse(
                "Metabolic or respiratory alkalosis; hypocalcemia (alkalosis decreases ionized calcium); excessive chloride loss (vomiting, NG suction without potassium replacement); hypokalemia.",
                citationIDs: ["openfda_sodium_bicarbonate"]
            ),
            warnings: [
                AttributedBullet("Tissue necrosis with extravasation — hyperosmolar; prefer central line.", citationIDs: ["openfda_sodium_bicarbonate"]),
                AttributedBullet("Metabolic alkalosis from over-correction — hypokalemia, hypocalcemia, hypoxemia, decreased oxygen delivery.", citationIDs: ["openfda_sodium_bicarbonate"]),
                AttributedBullet("Sodium load — risk of volume overload and CHF exacerbation.", citationIDs: ["openfda_sodium_bicarbonate"]),
                AttributedBullet("Incompatible with calcium-containing solutions (ceftriaxone, calcium chloride, lactated Ringer's) — precipitate forms.", citationIDs: ["openfda_sodium_bicarbonate"]),
                AttributedBullet("Cerebral edema in severe metabolic acidosis with rapid correction (controversial).", citationIDs: ["openfda_sodium_bicarbonate"])
            ],
            adverseReactions: AttributedProse(
                "Metabolic alkalosis with overcorrection, hypokalemia, hypocalcemia, hypernatremia, volume overload, tissue necrosis from extravasation, paradoxical CSF acidosis with rapid administration.",
                citationIDs: ["openfda_sodium_bicarbonate"]
            ),
            drugInteractions: [
                AttributedBullet("Calcium-containing solutions and drugs (ceftriaxone, LR) — precipitate; flush line between.", citationIDs: ["openfda_sodium_bicarbonate"]),
                AttributedBullet("Catecholamines — inactivated by bicarbonate; flush line.", citationIDs: ["openfda_sodium_bicarbonate"]),
                AttributedBullet("Lithium — increased renal clearance; reduces lithium levels.", citationIDs: ["openfda_sodium_bicarbonate"]),
                AttributedBullet("Salicylates — alkalinization increases excretion; useful in salicylate overdose.", citationIDs: ["openfda_sodium_bicarbonate"])
            ],
            nursingImplications: [
                AttributedBullet("Use central line if possible; if peripheral, use large vein and dilute.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Trend ABG before, during, and after correction; goal is not normal pH but safe pH (typically 7.20–7.30).", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Monitor potassium closely — bicarb shifts K intracellularly, can cause hypokalemia after correction.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Flush IV line before and after; do not mix with calcium or catecholamines.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Address underlying cause — bicarb is symptomatic; resolution requires fixing the source (sepsis, DKA, ischemia, toxin).", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "Tell the nurse if you have pain at the IV site, feel weak, or notice numbness or tingling around your mouth or fingertips.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Rocuronium

public enum RocuroniumSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_rocuronium",
            shortName: "FDA SPL — Rocuronium Bromide Injection",
            detail: "SET ID: 01825411-be08-4402-b101-cb546291c972",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "rocuronium",
            title: "Rocuronium",
            subtitle: "Zemuron · non-depolarizing neuromuscular blocker",
            category: "Paralytic",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Aminosteroid non-depolarizing neuromuscular blocker"),
                KeyValueRow(key: "Onset (IV)", value: "60–90 seconds (faster at intubating doses)"),
                KeyValueRow(key: "Duration", value: "30–60 minutes (intubating dose)"),
                KeyValueRow(key: "Reversal", value: "Sugammadex (selective binding) or neostigmine + glycopyrrolate")
            ],
            indications: AttributedProse(
                "Adjunct to general anesthesia to facilitate tracheal intubation; provide skeletal muscle relaxation during surgery or mechanical ventilation in the ICU.",
                citationIDs: ["openfda_rocuronium"]
            ),
            mechanism: AttributedProse(
                "Competitively blocks acetylcholine binding at the nicotinic receptor of the neuromuscular junction, preventing depolarization and muscle contraction. Non-depolarizing — does not cause initial fasciculations like succinylcholine.",
                citationIDs: ["openfda_rocuronium"]
            ),
            dosing: [
                DosingBlock(label: "Rapid sequence intubation (adult)", body: "1.0 to 1.2 mg/kg IV bolus.", citationIDs: ["openfda_rocuronium"]),
                DosingBlock(label: "Standard intubation", body: "0.6 mg/kg IV bolus.", citationIDs: ["openfda_rocuronium"]),
                DosingBlock(label: "Maintenance / continuous infusion", body: "8 to 12 mcg/kg/min titrated to train-of-four monitoring; goal usually 1–2 of 4 twitches.", citationIDs: ["openfda_rocuronium"])
            ],
            contraindications: AttributedProse(
                "Known hypersensitivity to rocuronium or any component.",
                citationIDs: ["openfda_rocuronium"]
            ),
            warnings: [
                AttributedBullet("BOXED WARNING: Risk of medication errors leading to harm and death; only providers credentialed in airway management should administer.", citationIDs: ["openfda_rocuronium"]),
                AttributedBullet("Anaphylaxis — rare but potentially fatal.", citationIDs: ["openfda_rocuronium"]),
                AttributedBullet("Prolonged paralysis with renal or hepatic impairment, hypothermia, electrolyte disturbance, or aminoglycoside concomitant use.", citationIDs: ["openfda_rocuronium"]),
                AttributedBullet("Patient must be sedated and analgesic before, during, and after — paralytic does NOT provide sedation or pain relief; awake paralysis is traumatic.", citationIDs: ["openfda_rocuronium"]),
                AttributedBullet("Mechanical ventilation must be available before administration — patient cannot breathe independently.", citationIDs: ["openfda_rocuronium"])
            ],
            adverseReactions: AttributedProse(
                "Tachycardia (mild, transient), nausea, vomiting, hypertension, hypotension, anaphylaxis, prolonged paralysis.",
                citationIDs: ["openfda_rocuronium"]
            ),
            drugInteractions: [
                AttributedBullet("Aminoglycoside antibiotics — potentiate paralysis.", citationIDs: ["openfda_rocuronium"]),
                AttributedBullet("Magnesium — potentiates paralysis.", citationIDs: ["openfda_rocuronium"]),
                AttributedBullet("Volatile anesthetics — potentiate paralysis.", citationIDs: ["openfda_rocuronium"]),
                AttributedBullet("Anticonvulsants (chronic phenytoin, carbamazepine) — induce metabolism, may require higher doses.", citationIDs: ["openfda_rocuronium"])
            ],
            nursingImplications: [
                AttributedBullet("Independent double-check before administration (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024_v3"]),
                AttributedBullet("ENSURE adequate sedation and analgesia BEFORE administering paralytic — never paralyze an awake patient.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Continuous mechanical ventilation, continuous pulse ox and capnography, continuous cardiac monitoring.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Train-of-four (TOF) monitoring to titrate continuous infusion — typical target 1–2 of 4 twitches.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Eye protection (lubricant, tape) — patient cannot blink.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("DVT prophylaxis, gastric protection, repositioning — paralyzed patients are immobile.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Reversal: sugammadex 2–16 mg/kg per TOF count, or neostigmine + glycopyrrolate.", citationIDs: ["openfda_rocuronium"])
            ],
            patientTeaching: AttributedProse(
                "Provide pre-procedure teaching about loss of voluntary movement and the breathing tube. After awakening from paralysis, patients commonly need to be told what happened and oriented gently — they may have been aware but unable to move.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2, ismp2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Succinylcholine

public enum SuccinylcholineSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_succinylcholine",
            shortName: "FDA SPL — Succinylcholine Chloride Injection",
            detail: "SET ID: 017e5ad4-028e-4e34-ac09-d0c8d64c880a",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "succinylcholine",
            title: "Succinylcholine",
            subtitle: "Anectine · depolarizing neuromuscular blocker",
            category: "Paralytic",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Depolarizing neuromuscular blocker"),
                KeyValueRow(key: "Onset (IV)", value: "30–60 seconds"),
                KeyValueRow(key: "Duration", value: "5–10 minutes"),
                KeyValueRow(key: "Reversal", value: "No reversal — wait for plasma cholinesterase metabolism")
            ],
            indications: AttributedProse(
                "Adjunct to general anesthesia to facilitate tracheal intubation, particularly when rapid sequence intubation is required and the airway must be secured quickly.",
                citationIDs: ["openfda_succinylcholine"]
            ),
            mechanism: AttributedProse(
                "Binds to acetylcholine receptors at the neuromuscular junction, causing initial depolarization (manifest as fasciculations) followed by sustained depolarization that prevents repolarization and produces paralysis. Rapidly metabolized by plasma cholinesterase.",
                citationIDs: ["openfda_succinylcholine"]
            ),
            dosing: [
                DosingBlock(label: "Rapid sequence intubation (adult)", body: "1 to 1.5 mg/kg IV bolus.", citationIDs: ["openfda_succinylcholine"]),
                DosingBlock(label: "IM (no IV access)", body: "3 to 4 mg/kg IM (maximum 150 mg); slower onset.", citationIDs: ["openfda_succinylcholine"]),
                DosingBlock(label: "Pediatric", body: "Not preferred for routine pediatric intubation due to risk of severe hyperkalemia in undiagnosed myopathy.", citationIDs: ["openfda_succinylcholine"])
            ],
            contraindications: AttributedProse(
                "BOXED WARNING in pediatric patients — risk of acute rhabdomyolysis with hyperkalemia and cardiac arrest in undiagnosed skeletal muscle myopathy. Personal or family history of malignant hyperthermia. Pre-existing hyperkalemia. Major burns, multiple trauma, denervation injury, or upper motor neuron injury more than 48–72 hours old (risk of severe hyperkalemia). Penetrating eye injury. Skeletal muscle myopathies. Acute phase of injury following major trauma.",
                citationIDs: ["openfda_succinylcholine"]
            ),
            warnings: [
                AttributedBullet("BOXED WARNING: Risk of cardiac arrest from acute hyperkalemia in pediatric patients with undiagnosed skeletal muscle myopathy — succinylcholine generally not recommended in children except for emergency intubation.", citationIDs: ["openfda_succinylcholine"]),
                AttributedBullet("Malignant hyperthermia — life-threatening; treatment is dantrolene plus supportive care; family history is contraindication.", citationIDs: ["openfda_succinylcholine"]),
                AttributedBullet("Severe hyperkalemia in burn patients (>24 hours after burn), spinal cord injury, prolonged immobility, denervation injury, severe abdominal infection, neuromuscular disease.", citationIDs: ["openfda_succinylcholine"]),
                AttributedBullet("Bradycardia and asystole, particularly with second dose or in children — pretreat with atropine if needed.", citationIDs: ["openfda_succinylcholine"]),
                AttributedBullet("Increased intraocular, intracranial, and intragastric pressure.", citationIDs: ["openfda_succinylcholine"]),
                AttributedBullet("Prolonged paralysis with pseudocholinesterase deficiency (genetic or acquired).", citationIDs: ["openfda_succinylcholine"])
            ],
            adverseReactions: AttributedProse(
                "Fasciculations (initial, expected), postoperative myalgia, transient hyperkalemia, bradycardia, asystole, hypotension, anaphylaxis, malignant hyperthermia, prolonged paralysis with pseudocholinesterase deficiency.",
                citationIDs: ["openfda_succinylcholine"]
            ),
            drugInteractions: [
                AttributedBullet("Anticholinesterases (neostigmine) — prolong succinylcholine paralysis.", citationIDs: ["openfda_succinylcholine"]),
                AttributedBullet("Aminoglycoside antibiotics, magnesium — potentiate paralysis.", citationIDs: ["openfda_succinylcholine"]),
                AttributedBullet("Volatile anesthetics — potentiate paralysis and increase risk of malignant hyperthermia.", citationIDs: ["openfda_succinylcholine"])
            ],
            nursingImplications: [
                AttributedBullet("Independent double-check before administration (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024_v3"]),
                AttributedBullet("Used only by providers credentialed in airway management with immediate intubation capability.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Verify no contraindications — burns, denervation, neuromuscular disease, family history of MH.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Continuous cardiac monitoring; have atropine available for bradycardia.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Have dantrolene available for malignant hyperthermia per facility crash cart.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Anticipate and treat post-procedure myalgia.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("If repeat dose needed and prolonged paralysis suspected, consider pseudocholinesterase deficiency.", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "You may experience muscle soreness for a day or two after this medication. Tell your provider and family members that you and any blood relatives should avoid certain anesthetics if you have ever had a serious reaction.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2, ismp2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Piperacillin-tazobactam (Zosyn)

public enum PiperacillinTazobactamSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_zosyn",
            shortName: "FDA SPL — Piperacillin and Tazobactam (Zosyn)",
            detail: "SET ID: 8ab9d90d-2f7f-4599-a44f-3d0a8f8ab623",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "piperacillin-tazobactam",
            title: "Piperacillin-tazobactam",
            subtitle: "Zosyn · extended-spectrum β-lactam + β-lactamase inhibitor",
            category: "Antibiotic",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Extended-spectrum penicillin + beta-lactamase inhibitor"),
                KeyValueRow(key: "Onset (IV)", value: "Bactericidal effect within hours"),
                KeyValueRow(key: "Half-life", value: "≈1 hour"),
                KeyValueRow(key: "Common forms", value: "2.25 g, 3.375 g, 4.5 g vials and pre-mixed bags")
            ],
            indications: AttributedProse(
                "Treatment of moderate-to-severe infections caused by piperacillin-resistant, beta-lactamase-producing strains: intra-abdominal infections, skin and soft tissue infections, pneumonia (including hospital-acquired and ventilator-associated), febrile neutropenia, gynecologic infections.",
                citationIDs: ["openfda_zosyn"]
            ),
            mechanism: AttributedProse(
                "Piperacillin inhibits bacterial cell wall synthesis by binding penicillin-binding proteins. Tazobactam is a beta-lactamase inhibitor that protects piperacillin from hydrolysis by many beta-lactamases, extending the antimicrobial spectrum.",
                citationIDs: ["openfda_zosyn"]
            ),
            dosing: [
                DosingBlock(label: "Adult — typical dosing", body: "3.375 g IV every 6 hours, or 4.5 g IV every 8 hours, infused over 30 minutes (extended-infusion regimens of 4 hours per dose are also used).", citationIDs: ["openfda_zosyn"]),
                DosingBlock(label: "Severe / pseudomonal infection", body: "4.5 g IV every 6 hours.", citationIDs: ["openfda_zosyn"]),
                DosingBlock(label: "Renal dose adjustment", body: "Required for CrCl ≤40 mL/min; consult dosing reference. Hemodialysis requires supplemental dose after each session.", citationIDs: ["openfda_zosyn"]),
                DosingBlock(label: "Compatibility", body: "Do NOT mix in the same line as aminoglycosides — inactivates them. Run lactated Ringer's compatible.", citationIDs: ["openfda_zosyn"])
            ],
            contraindications: AttributedProse(
                "Known serious hypersensitivity to penicillins, cephalosporins, or beta-lactamase inhibitors.",
                citationIDs: ["openfda_zosyn"]
            ),
            warnings: [
                AttributedBullet("Anaphylaxis and severe skin reactions including SJS/TEN reported.", citationIDs: ["openfda_zosyn"]),
                AttributedBullet("Clostridioides difficile-associated diarrhea — broad-spectrum disrupts normal flora.", citationIDs: ["openfda_zosyn"]),
                AttributedBullet("Bleeding manifestations — particularly at high doses, in renal impairment.", citationIDs: ["openfda_zosyn"]),
                AttributedBullet("Hypokalemia — sodium-content medication causes increased renal potassium loss.", citationIDs: ["openfda_zosyn"]),
                AttributedBullet("Acute kidney injury — risk increased when combined with vancomycin (controversial; monitor renal function carefully).", citationIDs: ["openfda_zosyn"]),
                AttributedBullet("Cross-reactivity with cephalosporins and carbapenems.", citationIDs: ["openfda_zosyn"])
            ],
            adverseReactions: AttributedProse(
                "Diarrhea (very common), nausea, vomiting, headache, rash, fever, insomnia, constipation. Serious: anaphylaxis, C. diff colitis, hepatitis, nephritis, severe skin reactions (SJS/TEN), seizures (especially in renal impairment).",
                citationIDs: ["openfda_zosyn"]
            ),
            drugInteractions: [
                AttributedBullet("Aminoglycosides — chemical inactivation; do not mix in same line; administer separately.", citationIDs: ["openfda_zosyn"]),
                AttributedBullet("Probenecid — increases piperacillin levels by inhibiting renal tubular secretion.", citationIDs: ["openfda_zosyn"]),
                AttributedBullet("Vancomycin — possible additive nephrotoxicity (monitor closely).", citationIDs: ["openfda_zosyn"]),
                AttributedBullet("Methotrexate — increased levels and toxicity.", citationIDs: ["openfda_zosyn"]),
                AttributedBullet("Anticoagulants — increased bleeding risk.", citationIDs: ["openfda_zosyn"])
            ],
            nursingImplications: [
                AttributedBullet("Verify allergies — penicillin, cephalosporin, carbapenem.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Infuse over 30 minutes (or extended infusion 4 hours per protocol); use a separate line from aminoglycosides.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Monitor for hypersensitivity, rash, anaphylaxis during and after infusion.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Trend renal function and electrolytes (especially potassium) during therapy.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Monitor for diarrhea — assess for C. difficile if it develops.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Verify de-escalation when culture and sensitivity results return — broad-spectrum stewardship.", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "Tell the nurse if you develop a rash, hives, trouble breathing, severe diarrhea, or any other unusual symptoms during or after the infusion.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Ciprofloxacin

public enum CiprofloxacinSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_ciprofloxacin",
            shortName: "FDA SPL — Ciprofloxacin in Dextrose Injection",
            detail: "SET ID: 42c758be-4d44-018a-e063-6294a90ae041",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "ciprofloxacin",
            title: "Ciprofloxacin",
            subtitle: "Cipro · fluoroquinolone antibiotic",
            category: "Antibiotic",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Fluoroquinolone (DNA gyrase inhibitor)"),
                KeyValueRow(key: "Half-life", value: "≈4 hours"),
                KeyValueRow(key: "Common forms", value: "200 mg/100 mL, 400 mg/200 mL premixed (IV); 250, 500, 750 mg tablets")
            ],
            indications: AttributedProse(
                "Treatment of urinary tract infections, complicated intra-abdominal infections, skin and soft tissue infections, bone and joint infections, infectious diarrhea, typhoid fever, and inhalational anthrax post-exposure prophylaxis. Carries Boxed Warning regarding tendinitis, tendon rupture, peripheral neuropathy, CNS effects, and exacerbation of myasthenia gravis.",
                citationIDs: ["openfda_ciprofloxacin"]
            ),
            mechanism: AttributedProse(
                "Inhibits bacterial DNA gyrase and topoisomerase IV, preventing DNA replication and transcription, killing the bacterium. Active against many gram-negative organisms including Pseudomonas, and some gram-positive organisms.",
                citationIDs: ["openfda_ciprofloxacin"]
            ),
            dosing: [
                DosingBlock(label: "UTI (uncomplicated, adult)", body: "250 mg PO every 12 hours for 3 days OR 200 mg IV every 12 hours.", citationIDs: ["openfda_ciprofloxacin"]),
                DosingBlock(label: "Complicated UTI / pyelonephritis", body: "500 mg PO every 12 hours OR 400 mg IV every 12 hours.", citationIDs: ["openfda_ciprofloxacin"]),
                DosingBlock(label: "Severe / complicated infection", body: "400 mg IV every 8 hours.", citationIDs: ["openfda_ciprofloxacin"]),
                DosingBlock(label: "Renal dose adjustment", body: "Required for CrCl <50 mL/min.", citationIDs: ["openfda_ciprofloxacin"])
            ],
            contraindications: AttributedProse(
                "Known hypersensitivity to ciprofloxacin or other fluoroquinolones; concomitant tizanidine.",
                citationIDs: ["openfda_ciprofloxacin"]
            ),
            warnings: [
                AttributedBullet("BOXED WARNING: Tendinitis and tendon rupture (Achilles most common); risk increased in older adults, organ transplant recipients, and patients on corticosteroids. Discontinue at first sign of tendon pain.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("BOXED WARNING: Peripheral neuropathy — may be permanent; discontinue at first symptoms.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("BOXED WARNING: CNS effects — seizures, confusion, hallucinations; caution in patients with CNS disorders or risk factors.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("BOXED WARNING: Exacerbation of myasthenia gravis — avoid in known MG.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("BOXED WARNING: Reserve for situations where alternatives are inappropriate due to the cumulative risk of disabling and potentially permanent serious adverse reactions.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("QT prolongation — caution with other QT-prolonging drugs and electrolyte abnormalities.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("C. difficile colitis.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("Aortic aneurysm and dissection — increased risk per FDA safety communication.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("Hypoglycemia and hyperglycemia — particularly in diabetic patients.", citationIDs: ["openfda_ciprofloxacin"])
            ],
            adverseReactions: AttributedProse(
                "Nausea, diarrhea, headache, rash, abdominal pain, dizziness, photosensitivity. Serious: tendon rupture, peripheral neuropathy, CNS effects (seizure, confusion), QT prolongation, hypoglycemia, severe skin reactions, C. difficile, aortic aneurysm.",
                citationIDs: ["openfda_ciprofloxacin"]
            ),
            drugInteractions: [
                AttributedBullet("Antacids, calcium, iron, magnesium, sucralfate — chelate ciprofloxacin and reduce absorption; separate by ≥2 hours.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("Theophylline — increased levels and toxicity.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("Warfarin — potentiates anticoagulation; monitor INR.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("Tizanidine — contraindicated; markedly elevated levels.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("QT-prolonging drugs — additive QT effect.", citationIDs: ["openfda_ciprofloxacin"]),
                AttributedBullet("NSAIDs — increased risk of CNS stimulation.", citationIDs: ["openfda_ciprofloxacin"])
            ],
            nursingImplications: [
                AttributedBullet("Verify allergies and prior fluoroquinolone reactions.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Counsel patient on tendon symptoms — pain, swelling, inflammation; stop and report immediately.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Counsel on photosensitivity — avoid prolonged sun exposure, wear sunscreen.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Separate from antacids, calcium, iron, multivitamins by ≥2 hours.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Monitor for C. difficile diarrhea, blood glucose changes (especially in diabetics), neuropathy symptoms.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Trend QTc and electrolytes (potassium, magnesium).", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("De-escalate to narrower-spectrum agent when culture results allow.", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "Drink plenty of water. Avoid prolonged sun exposure and wear sunscreen. Tell your provider immediately if you develop tendon pain, numbness, tingling, severe diarrhea, mood changes, or unusual blood sugar swings. Avoid antacids, calcium supplements, and dairy within 2 hours of your dose.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Phenytoin

public enum PhenytoinSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_phenytoin",
            shortName: "FDA SPL — Phenytoin Sodium Injection",
            detail: "SET ID: 035a8d4e-2063-4240-83cb-d7eebcabe301",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "phenytoin",
            title: "Phenytoin",
            subtitle: "Dilantin · sodium channel anticonvulsant",
            category: "Anticonvulsant",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Sodium channel blocker / anticonvulsant"),
                KeyValueRow(key: "Therapeutic level", value: "10–20 mcg/mL (total); free phenytoin 1–2 mcg/mL"),
                KeyValueRow(key: "Half-life", value: "Variable, dose-dependent saturation kinetics"),
                KeyValueRow(key: "Common forms", value: "50 mg/mL (IV); 100 mg capsules, oral suspension")
            ],
            indications: AttributedProse(
                "Control of generalized tonic-clonic and complex partial (psychomotor, temporal lobe) seizures; prevention and treatment of seizures occurring during or following neurosurgery; treatment of status epilepticus (parenteral). Often substituted by levetiracetam in modern practice due to fewer interactions.",
                citationIDs: ["openfda_phenytoin"]
            ),
            mechanism: AttributedProse(
                "Stabilizes neuronal membranes by blocking voltage-dependent sodium channels in the inactivated state, reducing repetitive neuronal firing. Limits the spread of seizure activity without significantly raising the seizure threshold.",
                citationIDs: ["openfda_phenytoin"]
            ),
            dosing: [
                DosingBlock(label: "Status epilepticus (loading, adult)", body: "15 to 20 mg/kg IV at a maximum rate of 50 mg/min (25 mg/min in elderly).", citationIDs: ["openfda_phenytoin"]),
                DosingBlock(label: "Maintenance (adult)", body: "100 mg PO/IV three times daily, adjusted by serum levels.", citationIDs: ["openfda_phenytoin"]),
                DosingBlock(label: "IV administration", body: "Infuse no faster than 50 mg/min; rapid administration causes 'purple glove syndrome,' hypotension, arrhythmia.", citationIDs: ["openfda_phenytoin"]),
                DosingBlock(label: "Compatibility", body: "Use ONLY normal saline; precipitates in dextrose. Use in-line filter. Flush IV line with saline before and after.", citationIDs: ["openfda_phenytoin"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity to phenytoin or other hydantoins; sinus bradycardia; sinoatrial block; second- or third-degree AV block; Adams-Stokes syndrome; concomitant delavirdine.",
                citationIDs: ["openfda_phenytoin"]
            ),
            warnings: [
                AttributedBullet("BOXED WARNING: Severe cardiovascular effects (hypotension, arrhythmia, cardiac arrest) with rapid IV administration; do not exceed 50 mg/min in adults, 25 mg/min in elderly or compromised patients.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Purple glove syndrome — soft tissue injury and necrosis at injection site; central line preferred when feasible.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Severe dermatologic reactions — Stevens-Johnson syndrome, toxic epidermal necrolysis, DRESS syndrome. Discontinue at first rash.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Suicidal behavior and ideation — class warning.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Hepatotoxicity, including acute liver failure.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Hematologic — leukopenia, thrombocytopenia, agranulocytosis.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Long-term effects — gingival hyperplasia, hirsutism, coarsening of facial features, vitamin D and folate deficiency.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Pregnancy — fetal hydantoin syndrome; folate supplementation recommended.", citationIDs: ["openfda_phenytoin"])
            ],
            adverseReactions: AttributedProse(
                "Nystagmus, ataxia, slurred speech, drowsiness (signs of toxicity); gingival hyperplasia; hirsutism; hyperglycemia; lymphadenopathy; hepatic enzyme elevation. Serious: SJS/TEN, DRESS, agranulocytosis, hepatotoxicity, purple glove syndrome.",
                citationIDs: ["openfda_phenytoin"]
            ),
            drugInteractions: [
                AttributedBullet("Phenytoin is BOTH an inducer and a substrate of CYP enzymes — many bidirectional interactions.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Warfarin — initial increase then decrease in INR; monitor closely.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Oral contraceptives — reduced effectiveness.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Other anticonvulsants — complex bidirectional interactions; monitor levels.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Fluconazole, isoniazid, amiodarone — increase phenytoin levels.", citationIDs: ["openfda_phenytoin"]),
                AttributedBullet("Rifampin, carbamazepine — decrease phenytoin levels.", citationIDs: ["openfda_phenytoin"])
            ],
            nursingImplications: [
                AttributedBullet("Independent double-check before IV loading dose (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024_v3"]),
                AttributedBullet("Use ONLY normal saline; precipitates in dextrose. Use in-line filter and dedicated IV line.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Continuous cardiac monitoring during IV loading; do not exceed 50 mg/min (25 mg/min elderly).", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Monitor BP every 5 minutes during loading dose.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Trend serum levels (free and total) — saturation kinetics mean small dose changes can cause large level changes.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Educate patient on gingival hyperplasia — meticulous oral hygiene, regular dental care.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Monitor CBC, LFTs, drug levels regularly.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Counsel on rash — stop and call provider for any new rash.", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "Take exactly as prescribed; do not stop suddenly. Brush and floss carefully; see your dentist regularly. Tell your provider if you develop a rash, fever, swollen glands, easy bruising, mood changes, or unusual fatigue. Many medications can affect this drug — always tell pharmacists you take it.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2, ismp2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - 0.9% Sodium Chloride

public enum SodiumChlorideSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_sodium_chloride",
            shortName: "FDA SPL — Sodium Chloride Injection",
            detail: "SET ID: 018a8807-1331-41c3-4889-c7ec502a9043",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "sodium-chloride",
            title: "Sodium chloride 0.9%",
            subtitle: "Normal saline · isotonic crystalloid",
            category: "IV fluid",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Isotonic crystalloid (osmolality 308 mOsm/L)"),
                KeyValueRow(key: "Composition", value: "154 mEq/L sodium, 154 mEq/L chloride"),
                KeyValueRow(key: "Common forms", value: "1000 mL, 500 mL, 250 mL, 100 mL bags; 10 mL flush syringes")
            ],
            indications: AttributedProse(
                "Source of water and electrolytes; fluid resuscitation; replacement of extracellular fluid losses; vehicle for IV medication administration; flush solution for IV lines and catheters.",
                citationIDs: ["openfda_sodium_chloride"]
            ),
            mechanism: AttributedProse(
                "Provides extracellular fluid volume and sodium. Distributes throughout the extracellular compartment after IV administration; approximately 25% remains intravascular at 1 hour, the rest moves into the interstitium.",
                citationIDs: ["openfda_sodium_chloride"]
            ),
            dosing: [
                DosingBlock(label: "Adult resuscitation", body: "Per provider order — typically 1–2 L bolus for hypovolemia; sepsis bundle calls for 30 mL/kg in the first 3 hours for septic shock or lactate ≥4.", citationIDs: ["openfda_sodium_chloride"]),
                DosingBlock(label: "Maintenance fluids (adult)", body: "75–125 mL/hour or per individualized order based on patient size, intake/output, and comorbidities.", citationIDs: ["openfda_sodium_chloride"]),
                DosingBlock(label: "Considerations", body: "Large-volume normal saline causes hyperchloremic metabolic acidosis; balanced crystalloids (LR, Plasma-Lyte) preferred in many critical care settings.", citationIDs: ["openfda_sodium_chloride"])
            ],
            contraindications: AttributedProse(
                "Conditions where sodium administration is harmful — severe heart failure, severe renal impairment with oliguria, hypernatremia.",
                citationIDs: ["openfda_sodium_chloride"]
            ),
            warnings: [
                AttributedBullet("Volume overload — particularly in heart failure, renal failure, advanced age; assess for crackles, edema, dyspnea.", citationIDs: ["openfda_sodium_chloride"]),
                AttributedBullet("Hyperchloremic metabolic acidosis with large volumes — consider balanced crystalloid alternative.", citationIDs: ["openfda_sodium_chloride"]),
                AttributedBullet("Pulmonary edema in patients with impaired cardiac or renal function.", citationIDs: ["openfda_sodium_chloride"]),
                AttributedBullet("Hypernatremia with prolonged use without water intake.", citationIDs: ["openfda_sodium_chloride"])
            ],
            adverseReactions: AttributedProse(
                "Volume overload, pulmonary edema, hyperchloremic acidosis, hypernatremia, infusion-site reactions.",
                citationIDs: ["openfda_sodium_chloride"]
            ),
            drugInteractions: [
                AttributedBullet("Compatible with most IV medications — frequently used as a vehicle.", citationIDs: ["openfda_sodium_chloride"]),
                AttributedBullet("Lithium — sodium loading increases lithium clearance.", citationIDs: ["openfda_sodium_chloride"])
            ],
            nursingImplications: [
                AttributedBullet("Monitor intake and output strictly; daily weights for patients on sustained fluids.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Assess lung sounds, peripheral edema, JVD before and during volume resuscitation.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Trend serum sodium, chloride, bicarbonate during sustained or large-volume infusions.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Use infusion pump for accurate rate control.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Hypertonic saline (3%, 23.4%) is a SEPARATE entry — high-alert, central line required.", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "This is the IV fluid commonly called 'normal saline.' Tell the nurse if you feel short of breath, have new swelling in your hands, feet, or face, or if the IV site becomes painful.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Albumin

public enum AlbuminSampleDrug {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_albumin",
            shortName: "FDA SPL — Albumin (Human) — Albuminex",
            detail: "SET ID: 167f48d0-8ae5-4f7e-b050-9673dad78acc",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "albumin-iv",
            title: "Albumin (IV)",
            subtitle: "Plasma volume expander · 5% or 25% solution",
            category: "Colloid",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Human plasma protein / colloid volume expander"),
                KeyValueRow(key: "Common forms", value: "5% (50 mg/mL) and 25% (250 mg/mL) — different indications"),
                KeyValueRow(key: "Onset", value: "Plasma volume expansion within minutes")
            ],
            indications: AttributedProse(
                "Hypovolemia (5%); hypoalbuminemia (25%); large-volume paracentesis (25%); spontaneous bacterial peritonitis (25%); hepatorenal syndrome (25%); plasma exchange replacement; certain cardiac surgery and transplant settings.",
                citationIDs: ["openfda_albumin"]
            ),
            mechanism: AttributedProse(
                "Provides oncotic pressure to maintain plasma volume by attracting fluid from the interstitial space. 5% albumin is iso-oncotic and primarily expands plasma volume; 25% is hyper-oncotic and pulls additional fluid into the vascular space.",
                citationIDs: ["openfda_albumin"]
            ),
            dosing: [
                DosingBlock(label: "Hypovolemia (5%)", body: "Per provider order — typical adult 250–500 mL IV, repeat as needed; maximum 250 g in 48 hours.", citationIDs: ["openfda_albumin"]),
                DosingBlock(label: "Large-volume paracentesis (25%)", body: "6–8 g of albumin per liter of ascitic fluid removed beyond 5 L.", citationIDs: ["openfda_albumin"]),
                DosingBlock(label: "SBP / hepatorenal syndrome (25%)", body: "Per protocol — typically 1.5 g/kg on day 1 and 1 g/kg on day 3 in SBP.", citationIDs: ["openfda_albumin"])
            ],
            contraindications: AttributedProse(
                "Severe anemia or heart failure; known hypersensitivity. Caution in patients with sodium restriction (5% albumin contains 130–160 mEq/L sodium).",
                citationIDs: ["openfda_albumin"]
            ),
            warnings: [
                AttributedBullet("Volume overload and pulmonary edema — particularly with 25% albumin in patients without volume depletion.", citationIDs: ["openfda_albumin"]),
                AttributedBullet("Hypersensitivity reactions — rare but include anaphylaxis.", citationIDs: ["openfda_albumin"]),
                AttributedBullet("Theoretical risk of transmissible infection — risk minimized by donor screening and viral inactivation.", citationIDs: ["openfda_albumin"]),
                AttributedBullet("Sodium content matters — 5% has substantial sodium load.", citationIDs: ["openfda_albumin"])
            ],
            adverseReactions: AttributedProse(
                "Generally well-tolerated. Possible: chills, fever, nausea, vomiting, urticaria, hypotension or hypertension, pulmonary edema with overload.",
                citationIDs: ["openfda_albumin"]
            ),
            drugInteractions: [
                AttributedBullet("ACE inhibitors — rare reports of severe hypotension during albumin infusion in patients on ACE-Is.", citationIDs: ["openfda_albumin"]),
                AttributedBullet("Compatible with most IV solutions; do not mix in same line as other proteins, amino acid solutions, or alcohol-containing solutions.", citationIDs: ["openfda_albumin"])
            ],
            nursingImplications: [
                AttributedBullet("Verify product type (5% vs 25%) — substantially different effects.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Monitor BP, HR, SpO2, lung sounds, urine output throughout infusion.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("25% albumin can rapidly overload an already-volume-replete patient — assess for pulmonary edema.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Use infusion pump; rate per provider order — typically 1–2 mL/min for 25%; faster rates for resuscitation 5%.", citationIDs: ["openrn_pharmacology_book_2"]),
                AttributedBullet("Monitor for hypersensitivity reaction during the first 15 minutes.", citationIDs: ["openrn_pharmacology_book_2"])
            ],
            patientTeaching: AttributedProse(
                "This is a protein product made from donated human plasma. Tell the nurse if you feel short of breath, have chills or fever, develop a rash, or feel any unusual symptoms during the infusion.",
                citationIDs: ["openrn_pharmacology_book_2"]
            ),
            citations: [openfda, openrnPharm2],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}
