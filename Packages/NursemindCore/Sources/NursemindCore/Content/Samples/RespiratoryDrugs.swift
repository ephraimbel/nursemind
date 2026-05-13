import Foundation

// Curator-model respiratory drug entries (v1.5 expansion).
// Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology — Respiratory (CC BY 4.0).

private let openfda = CitationSource(
    id: "openfda_resp",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_resp",
    shortName: "Open RN Nursing Pharmacology — Respiratory Therapy",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=respiratory+albuterol+inhaler+steroid",
    lastRetrieved: "2026-05-04"
)

// MARK: - Ipratropium

public enum IpratropiumSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ipratropium",
        title: "Ipratropium",
        subtitle: "Atrovent · short-acting muscarinic antagonist (SAMA)",
        category: "Anticholinergic Bronchodilator",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Short-acting muscarinic antagonist (SAMA)"),
            KeyValueRow(key: "Onset", value: "15 min; peak 1–2 hr"),
            KeyValueRow(key: "Duration", value: "4–6 hr"),
            KeyValueRow(key: "Common combo", value: "DuoNeb (with albuterol) for COPD exacerbation")
        ],
        indications: AttributedProse(
            "Maintenance bronchodilation in COPD. Acute COPD exacerbations (often combined with albuterol). Off-label asthma exacerbation in ED.",
            citationIDs: ["openfda_resp"]
        ),
        mechanism: AttributedProse(
            "Anticholinergic — blocks muscarinic acetylcholine receptors in airway smooth muscle, reducing vagal-mediated bronchoconstriction.",
            citationIDs: ["openfda_resp", "openrn_pharm_resp"]
        ),
        dosing: [
            DosingBlock(label: "Nebulizer (acute)", body: "500 mcg every 6–8 hours (often combined with albuterol 2.5 mg as DuoNeb).", citationIDs: ["openfda_resp"]),
            DosingBlock(label: "MDI (chronic)", body: "2 inhalations (17 mcg each) every 6 hours; max 12 puffs/24 hr.", citationIDs: ["openfda_resp"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to ipratropium, atropine, or related compounds. Caution with peanut/soy allergy (some MDI formulations).",
            citationIDs: ["openfda_resp"]
        ),
        warnings: [
            AttributedBullet("Acute angle-closure glaucoma — protect eyes from nebulized mist (use mouthpiece, not mask, when possible).", citationIDs: ["openfda_resp"]),
            AttributedBullet("Urinary retention, especially in patients with prostatic hyperplasia.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Paradoxical bronchospasm — discontinue if it occurs.", citationIDs: ["openfda_resp"])
        ],
        adverseReactions: AttributedProse(
            "Dry mouth, cough, headache, dizziness, hoarseness, nausea. Rare urinary retention, blurred vision, palpitations.",
            citationIDs: ["openfda_resp"]
        ),
        drugInteractions: [
            AttributedBullet("Other anticholinergics (oxybutynin, scopolamine, tricyclics) — additive systemic anticholinergic effects.", citationIDs: ["openfda_resp"])
        ],
        nursingImplications: [
            AttributedBullet("Use mouthpiece rather than mask when possible — mist contact with eyes can precipitate angle closure.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("If MDI: shake well, use spacer for adequate delivery; teach inhaler technique.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Combined nebs (DuoNeb): give albuterol AND ipratropium together for synergistic bronchodilation in acute COPD.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Monitor for urinary retention in elderly males, blurred vision, glaucoma symptoms.", citationIDs: ["openrn_pharm_resp"])
        ],
        patientTeaching: AttributedProse(
            "Use as directed. Rinse your mouth after to reduce dry mouth. Avoid spraying near your eyes — it can cause eye pain or vision changes. Keep your rescue inhaler (albuterol) for sudden symptoms.",
            citationIDs: ["openrn_pharm_resp"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Fluticasone-Salmeterol

public enum FluticasoneSalmeterolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fluticasone-salmeterol",
        title: "Fluticasone / Salmeterol",
        subtitle: "Advair · combination ICS + LABA inhaler",
        category: "Combination ICS + LABA",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Inhaled corticosteroid + long-acting β2-agonist"),
            KeyValueRow(key: "Onset", value: "Hours; full benefit over weeks"),
            KeyValueRow(key: "Duration", value: "12 hours (BID dosing)"),
            KeyValueRow(key: "Use", value: "Maintenance — NOT a rescue inhaler")
        ],
        indications: AttributedProse(
            "Maintenance treatment of asthma in patients ≥4 years (when not adequately controlled on ICS alone). Maintenance treatment of COPD.",
            citationIDs: ["openfda_resp"]
        ),
        mechanism: AttributedProse(
            "Fluticasone (corticosteroid) reduces airway inflammation; salmeterol (LABA) provides sustained bronchodilation via β2 receptor stimulation.",
            citationIDs: ["openfda_resp", "openrn_pharm_resp"]
        ),
        dosing: [
            DosingBlock(label: "Asthma (Advair Diskus)", body: "1 inhalation BID (100/50, 250/50, or 500/50 mcg) — dose by severity.", citationIDs: ["openfda_resp"]),
            DosingBlock(label: "Asthma (Advair HFA MDI)", body: "2 inhalations BID (45/21, 115/21, 230/21 mcg).", citationIDs: ["openfda_resp"]),
            DosingBlock(label: "COPD (Advair Diskus 250/50)", body: "1 inhalation BID — only the 250/50 strength is FDA-approved for COPD.", citationIDs: ["openfda_resp"])
        ],
        contraindications: AttributedProse(
            "Primary treatment of acute asthma or status asthmaticus (NOT a rescue inhaler). Hypersensitivity to milk proteins (Diskus) or any component.",
            citationIDs: ["openfda_resp"]
        ),
        warnings: [
            AttributedBullet("Boxed warning (LABA): asthma-related deaths reported with LABA monotherapy — only use combined ICS + LABA in asthma.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Oropharyngeal candidiasis (thrush) and dysphonia from ICS — rinse mouth after each dose.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Adrenal suppression with high-dose long-term use.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Pneumonia risk increased in COPD with ICS use.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Reduced bone density and growth velocity in pediatric patients with prolonged use.", citationIDs: ["openfda_resp"])
        ],
        adverseReactions: AttributedProse(
            "Oropharyngeal candidiasis, dysphonia, headache, throat irritation, upper respiratory infection, palpitations, tremor, increased pneumonia risk in COPD.",
            citationIDs: ["openfda_resp"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, clarithromycin, ritonavir) — increase fluticasone exposure → systemic steroid effects.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Beta-blockers — reduce bronchodilator effect; non-cardioselective most problematic.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Other LABA — DO NOT combine multiple LABAs.", citationIDs: ["openfda_resp"])
        ],
        nursingImplications: [
            AttributedBullet("Verify patient understands this is MAINTENANCE, not RESCUE — they still need albuterol for sudden symptoms.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Teach inhaler technique — Diskus vs HFA differs. Use spacer with HFA.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Counsel to RINSE MOUTH AND SPIT after each dose — prevents thrush and dysphonia.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Use BID at the same times each day — every 12 hours.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Document peak flow or symptom diary for asthma; monitor for pneumonia signs in COPD.", citationIDs: ["openrn_pharm_resp"])
        ],
        patientTeaching: AttributedProse(
            "This is your DAILY controller, not a rescue inhaler. Use it twice a day, even when you feel well. Keep albuterol available for sudden symptoms. Rinse your mouth and spit after every dose. Bring all inhalers to every appointment.",
            citationIDs: ["openrn_pharm_resp"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tramadol

public enum TramadolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tramadol",
        title: "Tramadol",
        subtitle: "Ultram · ConZip · centrally-acting analgesic (Schedule IV)",
        category: "Opioid Analgesic (Atypical)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Centrally-acting analgesic — μ-opioid agonist + SNRI activity"),
            KeyValueRow(key: "Onset", value: "1 hr (IR)"),
            KeyValueRow(key: "Half-life", value: "5–7 hr"),
            KeyValueRow(key: "Schedule", value: "DEA Schedule IV")
        ],
        indications: AttributedProse(
            "Moderate to moderately severe pain in adults.",
            citationIDs: ["openfda_resp"]
        ),
        mechanism: AttributedProse(
            "Weak μ-opioid receptor agonist plus inhibition of serotonin and norepinephrine reuptake. Active metabolite (M1) provides most opioid effect; metabolism is CYP2D6-dependent — wide variation in response.",
            citationIDs: ["openfda_resp", "openrn_pharm_resp"]
        ),
        dosing: [
            DosingBlock(label: "Adult (IR)", body: "50–100 mg PO every 4–6 hours; max 400 mg/day (300 mg/day in elderly).", citationIDs: ["openfda_resp"]),
            DosingBlock(label: "Adult (ER)", body: "100 mg PO daily, titrate by 100 mg every 5 days; max 300 mg/day.", citationIDs: ["openfda_resp"]),
            DosingBlock(label: "Renal/hepatic impairment", body: "Reduce dose and extend interval per package insert.", citationIDs: ["openfda_resp"])
        ],
        contraindications: AttributedProse(
            "Children <12 years (boxed warning — fatal respiratory depression in ultra-rapid CYP2D6 metabolizers). Post-op pain in children <18 after tonsillectomy/adenoidectomy. Severe respiratory depression. Acute or severe asthma. GI obstruction. Concurrent or recent (14 days) MAOI. Hypersensitivity.",
            citationIDs: ["openfda_resp"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: addiction, abuse, misuse — Schedule IV.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Boxed warning: life-threatening respiratory depression, especially in CYP2D6 ultra-rapid metabolizers, elderly, debilitated, or with concurrent CNS depressants.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Boxed warning: neonatal opioid withdrawal syndrome with prolonged maternal use.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Seizure risk — increased with high doses, history of seizures, or concurrent serotonergic/tricyclic agents.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Serotonin syndrome — risk with SSRIs, SNRIs, MAOIs, triptans, linezolid, methylene blue.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Hypoglycemia and hyponatremia reported.", citationIDs: ["openfda_resp"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, nausea, vomiting, constipation, headache, somnolence, sweating, dry mouth, pruritus, seizures (rare), serotonin syndrome (rare), hypoglycemia.",
            citationIDs: ["openfda_resp"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated; serotonin syndrome.", citationIDs: ["openfda_resp"]),
            AttributedBullet("SSRIs, SNRIs, TCAs, triptans, linezolid — additive serotonin syndrome risk.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Other CNS depressants (benzodiazepines, alcohol, gabapentin) — additive respiratory depression.", citationIDs: ["openfda_resp"]),
            AttributedBullet("CYP2D6 inhibitors (paroxetine, fluoxetine, bupropion) — reduce conversion to active M1 → reduced analgesia.", citationIDs: ["openfda_resp"]),
            AttributedBullet("CYP3A4 inducers (rifampin, carbamazepine) — reduce tramadol levels.", citationIDs: ["openfda_resp"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification per facility opioid policy.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Assess pain, sedation, respiratory rate, and bowel movements at each dose.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Monitor for serotonin syndrome — agitation, hyperthermia, clonus, autonomic instability.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Implement bowel regimen (docusate + senna) prophylactically.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Counsel against alcohol and other CNS depressants; teach about overdose risk.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Naloxone partially reverses tramadol but may not reverse seizures or serotonin syndrome.", citationIDs: ["openrn_pharm_resp"])
        ],
        patientTeaching: AttributedProse(
            "This is an opioid — do not combine with alcohol, sleep aids, or other pain medications without telling your provider. Avoid driving until you know how it affects you. Drink fluids and add fiber to prevent constipation. Tell your provider about all medications, including over-the-counter and herbal — many interact dangerously.",
            citationIDs: ["openrn_pharm_resp"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Oxycodone

public enum OxycodoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "oxycodone",
        title: "Oxycodone",
        subtitle: "Roxicodone · OxyContin (ER) · semi-synthetic opioid",
        category: "Opioid Analgesic",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "μ-opioid agonist"),
            KeyValueRow(key: "Onset", value: "10–30 min PO IR"),
            KeyValueRow(key: "Half-life", value: "3–5 hr (IR)"),
            KeyValueRow(key: "Schedule", value: "DEA Schedule II")
        ],
        indications: AttributedProse(
            "Moderate to severe pain. ER formulation for around-the-clock pain in opioid-tolerant patients only.",
            citationIDs: ["openfda_resp"]
        ),
        mechanism: AttributedProse(
            "μ-opioid receptor agonist — analgesia, sedation, respiratory depression, GI slowing. Approximately 1.5× more potent than morphine PO.",
            citationIDs: ["openfda_resp", "openrn_pharm_resp"]
        ),
        dosing: [
            DosingBlock(label: "Adult IR (opioid-naive)", body: "5–10 mg PO every 4–6 hours as needed; titrate to effect.", citationIDs: ["openfda_resp"]),
            DosingBlock(label: "Adult ER (OxyContin)", body: "Opioid-TOLERANT only. 10 mg PO every 12 hours; titrate. Do NOT crush, chew, or split.", citationIDs: ["openfda_resp"]),
            DosingBlock(label: "Combination products", body: "Oxycodone + acetaminophen (Percocet 5/325, 7.5/325, 10/325) — limit by acetaminophen 4 g/day.", citationIDs: ["openfda_resp"])
        ],
        contraindications: AttributedProse(
            "Severe respiratory depression. Acute or severe asthma without monitoring. Known or suspected GI obstruction (paralytic ileus). Hypersensitivity.",
            citationIDs: ["openfda_resp"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: addiction, abuse, misuse — Schedule II controlled substance.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Boxed warning: respiratory depression — assess prior to and within 24–72 hours of initiation; risk highest in opioid-naive, elderly, debilitated, hepatic/renal impairment.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Boxed warning: combining with benzodiazepines or other CNS depressants → fatal respiratory depression.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Boxed warning: ER formulations — accidental ingestion, especially by children, can be fatal.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Boxed warning: neonatal opioid withdrawal syndrome.", citationIDs: ["openfda_resp"]),
            AttributedBullet("Adrenal insufficiency, hypotension, increased ICP all reported.", citationIDs: ["openfda_resp"])
        ],
        adverseReactions: AttributedProse(
            "Constipation (very common — does not improve with tolerance), nausea, vomiting, sedation, pruritus, urinary retention, respiratory depression, dependence/withdrawal.",
            citationIDs: ["openfda_resp"]
        ),
        drugInteractions: [
            AttributedBullet("Benzodiazepines, gabapentin, alcohol, sleep aids — additive respiratory depression and sedation.", citationIDs: ["openfda_resp"]),
            AttributedBullet("CNS depressants (antihistamines, muscle relaxants) — additive sedation.", citationIDs: ["openfda_resp"]),
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides, protease inhibitors) — raise oxycodone levels.", citationIDs: ["openfda_resp"]),
            AttributedBullet("MAOIs — concurrent use can cause serotonin syndrome.", citationIDs: ["openfda_resp"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (facility opioid policy / ISMP high-alert).", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Assess pain (numeric scale or Wong-Baker), sedation (Pasero scale), and respiratory rate before and after each dose.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Hold and notify provider if RR <10, sedation increasing, or SpO2 dropping; have naloxone available.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Implement bowel regimen (docusate + senna) at start.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("ER formulations — confirm patient is opioid-tolerant; never crush/chew/split.", citationIDs: ["openrn_pharm_resp"]),
            AttributedBullet("Counsel about secure storage, naloxone availability at home, and risk of combining with CNS depressants.", citationIDs: ["openrn_pharm_resp"])
        ],
        patientTeaching: AttributedProse(
            "Take only as directed. Do not crush, chew, or split ER tablets. Do not combine with alcohol or sleep aids. Add fiber and fluids to prevent constipation. Keep the medication in a locked place — accidental ingestion can be fatal. Keep naloxone (Narcan) at home if you take long-term opioids.",
            citationIDs: ["openrn_pharm_resp"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}
