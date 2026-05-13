import Foundation

// Curator-model drug entries.
// Source: openFDA Drug Label API (CC0 / public domain) — live set IDs verified 2026-05-04.
// Nursing implications drawn from Open RN Nursing Pharmacology (CC BY 4.0).
// ISMP high-alert classification cited as concept only (list itself not reproduced).

private let openrnPharm = CitationSource(
    id: "openrn_pharmacology_book",
    shortName: "Open RN Nursing Pharmacology, 2nd ed.",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=cardiovascular+endocrine+drug",
    lastRetrieved: "2026-05-04"
)

private let ismpHighAlert = CitationSource(
    id: "ismp_high_alert_2024_v2",
    shortName: "ISMP List of High-Alert Medications in Acute Care",
    detail: "Concept citation only — list itself not reproduced",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Hydrocortisone (Solu-Cortef)

public enum HydrocortisoneSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_hydrocortisone",
            shortName: "FDA SPL — Hydrocortisone Sodium Succinate (Solu-Cortef)",
            detail: "SET ID: 386942d3-c75f-25f1-e063-6394a90a5af2",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "hydrocortisone",
            title: "Hydrocortisone",
            subtitle: "Solu-Cortef · hydrocortisone sodium succinate",
            category: "Glucocorticoid",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Glucocorticoid (corticosteroid)"),
                KeyValueRow(key: "Onset (IV)", value: "Within 1 hour"),
                KeyValueRow(key: "Duration", value: "Variable — biologic effect lasts 8–12 hours"),
                KeyValueRow(key: "Common forms", value: "100, 250, 500, 1000 mg vials")
            ],
            indications: AttributedProse(
                "Indicated for endocrine disorders (acute adrenal insufficiency, congenital adrenal hyperplasia), severe allergic reactions, exacerbations of asthma and COPD, certain dermatologic, hematologic, and rheumatic conditions, ulcerative colitis, and shock unresponsive to conventional therapy. The IV formulation is the agent of choice for adrenal crisis.",
                citationIDs: ["openfda_hydrocortisone"]
            ),
            mechanism: AttributedProse(
                "Hydrocortisone (cortisol) binds intracellular glucocorticoid receptors, modulating gene expression to suppress inflammatory and immune responses, decrease capillary permeability, and stabilize lysosomal membranes. It also has mineralocorticoid activity (sodium and water retention, potassium loss).",
                citationIDs: ["openfda_hydrocortisone", "openrn_pharmacology_book"]
            ),
            dosing: [
                DosingBlock(label: "Adrenal crisis (adult)", body: "100 mg IV bolus, then 200 mg per 24 hours by continuous infusion or 50 mg IV every 6 hours.", citationIDs: ["openfda_hydrocortisone"]),
                DosingBlock(label: "Severe inflammation / shock (adult)", body: "100 to 500 mg IV initially; may repeat at 2-, 4-, or 6-hour intervals based on clinical response.", citationIDs: ["openfda_hydrocortisone"]),
                DosingBlock(label: "Reconstitution", body: "Reconstitute with the supplied diluent (bacteriostatic water with benzyl alcohol). Use within 3 days of reconstitution.", citationIDs: ["openfda_hydrocortisone"])
            ],
            contraindications: AttributedProse(
                "Systemic fungal infections; known hypersensitivity to the product or any component. Live or live-attenuated vaccines should not be administered to patients receiving immunosuppressive doses.",
                citationIDs: ["openfda_hydrocortisone"]
            ),
            warnings: [
                AttributedBullet("Adrenal suppression with prolonged use — taper to discontinue, do not stop abruptly; supplemental dosing required for stress (illness, surgery).", citationIDs: ["openfda_hydrocortisone"]),
                AttributedBullet("Increased risk of infection; may mask clinical signs of infection.", citationIDs: ["openfda_hydrocortisone"]),
                AttributedBullet("Hyperglycemia, fluid retention, hypokalemia, hypertension.", citationIDs: ["openfda_hydrocortisone"]),
                AttributedBullet("GI perforation or bleeding, especially with concurrent NSAIDs.", citationIDs: ["openfda_hydrocortisone"]),
                AttributedBullet("Psychiatric disturbances — euphoria, mood swings, depression, psychosis.", citationIDs: ["openfda_hydrocortisone"]),
                AttributedBullet("Long-term use — osteoporosis, cataracts, glaucoma, growth suppression in children.", citationIDs: ["openfda_hydrocortisone"])
            ],
            adverseReactions: AttributedProse(
                "Common: fluid retention, weight gain, hyperglycemia, hypokalemia, hypertension, increased appetite, mood changes, insomnia, gastric irritation, delayed wound healing, skin thinning, easy bruising. Serious: infection, GI perforation, adrenal crisis on abrupt withdrawal, vertebral compression fractures.",
                citationIDs: ["openfda_hydrocortisone"]
            ),
            drugInteractions: [
                AttributedBullet("CYP3A4 inducers (rifampin, phenytoin, phenobarbital) decrease corticosteroid effect.", citationIDs: ["openfda_hydrocortisone"]),
                AttributedBullet("CYP3A4 inhibitors (ketoconazole, ritonavir) increase corticosteroid effect.", citationIDs: ["openfda_hydrocortisone"]),
                AttributedBullet("NSAIDs increase risk of GI bleeding.", citationIDs: ["openfda_hydrocortisone"]),
                AttributedBullet("Live vaccines contraindicated during immunosuppressive doses.", citationIDs: ["openfda_hydrocortisone"]),
                AttributedBullet("Diuretics potentiate hypokalemia.", citationIDs: ["openfda_hydrocortisone"])
            ],
            nursingImplications: [
                AttributedBullet("Monitor blood glucose, electrolytes (especially potassium), blood pressure, and weight.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Assess for signs of infection — fever may be masked; check WBC trends.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Administer with food or antacid if oral; IV infusion can be given as bolus or continuous.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Never abruptly discontinue chronic therapy — requires taper.", citationIDs: ["openfda_hydrocortisone", "openrn_pharmacology_book"]),
                AttributedBullet("Educate patient to wear medical alert identification if on chronic steroid therapy.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("In adrenal crisis: prompt IV administration is life-saving — do not delay for further workup.", citationIDs: ["openrn_pharmacology_book"])
            ],
            patientTeaching: AttributedProse(
                "Take exactly as prescribed; do not stop suddenly. Report signs of infection (fever, sore throat), hyperglycemia (excessive thirst, urination), GI bleeding (black or tarry stools), or adrenal insufficiency (fatigue, dizziness, weakness, low blood pressure). Carry medical alert identification.",
                citationIDs: ["openrn_pharmacology_book"]
            ),
            citations: [openfda, openrnPharm],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Dexmedetomidine (Precedex)

public enum DexmedetomidineSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_dexmedetomidine",
            shortName: "FDA SPL — Dexmedetomidine",
            detail: "SET ID: 0d2710f2-ee47-4114-ab5c-8dca74cdcb8d",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "dexmedetomidine",
            title: "Dexmedetomidine",
            subtitle: "Precedex — selective α-2 adrenergic agonist",
            category: "Sedative",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Selective α-2 adrenergic agonist"),
                KeyValueRow(key: "Onset (IV)", value: "5–10 minutes"),
                KeyValueRow(key: "Half-life", value: "≈2 hours (terminal)"),
                KeyValueRow(key: "Common forms", value: "200 mcg/2 mL or 400 mcg/4 mL vial; ready-to-use bags")
            ],
            indications: AttributedProse(
                "Indicated for sedation of initially intubated and mechanically ventilated adult patients during treatment in an intensive care setting (infusion not exceeding 24 hours per labeling) and for procedural sedation of non-intubated patients prior to and during surgical and other procedures.",
                citationIDs: ["openfda_dexmedetomidine"]
            ),
            mechanism: AttributedProse(
                "Selective alpha-2 adrenoceptor agonist with sedative, anxiolytic, and analgesic-sparing properties. Reduces sympathetic outflow, producing sedation that closely resembles natural sleep — patients are typically arousable.",
                citationIDs: ["openfda_dexmedetomidine"]
            ),
            dosing: [
                DosingBlock(label: "ICU sedation — loading", body: "1 mcg/kg IV over 10 minutes (loading dose may be omitted to reduce hemodynamic effect).", citationIDs: ["openfda_dexmedetomidine"]),
                DosingBlock(label: "ICU sedation — maintenance", body: "0.2 to 0.7 mcg/kg/hr, titrated to desired sedation level.", citationIDs: ["openfda_dexmedetomidine"]),
                DosingBlock(label: "Procedural sedation — adult", body: "1 mcg/kg IV over 10 min, then 0.6 mcg/kg/hr maintenance, titrated 0.2 to 1 mcg/kg/hr.", citationIDs: ["openfda_dexmedetomidine"]),
                DosingBlock(label: "Dose reduction", body: "Consider lower doses in geriatric patients, hepatic impairment, and patients with hypovolemia or vasoconstriction.", citationIDs: ["openfda_dexmedetomidine"])
            ],
            contraindications: AttributedProse("None listed in FDA labeling, but caution with bradycardia, hypotension, advanced heart block, or severe hepatic impairment.", citationIDs: ["openfda_dexmedetomidine"]),
            warnings: [
                AttributedBullet("Hypotension and bradycardia — most common adverse effects; may require dose reduction or vasopressor/atropine.", citationIDs: ["openfda_dexmedetomidine"]),
                AttributedBullet("Transient hypertension during loading dose due to peripheral vasoconstriction.", citationIDs: ["openfda_dexmedetomidine"]),
                AttributedBullet("Sinus arrest reported; greater risk in patients with high vagal tone.", citationIDs: ["openfda_dexmedetomidine"]),
                AttributedBullet("Discontinuation may produce withdrawal symptoms similar to clonidine — agitation, hypertension, tachycardia.", citationIDs: ["openfda_dexmedetomidine"]),
                AttributedBullet("Hepatic impairment — reduce dose; metabolized in the liver.", citationIDs: ["openfda_dexmedetomidine"])
            ],
            adverseReactions: AttributedProse(
                "Most common: hypotension, bradycardia, dry mouth, nausea. Less common: atrial fibrillation, fever, hypoxia, pleural effusion, hyperglycemia, anemia.",
                citationIDs: ["openfda_dexmedetomidine"]
            ),
            drugInteractions: [
                AttributedBullet("Other anesthetics, sedatives, hypnotics, opioids — additive CNS and hemodynamic effects; consider dose reduction.", citationIDs: ["openfda_dexmedetomidine"]),
                AttributedBullet("Beta-blockers and other vasodilators — additive bradycardia and hypotension.", citationIDs: ["openfda_dexmedetomidine"])
            ],
            nursingImplications: [
                AttributedBullet("Continuous cardiac monitoring required throughout infusion.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Monitor blood pressure and heart rate every 5 minutes during loading; every 15 minutes thereafter.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Have IV fluids, atropine, and vasopressors available for hypotension and bradycardia.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Patients are arousable — communicate with the patient even when sedated.", citationIDs: ["openfda_dexmedetomidine", "openrn_pharmacology_book"]),
                AttributedBullet("Avoid concurrent loading-dose administration in patients with hypovolemia, severe ventricular dysfunction, or pre-existing bradycardia.", citationIDs: ["openfda_dexmedetomidine"])
            ],
            patientTeaching: AttributedProse(
                "You will feel relaxed and may sleep, but you can be awakened to follow commands. Tell the nurse if you feel lightheaded, your heart races, or you feel anxious.",
                citationIDs: ["openrn_pharmacology_book"]
            ),
            citations: [openfda, openrnPharm, ismpHighAlert],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Midazolam (Versed)

public enum MidazolamSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_midazolam",
            shortName: "FDA SPL — Midazolam Hydrochloride",
            detail: "SET ID: 06e4f754-72df-4eb4-aaed-b538524f5277",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "midazolam",
            title: "Midazolam",
            subtitle: "Versed — short-acting benzodiazepine",
            category: "Benzodiazepine",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Short-acting benzodiazepine"),
                KeyValueRow(key: "Onset (IV)", value: "1–5 minutes"),
                KeyValueRow(key: "Half-life", value: "1.8–6.4 hours"),
                KeyValueRow(key: "Reversal agent", value: "Flumazenil")
            ],
            indications: AttributedProse(
                "Pre-procedural sedation, anxiolysis, and amnesia; induction of general anesthesia; sedation of intubated and mechanically ventilated patients in critical care; treatment of status epilepticus (off-label / per protocol). Carries a Boxed Warning for respiratory depression and arrest, particularly when combined with opioids.",
                citationIDs: ["openfda_midazolam"]
            ),
            mechanism: AttributedProse(
                "Binds the benzodiazepine site on the GABA-A receptor, enhancing the inhibitory effect of GABA and producing sedation, anxiolysis, anterograde amnesia, anticonvulsant effect, and skeletal muscle relaxation.",
                citationIDs: ["openfda_midazolam"]
            ),
            dosing: [
                DosingBlock(label: "Pre-procedural sedation (adult, IV)", body: "0.5 to 2 mg slowly over at least 2 minutes, titrated to effect; total dose typically ≤2.5 mg in healthy adults.", citationIDs: ["openfda_midazolam"]),
                DosingBlock(label: "Continuous sedation (ICU adult)", body: "0.02 to 0.1 mg/kg/hr; titrate to sedation goal.", citationIDs: ["openfda_midazolam"]),
                DosingBlock(label: "Status epilepticus (per institutional protocol)", body: "Per facility protocol — IV bolus and continuous infusion regimens vary; ALWAYS confirm with current institutional protocol and provider order.", citationIDs: ["openfda_midazolam"]),
                DosingBlock(label: "Geriatric / debilitated", body: "Reduce dose by 50% or more; titrate slowly.", citationIDs: ["openfda_midazolam"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity to midazolam or other benzodiazepines; acute narrow-angle glaucoma. Use with extreme caution in patients with CNS depression, shock, coma, or alcohol intoxication.",
                citationIDs: ["openfda_midazolam"]
            ),
            warnings: [
                AttributedBullet("BOXED WARNING: Risk of respiratory depression and arrest, particularly with concurrent opioids; resuscitation equipment must be immediately available.", citationIDs: ["openfda_midazolam"]),
                AttributedBullet("Hypotension, especially with rapid IV push or in hypovolemic patients.", citationIDs: ["openfda_midazolam"]),
                AttributedBullet("Paradoxical reactions — agitation, combativeness — particularly in elderly and pediatric patients.", citationIDs: ["openfda_midazolam"]),
                AttributedBullet("Physical dependence with prolonged infusion; taper or transition to longer-acting agent to discontinue.", citationIDs: ["openfda_midazolam"]),
                AttributedBullet("Reduce dose substantially in geriatric, debilitated, hepatic-impaired, and renal-impaired patients.", citationIDs: ["openfda_midazolam"])
            ],
            adverseReactions: AttributedProse(
                "Most common: respiratory depression, hypotension, sedation, headache, hiccups, nausea, vomiting. Serious: respiratory and cardiac arrest with rapid administration or opioid co-administration.",
                citationIDs: ["openfda_midazolam"]
            ),
            drugInteractions: [
                AttributedBullet("Opioids — synergistic respiratory depression; reduce both doses and monitor closely.", citationIDs: ["openfda_midazolam"]),
                AttributedBullet("CYP3A4 inhibitors (azoles, macrolides, protease inhibitors, grapefruit juice) — increase midazolam levels.", citationIDs: ["openfda_midazolam"]),
                AttributedBullet("CYP3A4 inducers (rifampin, phenytoin, carbamazepine) — decrease midazolam levels.", citationIDs: ["openfda_midazolam"]),
                AttributedBullet("Other CNS depressants (alcohol, barbiturates, antipsychotics, antihistamines) — additive sedation.", citationIDs: ["openfda_midazolam"])
            ],
            nursingImplications: [
                AttributedBullet("Continuous cardiac and respiratory monitoring; pulse oximetry and capnography per facility protocol.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Resuscitation equipment, oxygen, and flumazenil at bedside before administration.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Administer slowly — at least 2 minutes for IV push; rapid administration causes apnea.", citationIDs: ["openfda_midazolam", "openrn_pharmacology_book"]),
                AttributedBullet("Reassess level of consciousness and respiratory effort every 5 minutes during procedural sedation.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Independent double-check before high-dose or continuous infusion administration (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024_v2"]),
                AttributedBullet("After prolonged ICU infusion, expect delayed awakening; daily sedation interruption per protocol when appropriate.", citationIDs: ["openrn_pharmacology_book"])
            ],
            patientTeaching: AttributedProse(
                "You will become very drowsy and may not remember the procedure. Do not drive or make important decisions for at least 24 hours afterward. Have a responsible adult to take you home.",
                citationIDs: ["openrn_pharmacology_book"]
            ),
            citations: [openfda, openrnPharm, ismpHighAlert],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Atropine

public enum AtropineSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_atropine",
            shortName: "FDA SPL — Atropine Sulfate Injection",
            detail: "SET ID: 0060b971-19bd-2849-e063-6294a90afca8",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )
        let aha = CitationSource(
            id: "aha_acls_atropine",
            shortName: "AHA Adult ACLS — Bradycardia algorithm (concept citation)",
            detail: "Atropine 1 mg IV bolus q3–5 min, max 3 mg",
            publisher: "American Heart Association",
            license: .factCitationOnly,
            url: "https://cpr.heart.org/en/resuscitation-science/cpr-and-ecc-guidelines",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "atropine",
            title: "Atropine",
            subtitle: "Atropine sulfate — anticholinergic",
            category: "Anticholinergic",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Muscarinic antagonist (anticholinergic)"),
                KeyValueRow(key: "Onset (IV)", value: "Immediate"),
                KeyValueRow(key: "Half-life", value: "≈4 hours"),
                KeyValueRow(key: "Common forms", value: "0.4, 0.5, 1 mg/mL prefilled syringes")
            ],
            indications: AttributedProse(
                "Treatment of symptomatic bradycardia and certain types of heart block; antidote for organophosphate or carbamate poisoning and muscarinic mushroom poisoning; pre-anesthetic to reduce secretions; adjunct in cycloplegic refraction (ophthalmic).",
                citationIDs: ["openfda_atropine"]
            ),
            mechanism: AttributedProse(
                "Competitive antagonist at muscarinic acetylcholine receptors. Increases heart rate by blocking vagal effects on the SA and AV nodes. Reduces secretions, dilates pupils, decreases GI motility.",
                citationIDs: ["openfda_atropine"]
            ),
            dosing: [
                DosingBlock(label: "Bradycardia (adult, AHA ACLS)", body: "1 mg IV bolus every 3–5 minutes; maximum total dose 3 mg.", citationIDs: ["openfda_atropine", "aha_acls_atropine"]),
                DosingBlock(label: "Organophosphate / carbamate poisoning", body: "Doubling-dose strategy — 1 to 6 mg IV initially, doubled every 5 minutes until secretions are dried; very large total doses may be required.", citationIDs: ["openfda_atropine"]),
                DosingBlock(label: "Pre-anesthesia", body: "0.4 to 0.6 mg IV/IM 30–60 minutes before anesthesia.", citationIDs: ["openfda_atropine"])
            ],
            contraindications: AttributedProse(
                "Acute narrow-angle glaucoma; obstructive uropathy; myasthenia gravis (unless used for specific paradoxical bradycardia); paralytic ileus; tachyarrhythmias; thyrotoxicosis; severe ulcerative colitis.",
                citationIDs: ["openfda_atropine"]
            ),
            warnings: [
                AttributedBullet("Doses below 0.5 mg in adults can paradoxically slow the heart rate.", citationIDs: ["openfda_atropine", "aha_acls_atropine"]),
                AttributedBullet("Heat illness — atropine inhibits sweating; risk of hyperthermia in hot environments.", citationIDs: ["openfda_atropine"]),
                AttributedBullet("Anticholinergic toxicity — 'hot as a hare, dry as a bone, red as a beet, blind as a bat, mad as a hatter, full as a flask.'", citationIDs: ["openfda_atropine"]),
                AttributedBullet("Caution in elderly — confusion, urinary retention more common.", citationIDs: ["openfda_atropine"])
            ],
            adverseReactions: AttributedProse(
                "Tachycardia, palpitations, dry mouth, urinary retention, blurred vision, mydriasis, photophobia, decreased GI motility, flushing, hyperthermia, confusion (especially elderly).",
                citationIDs: ["openfda_atropine"]
            ),
            drugInteractions: [
                AttributedBullet("Other anticholinergics (antihistamines, TCAs, antipsychotics) — additive effect.", citationIDs: ["openfda_atropine"]),
                AttributedBullet("Decreased absorption of slowly-dissolving oral medications due to slowed gastric emptying.", citationIDs: ["openfda_atropine"])
            ],
            nursingImplications: [
                AttributedBullet("Continuous cardiac monitoring during IV administration.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Reassess heart rate and blood pressure 5 minutes after each dose.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Have transcutaneous pacing available for refractory bradycardia.", citationIDs: ["aha_acls_atropine"]),
                AttributedBullet("Monitor for urinary retention, especially in elderly males with BPH.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Use cautiously after heart transplant — denervated heart does not respond to atropine.", citationIDs: ["aha_acls_atropine"])
            ],
            patientTeaching: AttributedProse(
                "You may notice dry mouth, blurred vision, or warmth/flushing. Avoid driving until vision returns to normal. Stay cool — atropine reduces your ability to sweat.",
                citationIDs: ["openrn_pharmacology_book"]
            ),
            citations: [openfda, openrnPharm, aha],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Adenosine

public enum AdenosineSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_adenosine",
            shortName: "FDA SPL — Adenosine Injection",
            detail: "SET ID: 1809fc7e-f5d8-18d8-e063-6394a90a7713",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )
        let aha = CitationSource(
            id: "aha_acls_adenosine",
            shortName: "AHA Adult ACLS — Tachycardia algorithm (concept citation)",
            publisher: "American Heart Association",
            license: .factCitationOnly,
            url: "https://cpr.heart.org/en/resuscitation-science/cpr-and-ecc-guidelines",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "adenosine",
            title: "Adenosine",
            subtitle: "Adenocard — antiarrhythmic for SVT",
            category: "Antiarrhythmic",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Endogenous nucleoside (Vaughan-Williams V)"),
                KeyValueRow(key: "Onset", value: "Immediate"),
                KeyValueRow(key: "Half-life", value: "<10 seconds"),
                KeyValueRow(key: "Common forms", value: "6 mg/2 mL or 12 mg/4 mL vials")
            ],
            indications: AttributedProse(
                "Conversion to sinus rhythm of paroxysmal supraventricular tachycardia (PSVT), including PSVT associated with accessory bypass tracts (Wolff-Parkinson-White syndrome). Diagnostic adenosine stress testing (separate formulation).",
                citationIDs: ["openfda_adenosine"]
            ),
            mechanism: AttributedProse(
                "Slows conduction through the AV node, interrupts re-entry pathways through the AV node, and restores normal sinus rhythm. Has very brief duration of action because of rapid uptake into cells and metabolism.",
                citationIDs: ["openfda_adenosine"]
            ),
            dosing: [
                DosingBlock(label: "Initial dose (adult)", body: "6 mg rapid IV bolus over 1–2 seconds, immediately followed by a 20 mL saline flush, with arm elevated.", citationIDs: ["openfda_adenosine"]),
                DosingBlock(label: "Second dose if needed", body: "If PSVT not resolved within 1–2 minutes, give 12 mg rapid IV bolus with saline flush.", citationIDs: ["openfda_adenosine"]),
                DosingBlock(label: "Third dose if needed", body: "May repeat 12 mg rapid IV bolus once.", citationIDs: ["openfda_adenosine"]),
                DosingBlock(label: "Administration site", body: "Use a port closest to the patient (proximal IV preferred — antecubital or higher) due to ultra-short half-life.", citationIDs: ["openfda_adenosine"])
            ],
            contraindications: AttributedProse(
                "Second- or third-degree AV block (except in patients with a functioning artificial pacemaker); sick sinus syndrome (except with pacemaker); known hypersensitivity; symptomatic bradycardia; bronchoconstrictive or bronchospastic lung disease (asthma, COPD with severe bronchospasm).",
                citationIDs: ["openfda_adenosine"]
            ),
            warnings: [
                AttributedBullet("Brief asystole (typically <10 seconds) is expected after administration. Continuous ECG monitoring required.", citationIDs: ["openfda_adenosine"]),
                AttributedBullet("New rhythm disturbances at the time of conversion — VPCs, atrial fibrillation, sinus bradycardia, AV block.", citationIDs: ["openfda_adenosine"]),
                AttributedBullet("Bronchoconstriction in susceptible patients — have bronchodilator available.", citationIDs: ["openfda_adenosine"]),
                AttributedBullet("Cardiac transplant patients — markedly increased sensitivity; reduce dose.", citationIDs: ["openfda_adenosine"]),
                AttributedBullet("Methylxanthines (caffeine, theophylline) antagonize the effect; dipyridamole and carbamazepine potentiate it.", citationIDs: ["openfda_adenosine"])
            ],
            adverseReactions: AttributedProse(
                "Common (often distressing but brief): facial flushing, dyspnea or chest pressure, nausea, lightheadedness, brief asystole, headache. Patients should be warned these will pass quickly.",
                citationIDs: ["openfda_adenosine"]
            ),
            drugInteractions: [
                AttributedBullet("Methylxanthines (caffeine, theophylline) antagonize adenosine — patient may need a higher dose.", citationIDs: ["openfda_adenosine"]),
                AttributedBullet("Dipyridamole potentiates adenosine — reduce dose substantially.", citationIDs: ["openfda_adenosine"]),
                AttributedBullet("Carbamazepine — may potentiate higher-degree heart block.", citationIDs: ["openfda_adenosine"])
            ],
            nursingImplications: [
                AttributedBullet("Continuous ECG monitoring; print rhythm strip before, during, and after administration.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Use a 3-way stopcock setup with the saline flush ready; push adenosine and immediately push the saline flush — speed is critical.", citationIDs: ["openfda_adenosine", "openrn_pharmacology_book"]),
                AttributedBullet("Warn the patient: 'You may feel a wave of chest pressure or like you can't breathe — it will pass in seconds. We're watching you closely.'", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Have advanced airway equipment, atropine, transcutaneous pacing, and crash cart available.", citationIDs: ["aha_acls_adenosine"]),
                AttributedBullet("Reassess rhythm, BP, and patient symptoms immediately after each dose.", citationIDs: ["openrn_pharmacology_book"])
            ],
            patientTeaching: AttributedProse(
                "You may feel a strong sensation of chest pressure, flushing, or shortness of breath for a few seconds. This is expected and will pass quickly. Tell the nurse if anything feels unusual.",
                citationIDs: ["openrn_pharmacology_book"]
            ),
            citations: [openfda, openrnPharm, aha],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Magnesium Sulfate

public enum MagnesiumSulfateSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_magnesium_sulfate",
            shortName: "FDA SPL — Magnesium Sulfate in Dextrose Injection",
            detail: "SET ID: 03ebeabb-8386-4af4-3086-bdf3c3fc4a5a",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "magnesium-sulfate",
            title: "Magnesium sulfate",
            subtitle: "Anticonvulsant · electrolyte replacement",
            category: "Electrolyte",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Electrolyte / anticonvulsant"),
                KeyValueRow(key: "Onset (IV)", value: "Immediate"),
                KeyValueRow(key: "Therapeutic level (eclampsia)", value: "4–8 mg/dL"),
                KeyValueRow(key: "Reversal", value: "Calcium gluconate (1 g IV)")
            ],
            indications: AttributedProse(
                "Prevention and control of seizures in severe preeclampsia and eclampsia; treatment of acute nephritis with hypertension and seizures in pediatric patients; replacement therapy for hypomagnesemia. Adjunct in torsades de pointes (concept citation: AHA ACLS).",
                citationIDs: ["openfda_magnesium_sulfate"]
            ),
            mechanism: AttributedProse(
                "Magnesium is a critical cofactor for many enzyme systems. In the cardiovascular system, it antagonizes calcium and stabilizes the resting membrane potential, suppressing arrhythmias. In the CNS, it may decrease neuromuscular transmission, producing the anticonvulsant effect.",
                citationIDs: ["openfda_magnesium_sulfate"]
            ),
            dosing: [
                DosingBlock(label: "Severe preeclampsia / eclampsia (loading)", body: "4 to 6 g IV over 15 to 30 minutes.", citationIDs: ["openfda_magnesium_sulfate"]),
                DosingBlock(label: "Severe preeclampsia / eclampsia (maintenance)", body: "1 to 3 g/hour continuous IV infusion, titrated to clinical response and serum magnesium levels.", citationIDs: ["openfda_magnesium_sulfate"]),
                DosingBlock(label: "Hypomagnesemia (mild)", body: "1 to 2 g IV over 1 hour.", citationIDs: ["openfda_magnesium_sulfate"]),
                DosingBlock(label: "Severe hypomagnesemia", body: "Higher doses per provider order; replace cautiously and monitor reflexes and respiration.", citationIDs: ["openfda_magnesium_sulfate"])
            ],
            contraindications: AttributedProse(
                "Heart block; myocardial damage; severe renal impairment (use with extreme caution and dose adjustment).",
                citationIDs: ["openfda_magnesium_sulfate"]
            ),
            warnings: [
                AttributedBullet("Magnesium toxicity — loss of deep tendon reflexes is the EARLIEST sign; respiratory depression and cardiac arrest at higher levels.", citationIDs: ["openfda_magnesium_sulfate"]),
                AttributedBullet("Renal impairment — magnesium is renally excreted; dose adjust and monitor serum levels closely.", citationIDs: ["openfda_magnesium_sulfate"]),
                AttributedBullet("Crosses the placenta — neonatal magnesium toxicity (respiratory depression, hypotonia) possible after maternal use.", citationIDs: ["openfda_magnesium_sulfate"]),
                AttributedBullet("Calcium gluconate is the antidote for magnesium toxicity — keep at the bedside during eclampsia treatment.", citationIDs: ["openfda_magnesium_sulfate"])
            ],
            adverseReactions: AttributedProse(
                "Flushing, sweating, nausea, hypotension, depressed reflexes, weakness, drowsiness. Severe: respiratory depression, cardiac conduction changes, cardiac arrest.",
                citationIDs: ["openfda_magnesium_sulfate"]
            ),
            drugInteractions: [
                AttributedBullet("Neuromuscular blockers — additive effect; potentiated paralysis.", citationIDs: ["openfda_magnesium_sulfate"]),
                AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_magnesium_sulfate"]),
                AttributedBullet("Calcium-containing solutions — antagonize magnesium effect.", citationIDs: ["openfda_magnesium_sulfate"])
            ],
            nursingImplications: [
                AttributedBullet("Independent double-check before initiation and any rate change (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024_v2"]),
                AttributedBullet("Monitor deep tendon reflexes (typically patellar) every hour during eclampsia infusion — diminished or absent reflexes signal toxicity. STOP infusion and notify provider.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Monitor respiratory rate (must be ≥12), urine output (≥30 mL/hr), and serum magnesium per protocol.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Calcium gluconate 1 g IV at the bedside as antidote.", citationIDs: ["openfda_magnesium_sulfate", "openrn_pharmacology_book"]),
                AttributedBullet("Continuous fetal monitoring during obstetric use.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Use an infusion pump — never gravity drip.", citationIDs: ["openrn_pharmacology_book"])
            ],
            patientTeaching: AttributedProse(
                "You may feel warm or flushed during the infusion. Tell the nurse if you feel weak, short of breath, or your vision changes.",
                citationIDs: ["openrn_pharmacology_book"]
            ),
            citations: [openfda, openrnPharm, ismpHighAlert],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Calcium Gluconate

public enum CalciumGluconateSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_calcium_gluconate",
            shortName: "FDA SPL — Calcium Gluconate in Sodium Chloride Injection",
            detail: "SET ID: 0deed071-d89d-420e-b4b4-797dce0ad8f0",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "calcium-gluconate",
            title: "Calcium gluconate",
            subtitle: "Electrolyte replacement · hyperkalemia membrane stabilizer",
            category: "Electrolyte",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Calcium salt / electrolyte"),
                KeyValueRow(key: "Onset (IV)", value: "Immediate"),
                KeyValueRow(key: "Common forms", value: "1 g/10 mL (10% solution)"),
                KeyValueRow(key: "Elemental Ca", value: "1 g calcium gluconate ≈ 90 mg elemental calcium")
            ],
            indications: AttributedProse(
                "Acute symptomatic hypocalcemia; cardiac membrane stabilization in hyperkalemia (does NOT lower potassium — buys time while other agents act); calcium channel blocker overdose; magnesium toxicity (antidote); citrate toxicity from massive transfusion.",
                citationIDs: ["openfda_calcium_gluconate"]
            ),
            mechanism: AttributedProse(
                "Restores calcium needed for cellular function. In hyperkalemia, raises the cardiac myocyte threshold potential, stabilizing the membrane and reducing the risk of arrhythmia (does not affect serum potassium).",
                citationIDs: ["openfda_calcium_gluconate"]
            ),
            dosing: [
                DosingBlock(label: "Hyperkalemia membrane stabilization (adult)", body: "1 to 2 g (10 to 20 mL of 10% solution) IV slow push over 5 to 10 minutes; repeat in 5 minutes if ECG changes persist.", citationIDs: ["openfda_calcium_gluconate"]),
                DosingBlock(label: "Symptomatic hypocalcemia (adult)", body: "1 to 2 g IV over 10 minutes, may repeat as needed; follow with infusion if persistent.", citationIDs: ["openfda_calcium_gluconate"]),
                DosingBlock(label: "Calcium channel blocker overdose", body: "Per institutional protocol — typically 1 to 3 g IV bolus, may require repeat dosing or infusion.", citationIDs: ["openfda_calcium_gluconate"]),
                DosingBlock(label: "Magnesium toxicity (antidote)", body: "1 g IV over 10 minutes.", citationIDs: ["openfda_calcium_gluconate"])
            ],
            contraindications: AttributedProse(
                "Hypercalcemia; ventricular fibrillation during cardiac resuscitation; concurrent IV digitalis (cardiac glycoside) administration — calcium markedly potentiates digoxin toxicity.",
                citationIDs: ["openfda_calcium_gluconate"]
            ),
            warnings: [
                AttributedBullet("Tissue necrosis with extravasation — infiltration causes severe tissue damage. Prefer central line; if peripheral, dilute and infuse slowly.", citationIDs: ["openfda_calcium_gluconate"]),
                AttributedBullet("Rapid IV administration causes vasodilation, hypotension, bradycardia, arrhythmias, syncope, cardiac arrest.", citationIDs: ["openfda_calcium_gluconate"]),
                AttributedBullet("Incompatible with bicarbonate, phosphate, and many antibiotics — precipitates form. Flush IV line between administrations.", citationIDs: ["openfda_calcium_gluconate"]),
                AttributedBullet("Severe enhancement of digoxin toxicity — avoid concurrent administration in digitalized patients unless treating life-threatening hyperkalemia.", citationIDs: ["openfda_calcium_gluconate"])
            ],
            adverseReactions: AttributedProse(
                "Common: tingling, sensation of warmth or heat, calcium taste in mouth. Severe: hypotension, bradycardia, arrhythmias, cardiac arrest with rapid administration; tissue necrosis with extravasation.",
                citationIDs: ["openfda_calcium_gluconate"]
            ),
            drugInteractions: [
                AttributedBullet("Digitalis glycosides — markedly increased risk of arrhythmia. Avoid IV calcium in digitalized patients except for life-threatening situations.", citationIDs: ["openfda_calcium_gluconate"]),
                AttributedBullet("Calcium channel blockers — calcium antagonizes their effect (basis for use in CCB overdose).", citationIDs: ["openfda_calcium_gluconate"]),
                AttributedBullet("Bicarbonate, phosphate, ceftriaxone — incompatible; precipitates form.", citationIDs: ["openfda_calcium_gluconate"])
            ],
            nursingImplications: [
                AttributedBullet("Continuous cardiac monitoring during IV administration.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Use a large vein with secure IV access; central line preferred for repeated dosing or large volumes.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Flush line before and after administration if other medications are running on the same line.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Monitor for extravasation throughout administration — pain, swelling, blanching at site warrants immediate stop.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("In hyperkalemia, calcium does NOT lower potassium — must follow with insulin/dextrose, beta-agonist, sodium polystyrene/patiromer, or dialysis to actually remove potassium.", citationIDs: ["openrn_pharmacology_book"])
            ],
            patientTeaching: AttributedProse(
                "You may feel a warm or tingling sensation during the infusion. Tell the nurse immediately if you have pain at the IV site, dizziness, or your heart feels different.",
                citationIDs: ["openrn_pharmacology_book"]
            ),
            citations: [openfda, openrnPharm],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}

// MARK: - Levetiracetam (Keppra)

public enum LevetiracetamSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_levetiracetam",
            shortName: "FDA SPL — Levetiracetam Injection",
            detail: "SET ID: 097e5606-dd5e-4518-ab97-f71f68786444",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-04"
        )

        return DrugEntry(
            id: "levetiracetam",
            title: "Levetiracetam",
            subtitle: "Keppra — broad-spectrum anticonvulsant",
            category: "Anticonvulsant",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Anticonvulsant (SV2A binder)"),
                KeyValueRow(key: "Onset (IV)", value: "Within minutes; therapeutic levels rapid"),
                KeyValueRow(key: "Half-life", value: "≈6–8 hours (longer in renal impairment)"),
                KeyValueRow(key: "Bioavailability (oral)", value: "≈100% — IV and oral are 1:1")
            ],
            indications: AttributedProse(
                "Adjunctive therapy in adults and pediatric patients for partial-onset seizures, myoclonic seizures (juvenile myoclonic epilepsy), and primary generalized tonic-clonic seizures. IV form is for use when oral administration is temporarily not feasible.",
                citationIDs: ["openfda_levetiracetam"]
            ),
            mechanism: AttributedProse(
                "Binds synaptic vesicle protein SV2A in the brain, modulating neurotransmitter release. The exact anticonvulsant mechanism is not fully understood.",
                citationIDs: ["openfda_levetiracetam"]
            ),
            dosing: [
                DosingBlock(label: "Adult — initial", body: "500 mg PO or IV twice daily; may increase by 1000 mg/day every 2 weeks to a maximum of 3000 mg/day.", citationIDs: ["openfda_levetiracetam"]),
                DosingBlock(label: "IV administration", body: "Dilute in 100 mL compatible diluent; infuse over 15 minutes.", citationIDs: ["openfda_levetiracetam"]),
                DosingBlock(label: "Renal dose adjustment", body: "Required for CrCl <80 mL/min; consult dosing reference. Patients on hemodialysis require a supplemental dose after each session.", citationIDs: ["openfda_levetiracetam"]),
                DosingBlock(label: "Conversion oral / IV", body: "1:1 ratio — no dose change needed.", citationIDs: ["openfda_levetiracetam"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity to levetiracetam.",
                citationIDs: ["openfda_levetiracetam"]
            ),
            warnings: [
                AttributedBullet("Behavioral abnormalities — somnolence, fatigue, dizziness, mood changes (irritability, depression, anxiety, psychosis). Monitor and report.", citationIDs: ["openfda_levetiracetam"]),
                AttributedBullet("Suicidal behavior and ideation — class warning for all antiepileptic drugs.", citationIDs: ["openfda_levetiracetam"]),
                AttributedBullet("Anaphylaxis and angioedema reported.", citationIDs: ["openfda_levetiracetam"]),
                AttributedBullet("Serious dermatologic reactions — Stevens-Johnson syndrome, toxic epidermal necrolysis. Discontinue at first sign of rash.", citationIDs: ["openfda_levetiracetam"]),
                AttributedBullet("Withdrawal seizures with abrupt discontinuation — taper unless emergency requires immediate stop.", citationIDs: ["openfda_levetiracetam"]),
                AttributedBullet("Coordination difficulties — counsel against driving or operating machinery until response is known.", citationIDs: ["openfda_levetiracetam"])
            ],
            adverseReactions: AttributedProse(
                "Most common: somnolence, asthenia, headache, infection, dizziness, irritability. Pediatric: behavioral changes, anorexia, agitation.",
                citationIDs: ["openfda_levetiracetam"]
            ),
            drugInteractions: [
                AttributedBullet("Minimal cytochrome P450 interactions; not significantly bound to plasma proteins.", citationIDs: ["openfda_levetiracetam"]),
                AttributedBullet("Other CNS depressants — additive sedation.", citationIDs: ["openfda_levetiracetam"])
            ],
            nursingImplications: [
                AttributedBullet("Assess seizure frequency, character, duration; document baseline.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Monitor for behavioral changes, particularly in pediatric patients — report to provider.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Renal function monitoring — adjust dose for impairment.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Do not abruptly discontinue — withdraw gradually unless emergent.", citationIDs: ["openfda_levetiracetam"]),
                AttributedBullet("Implement seizure precautions per facility protocol — bed rails padded, oxygen and suction available, position safely.", citationIDs: ["openrn_pharmacology_book"]),
                AttributedBullet("Educate on suicidal ideation warning — report any new or worsening depression.", citationIDs: ["openfda_levetiracetam"])
            ],
            patientTeaching: AttributedProse(
                "Take exactly as prescribed; do not stop suddenly. Report any new mood changes, depression, thoughts of self-harm, or rash to your provider immediately. Do not drive until you know how this medication affects you.",
                citationIDs: ["openrn_pharmacology_book"]
            ),
            citations: [openfda, openrnPharm],
            lastSourceFidelityReview: "2026-05-04"
        )
    }()
}
