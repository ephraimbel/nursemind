import SwiftUI

// MARK: - Shared citation sources

private let vanSwieten1988Mrs = CitationSource(
    id: "van_swieten_1988_mrs",
    shortName: "Modified Rankin Scale — van Swieten JC et al., Stroke 1988 (concept citation)",
    detail: "Standardized 7-grade global disability scale used as the primary outcome in most stroke trials",
    publisher: "Stroke",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/3363593/",
    lastRetrieved: "2026-05-05"
)

private let huntHess1968 = CitationSource(
    id: "hunt_hess_1968",
    shortName: "Hunt and Hess — Hunt WE, Hess RM, J Neurosurg 1968 (concept citation)",
    detail: "Clinical grading of subarachnoid hemorrhage; the most-cited SAH severity scale",
    publisher: "Journal of Neurosurgery",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/5635959/",
    lastRetrieved: "2026-05-05"
)

private let hemphill2001Ich = CitationSource(
    id: "hemphill_2001_ich",
    shortName: "ICH Score — Hemphill JC et al., Stroke 2001 (concept citation)",
    detail: "5-component intracerebral-hemorrhage 30-day mortality predictor",
    publisher: "Stroke",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/11283388/",
    lastRetrieved: "2026-05-05"
)

private let asa2020Status = CitationSource(
    id: "asa_2020_status",
    shortName: "ASA Physical Status Classification — ASA, 2020 update (concept citation)",
    detail: "American Society of Anesthesiologists pre-anesthetic physical status classification",
    publisher: "American Society of Anesthesiologists",
    license: .factCitationOnly,
    url: "https://www.asahq.org/standards-and-practice-parameters/statement-on-asa-physical-status-classification-system",
    lastRetrieved: "2026-05-05"
)

private let mallampati1985 = CitationSource(
    id: "mallampati_1985",
    shortName: "Mallampati — Mallampati SR et al., Can Anaesth Soc J 1985; modified by Samsoon & Young, Anaesthesia 1987 (concept citation)",
    detail: "Oropharyngeal-visualization grading used as a pre-operative airway-difficulty screen",
    publisher: "Canadian Anaesthetists' Society Journal",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/4027773/",
    lastRetrieved: "2026-05-05"
)

private let bone1992Sirs = CitationSource(
    id: "bone_1992_sirs",
    shortName: "SIRS — Bone RC et al. (ACCP/SCCM Consensus), Chest 1992 (concept citation)",
    detail: "Systemic Inflammatory Response Syndrome criteria; Sepsis-1/2 framework, partly superseded by Sepsis-3 / qSOFA",
    publisher: "Chest",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/1303622/",
    lastRetrieved: "2026-05-05"
)

private let westley1978Croup = CitationSource(
    id: "westley_1978_croup",
    shortName: "Westley Croup Score — Westley CR et al., Am J Dis Child 1978 (concept citation)",
    detail: "5-item severity score for pediatric croup",
    publisher: "American Journal of Diseases of Children",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/350062/",
    lastRetrieved: "2026-05-05"
)

private let mahoney1965Barthel = CitationSource(
    id: "mahoney_1965_barthel",
    shortName: "Barthel Index — Mahoney FI, Barthel DW, Md State Med J 1965 (concept citation)",
    detail: "10-item activities-of-daily-living scale for functional independence",
    publisher: "Maryland State Medical Journal",
    license: .factCitationOnly,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK207247/",
    lastRetrieved: "2026-05-05"
)

private let openrnRisk10 = CitationSource(
    id: "openrn_risk_10",
    shortName: "Open RN Health Alterations — Stroke / Pre-op / SIRS / Pediatrics / ADLs",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=stroke+pediatric+functional+pre-op",
    lastRetrieved: "2026-05-05"
)

// MARK: - Modified Rankin Scale (mRS)

public struct MRSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "mrs", key: "level") private var levelID
    private var level: CalculatorScoreRow.Option? { levelOptions.first { $0.id == levelID } }

    private let levelOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · No symptoms",                                                       score: 0),
        .init(id: 1, label: "1 · No significant disability despite symptoms",                        score: 1),
        .init(id: 2, label: "2 · Slight disability — unable to do all previous activities",           score: 2),
        .init(id: 3, label: "3 · Moderate disability — requires some help",                          score: 3),
        .init(id: 4, label: "4 · Moderately severe disability — unable to walk without assistance",   score: 4),
        .init(id: 5, label: "5 · Severe disability — bedridden, requiring constant care",            score: 5),
        .init(id: 6, label: "6 · Dead",                                                              score: 6)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = level else { return nil }
        switch l.score {
        case 0...2: return ("mRS 0–2 — published 'good functional outcome' threshold used as the primary endpoint in most acute-stroke trials.", .neutral)
        case 3...4: return ("mRS 3–4 — moderate to moderately-severe disability; requires assistance with daily activities per published descriptors.", .caution)
        case 5:     return ("mRS 5 — severe disability; bedridden and requiring constant care per published descriptors.", .alert)
        default:    return ("mRS 6 — death.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Modified Rankin Scale",
            subtitle: "Stroke functional outcome · 0–6"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Best descriptor", options: levelOptions, selection: $levelID.option(in: levelOptions))
            }
            CalculatorResultDisplay(
                label: "mRS",
                value: level.map { "\($0.score)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 7-grade ordinal scale (0–6).\nThe 0–2 split is the standard 'good outcome' endpoint in acute-stroke trial literature (e.g., NINDS, MR CLEAN).",
                notes: "Assigned by structured interview with patient or caregiver. Inter-rater reliability is improved with the published structured-interview format. Captures global function — does not localize the deficit (use NIHSS for that).",
                citations: [vanSwieten1988Mrs, openrnRisk10]
            )
        }
    }
}

// MARK: - Hunt and Hess

public struct HuntHessCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "hunt-hess", key: "grade") private var gradeID
    private var grade: CalculatorScoreRow.Option? { gradeOptions.first { $0.id == gradeID } }

    private let gradeOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "Grade I — asymptomatic or mild headache, slight nuchal rigidity",                        score: 1),
        .init(id: 2, label: "Grade II — moderate-severe headache, nuchal rigidity, no deficit other than CN palsy",   score: 2),
        .init(id: 3, label: "Grade III — drowsiness, confusion, or mild focal deficit",                                score: 3),
        .init(id: 4, label: "Grade IV — stupor, moderate-severe hemiparesis, possibly early decerebrate posturing",    score: 4),
        .init(id: 5, label: "Grade V — deep coma, decerebrate posturing, moribund appearance",                          score: 5)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let g = grade else { return nil }
        switch g.score {
        case 1: return ("Grade I — published mortality ≈ 11% (Hunt and Hess 1968 derivation cohort).", .neutral)
        case 2: return ("Grade II — published mortality ≈ 26%.", .caution)
        case 3: return ("Grade III — published mortality ≈ 37%.", .alert)
        case 4: return ("Grade IV — published mortality ≈ 71%.", .alert)
        default: return ("Grade V — published mortality ≈ 100% in original cohort.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Hunt and Hess",
            subtitle: "Subarachnoid hemorrhage clinical grading"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Grade", options: gradeOptions, selection: $gradeID.option(in: gradeOptions))
            }
            CalculatorResultDisplay(
                label: "H&H",
                value: grade.map { "\($0.score)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 5-grade clinical scale (I–V) at presentation.\nMortality strata published in the 1968 derivation cohort.",
                notes: "Use the WORST grade in the first 24 hours. Add a + grade for severe systemic disease (HTN, DM, COPD, severe atherosclerosis). The WFNS scale (which incorporates GCS) is the more modern alternative used in many trials. Hunt and Hess remains the most-cited bedside SAH grading in the U.S.",
                citations: [huntHess1968, openrnRisk10]
            )
        }
    }
}

// MARK: - ICH Score

public struct ICHScoreCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "ich", key: "gcs")          private var gcsID
    @CalcPersistedBool(calculatorID: "ich", key: "ageGE80")          private var ageGE80
    @CalcPersistedBool(calculatorID: "ich", key: "infratentorial")   private var infratentorial
    @CalcPersistedBool(calculatorID: "ich", key: "volumeGE30")       private var volumeGE30
    @CalcPersistedBool(calculatorID: "ich", key: "ivh")              private var ivh

    private var gcsOption: CalculatorScoreRow.Option? { gcsOpts.first { $0.id == gcsID } }

    private let gcsOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "GCS 13–15", score: 0),
        .init(id: 1, label: "GCS 5–12",  score: 1),
        .init(id: 2, label: "GCS 3–4",   score: 2)
    ]

    private var total: Int? {
        guard let g = gcsOption else { return nil }
        var t = g.score
        if ageGE80         { t += 1 }
        if infratentorial  { t += 1 }
        if volumeGE30      { t += 1 }
        if ivh             { t += 1 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        switch s {
        case 0:  return ("ICH Score 0 — published 30-day mortality 0% (Hemphill 2001 derivation cohort).", .neutral)
        case 1:  return ("ICH Score 1 — published 30-day mortality ≈ 13%.", .caution)
        case 2:  return ("ICH Score 2 — published 30-day mortality ≈ 26%.", .alert)
        case 3:  return ("ICH Score 3 — published 30-day mortality ≈ 72%.", .alert)
        case 4:  return ("ICH Score 4 — published 30-day mortality ≈ 97%.", .alert)
        default: return ("ICH Score 5–6 — published 30-day mortality ≈ 100% in original cohort.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "ICH Score",
            subtitle: "Intracerebral hemorrhage 30-day mortality"
        ) {
            CalculatorSection("CRITERIA") {
                CalculatorScoreRow(label: "Glasgow Coma Scale", options: gcsOpts, selection: $gcsID.option(in: gcsOpts))
                Hairline(color: NMColor.borderSubtle)
                Toggle("Age ≥ 80 years (+1)",                                  isOn: $ageGE80).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Infratentorial origin (+1)",                            isOn: $infratentorial).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("ICH volume ≥ 30 mL on CT (+1)",                         isOn: $volumeGE30).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Intraventricular hemorrhage present (+1)",              isOn: $ivh).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "ICH Score",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 components. Range 0–6.\nMortality strata published in Hemphill 2001 derivation.",
                notes: "ICH volume measured by the ABC/2 ellipsoid method on initial CT (A × B × C ÷ 2, in cm). Use the GCS at initial presentation. The score has been externally validated across multiple cohorts but should not by itself drive limitation-of-care decisions in the first 24 hours per published consensus.",
                citations: [hemphill2001Ich, openrnRisk10]
            )
        }
    }
}

// MARK: - ASA Physical Status

public struct ASAStatusCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "asa-ps", key: "level") private var levelID
    @CalcPersistedBool(calculatorID: "asa-ps", key: "emergency") private var emergency

    private var level: CalculatorScoreRow.Option? { levelOptions.first { $0.id == levelID } }

    private let levelOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "ASA I — A normal healthy patient",                                              score: 1),
        .init(id: 2, label: "ASA II — Mild systemic disease",                                                 score: 2),
        .init(id: 3, label: "ASA III — Severe systemic disease",                                              score: 3),
        .init(id: 4, label: "ASA IV — Severe systemic disease that is a constant threat to life",             score: 4),
        .init(id: 5, label: "ASA V — Moribund patient not expected to survive without the operation",         score: 5),
        .init(id: 6, label: "ASA VI — Brain-dead patient whose organs are being removed for donation",        score: 6)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = level else { return nil }
        let suffix = emergency ? "E" : ""
        switch l.score {
        case 1...2: return ("ASA \(roman(l.score))\(suffix) — low pre-operative risk band per ASA 2020 classification.", .neutral)
        case 3:     return ("ASA III\(suffix) — substantial pre-operative risk band per ASA 2020 classification.", .caution)
        case 4:     return ("ASA IV\(suffix) — high pre-operative risk band per ASA 2020 classification.", .alert)
        case 5:     return ("ASA V\(suffix) — moribund pre-operative status per ASA 2020 classification.", .alert)
        default:    return ("ASA VI — declared brain death per ASA 2020 classification.", .alert)
        }
    }

    private func roman(_ n: Int) -> String {
        switch n { case 1: return "I"; case 2: return "II"; case 3: return "III"; case 4: return "IV"; case 5: return "V"; default: return "VI" }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "ASA Physical Status",
            subtitle: "Pre-anesthetic classification · 1–6"
        ) {
            CalculatorSection("CLASSIFICATION") {
                CalculatorScoreRow(label: "Level", options: levelOptions, selection: $levelID.option(in: levelOptions))
                Hairline(color: NMColor.borderSubtle)
                Toggle("Emergency case (E suffix)", isOn: $emergency).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "ASA",
                value: level.map { roman($0.score) + (emergency ? "E" : "") },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 6-grade pre-anesthetic classification with optional 'E' suffix for emergency cases.",
                notes: "ASA 2020 update added illustrative examples to each grade — see the ASA reference link. Mild systemic disease (ASA II) examples include current smoker, social alcohol, pregnancy, obesity (BMI 30–40), well-controlled DM/HTN, mild lung disease. Severe (ASA III) examples include poorly-controlled DM/HTN, COPD, morbid obesity (BMI ≥ 40), CKD, MI > 3 months ago, pacemaker, EF reduction. Constant threat (ASA IV): MI < 3 months, ongoing ischemia, severe valve dysfunction, sepsis, DIC, ARDS, ESRD not on schedule.",
                citations: [asa2020Status, openrnRisk10]
            )
        }
    }
}

// MARK: - Mallampati

public struct MallampatiCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "mallampati", key: "level") private var levelID
    private var level: CalculatorScoreRow.Option? { levelOptions.first { $0.id == levelID } }

    private let levelOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "Class I — soft palate, fauces, uvula, pillars all visible",  score: 1),
        .init(id: 2, label: "Class II — soft palate, fauces, uvula visible (no pillars)", score: 2),
        .init(id: 3, label: "Class III — soft palate, base of uvula visible",              score: 3),
        .init(id: 4, label: "Class IV — only hard palate visible",                         score: 4)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = level else { return nil }
        switch l.score {
        case 1...2: return ("Mallampati I–II — published lower likelihood of difficult laryngoscopy per Samsoon & Young 1987 modification.", .neutral)
        case 3:     return ("Mallampati III — published intermediate likelihood of difficult laryngoscopy.", .caution)
        default:    return ("Mallampati IV — published higher likelihood of difficult laryngoscopy.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Mallampati",
            subtitle: "Pre-operative airway visualization"
        ) {
            CalculatorSection("CLASSIFICATION") {
                CalculatorScoreRow(label: "Class", options: levelOptions, selection: $levelID.option(in: levelOptions))
            }
            CalculatorResultDisplay(
                label: "Mallampati",
                value: level.map { String($0.score) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 4-class scale based on oropharyngeal visualization with the patient seated, mouth maximally open, tongue protruded, no phonation.",
                notes: "Pair with other published difficult-airway predictors (LEMON, thyromental distance, neck mobility, mouth opening). Mallampati alone has modest sensitivity for difficult intubation — its value is in the BUNDLE of pre-op airway assessment, not as a stand-alone screen.",
                citations: [mallampati1985, openrnRisk10]
            )
        }
    }
}

// MARK: - SIRS

public struct SIRSCalculatorView: View {
    @CalcPersistedBool(calculatorID: "sirs", key: "tempAbn") private var tempAbn
    @CalcPersistedBool(calculatorID: "sirs", key: "hrAbn")   private var hrAbn
    @CalcPersistedBool(calculatorID: "sirs", key: "rrAbn")   private var rrAbn
    @CalcPersistedBool(calculatorID: "sirs", key: "wbcAbn")  private var wbcAbn

    private var total: Int {
        [tempAbn, hrAbn, rrAbn, wbcAbn].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total >= 2 { return ("SIRS ≥ 2 — meets the published 1992 ACCP/SCCM consensus SIRS criteria. The Sepsis-3 framework (Singer 2016) replaced SIRS with qSOFA for sepsis screening, but SIRS remains in many institutional protocols and is a widely-recognized inflammatory-response marker.", .alert) }
        if total == 1 { return ("SIRS = 1 — single positive criterion; below the published ACCP/SCCM threshold.", .caution) }
        return ("SIRS = 0 — no SIRS criteria met at this assessment.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "SIRS",
            subtitle: "Systemic Inflammatory Response Syndrome · 1992"
        ) {
            CalculatorSection("CRITERIA") {
                Toggle("Temperature > 38 °C OR < 36 °C",                              isOn: $tempAbn).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Heart rate > 90 bpm",                                         isOn: $hrAbn).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Respiratory rate > 20 OR PaCO₂ < 32 mmHg",                    isOn: $rrAbn).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("WBC > 12 K, < 4 K, OR > 10% bands",                            isOn: $wbcAbn).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "SIRS",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 4 binary criteria. Range 0–4.\nSIRS positive = ≥ 2 criteria.",
                notes: "Originally the entry criterion for sepsis (SIRS + suspected infection) under the 1992 ACCP/SCCM consensus. Sepsis-3 (2016) replaced SIRS with qSOFA for bedside sepsis screening because SIRS lacks specificity. Many institutions still embed SIRS in their EHR sepsis-alert logic. Pair with qSOFA for a complete bedside picture.",
                citations: [bone1992Sirs, openrnRisk10]
            )
        }
    }
}

// MARK: - Westley Croup

public struct WestleyCroupCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "westley", key: "loc")       private var locID
    @CalcPersistedOptionID(calculatorID: "westley", key: "cyanosis")  private var cyanosisID
    @CalcPersistedOptionID(calculatorID: "westley", key: "stridor")   private var stridorID
    @CalcPersistedOptionID(calculatorID: "westley", key: "airEntry")  private var airEntryID
    @CalcPersistedOptionID(calculatorID: "westley", key: "retract")   private var retractID

    private var loc:       CalculatorScoreRow.Option? { locOpts.first       { $0.id == locID } }
    private var cyanosis:  CalculatorScoreRow.Option? { cyanosisOpts.first  { $0.id == cyanosisID } }
    private var stridor:   CalculatorScoreRow.Option? { stridorOpts.first   { $0.id == stridorID } }
    private var airEntry:  CalculatorScoreRow.Option? { airEntryOpts.first  { $0.id == airEntryID } }
    private var retract:   CalculatorScoreRow.Option? { retractOpts.first   { $0.id == retractID } }

    private let locOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Normal",       score: 0),
        .init(id: 1, label: "Disoriented",  score: 5)
    ]
    private let cyanosisOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "None",            score: 0),
        .init(id: 1, label: "With agitation",  score: 4),
        .init(id: 2, label: "At rest",         score: 5)
    ]
    private let stridorOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "None",            score: 0),
        .init(id: 1, label: "With agitation",  score: 1),
        .init(id: 2, label: "At rest",         score: 2)
    ]
    private let airEntryOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Normal",                score: 0),
        .init(id: 1, label: "Decreased",             score: 1),
        .init(id: 2, label: "Markedly decreased",    score: 2)
    ]
    private let retractOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "None",       score: 0),
        .init(id: 1, label: "Mild",       score: 1),
        .init(id: 2, label: "Moderate",   score: 2),
        .init(id: 3, label: "Severe",     score: 3)
    ]

    private var total: Int? {
        guard let a = loc, let b = cyanosis, let c = stridor,
              let d = airEntry, let e = retract else { return nil }
        return a.score + b.score + c.score + d.score + e.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 12 { return ("Westley ≥ 12 — published 'impending respiratory failure' band per Westley 1978.", .alert) }
        if s >= 6  { return ("Westley 6–11 — severe-croup band.", .alert) }
        if s >= 3  { return ("Westley 3–5 — moderate-croup band.", .caution) }
        return ("Westley ≤ 2 — mild-croup band per published cutoffs.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Westley Croup",
            subtitle: "Pediatric croup severity"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Level of consciousness", options: locOpts,      selection: $locID.option(in: locOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Cyanosis",                options: cyanosisOpts, selection: $cyanosisID.option(in: cyanosisOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Stridor",                 options: stridorOpts,  selection: $stridorID.option(in: stridorOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Air entry",               options: airEntryOpts, selection: $airEntryID.option(in: airEntryOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Retractions",             options: retractOpts,  selection: $retractID.option(in: retractOpts))
            }
            CalculatorResultDisplay(
                label: "Westley",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 weighted items. Range 0–17.\nMild ≤ 2  ·  Moderate 3–5  ·  Severe 6–11  ·  Impending failure ≥ 12.",
                notes: "The most-cited croup severity score; widely used in peds ED and outpatient settings to track response to nebulized epinephrine and dexamethasone. Stridor descriptors are based on auscultation at rest vs. with agitation — agitate the child gently if stridor is not audible at rest.",
                citations: [westley1978Croup, openrnRisk10]
            )
        }
    }
}

// MARK: - Barthel Index

public struct BarthelIndexCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "barthel", key: "feeding")  private var feedingID
    @CalcPersistedOptionID(calculatorID: "barthel", key: "bathing")  private var bathingID
    @CalcPersistedOptionID(calculatorID: "barthel", key: "grooming") private var groomingID
    @CalcPersistedOptionID(calculatorID: "barthel", key: "dressing") private var dressingID
    @CalcPersistedOptionID(calculatorID: "barthel", key: "bowels")   private var bowelsID
    @CalcPersistedOptionID(calculatorID: "barthel", key: "bladder")  private var bladderID
    @CalcPersistedOptionID(calculatorID: "barthel", key: "toilet")   private var toiletID
    @CalcPersistedOptionID(calculatorID: "barthel", key: "transfer") private var transferID
    @CalcPersistedOptionID(calculatorID: "barthel", key: "mobility") private var mobilityID
    @CalcPersistedOptionID(calculatorID: "barthel", key: "stairs")   private var stairsID

    private var feeding:  CalculatorScoreRow.Option? { feedingOpts.first  { $0.id == feedingID } }
    private var bathing:  CalculatorScoreRow.Option? { bathingOpts.first  { $0.id == bathingID } }
    private var grooming: CalculatorScoreRow.Option? { groomingOpts.first { $0.id == groomingID } }
    private var dressing: CalculatorScoreRow.Option? { dressingOpts.first { $0.id == dressingID } }
    private var bowels:   CalculatorScoreRow.Option? { bowelsOpts.first   { $0.id == bowelsID } }
    private var bladder:  CalculatorScoreRow.Option? { bladderOpts.first  { $0.id == bladderID } }
    private var toilet:   CalculatorScoreRow.Option? { toiletOpts.first   { $0.id == toiletID } }
    private var transfer: CalculatorScoreRow.Option? { transferOpts.first { $0.id == transferID } }
    private var mobility: CalculatorScoreRow.Option? { mobilityOpts.first { $0.id == mobilityID } }
    private var stairs:   CalculatorScoreRow.Option? { stairsOpts.first   { $0.id == stairsID } }

    private let feedingOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Unable",      score: 0),
        .init(id: 1, label: "Needs help",  score: 5),
        .init(id: 2, label: "Independent", score: 10)
    ]
    private let bathingOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Dependent",   score: 0),
        .init(id: 1, label: "Independent", score: 5)
    ]
    private let groomingOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Needs help",   score: 0),
        .init(id: 1, label: "Independent",  score: 5)
    ]
    private let dressingOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Dependent",        score: 0),
        .init(id: 1, label: "Needs some help",  score: 5),
        .init(id: 2, label: "Independent",      score: 10)
    ]
    private let bowelsOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Incontinent / enemas",         score: 0),
        .init(id: 1, label: "Occasional accident",          score: 5),
        .init(id: 2, label: "Continent",                    score: 10)
    ]
    private let bladderOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Incontinent / catheterized",   score: 0),
        .init(id: 1, label: "Occasional accident",          score: 5),
        .init(id: 2, label: "Continent",                    score: 10)
    ]
    private let toiletOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Dependent",        score: 0),
        .init(id: 1, label: "Needs some help",  score: 5),
        .init(id: 2, label: "Independent",      score: 10)
    ]
    private let transferOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Unable, no sitting balance",          score: 0),
        .init(id: 1, label: "Major help (1–2 people, physical)",   score: 5),
        .init(id: 2, label: "Minor help (verbal or physical)",     score: 10),
        .init(id: 3, label: "Independent",                         score: 15)
    ]
    private let mobilityOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Immobile",                                  score: 0),
        .init(id: 1, label: "Wheelchair-independent (incl. corners)",    score: 5),
        .init(id: 2, label: "Walks with help of one person",             score: 10),
        .init(id: 3, label: "Independent (may use any aid)",             score: 15)
    ]
    private let stairsOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Unable",                  score: 0),
        .init(id: 1, label: "Needs help (verbal/physical)", score: 5),
        .init(id: 2, label: "Independent",             score: 10)
    ]

    private var total: Int? {
        let parts = [feeding, bathing, grooming, dressing, bowels,
                     bladder, toilet, transfer, mobility, stairs]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        switch s {
        case 0...20:   return ("Barthel 0–20 — total-dependence band per published descriptors.", .alert)
        case 21...60:  return ("Barthel 21–60 — severe-dependence band.", .alert)
        case 61...90:  return ("Barthel 61–90 — moderate-dependence band.", .caution)
        case 91...99:  return ("Barthel 91–99 — slight-dependence band.", .caution)
        default:       return ("Barthel = 100 — independence band per published descriptors.", .neutral)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Barthel Index",
            subtitle: "Activities of daily living · 0–100"
        ) {
            CalculatorSection("ADL") {
                CalculatorScoreRow(label: "Feeding",   options: feedingOpts,  selection: $feedingID.option(in: feedingOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Bathing",   options: bathingOpts,  selection: $bathingID.option(in: bathingOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Grooming",  options: groomingOpts, selection: $groomingID.option(in: groomingOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Dressing",  options: dressingOpts, selection: $dressingID.option(in: dressingOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Bowels",    options: bowelsOpts,   selection: $bowelsID.option(in: bowelsOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Bladder",   options: bladderOpts,  selection: $bladderID.option(in: bladderOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Toilet use", options: toiletOpts,  selection: $toiletID.option(in: toiletOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Transfer",  options: transferOpts, selection: $transferID.option(in: transferOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Mobility",  options: mobilityOpts, selection: $mobilityID.option(in: mobilityOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Stairs",    options: stairsOpts,   selection: $stairsID.option(in: stairsOpts))
            }
            CalculatorResultDisplay(
                label: "Barthel",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 10 weighted ADL items. Range 0–100.\nDependence bands: 0–20 total · 21–60 severe · 61–90 moderate · 91–99 slight · 100 independent.",
                notes: "Most widely used ADL scale in stroke rehabilitation, post-acute care, and geriatrics. Score the patient's actual performance over the past 24–48 hours, not what they could potentially do. Barthel does not capture instrumental ADLs (cooking, finances) — pair with the Lawton IADL scale for a fuller picture.",
                citations: [mahoney1965Barthel, openrnRisk10]
            )
        }
    }
}
