import SwiftUI

// MARK: - Shared citation sources

private let brott1989Nihss = CitationSource(
    id: "brott_1989_nihss",
    shortName: "NIHSS — Brott T et al., Stroke 1989 (concept citation)",
    detail: "Original derivation of the National Institutes of Health Stroke Scale",
    publisher: "Stroke",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/2749846/",
    lastRetrieved: "2026-05-04"
)

private let nindsNihss = CitationSource(
    id: "ninds_nihss_admin",
    shortName: "NIH Stroke Scale Administration — NINDS public reference (concept citation)",
    detail: "Standardized scoring instructions and item definitions; the operational reference for NIHSS scoring",
    publisher: "National Institute of Neurological Disorders and Stroke",
    license: .publicDomain,
    url: "https://www.stroke.nih.gov/resources/scale.htm",
    lastRetrieved: "2026-05-04"
)

private let charlson1987 = CitationSource(
    id: "charlson_1987",
    shortName: "Charlson Comorbidity Index — Charlson ME et al., J Chronic Dis 1987 (concept citation)",
    detail: "Weighted comorbidity index validated against 1-year mortality in medical inpatients",
    publisher: "Journal of Chronic Diseases",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/3558716/",
    lastRetrieved: "2026-05-04"
)

private let charlson1994AgeAdj = CitationSource(
    id: "charlson_1994_age_adj",
    shortName: "Age-adjusted Charlson — Charlson ME et al., J Clin Epidemiol 1994 (concept citation)",
    detail: "Adds age points to the original Charlson Comorbidity Index for refined survival estimation",
    publisher: "Journal of Clinical Epidemiology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/7722560/",
    lastRetrieved: "2026-05-04"
)

private let holmes2005PedsGcs = CitationSource(
    id: "holmes_2005_peds_gcs",
    shortName: "Pediatric GCS — Holmes JF et al., Acad Emerg Med 2005 (concept citation)",
    detail: "Validation of the verbal-component modification for pre-verbal pediatric patients",
    publisher: "Academic Emergency Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/15805325/",
    lastRetrieved: "2026-05-04"
)

private let openrnRisk7 = CitationSource(
    id: "openrn_risk_7",
    shortName: "Open RN Health Alterations — Stroke / Pediatric Neuro / Comorbidity",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=stroke+pediatric+neuro",
    lastRetrieved: "2026-05-04"
)

// MARK: - NIHSS

public struct NIHSSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "nihss", key: "loc")        private var locID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "locQ")       private var locQID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "locC")       private var locCID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "gaze")       private var gazeID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "visual")     private var visualID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "facial")     private var facialID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "armL")       private var armLID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "armR")       private var armRID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "legL")       private var legLID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "legR")       private var legRID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "ataxia")     private var ataxiaID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "sensory")    private var sensoryID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "language")   private var languageID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "dysarthria") private var dysarthriaID
    @CalcPersistedOptionID(calculatorID: "nihss", key: "extinction") private var extinctionID

    private var loc:        CalculatorScoreRow.Option? { locOpts.first        { $0.id == locID } }
    private var locQ:       CalculatorScoreRow.Option? { locQOpts.first       { $0.id == locQID } }
    private var locC:       CalculatorScoreRow.Option? { locCOpts.first       { $0.id == locCID } }
    private var gaze:       CalculatorScoreRow.Option? { gazeOpts.first       { $0.id == gazeID } }
    private var visual:     CalculatorScoreRow.Option? { visualOpts.first     { $0.id == visualID } }
    private var facial:     CalculatorScoreRow.Option? { facialOpts.first     { $0.id == facialID } }
    private var armL:       CalculatorScoreRow.Option? { limbOpts.first       { $0.id == armLID } }
    private var armR:       CalculatorScoreRow.Option? { limbOpts.first       { $0.id == armRID } }
    private var legL:       CalculatorScoreRow.Option? { limbOpts.first       { $0.id == legLID } }
    private var legR:       CalculatorScoreRow.Option? { limbOpts.first       { $0.id == legRID } }
    private var ataxia:     CalculatorScoreRow.Option? { ataxiaOpts.first     { $0.id == ataxiaID } }
    private var sensory:    CalculatorScoreRow.Option? { sensoryOpts.first    { $0.id == sensoryID } }
    private var language:   CalculatorScoreRow.Option? { languageOpts.first   { $0.id == languageID } }
    private var dysarthria: CalculatorScoreRow.Option? { dysarthriaOpts.first { $0.id == dysarthriaID } }
    private var extinction: CalculatorScoreRow.Option? { extinctionOpts.first { $0.id == extinctionID } }

    private let locOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · Alert; keenly responsive",                            score: 0),
        .init(id: 1, label: "1 · Not alert; arouses to minor stimulation",             score: 1),
        .init(id: 2, label: "2 · Not alert; requires repeated stimulation",            score: 2),
        .init(id: 3, label: "3 · Reflex motor / autonomic effects only, or unresponsive", score: 3)
    ]
    private let locQOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · Both questions answered correctly",     score: 0),
        .init(id: 1, label: "1 · One question answered correctly",       score: 1),
        .init(id: 2, label: "2 · Neither question answered correctly",   score: 2)
    ]
    private let locCOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · Performs both tasks correctly",         score: 0),
        .init(id: 1, label: "1 · Performs one task correctly",           score: 1),
        .init(id: 2, label: "2 · Performs neither task correctly",       score: 2)
    ]
    private let gazeOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · Normal",                                                score: 0),
        .init(id: 1, label: "1 · Partial gaze palsy",                                    score: 1),
        .init(id: 2, label: "2 · Forced deviation / total gaze paresis not overcome",    score: 2)
    ]
    private let visualOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · No visual loss",                          score: 0),
        .init(id: 1, label: "1 · Partial hemianopia",                      score: 1),
        .init(id: 2, label: "2 · Complete hemianopia",                     score: 2),
        .init(id: 3, label: "3 · Bilateral hemianopia (cortical blindness)", score: 3)
    ]
    private let facialOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · Normal symmetric movement",                              score: 0),
        .init(id: 1, label: "1 · Minor paralysis (flattened nasolabial fold)",            score: 1),
        .init(id: 2, label: "2 · Partial paralysis (lower-face)",                         score: 2),
        .init(id: 3, label: "3 · Complete paralysis (one or both sides)",                 score: 3)
    ]
    private let limbOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · No drift; holds position 10 sec",                   score: 0),
        .init(id: 1, label: "1 · Drift; holds initially but drifts before 10 sec",   score: 1),
        .init(id: 2, label: "2 · Some effort against gravity",                       score: 2),
        .init(id: 3, label: "3 · No effort against gravity; falls",                  score: 3),
        .init(id: 4, label: "4 · No movement",                                       score: 4),
        .init(id: 9, label: "Untestable (amputation / joint fusion)",                score: 0)
    ]
    private let ataxiaOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · Absent",                          score: 0),
        .init(id: 1, label: "1 · Present in one limb",             score: 1),
        .init(id: 2, label: "2 · Present in two limbs",            score: 2)
    ]
    private let sensoryOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · Normal; no sensory loss",                              score: 0),
        .init(id: 1, label: "1 · Mild-to-moderate; less sharp / dull on affected side", score: 1),
        .init(id: 2, label: "2 · Severe to total sensory loss",                         score: 2)
    ]
    private let languageOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · No aphasia; normal",                                   score: 0),
        .init(id: 1, label: "1 · Mild-to-moderate aphasia",                             score: 1),
        .init(id: 2, label: "2 · Severe aphasia",                                       score: 2),
        .init(id: 3, label: "3 · Mute, global aphasia, or coma",                        score: 3)
    ]
    private let dysarthriaOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · Normal",                                               score: 0),
        .init(id: 1, label: "1 · Mild-to-moderate; slurs some words but understandable", score: 1),
        .init(id: 2, label: "2 · Severe; speech unintelligible OR mute / anarthric",    score: 2)
    ]
    private let extinctionOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · No abnormality",                                       score: 0),
        .init(id: 1, label: "1 · Inattention / extinction in one modality",             score: 1),
        .init(id: 2, label: "2 · Profound hemi-inattention or extinction in > 1 modality", score: 2)
    ]

    private var components: [CalculatorScoreRow.Option?] {
        [loc, locQ, locC, gaze, visual, facial, armL, armR, legL, legR, ataxia, sensory, language, dysarthria, extinction]
    }

    private var total: Int? {
        guard components.allSatisfy({ $0 != nil }) else { return nil }
        return components.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s == 0      { return ("NIHSS = 0 — no measurable stroke deficits at this assessment.", .neutral) }
        if s <= 4      { return ("NIHSS 1–4 — published 'minor stroke' band.", .neutral) }
        if s <= 15     { return ("NIHSS 5–15 — published 'moderate stroke' band.", .caution) }
        if s <= 20     { return ("NIHSS 16–20 — published 'moderate-to-severe stroke' band.", .alert) }
        return ("NIHSS 21–42 — published 'severe stroke' band; substantially elevated mortality and disability in trial-derivation cohorts.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "NIHSS",
            subtitle: "NIH Stroke Scale · 15 items"
        ) {
            CalculatorSection("LEVEL OF CONSCIOUSNESS") {
                CalculatorScoreRow(label: "1a · LOC",         options: locOpts,  selection: $locID.option(in: locOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "1b · LOC questions", options: locQOpts, selection: $locQID.option(in: locQOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "1c · LOC commands",  options: locCOpts, selection: $locCID.option(in: locCOpts))
            }
            CalculatorSection("CRANIAL NERVES") {
                CalculatorScoreRow(label: "2 · Best gaze",    options: gazeOpts,   selection: $gazeID.option(in: gazeOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "3 · Visual fields", options: visualOpts, selection: $visualID.option(in: visualOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "4 · Facial palsy",  options: facialOpts, selection: $facialID.option(in: facialOpts))
            }
            CalculatorSection("MOTOR") {
                CalculatorScoreRow(label: "5a · Motor arm — left",  options: limbOpts, selection: $armLID.option(in: limbOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "5b · Motor arm — right", options: limbOpts, selection: $armRID.option(in: limbOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "6a · Motor leg — left",  options: limbOpts, selection: $legLID.option(in: limbOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "6b · Motor leg — right", options: limbOpts, selection: $legRID.option(in: limbOpts))
            }
            CalculatorSection("SENSORY · LANGUAGE · ATTENTION") {
                CalculatorScoreRow(label: "7 · Limb ataxia",        options: ataxiaOpts,     selection: $ataxiaID.option(in: ataxiaOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "8 · Sensory",            options: sensoryOpts,    selection: $sensoryID.option(in: sensoryOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "9 · Best language",      options: languageOpts,   selection: $languageID.option(in: languageOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "10 · Dysarthria",         options: dysarthriaOpts, selection: $dysarthriaID.option(in: dysarthriaOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "11 · Extinction / inattention", options: extinctionOpts, selection: $extinctionID.option(in: extinctionOpts))
            }
            CalculatorResultDisplay(
                label: "NIHSS",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 15 standardized stroke items. Range 0–42.\n0 no stroke  ·  1–4 minor  ·  5–15 moderate  ·  16–20 moderate-severe  ·  21–42 severe.",
                notes: "Score the patient's first response — do not coach. NIHSS certification (NINDS / AHA) is a standard requirement for stroke nurses. Trends over time are as important as the absolute number; document score, examiner, and timing at every assessment. Right- and left-sided strokes can score similarly because the scale weights aphasia and neglect heavily.",
                citations: [brott1989Nihss, nindsNihss, openrnRisk7]
            )
        }
    }
}

// MARK: - Charlson Comorbidity Index

public struct CharlsonCalculatorView: View {
    // Weight 1
    @CalcPersistedBool(calculatorID: "charlson", key: "mi")        private var mi
    @CalcPersistedBool(calculatorID: "charlson", key: "chf")       private var chf
    @CalcPersistedBool(calculatorID: "charlson", key: "pvd")       private var pvd
    @CalcPersistedBool(calculatorID: "charlson", key: "cvd")       private var cvd
    @CalcPersistedBool(calculatorID: "charlson", key: "dementia")  private var dementia
    @CalcPersistedBool(calculatorID: "charlson", key: "copd")      private var copd
    @CalcPersistedBool(calculatorID: "charlson", key: "ctd")       private var ctd       // connective tissue disease
    @CalcPersistedBool(calculatorID: "charlson", key: "pud")       private var pud       // peptic ulcer disease
    @CalcPersistedBool(calculatorID: "charlson", key: "mildLiver") private var mildLiver
    @CalcPersistedBool(calculatorID: "charlson", key: "diabetes")  private var diabetes  // uncomplicated

    // Weight 2
    @CalcPersistedBool(calculatorID: "charlson", key: "hemiplegia")     private var hemiplegia
    @CalcPersistedBool(calculatorID: "charlson", key: "modSevereCKD")   private var modSevereCKD
    @CalcPersistedBool(calculatorID: "charlson", key: "diabetesEnd")    private var diabetesEnd   // end-organ damage
    @CalcPersistedBool(calculatorID: "charlson", key: "anyTumor")       private var anyTumor       // any tumor incl. leukemia/lymphoma
    @CalcPersistedBool(calculatorID: "charlson", key: "modSevereLiver") private var modSevereLiver

    // Weight 6
    @CalcPersistedBool(calculatorID: "charlson", key: "metsTumor") private var metsTumor
    @CalcPersistedBool(calculatorID: "charlson", key: "aids")      private var aids

    // Age
    @CalcPersistedOptionID(calculatorID: "charlson", key: "ageBand") private var ageBandID
    private var ageBand: CalculatorScoreRow.Option? { ageOpts.first { $0.id == ageBandID } }

    private let ageOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 50",     score: 0),
        .init(id: 1, label: "50–59",    score: 1),
        .init(id: 2, label: "60–69",    score: 2),
        .init(id: 3, label: "70–79",    score: 3),
        .init(id: 4, label: "≥ 80",     score: 4)
    ]

    private var total: Int? {
        guard let a = ageBand else { return nil }
        // Charlson rule: when both mild and moderate-severe liver disease are present, count only the higher
        let liver = modSevereLiver ? 3 : (mildLiver ? 1 : 0)
        // Diabetes: count higher tier only
        let dm = diabetesEnd ? 2 : (diabetes ? 1 : 0)
        // Tumor: count metastatic if present, otherwise any-tumor
        let tumor = metsTumor ? 6 : (anyTumor ? 2 : 0)
        var t = 0
        // Weight 1 (excluding diabetes/liver/tumor handled above)
        for present in [mi, chf, pvd, cvd, dementia, copd, ctd, pud] where present { t += 1 }
        // Weight 2 (excluding tumor handled above)
        for present in [hemiplegia, modSevereCKD] where present { t += 2 }
        // Weight 6 (only AIDS — tumor handled above)
        if aids { t += 6 }
        t += liver + dm + tumor + a.score
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 5  { return ("Charlson ≥ 5 — published 10-year survival estimate ≈ 0–21% (Charlson 1994 derivation).", .alert) }
        if s >= 3  { return ("Charlson 3–4 — published 10-year survival estimate ≈ 53%.", .caution) }
        if s == 2  { return ("Charlson 2 — published 10-year survival estimate ≈ 90%.", .neutral) }
        if s == 1  { return ("Charlson 1 — published 10-year survival estimate ≈ 96%.", .neutral) }
        return ("Charlson 0 — published 10-year survival estimate ≈ 99% (low-risk reference).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Charlson",
            subtitle: "Comorbidity index · 10-year survival"
        ) {
            CalculatorSection("AGE") {
                CalculatorScoreRow(label: "Age band", options: ageOpts, selection: $ageBandID.option(in: ageOpts))
            }
            CalculatorSection("WEIGHT 1") {
                Toggle("Myocardial infarction (history)",            isOn: $mi).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Congestive heart failure",                   isOn: $chf).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Peripheral vascular disease",                isOn: $pvd).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Cerebrovascular disease (CVA / TIA)",        isOn: $cvd).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Dementia",                                   isOn: $dementia).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("COPD / chronic pulmonary disease",           isOn: $copd).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Connective tissue disease",                  isOn: $ctd).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Peptic ulcer disease",                       isOn: $pud).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Mild liver disease",                         isOn: $mildLiver).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Diabetes (uncomplicated)",                   isOn: $diabetes).toggleStyle(.switch)
            }
            CalculatorSection("WEIGHT 2") {
                Toggle("Hemiplegia",                                                isOn: $hemiplegia).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Moderate-to-severe CKD",                                    isOn: $modSevereCKD).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Diabetes with end-organ damage",                            isOn: $diabetesEnd).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Any tumor (including leukemia / lymphoma)",                 isOn: $anyTumor).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Moderate-to-severe liver disease",                          isOn: $modSevereLiver).toggleStyle(.switch)
            }
            CalculatorSection("WEIGHT 6") {
                Toggle("Metastatic solid tumor",                                    isOn: $metsTumor).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("AIDS",                                                      isOn: $aids).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "Charlson",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Weighted sum of comorbidities (1, 2, 3, or 6 points) + age band (0–4).\nWhere a higher tier is present (e.g., metastatic tumor, mod-severe liver, diabetes with end-organ damage), only the higher tier is counted.",
                notes: "Originally derived to predict 1-year mortality in medical inpatients (1987); the 1994 update added the age adjustment for 10-year survival estimation. Widely used in oncology, transplant, peri-operative, and dialysis populations to risk-adjust outcomes. Not a substitute for clinical judgment in any single patient.",
                citations: [charlson1987, charlson1994AgeAdj, openrnRisk7]
            )
        }
    }
}

// MARK: - Pediatric GCS

public struct PediatricGCSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "peds-gcs", key: "eye")    private var eyeID
    @CalcPersistedOptionID(calculatorID: "peds-gcs", key: "verbal") private var verbalID
    @CalcPersistedOptionID(calculatorID: "peds-gcs", key: "motor")  private var motorID

    private var eye:    CalculatorScoreRow.Option? { eyeOpts.first    { $0.id == eyeID } }
    private var verbal: CalculatorScoreRow.Option? { verbalOpts.first { $0.id == verbalID } }
    private var motor:  CalculatorScoreRow.Option? { motorOpts.first  { $0.id == motorID } }

    private let eyeOpts: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "1 · No response",                                          score: 1),
        .init(id: 2, label: "2 · Opens to pain",                                        score: 2),
        .init(id: 3, label: "3 · Opens to voice / sound",                               score: 3),
        .init(id: 4, label: "4 · Opens spontaneously",                                  score: 4)
    ]
    private let verbalOpts: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "1 · No response",                                          score: 1),
        .init(id: 2, label: "2 · Grunts; agitated and restless",                        score: 2),
        .init(id: 3, label: "3 · Cries persistently / inconsolable",                    score: 3),
        .init(id: 4, label: "4 · Irritable cry, consolable",                            score: 4),
        .init(id: 5, label: "5 · Coos, babbles, smiles (age-appropriate interaction)",  score: 5)
    ]
    private let motorOpts: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "1 · No response",                                          score: 1),
        .init(id: 2, label: "2 · Decerebrate posturing (extension)",                    score: 2),
        .init(id: 3, label: "3 · Decorticate posturing (flexion)",                      score: 3),
        .init(id: 4, label: "4 · Withdraws from pain",                                  score: 4),
        .init(id: 5, label: "5 · Withdraws from touch / localizes pain",                score: 5),
        .init(id: 6, label: "6 · Spontaneous, purposeful movement",                     score: 6)
    ]

    private var total: Int? {
        guard let e = eye, let v = verbal, let m = motor else { return nil }
        return e.score + v.score + m.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s <= 8  { return ("Peds GCS ≤ 8 — corresponds to severe TBI band; airway protection considerations apply per pediatric trauma literature.", .alert) }
        if s <= 12 { return ("Peds GCS 9–12 — moderate TBI band.", .caution) }
        return ("Peds GCS 13–15 — mild TBI band / preserved consciousness.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Peds GCS",
            subtitle: "Pediatric Glasgow Coma Scale · pre-verbal modification"
        ) {
            CalculatorSection("COMPONENTS") {
                CalculatorScoreRow(label: "Eye opening (E)",               options: eyeOpts,    selection: $eyeID.option(in: eyeOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Verbal response (V — pediatric)", options: verbalOpts, selection: $verbalID.option(in: verbalOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Motor response (M)",            options: motorOpts,  selection: $motorID.option(in: motorOpts))
            }
            CalculatorResultDisplay(
                label: "Peds GCS",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of E (1–4), V (1–5 — pediatric), M (1–6). Range 3–15.\nVerbal subscale replaces standard GCS verbal items with developmentally-appropriate descriptors for pre-verbal children.",
                notes: "Used in children too young to follow standard GCS verbal items (typically < 2 years; some institutions extend to 5 years). Document the verbal subscale variant used (peds vs. adult) at every assessment. For older children with developmental ages matching standard GCS verbal cues, the standard adult GCS may be more appropriate.",
                citations: [holmes2005PedsGcs, openrnRisk7]
            )
        }
    }
}
