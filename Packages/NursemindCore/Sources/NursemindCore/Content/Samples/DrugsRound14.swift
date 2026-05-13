import Foundation

// Curator-model drug entries (round 14 expansion — sleep, psych, GI, immunology, addiction).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0), CDC + AASM / APA / ACG / SAMHSA concept citations.

private let openfda = CitationSource(
    id: "openfda_round14",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR14 = CitationSource(
    id: "openrn_pharm_round14",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=sleep+psych+anaphylaxis+addiction",
    lastRetrieved: "2026-05-04"
)
private let cdcR14 = CitationSource(
    id: "cdc_round14",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let specialtyR14 = CitationSource(
    id: "specialty_round14",
    shortName: "AASM / APA / ACG / AAAAI / SAMHSA concept citations",
    publisher: "AASM · APA · ACG · AAAAI · SAMHSA",
    license: .factCitationOnly,
    url: "https://aasm.org/clinical-resources/practice-standards/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Zolpidem

public enum ZolpidemSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "zolpidem",
        title: "Zolpidem",
        subtitle: "Ambien · Z-drug hypnotic · short-term insomnia · Beers caution",
        category: "Z-drug hypnotic (non-benzodiazepine)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-benzodiazepine GABA-A modulator (\"Z-drug\")"),
            KeyValueRow(key: "Indication", value: "Short-term insomnia (sleep onset and maintenance)"),
            KeyValueRow(key: "Boxed warning", value: "Complex sleep behaviors (sleep-driving, sleep-walking, sleep-eating) → DISCONTINUE if any episode per primary source"),
            KeyValueRow(key: "Notable", value: "FDA mandated lower female dose (5 mg vs 10 mg) due to slower clearance + driving impairment per primary source")
        ],
        indications: AttributedProse(
            "Short-term treatment of insomnia (typically <4–5 weeks); IR for sleep onset, CR for both onset and maintenance per primary source.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "Selective benzodiazepine receptor (BZ-1 / α1 subunit) agonist → GABA potentiation → sedation; less anxiolytic / muscle-relaxant / anticonvulsant action than classic benzos.",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Adult IR", body: "5 mg PO qHS for women, 5–10 mg for men per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "CR (Ambien CR)", body: "6.25 mg women, 6.25–12.5 mg men qHS per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "Sublingual (Intermezzo, middle-of-the-night)", body: "1.75 mg women, 3.5 mg men SL when awakening with ≥4 hr sleep remaining per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; pregnancy / lactation (relative); hepatic impairment (start lower); concurrent CNS depressants per primary source.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("BOXED — complex sleep behaviors (sleep-driving, sleep-walking, sleep-cooking) — DISCONTINUE permanently after any episode per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Next-day driving impairment — especially women + elderly; only take when ≥7–8 hours of sleep available.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Tolerance + dependence — short-term use only; rebound insomnia on stopping.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Falls / confusion in elderly — Beers list per primary source.", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness, dizziness, headache, GI upset, complex sleep behavior, anterograde amnesia.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("CNS depressants — additive sedation; AVOID alcohol.", citationIDs: ["openfda_round14"]),
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides) — raise levels.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("Take only when 7–8 hours sleep available; have someone aware of risk for sleep-walking.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("STOP IMMEDIATELY if any complex sleep behavior episode reported per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Counsel — short-term use; address sleep-hygiene + CBT-I as first-line for chronic insomnia per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Older adults — Beers; consider non-pharmacologic + alternative agents (low-dose doxepin, melatonin).", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "Take just before bed when you have 7–8 hours of sleep ahead. Do NOT drive the morning after. Avoid alcohol. STOP and call us about sleep-walking, sleep-driving, sleep-eating, or any unusual nighttime behaviors. Use only short-term and address sleep habits — talk therapy works better long-term.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Suvorexant

public enum SuvorexantSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "suvorexant",
        title: "Suvorexant",
        subtitle: "Belsomra · dual orexin receptor antagonist · insomnia · less misuse risk",
        category: "Dual orexin receptor antagonist (DORA)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dual orexin receptor antagonist (DORA)"),
            KeyValueRow(key: "Indication", value: "Insomnia (sleep onset + maintenance)"),
            KeyValueRow(key: "Notable", value: "Lower misuse / dependence risk than Z-drugs and benzos; controlled substance Schedule IV"),
            KeyValueRow(key: "Pharmacokinetics", value: "Half-life ~12 hours; next-day drowsiness possible")
        ],
        indications: AttributedProse(
            "Treatment of insomnia characterized by difficulties with sleep onset and / or sleep maintenance per primary source.",
            citationIDs: ["openfda_round14"]
        ),
        mechanism: AttributedProse(
            "Selective antagonist at orexin OX1R + OX2R → blocks wake-promoting orexin signaling → promotes sleep without GABA mechanism (different from Z-drugs / benzos).",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "10 mg PO 30 min before bed; max 20 mg per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Narcolepsy; concurrent strong CYP3A4 inhibitor at full dose; hypersensitivity per primary source.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("Next-day drowsiness + driving impairment — counsel against driving morning after.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Sleep paralysis, hypnagogic / hypnopompic hallucinations, cataplexy-like symptoms.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Worsening of depression / suicidality.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Complex sleep behaviors (rare).", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Somnolence, headache, abnormal dreams, dry mouth.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, macrolides) — REDUCE dose; AVOID combinations per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Other CNS depressants — additive sedation.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("Take 30 minutes before bed; ensure 7–8 hour sleep window.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Lower abuse / dependence risk than Z-drugs; useful in patients with addiction history per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Counsel about cataplexy-like episodes and complex sleep behaviors; STOP if any episode.", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "Take 30 minutes before bed when you can sleep 7–8 hours. Do not drive the morning after. Avoid alcohol. Tell us about cataplexy (sudden weakness with emotion), sleep paralysis, vivid hallucinations, or unusual nighttime behaviors.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Modafinil

public enum ModafinilSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "modafinil",
        title: "Modafinil",
        subtitle: "Provigil · wake-promoting · narcolepsy + OSA + shift-work disorder",
        category: "Wake-promoting agent (CIV)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Wake-promoting agent — Schedule IV controlled substance"),
            KeyValueRow(key: "Indications", value: "Narcolepsy (excessive daytime sleepiness), OSA residual sleepiness despite CPAP, shift-work disorder"),
            KeyValueRow(key: "Boxed warning", value: "Severe rash (SJS / TEN, DRESS) — STOP at any rash per primary source"),
            KeyValueRow(key: "Notable", value: "Less abuse + cardiovascular effects than amphetamines but still controlled")
        ],
        indications: AttributedProse(
            "Excessive daytime sleepiness in narcolepsy; OSA with residual sleepiness despite optimal CPAP; shift-work disorder per primary source.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "Increases dopamine + norepinephrine + serotonin + histamine; reduces GABA. Wake-promoting via complex mechanisms; less abuse potential than amphetamines.",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Narcolepsy / OSA", body: "200 mg PO once daily in morning per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "Shift-work disorder", body: "200 mg PO 1 hour before shift per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to modafinil / armodafinil; LVH or angina (relative); hypersensitivity to prior agent.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("BOXED — severe cutaneous adverse reactions (SJS / TEN / DRESS / multi-organ hypersensitivity); STOP for any rash per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Cardiovascular — chest pain, palpitations, HTN, tachyarrhythmia; baseline ECG / BP.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Psychiatric — anxiety, insomnia, mania, suicidality; monitor.", citationIDs: ["openfda_round14"]),
            AttributedBullet("REDUCES OCP efficacy — counsel non-hormonal contraception per primary source.", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Headache, nausea, anxiety, insomnia, dry mouth, dizziness, palpitations.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 INDUCER — REDUCES OCPs (use barrier or non-hormonal), DOACs, calcineurin inhibitors per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Warfarin — modafinil raises INR.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Other stimulants / CNS depressants — additive effects.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("Take in morning to avoid insomnia; do NOT use as substitute for adequate sleep / CPAP adherence.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("STOP for any rash and notify provider per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Counsel barrier contraception in OCP users.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Schedule II–IV controlled — federal restrictions on prescribing.", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "Take in the morning. Do not stop your CPAP if you have OSA — this medicine treats residual sleepiness, not the underlying problem. STOP and call right away for any rash, fever, or mouth sores. Use a backup birth-control method — this medicine reduces birth-control pill effectiveness.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Doxepin (low-dose insomnia)

public enum DoxepinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "doxepin",
        title: "Doxepin (low-dose insomnia)",
        subtitle: "Silenor 3–6 mg · TCA / H1 antagonist · sleep maintenance · Beers caution at higher doses",
        category: "Tricyclic antidepressant / H1 antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "TCA + selective H1 antagonist at low dose"),
            KeyValueRow(key: "Indication", value: "Insomnia characterized by sleep maintenance difficulty (Silenor 3–6 mg)"),
            KeyValueRow(key: "Higher doses", value: "Antidepressant + chronic urticaria (Beers list)"),
            KeyValueRow(key: "Notable", value: "Low-dose form has minimal anticholinergic burden; preferred over Z-drugs in elderly per primary source")
        ],
        indications: AttributedProse(
            "Insomnia characterized by sleep maintenance difficulty (Silenor 3–6 mg). Higher doses (10–300 mg) for major depression and chronic pruritus / urticaria per primary source.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "Tricyclic with strong H1 receptor antagonism — at low dose (3–6 mg) primarily H1 effect promotes sleep with minimal anticholinergic / α1 effects.",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Insomnia (Silenor)", body: "3 mg PO 30 min before bed; max 6 mg per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "Depression", body: "75–150 mg/day in divided doses; max 300 mg per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Untreated narrow-angle glaucoma; severe urinary retention; hypersensitivity to TCAs; concurrent MAOI; hypersensitivity to doxepin.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("Higher doses — anticholinergic effects, orthostatic hypotension, QT prolongation, suicide risk in young adults (boxed for TCAs).", citationIDs: ["openfda_round14"]),
            AttributedBullet("Low-dose Silenor has minimal anticholinergic effect — preferred in older adults per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Avoid taking within 3 hours of meal (delays onset).", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Somnolence, dry mouth (high dose), constipation, blurred vision, dizziness, weight gain.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated; serotonin syndrome.", citationIDs: ["openfda_round14"]),
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Cimetidine, fluoxetine, paroxetine — raise doxepin levels.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("Take 30 minutes before bed; AVOID heavy meal in 3 hours before dose.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Counsel that 3–6 mg form is for INSOMNIA only, not depression — different formulations.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Preferred to Z-drugs in older adults per AGS / AASM per primary source.", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "Take 30 minutes before bed. Do not eat a big meal within 3 hours of the dose. Do not drive the morning after. Tell us about dry mouth, constipation, or vision changes (rare at low dose).",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Brexpiprazole

public enum BrexpiprazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "brexpiprazole",
        title: "Brexpiprazole",
        subtitle: "Rexulti · partial-agonist atypical · MDD adjunct · agitation in dementia",
        category: "Atypical antipsychotic (D2 partial agonist)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "D2 / 5-HT1A partial agonist + 5-HT2A antagonist"),
            KeyValueRow(key: "Indications", value: "Schizophrenia, adjunctive MDD, agitation in Alzheimer dementia (FDA-approved 2023)"),
            KeyValueRow(key: "Boxed warnings", value: "Increased mortality in dementia psychosis (class effect); suicidality in young adults"),
            KeyValueRow(key: "Notable", value: "Compared to aripiprazole — slightly lower akathisia, similar metabolic profile")
        ],
        indications: AttributedProse(
            "Schizophrenia (adult); adjunct to antidepressant for major depressive disorder; agitation associated with Alzheimer dementia (FDA-approved 2023, first specific indication) per primary source.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "Partial agonist at D2 + 5-HT1A; antagonist at 5-HT2A; modest α1 antagonism. Dopamine system stabilizer (similar to aripiprazole).",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Schizophrenia", body: "Initial 1 mg PO daily; titrate to 2–4 mg/day per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "Adjunct MDD", body: "Initial 0.5–1 mg PO daily; titrate to 1–3 mg per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "Dementia agitation", body: "Initial 0.5 mg PO daily; titrate to 2 mg max per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution in dementia (boxed).",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("BOXED — increased mortality in elderly dementia psychosis (class effect — but DEMENTIA AGITATION is now an FDA-approved indication with this specific medication; balance carefully) per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("BOXED — suicidality in patients <25.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Akathisia, tardive dyskinesia, NMS, metabolic effects, hyperprolactinemia.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Pathologic compulsive behaviors (gambling / shopping / sexual) — class effect of dopamine partial agonists per primary source.", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Akathisia, weight gain, somnolence, dyspepsia, headache.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors / inducers — adjust dose.", citationIDs: ["openfda_round14"]),
            AttributedBullet("CYP2D6 inhibitors (paroxetine, fluoxetine) — reduce dose.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Other antipsychotics / serotonergic — additive effects.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel about compulsive behaviors — gambling / shopping / sexual / eating; STOP if reported per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Trend metabolic — weight, fasting glucose, lipids, prolactin.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Akathisia — common; β-blocker (propranolol) or benztropine adjunctive per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("In dementia agitation — non-pharmacologic interventions FIRST; brexpiprazole only when needed and ongoing benefit reassessed per primary source.", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed. Tell us about new gambling, shopping, eating, or sexual urges — these can be side effects. Tell us about restlessness or inability to sit still. Avoid alcohol. Get regular blood tests.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Esketamine

public enum EsketamineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "esketamine",
        title: "Esketamine (intranasal)",
        subtitle: "Spravato · NMDA antagonist · treatment-resistant depression + MDD with suicidality · REMS",
        category: "NMDA receptor antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "NMDA receptor antagonist (S-enantiomer of ketamine)"),
            KeyValueRow(key: "Indications", value: "Treatment-resistant depression (TRD); MDD with acute suicidal ideation / behavior"),
            KeyValueRow(key: "REMS-required setting", value: "Administered ONLY in REMS-certified clinics with 2-hour observation per primary source"),
            KeyValueRow(key: "Notable", value: "Rapid antidepressant onset (hours); used WITH a standard oral antidepressant")
        ],
        indications: AttributedProse(
            "Treatment-resistant depression in adults (failed ≥2 antidepressant trials in current episode); depressive symptoms in MDD with acute suicidal ideation / behavior — used WITH a standard oral antidepressant per primary source.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "NMDA receptor antagonist → AMPA receptor activation → BDNF release → rapid synaptogenesis. Mechanism distinct from monoamine antidepressants → rapid onset.",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "TRD induction", body: "Twice weekly × 4 weeks — 56 mg or 84 mg intranasal (with oral antidepressant) per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "TRD maintenance", body: "Weekly × 4 weeks, then weekly or every 2 weeks per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "Suicidality", body: "Twice weekly × 4 weeks per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Aneurysmal vascular disease (severe HTN risk); arteriovenous malformation; intracerebral hemorrhage; hypersensitivity per primary source.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("BOXED — sedation + dissociation; supervise in clinic for at least 2 hours per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("BOXED — abuse + misuse potential; Schedule III controlled substance.", citationIDs: ["openfda_round14"]),
            AttributedBullet("BOXED — suicidality in patients <25 (class warning for antidepressants).", citationIDs: ["openfda_round14"]),
            AttributedBullet("BOXED — REMS — ONLY administered in certified clinic with health-care professional present + 2-hour observation per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Hypertension — transient; trend BP; treat HTN >180/110 before dosing.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Bladder pain / cystitis with chronic ketamine use; assess.", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Dissociation (most common — feeling detached, altered perception), dizziness, nausea, sedation, headache, hypertension (transient), increased BP.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("Other CNS depressants — additive sedation.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Stimulants / amphetamines — additive HTN.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Strong CYP2B6 / 3A4 inducers may reduce levels.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("REMS-certified clinic; verify patient enrollment; trained staff present.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Pre-dose — vital signs (treat HTN >140/90 if symptomatic before dosing); meal + fluid restriction (NPO 2 hr food, 30 min fluids per primary source).", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("During + 2-hour observation — monitor BP every 40 min × 2 hr; assess sedation and dissociation per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Patient must NOT drive home; arrange transportation; counsel.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Assess suicidality with C-SSRS; coordinate ongoing mental-health care.", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "You will receive this in a clinic with monitoring for 2 hours after each dose. Don't eat for 2 hours or drink for 30 minutes before. Bring someone to drive you home — you cannot drive yourself for the rest of the day. Tell us about racing heartbeat, severe headache, or chest pain. This works alongside your other antidepressant — do not stop your oral medication.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lurasidone

public enum LurasidoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lurasidone",
        title: "Lurasidone",
        subtitle: "Latuda · atypical · schizophrenia + bipolar depression · take with food",
        category: "Atypical antipsychotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Atypical antipsychotic (D2 / 5-HT2A antagonist)"),
            KeyValueRow(key: "Indications", value: "Schizophrenia (adolescent + adult); bipolar I depression (monotherapy + adjunct to lithium / valproate)"),
            KeyValueRow(key: "Critical", value: "Take WITH FOOD ≥350 calories — REQUIRED for absorption per primary source"),
            KeyValueRow(key: "Notable", value: "Lower weight gain + metabolic burden than olanzapine / quetiapine; modest akathisia")
        ],
        indications: AttributedProse(
            "Schizophrenia in adults and adolescents 13–17; bipolar I depression as monotherapy or adjunct to lithium / valproate per primary source.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "D2 + 5-HT2A antagonist with high 5-HT7 + α2C affinity → potential cognitive / antidepressant effects beyond classic antipsychotic action.",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Schizophrenia", body: "Initial 40 mg PO daily WITH FOOD; range 40–160 mg per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "Bipolar depression", body: "Initial 20 mg PO daily WITH FOOD; range 20–120 mg per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Concurrent strong CYP3A4 inhibitor or inducer; hypersensitivity; dementia-related psychosis (boxed) per primary source.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("BOXED — increased mortality in elderly dementia psychosis; suicidality in young adults.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Akathisia (common, dose-related); EPS, NMS, tardive dyskinesia.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Metabolic — less weight gain / glucose / lipid effects than other atypicals; still monitor.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Hyperprolactinemia.", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Akathisia, somnolence, nausea, parkinsonism, agitation.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, clarithromycin) — CONTRAINDICATED.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Strong CYP3A4 inducers (rifampin, phenytoin) — CONTRAINDICATED.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Grapefruit — AVOID per primary source.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("Take with FOOD containing AT LEAST 350 calories — fasting reduces absorption by 50% per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Trend metabolic + EPS / akathisia at every visit.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Avoid grapefruit; reconcile CYP3A4 interactions carefully.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Bipolar depression — useful when weight / metabolic concerns favor over olanzapine / quetiapine.", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "Take with food (at least 350 calories) every day at the same time. Avoid grapefruit. Tell us about restlessness or inability to sit still, stiffness, fever, or sudden mood changes. Avoid alcohol. Tell every provider about all your medications.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sucralfate

public enum SucralfateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sucralfate",
        title: "Sucralfate",
        subtitle: "Carafate · sucrose-aluminum complex · ulcer protective · stress ulcer prophylaxis",
        category: "Mucosal protectant",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Sucrose octasulfate aluminum complex"),
            KeyValueRow(key: "Indications", value: "Active duodenal ulcer; stress-ulcer prophylaxis (alternative to PPI in select ICU patients); radiation proctitis"),
            KeyValueRow(key: "Notable", value: "Locally active; minimal systemic absorption; takes 4 doses to coat GI tract"),
            KeyValueRow(key: "Caution", value: "Aluminum content — accumulates in CKD")
        ],
        indications: AttributedProse(
            "Treatment of active duodenal ulcer; maintenance of duodenal-ulcer healing post-treatment; stress-ulcer prophylaxis in selected ICU patients; radiation-induced proctitis per primary source.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "In acidic environment forms sticky paste that binds to ulcer base + duodenal mucosa → physical barrier protecting from acid + pepsin + bile salts. Stimulates prostaglandin production + bicarbonate secretion locally.",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Adult ulcer", body: "1 g PO QID 1 hour before meals + at bedtime × 4–8 weeks per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "Maintenance", body: "1 g PO BID per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to sucralfate; caution in chronic kidney disease (aluminum accumulation) per primary source.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("Aluminum accumulation in CKD — encephalopathy, osteomalacia; AVOID prolonged use in dialysis per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Bezoar formation in critically ill / NG-tube patients.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Constipation common.", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Constipation (most common), nausea, dyspepsia, dry mouth.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("Antacids — REDUCE acidity needed for sucralfate activation; SEPARATE by 30 min per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Many drugs — SEPARATE administration by ≥2 hours: levothyroxine, ciprofloxacin, phenytoin, digoxin, warfarin, tetracycline (sucralfate binds them) per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("PPI — sucralfate requires acidic environment; effectiveness reduced when given with PPI.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("Give 1 hour BEFORE meals on empty stomach; bedtime dose per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Separate from other oral medications by at least 2 hours.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Counsel about constipation — fluids + fiber.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("In CKD / dialysis — limit duration; choose alternative (PPI) per primary source.", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "Take 1 hour before meals and at bedtime on an empty stomach. Take other medications at least 2 hours away from this. Increase fluids and fiber to prevent constipation. Tell us about kidney problems before starting.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bismuth Subsalicylate

public enum BismuthSubsalicylateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "bismuth-subsalicylate",
        title: "Bismuth subsalicylate",
        subtitle: "Pepto-Bismol · OTC GI agent · diarrhea + H. pylori quad regimen",
        category: "Bismuth + salicylate compound",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Bismuth + salicylate compound"),
            KeyValueRow(key: "Indications", value: "Acute diarrhea; H. pylori quadruple regimen; traveler's diarrhea prophylaxis; dyspepsia"),
            KeyValueRow(key: "Boxed concerns", value: "REYE'S syndrome — AVOID in children with viral illness; salicylate component"),
            KeyValueRow(key: "Notable", value: "Causes harmless black tongue + stools (do not confuse with melena)")
        ],
        indications: AttributedProse(
            "Acute non-infectious diarrhea (adults), traveler's diarrhea prevention; component of H. pylori quadruple therapy (with PPI + tetracycline + metronidazole); upset stomach / dyspepsia per primary source.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "Antimicrobial (binds bacterial enterotoxins, inhibits bacterial adherence + growth); antisecretory (reduces gastric secretion); cytoprotective (coats GI mucosa).",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Diarrhea / dyspepsia", body: "524 mg (2 tablets / 30 mL) PO every 30–60 min as needed; max 4 g/day per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "H. pylori (quadruple)", body: "525 mg PO QID with PPI + tetracycline + metronidazole × 14 days per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Children / adolescents with viral illness (Reye's syndrome with salicylates); known salicylate allergy; severe GI bleeding; hypersensitivity per primary source.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("REYE'S syndrome risk — DO NOT GIVE to children / teens with viral illness (flu, varicella) per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Salicylate toxicity in overdose; pregnancy — avoid in 3rd trimester (closes ductus arteriosus).", citationIDs: ["openfda_round14"]),
            AttributedBullet("Black tongue + stools — common, harmless; counsel patient (do NOT confuse with melena).", citationIDs: ["openfda_round14"]),
            AttributedBullet("CNS toxicity (encephalopathy) with prolonged high-dose use — bismuth accumulation.", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Black tongue + stools (harmless), constipation, salicylate-related (tinnitus, salicylism in overdose).",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("Anticoagulants / antiplatelets — additive bleeding risk.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Tetracycline / quinolones — bismuth REDUCES absorption (relevant for H. pylori regimen — TAKE TETRACYCLINE WITH the bismuth per primary source).", citationIDs: ["openfda_round14"]),
            AttributedBullet("Other salicylates / NSAIDs — additive salicylate effects.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel patients about black tongue / stools — common and harmless; differentiate from melena (which is tarry, foul-smelling, indicates GI bleed).", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("AVOID in children / teens with viral illness due to Reye's risk per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("In H. pylori regimen — adherence to all 4 medications × 14 days is critical for cure.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Pregnancy — avoid in 3rd trimester (premature ductus closure).", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "Your tongue and stools may turn black temporarily — this is harmless. Do not give to children with the flu or chicken pox. Avoid in late pregnancy. Tell us about ringing in ears or fast breathing (signs of too much salicylate). Take tetracycline at the same time if part of an H. pylori regimen.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Omalizumab

public enum OmalizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "omalizumab",
        title: "Omalizumab",
        subtitle: "Xolair · anti-IgE Mab · severe allergic asthma + chronic urticaria + nasal polyps + food allergy (peds)",
        category: "Anti-IgE monoclonal antibody",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anti-IgE humanized monoclonal antibody"),
            KeyValueRow(key: "Indications", value: "Severe allergic asthma (≥6 yr), chronic spontaneous urticaria (≥12 yr), nasal polyposis, IgE-mediated food allergy (≥1 yr — FDA 2024)"),
            KeyValueRow(key: "Notable", value: "Anaphylaxis post-injection — REMS-like observation 2 hours initially; pre-fill home self-injection later")
        ],
        indications: AttributedProse(
            "Moderate-severe persistent ALLERGIC asthma uncontrolled with ICS in patients ≥6 years; chronic spontaneous urticaria refractory to H1 antihistamines; nasal polyposis; reduce risk of allergic reaction from accidental ingestion in IgE-mediated food allergy (≥1 year — FDA 2024) per primary source.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "Binds free IgE → prevents IgE binding to FcεRI on mast cells / basophils → reduces mediator release on antigen exposure.",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Asthma", body: "75–375 mg SQ every 2–4 weeks based on weight + IgE level per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "Chronic urticaria", body: "150 or 300 mg SQ every 4 weeks per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "Food allergy", body: "Per FDA dosing chart by weight + IgE per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to omalizumab.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("BOXED — anaphylaxis (post-injection); ~0.2% incidence; observe in clinic 2 hours after first 3 doses, then 30 minutes for subsequent (per current label) per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Risk of malignancy — initial concern; ongoing surveillance.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Helminth infection — if at risk geography, screen (omalizumab may reduce protection).", citationIDs: ["openfda_round14"]),
            AttributedBullet("Eosinophilic conditions (Churg-Strauss / EGPA) reported.", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Injection-site reactions, headache, pharyngitis, viral infection.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("None major; anti-allergic medications (antihistamines, decongestants) often continued.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Live vaccines — generally OK with omalizumab (unlike many other biologics).", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("First 3 injections — observe in clinic 2 hours; subsequent 30 minutes; have epinephrine + epinephrine auto-injector available per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Self-injection at home eligible after first 3 doses; pre-filled syringe / autoinjector.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Patients should carry EpiPen and recognize anaphylaxis symptoms per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Continue baseline asthma / urticaria medications during initiation; titrate down per response.", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "You will be observed in clinic for 2 hours after the first 3 injections. Carry an EpiPen at all times. Recognize anaphylaxis — swelling, trouble breathing, hives, dizziness — and use EpiPen + call 911. Do not stop your inhaler or other allergy medications without your provider. Monthly self-injection at home becomes possible after several clinic visits.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Mepolizumab

public enum MepolizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "mepolizumab",
        title: "Mepolizumab",
        subtitle: "Nucala · anti-IL-5 Mab · severe eosinophilic asthma + EGPA + HES + CRSwNP",
        category: "Anti-IL-5 monoclonal antibody",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anti-IL-5 humanized monoclonal antibody"),
            KeyValueRow(key: "Indications", value: "Severe eosinophilic asthma (≥6 yr), EGPA, hypereosinophilic syndrome (HES), chronic rhinosinusitis with nasal polyps (CRSwNP)"),
            KeyValueRow(key: "Notable", value: "Once-monthly SQ; reduces eosinophil-driven inflammation; not effective in non-eosinophilic asthma")
        ],
        indications: AttributedProse(
            "Severe eosinophilic asthma (≥6 yr); EGPA (Churg-Strauss); HES with no FIP1L1-PDGFRA fusion; chronic rhinosinusitis with nasal polyps per primary source.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "Binds IL-5 → blocks IL-5 binding to eosinophil receptor → reduces eosinophil maturation, recruitment, and survival.",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Severe asthma", body: "100 mg SQ every 4 weeks (≥12 yr); 40 mg SQ every 4 weeks (6–11 yr) per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "EGPA / HES", body: "300 mg SQ every 4 weeks per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "CRSwNP", body: "100 mg SQ every 4 weeks per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to mepolizumab.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("Hypersensitivity reactions (uncommon).", citationIDs: ["openfda_round14"]),
            AttributedBullet("Herpes zoster — consider zoster vaccination before initiation per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Helminth infection risk — eosinophils are key in helminth defense.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Do NOT use for acute bronchospasm / asthma exacerbation per primary source.", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Headache, injection-site reaction, back pain, fatigue, eczema, herpes zoster.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("Live vaccines — generally OK with anti-IL-5 (less immunosuppressive than other biologics).", citationIDs: ["openfda_round14"]),
            AttributedBullet("Other biologic / immunomodulators — use cautiously; combination not well-studied.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm SEVERE EOSINOPHILIC asthma — peripheral eosinophil count + clinical phenotype per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Continue maintenance ICS / LABA per pulmonologist — biologic is ADD-ON, not replacement.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Self-injection at home after training; pen / pre-filled syringe.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Reassess eosinophils + asthma control at 4 months; if no response, discontinue.", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "Inject monthly at the same time. Continue your inhaler — this is added on. This medicine takes weeks to show benefit. Tell us about severe injection-site reactions, swelling, or signs of shingles. Avoid people with active TB or parasitic infection.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acamprosate

public enum AcamprosateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "acamprosate",
        title: "Acamprosate",
        subtitle: "Campral · NMDA / GABA modulator · alcohol use disorder maintenance",
        category: "Glutamate modulator (AUD)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "GABA-A enhancer + NMDA antagonist (modulates post-withdrawal hyperexcitability)"),
            KeyValueRow(key: "Indication", value: "MAINTENANCE of abstinence in alcohol use disorder after detoxification"),
            KeyValueRow(key: "Notable", value: "Works AFTER detox — not for acute withdrawal; renal-cleared, dose-adjust in CKD"),
            KeyValueRow(key: "Beauty of acamprosate", value: "Safe in liver disease (vs naltrexone hepatotoxicity concern); no abuse potential")
        ],
        indications: AttributedProse(
            "Maintenance of abstinence in patients with alcohol use disorder following detoxification per primary source. Used WITH counseling / behavioral support.",
            citationIDs: ["openfda_round14", "specialty_round14"]
        ),
        mechanism: AttributedProse(
            "Modulates glutamate / GABA balance disrupted by chronic alcohol → reduces post-acute withdrawal hyperexcitability + craving in early recovery.",
            citationIDs: ["openfda_round14"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "666 mg PO TID (two 333-mg tablets three times daily); take with meals to enhance compliance per primary source.", citationIDs: ["openfda_round14"]),
            DosingBlock(label: "CrCl 30–50", body: "333 mg PO TID per primary source.", citationIDs: ["openfda_round14"])
        ],
        contraindications: AttributedProse(
            "Severe renal impairment (CrCl <30); hypersensitivity per primary source.",
            citationIDs: ["openfda_round14"]
        ),
        warnings: [
            AttributedBullet("Renal-cleared — adjust dose; AVOID in CrCl <30.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Suicidal ideation reported — counsel + monitor.", citationIDs: ["openfda_round14"]),
            AttributedBullet("Continued alcohol consumption — does NOT prevent or reduce alcohol effects, just supports abstinence.", citationIDs: ["openfda_round14"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, GI upset (most common), insomnia, anxiety, dizziness.",
            citationIDs: ["openfda_round14"]
        ),
        drugInteractions: [
            AttributedBullet("Few clinically significant interactions; can be combined with naltrexone for synergistic effect per primary source.", citationIDs: ["openfda_round14"]),
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_round14"])
        ],
        nursingImplications: [
            AttributedBullet("Take with meals to improve adherence (3 large pills × 3 times/day is a lot).", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Combine with behavioral therapy + AA / SMART Recovery / peer support per primary source.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Patients can continue if they relapse — does not require abstinence to be effective.", citationIDs: ["openrn_pharm_round14"]),
            AttributedBullet("Naltrexone alternative if acamprosate doesn't suit; consider hepatic / renal status.", citationIDs: ["openrn_pharm_round14"])
        ],
        patientTeaching: AttributedProse(
            "Take 2 pills three times a day with meals. This medicine helps reduce cravings and supports abstinence — it does NOT prevent intoxication if you drink. Continue your counseling and recovery program. Tell us about diarrhea, mood changes, or new thoughts of self-harm.",
            citationIDs: ["openrn_pharm_round14"]
        ),
        citations: [openfda, openrnPharmR14, specialtyR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}
