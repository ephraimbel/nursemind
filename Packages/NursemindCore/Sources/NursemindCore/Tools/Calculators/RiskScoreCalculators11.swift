import SwiftUI

// MARK: - Shared citation sources

private let bishop1964 = CitationSource(
    id: "bishop_1964",
    shortName: "Bishop Score — Bishop EH, Obstet Gynecol 1964 (concept citation)",
    detail: "5-component cervical-readiness assessment for labor induction success",
    publisher: "Obstetrics and Gynecology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/14199536/",
    lastRetrieved: "2026-05-06"
)

private let johns1991Epworth = CitationSource(
    id: "johns_1991_epworth",
    shortName: "Epworth Sleepiness Scale — Johns MW, Sleep 1991 (concept citation)",
    detail: "8-item self-rated daytime sleepiness scale",
    publisher: "Sleep",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/1798888/",
    lastRetrieved: "2026-05-06"
)

private let saunders1993Audit = CitationSource(
    id: "saunders_1993_audit",
    shortName: "AUDIT — Saunders JB et al., Addiction 1993 (concept citation)",
    detail: "WHO Alcohol Use Disorders Identification Test — 10-item full screen",
    publisher: "Addiction",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/8329970/",
    lastRetrieved: "2026-05-06"
)

private let apfel1999 = CitationSource(
    id: "apfel_1999",
    shortName: "Apfel Score — Apfel CC et al., Anesthesiology 1999 (concept citation)",
    detail: "4-item simplified risk score for post-operative nausea and vomiting",
    publisher: "Anesthesiology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/10485781/",
    lastRetrieved: "2026-05-06"
)

private let lawton1969 = CitationSource(
    id: "lawton_1969",
    shortName: "Lawton IADL — Lawton MP, Brody EM, Gerontologist 1969 (concept citation)",
    detail: "8-item Instrumental Activities of Daily Living scale",
    publisher: "The Gerontologist",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/5349366/",
    lastRetrieved: "2026-05-06"
)

private let podsiadlo1991Tug = CitationSource(
    id: "podsiadlo_1991_tug",
    shortName: "Timed Up and Go — Podsiadlo D, Richardson S, J Am Geriatr Soc 1991 (concept citation)",
    detail: "Time to rise from chair, walk 3 m, return, and sit — global mobility/falls indicator",
    publisher: "Journal of the American Geriatrics Society",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/1991946/",
    lastRetrieved: "2026-05-06"
)

private let monaghan2005Pews = CitationSource(
    id: "monaghan_2005_pews",
    shortName: "PEWS (Brighton) — Monaghan A, Paediatr Nurs 2005 (concept citation)",
    detail: "Pediatric Early Warning Score for ward-deterioration recognition",
    publisher: "Paediatric Nursing",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/15835446/",
    lastRetrieved: "2026-05-06"
)

private let drake1988Wfns = CitationSource(
    id: "drake_1988_wfns",
    shortName: "WFNS SAH Grade — Report of the World Federation of Neurosurgical Societies, J Neurosurg 1988 (concept citation)",
    detail: "GCS-based subarachnoid hemorrhage clinical grade",
    publisher: "Journal of Neurosurgery",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/3193210/",
    lastRetrieved: "2026-05-06"
)

private let bouhassira2005Dn4 = CitationSource(
    id: "bouhassira_2005_dn4",
    shortName: "DN4 — Bouhassira D et al., Pain 2005 (concept citation)",
    detail: "10-item interview-and-exam screen for neuropathic pain",
    publisher: "Pain",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/15733628/",
    lastRetrieved: "2026-05-06"
)

private let hirschfeld2000Mdq = CitationSource(
    id: "hirschfeld_2000_mdq",
    shortName: "MDQ — Hirschfeld RM et al., Am J Psychiatry 2000 (concept citation)",
    detail: "13-item Mood Disorder Questionnaire — bipolar-spectrum screening",
    publisher: "American Journal of Psychiatry",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/11058490/",
    lastRetrieved: "2026-05-06"
)

private let openrnRisk11 = CitationSource(
    id: "openrn_risk_11",
    shortName: "Open RN Health Alterations & Mental Health — OB / Sleep / PACU / Geriatrics / Pediatrics / Pain",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=induction+sleep+PONV+pediatric+falls",
    lastRetrieved: "2026-05-06"
)

// MARK: - Bishop Score

public struct BishopCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "bishop", key: "dilation")    private var dilationID
    @CalcPersistedOptionID(calculatorID: "bishop", key: "effacement")  private var effacementID
    @CalcPersistedOptionID(calculatorID: "bishop", key: "consistency") private var consistencyID
    @CalcPersistedOptionID(calculatorID: "bishop", key: "position")    private var positionID
    @CalcPersistedOptionID(calculatorID: "bishop", key: "station")     private var stationID

    private var dilation:    CalculatorScoreRow.Option? { dilationOpts.first    { $0.id == dilationID } }
    private var effacement:  CalculatorScoreRow.Option? { effacementOpts.first  { $0.id == effacementID } }
    private var consistency: CalculatorScoreRow.Option? { consistencyOpts.first { $0.id == consistencyID } }
    private var position:    CalculatorScoreRow.Option? { positionOpts.first    { $0.id == positionID } }
    private var station:     CalculatorScoreRow.Option? { stationOpts.first     { $0.id == stationID } }

    private let dilationOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Closed",          score: 0),
        .init(id: 1, label: "1–2 cm",          score: 1),
        .init(id: 2, label: "3–4 cm",          score: 2),
        .init(id: 3, label: "≥ 5 cm",          score: 3)
    ]
    private let effacementOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0–30%",           score: 0),
        .init(id: 1, label: "40–50%",          score: 1),
        .init(id: 2, label: "60–70%",          score: 2),
        .init(id: 3, label: "≥ 80%",           score: 3)
    ]
    private let consistencyOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Firm",            score: 0),
        .init(id: 1, label: "Medium",          score: 1),
        .init(id: 2, label: "Soft",            score: 2)
    ]
    private let positionOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Posterior",       score: 0),
        .init(id: 1, label: "Midposition",     score: 1),
        .init(id: 2, label: "Anterior",        score: 2)
    ]
    private let stationOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "−3",              score: 0),
        .init(id: 1, label: "−2",              score: 1),
        .init(id: 2, label: "−1 / 0",          score: 2),
        .init(id: 3, label: "+1 / +2",         score: 3)
    ]

    private var total: Int? {
        guard let a = dilation, let b = effacement, let c = consistency,
              let d = position, let e = station else { return nil }
        return a.score + b.score + c.score + d.score + e.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 8 { return ("Bishop ≥ 8 — favorable cervix; published induction-success rates approach those of spontaneous labor in derivation cohorts.", .neutral) }
        if s >= 6 { return ("Bishop 6–7 — indeterminate band per published cutoffs.", .caution) }
        return ("Bishop ≤ 5 — unfavorable cervix per published cutoffs; cervical ripening literature uses this band as the threshold for considering ripening before induction.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Bishop Score",
            subtitle: "Cervical readiness for induction"
        ) {
            CalculatorSection("CERVIX") {
                CalculatorScoreRow(label: "Dilation",     options: dilationOpts,    selection: $dilationID.option(in: dilationOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Effacement",   options: effacementOpts,  selection: $effacementID.option(in: effacementOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Consistency",  options: consistencyOpts, selection: $consistencyID.option(in: consistencyOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Position",     options: positionOpts,    selection: $positionID.option(in: positionOpts))
            }
            CalculatorSection("FETAL") {
                CalculatorScoreRow(label: "Station",      options: stationOpts,     selection: $stationID.option(in: stationOpts))
            }
            CalculatorResultDisplay(
                label: "Bishop",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 cervical/fetal components. Range 0–13.\n≥ 8 favorable  ·  6–7 indeterminate  ·  ≤ 5 unfavorable.",
                notes: "ACOG 2009 endorses cervical-ripening agents (mechanical or pharmacologic) for the unfavorable-cervix band. Modified Bishop scores (Burnett, Calder) drop the consistency/position items in favor of dilation and station alone — institutions vary.",
                citations: [bishop1964, openrnRisk11]
            )
        }
    }
}

// MARK: - Epworth Sleepiness Scale

public struct EpworthCalculatorView: View {
    @CalcPersistedOptionIDArray(calculatorID: "epworth", key: "items", count: 8) private var itemIDs

    private let labels: [String] = [
        "Sitting and reading",
        "Watching TV",
        "Sitting inactive in a public place",
        "As a passenger in a car for an hour without a break",
        "Lying down to rest in the afternoon when circumstances permit",
        "Sitting and talking to someone",
        "Sitting quietly after lunch without alcohol",
        "In a car, while stopped for a few minutes in traffic"
    ]

    private let opts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — Would never doze",          score: 0),
        .init(id: 1, label: "1 — Slight chance of dozing",    score: 1),
        .init(id: 2, label: "2 — Moderate chance of dozing",  score: 2),
        .init(id: 3, label: "3 — High chance of dozing",      score: 3)
    ]

    private var items: [CalculatorScoreRow.Option?] {
        itemIDs.map { id in opts.first { $0.id == id } }
    }

    private var total: Int? {
        guard items.allSatisfy({ $0 != nil }) else { return nil }
        return items.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        switch s {
        case 0...5:   return ("ESS 0–5 — published 'lower normal' band.", .neutral)
        case 6...10:  return ("ESS 6–10 — published 'higher normal' band.", .neutral)
        case 11...12: return ("ESS 11–12 — mild excessive daytime sleepiness band.", .caution)
        case 13...15: return ("ESS 13–15 — moderate excessive daytime sleepiness band.", .alert)
        default:      return ("ESS 16–24 — severe excessive daytime sleepiness band.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Epworth",
            subtitle: "Daytime sleepiness · 0–24"
        ) {
            CalculatorSection("HOW LIKELY ARE YOU TO DOZE?") {
                ForEach(Array(labels.enumerated()), id: \.offset) { idx, label in
                    CalculatorScoreRow(
                        label: "\(idx + 1). \(label)",
                        options: opts,
                        selection: Binding(
                            get: { items[idx] },
                            set: { newValue in
                                var updated = itemIDs
                                updated[idx] = newValue?.id
                                itemIDs = updated
                            }
                        )
                    )
                    if idx < labels.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
            CalculatorResultDisplay(
                label: "ESS",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 8 items, each 0–3. Range 0–24.\nLower normal 0–5 · Higher normal 6–10 · Mild 11–12 · Moderate 13–15 · Severe 16–24.",
                notes: "Self-rated, validated for adults. Pair with STOP-BANG (a screening tool focused on OSA) — Epworth captures daytime symptom burden, STOP-BANG captures structural/clinical risk factors. Polysomnography or home sleep study is required for OSA diagnosis.",
                citations: [johns1991Epworth, openrnRisk11]
            )
        }
    }
}

// MARK: - AUDIT (full WHO 10-item)

public struct AUDITCalculatorView: View {
    @CalcPersistedOptionIDArray(calculatorID: "audit-full", key: "items", count: 10) private var itemIDs

    private let labels: [String] = [
        "How often do you have a drink containing alcohol?",
        "How many drinks containing alcohol do you have on a typical day when you are drinking?",
        "How often do you have six or more drinks on one occasion?",
        "How often during the last year have you found that you were not able to stop drinking once you had started?",
        "How often during the last year have you failed to do what was normally expected from you because of drinking?",
        "How often during the last year have you needed a first drink in the morning to get yourself going?",
        "How often during the last year have you had a feeling of guilt or remorse after drinking?",
        "How often during the last year have you been unable to remember what happened the night before because of your drinking?",
        "Have you or someone else been injured as a result of your drinking?",
        "Has a relative, friend, doctor, or other health worker been concerned about your drinking or suggested you cut down?"
    ]

    // Items 1-8 use 0-4 scale; items 9-10 use 0/2/4
    private let standardOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — Never / 1–2 drinks",        score: 0),
        .init(id: 1, label: "1 — Less than monthly / 3–4",   score: 1),
        .init(id: 2, label: "2 — Monthly / 5–6",             score: 2),
        .init(id: 3, label: "3 — Weekly / 7–9",              score: 3),
        .init(id: 4, label: "4 — Daily-almost daily / ≥10",  score: 4)
    ]
    private let injuryOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — No",                            score: 0),
        .init(id: 2, label: "2 — Yes, but not in the last year", score: 2),
        .init(id: 4, label: "4 — Yes, during the last year",     score: 4)
    ]

    private func optionsFor(_ idx: Int) -> [CalculatorScoreRow.Option] {
        idx >= 8 ? injuryOpts : standardOpts
    }

    private func option(at idx: Int) -> CalculatorScoreRow.Option? {
        guard let id = itemIDs[idx] else { return nil }
        return optionsFor(idx).first { $0.id == id }
    }

    private var total: Int? {
        var sum = 0
        for i in 0..<labels.count {
            guard let o = option(at: i) else { return nil }
            sum += o.score
        }
        return sum
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 20 { return ("AUDIT ≥ 20 — published 'likely alcohol dependence' band per WHO 1993.", .alert) }
        if s >= 15 { return ("AUDIT 15–19 — published 'harmful use / probable AUD' band.", .alert) }
        if s >= 8  { return ("AUDIT 8–14 — published 'hazardous use' band; the standard threshold for brief intervention in adults.", .caution) }
        return ("AUDIT 0–7 — published 'low-risk' band.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "AUDIT",
            subtitle: "Alcohol Use Disorders · WHO 10-item"
        ) {
            CalculatorSection("CONSUMPTION (Q1–3)") {
                ForEach(0..<3, id: \.self) { idx in
                    CalculatorScoreRow(
                        label: "\(idx + 1). \(labels[idx])",
                        options: optionsFor(idx),
                        selection: Binding(
                            get: { option(at: idx) },
                            set: { newValue in
                                var updated = itemIDs
                                updated[idx] = newValue?.id
                                itemIDs = updated
                            }
                        )
                    )
                    if idx < 2 { Hairline(color: NMColor.borderSubtle) }
                }
            }
            CalculatorSection("DEPENDENCE (Q4–6)") {
                ForEach(3..<6, id: \.self) { idx in
                    CalculatorScoreRow(
                        label: "\(idx + 1). \(labels[idx])",
                        options: optionsFor(idx),
                        selection: Binding(
                            get: { option(at: idx) },
                            set: { newValue in
                                var updated = itemIDs
                                updated[idx] = newValue?.id
                                itemIDs = updated
                            }
                        )
                    )
                    if idx < 5 { Hairline(color: NMColor.borderSubtle) }
                }
            }
            CalculatorSection("HARMS (Q7–10)") {
                ForEach(6..<10, id: \.self) { idx in
                    CalculatorScoreRow(
                        label: "\(idx + 1). \(labels[idx])",
                        options: optionsFor(idx),
                        selection: Binding(
                            get: { option(at: idx) },
                            set: { newValue in
                                var updated = itemIDs
                                updated[idx] = newValue?.id
                                itemIDs = updated
                            }
                        )
                    )
                    if idx < 9 { Hairline(color: NMColor.borderSubtle) }
                }
            }
            CalculatorResultDisplay(
                label: "AUDIT",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 10 questions. Q1–8 each 0–4; Q9–10 each 0/2/4. Range 0–40.\nLow-risk 0–7  ·  Hazardous 8–14  ·  Harmful 15–19  ·  Likely dependence ≥ 20.",
                notes: "WHO standard alcohol-use screening tool; superset of the 3-item AUDIT-C. Use the full AUDIT when you want to differentiate dependence from hazardous use, or to track response to intervention. Cutoffs may be slightly lower for women (≥ 7) and adults > 65 in some published guidelines.",
                citations: [saunders1993Audit, openrnRisk11]
            )
        }
    }
}

// MARK: - Apfel PONV

public struct ApfelCalculatorView: View {
    @CalcPersistedBool(calculatorID: "apfel", key: "femaleSex")    private var femaleSex
    @CalcPersistedBool(calculatorID: "apfel", key: "nonsmoker")    private var nonsmoker
    @CalcPersistedBool(calculatorID: "apfel", key: "ponvHistory")  private var ponvHistory   // PONV or motion sickness
    @CalcPersistedBool(calculatorID: "apfel", key: "postopOpioids") private var postopOpioids

    private var total: Int {
        [femaleSex, nonsmoker, ponvHistory, postopOpioids].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        switch total {
        case 0:  return ("Apfel 0 — published PONV risk ≈ 10%.", .neutral)
        case 1:  return ("Apfel 1 — published PONV risk ≈ 21%.", .neutral)
        case 2:  return ("Apfel 2 — published PONV risk ≈ 39%.", .caution)
        case 3:  return ("Apfel 3 — published PONV risk ≈ 61%.", .alert)
        default: return ("Apfel 4 — published PONV risk ≈ 79%.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Apfel",
            subtitle: "Post-operative nausea and vomiting risk"
        ) {
            CalculatorSection("RISK FACTORS") {
                Toggle("Female sex",                                              isOn: $femaleSex).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Non-smoker",                                               isOn: $nonsmoker).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("History of PONV or motion sickness",                       isOn: $ponvHistory).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Use of post-operative opioids",                            isOn: $postopOpioids).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "Apfel",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 4 binary risk factors. Range 0–4.\nPublished PONV risk: 10% / 21% / 39% / 61% / 79% across the bands.",
                notes: "Apfel is the published bedside PONV risk-stratification tool. Society for Ambulatory Anesthesia (SAMBA) consensus recommends multi-modal antiemetic prophylaxis based on the Apfel band. Adult-validated; pediatric POVOC score (Eberhart) is the analogue for children.",
                citations: [apfel1999, openrnRisk11]
            )
        }
    }
}

// MARK: - Lawton IADL

public struct LawtonIADLCalculatorView: View {
    @CalcPersistedBool(calculatorID: "lawton", key: "telephone")       private var telephone
    @CalcPersistedBool(calculatorID: "lawton", key: "shopping")        private var shopping
    @CalcPersistedBool(calculatorID: "lawton", key: "foodPrep")        private var foodPrep
    @CalcPersistedBool(calculatorID: "lawton", key: "housekeeping")    private var housekeeping
    @CalcPersistedBool(calculatorID: "lawton", key: "laundry")         private var laundry
    @CalcPersistedBool(calculatorID: "lawton", key: "transportation")  private var transportation
    @CalcPersistedBool(calculatorID: "lawton", key: "medications")     private var medications
    @CalcPersistedBool(calculatorID: "lawton", key: "finances")        private var finances

    private var total: Int {
        [telephone, shopping, foodPrep, housekeeping, laundry,
         transportation, medications, finances].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        switch total {
        case 8:  return ("Lawton IADL 8 — full instrumental independence per published descriptors.", .neutral)
        case 5...7: return ("Lawton IADL 5–7 — partial IADL assistance band.", .caution)
        default: return ("Lawton IADL 0–4 — substantial IADL dependence band; pair with the Barthel Index for basic-ADL detail.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Lawton IADL",
            subtitle: "Instrumental ADLs · 0–8"
        ) {
            CalculatorSection("INDEPENDENT WITH…") {
                Toggle("Using the telephone",                isOn: $telephone).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Shopping",                            isOn: $shopping).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Food preparation",                    isOn: $foodPrep).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Housekeeping",                        isOn: $housekeeping).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Laundry",                             isOn: $laundry).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Transportation (incl. driving)",      isOn: $transportation).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Medication management",               isOn: $medications).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Handling finances",                   isOn: $finances).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "Lawton",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "1 point per IADL the patient performs independently. Range 0–8.\nMen sometimes scored on 5 items historically (excluding food prep, housekeeping, laundry); modern usage scores all 8 regardless of sex.",
                notes: "Captures higher-order daily-living abilities not measured by the Barthel Index (which focuses on basic self-care). IADLs decline before basic ADLs in most progressive cognitive/functional disorders, making Lawton a useful early-detection screen. Pair with the Mini-Cog or MoCA when cognitive impairment is suspected.",
                citations: [lawton1969, openrnRisk11]
            )
        }
    }
}

// MARK: - TUG

public struct TUGCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "tug", key: "seconds") private var seconds

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = seconds, s > 0 else { return nil }
        if s > 20 { return ("TUG > 20 sec — published 'high fall risk' band; significant mobility limitation.", .alert) }
        if s >= 10 { return ("TUG 10–20 sec — published 'increased fall risk' band per Podsiadlo 1991.", .caution) }
        return ("TUG < 10 sec — published 'normal mobility' band.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Timed Up and Go",
            subtitle: "Functional mobility · falls screen"
        ) {
            CalculatorSection("MEASUREMENT") {
                CalculatorNumberField(label: "Time", unit: "seconds", value: $seconds)
            }
            CalculatorResultDisplay(
                label: "TUG",
                value: seconds.map { String(format: "%.1f", $0) },
                unit: "sec",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Time the patient to: rise from a standard chair (no arm-push), walk 3 m at usual pace, turn, return, sit down.\nNormal < 10 sec  ·  Increased fall risk 10–20  ·  High fall risk > 20.",
                notes: "Use the patient's usual walking aid (cane/walker). Validated for community-dwelling older adults. Pair with Morse Fall Scale or STRATIFY for inpatient fall-risk stratification, and Tinetti POMA when balance + gait detail is needed.",
                citations: [podsiadlo1991Tug, openrnRisk11]
            )
        }
    }
}

// MARK: - PEWS (Brighton)

public struct PEWSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "pews", key: "behavior")   private var behaviorID
    @CalcPersistedOptionID(calculatorID: "pews", key: "cardio")     private var cardioID
    @CalcPersistedOptionID(calculatorID: "pews", key: "respiratory") private var respiratoryID
    @CalcPersistedBool(calculatorID: "pews", key: "nebulizer")      private var nebulizer
    @CalcPersistedBool(calculatorID: "pews", key: "persistentVomiting") private var persistentVomiting

    private var behavior:    CalculatorScoreRow.Option? { behaviorOpts.first    { $0.id == behaviorID } }
    private var cardio:      CalculatorScoreRow.Option? { cardioOpts.first      { $0.id == cardioID } }
    private var respiratory: CalculatorScoreRow.Option? { respiratoryOpts.first { $0.id == respiratoryID } }

    private let behaviorOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Playing / appropriate",                                           score: 0),
        .init(id: 1, label: "Sleeping",                                                        score: 1),
        .init(id: 2, label: "Irritable",                                                       score: 2),
        .init(id: 3, label: "Lethargic / confused / reduced response to pain",                 score: 3)
    ]
    private let cardioOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Pink / cap refill 1–2 sec",                                                  score: 0),
        .init(id: 1, label: "Pale / cap refill 3 sec",                                                    score: 1),
        .init(id: 2, label: "Grey / cap refill 4 sec / HR 20 above normal",                               score: 2),
        .init(id: 3, label: "Grey & mottled / cap refill ≥ 5 sec / HR 30 above normal / bradycardia",     score: 3)
    ]
    private let respiratoryOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Within normal · no recession / tracheal tug",                                       score: 0),
        .init(id: 1, label: "RR > 10 above normal · recession / accessory muscle use / 30%+ FiO₂ or 3+ L/min",   score: 1),
        .init(id: 2, label: "RR > 20 above normal · recessing / accessory use / 40%+ FiO₂ or 6+ L/min",          score: 2),
        .init(id: 3, label: "RR ≥ 5 below normal · sternal recession / grunting / 50%+ FiO₂ or 8+ L/min",        score: 3)
    ]

    private var total: Int? {
        guard let b = behavior, let c = cardio, let r = respiratory else { return nil }
        var t = b.score + c.score + r.score
        if nebulizer            { t += 2 }
        if persistentVomiting   { t += 2 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 5 { return ("PEWS ≥ 5 — published high-deterioration-risk band; the typical institutional threshold for medical-emergency-team activation.", .alert) }
        if s >= 3 { return ("PEWS 3–4 — published moderate-risk band; standard published threshold for nursing escalation.", .caution) }
        return ("PEWS 0–2 — low-risk band per published cutoffs.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "PEWS",
            subtitle: "Pediatric Early Warning · Brighton"
        ) {
            CalculatorSection("DOMAINS") {
                CalculatorScoreRow(label: "Behavior",         options: behaviorOpts,    selection: $behaviorID.option(in: behaviorOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Cardiovascular",   options: cardioOpts,      selection: $cardioID.option(in: cardioOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Respiratory",      options: respiratoryOpts, selection: $respiratoryID.option(in: respiratoryOpts))
            }
            CalculatorSection("ADD POINTS FOR…") {
                Toggle("Nebulizer treatment within last 15 min (+2)", isOn: $nebulizer).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Persistent vomiting post-operatively (+2)",    isOn: $persistentVomiting).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "PEWS",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 3 domain scores (each 0–3) + add-on points (nebulizer +2, vomiting +2). Range 0–13.\nMonaghan/Brighton cutoffs: ≥ 3 escalation  ·  ≥ 5 high-risk band.",
                notes: "Many regional variants exist (Bedside PEWS, Cardiac PEWS, NHS Wales PEWS) — institutions standardize on a single chart per facility. Use age-appropriate vital-sign reference ranges (the cardio and respiratory items reference 'normal for age'). Always trend serially; a rising score is more meaningful than the single value.",
                citations: [monaghan2005Pews, openrnRisk11]
            )
        }
    }
}

// MARK: - WFNS SAH

public struct WFNSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "wfns", key: "grade") private var gradeID
    private var grade: CalculatorScoreRow.Option? { gradeOptions.first { $0.id == gradeID } }

    private let gradeOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "Grade I — GCS 15, no motor deficit",                              score: 1),
        .init(id: 2, label: "Grade II — GCS 13–14, no motor deficit",                          score: 2),
        .init(id: 3, label: "Grade III — GCS 13–14, motor deficit present",                    score: 3),
        .init(id: 4, label: "Grade IV — GCS 7–12, with or without motor deficit",              score: 4),
        .init(id: 5, label: "Grade V — GCS 3–6, with or without motor deficit",                score: 5)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let g = grade else { return nil }
        switch g.score {
        case 1: return ("WFNS Grade I — published lowest-mortality band per WFNS framework.", .neutral)
        case 2: return ("WFNS Grade II — low-to-moderate mortality band.", .caution)
        case 3: return ("WFNS Grade III — moderate mortality band.", .alert)
        case 4: return ("WFNS Grade IV — high mortality band.", .alert)
        default: return ("WFNS Grade V — highest mortality band per WFNS framework.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "WFNS SAH",
            subtitle: "GCS-based subarachnoid hemorrhage grading"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Grade", options: gradeOptions, selection: $gradeID.option(in: gradeOptions))
            }
            CalculatorResultDisplay(
                label: "WFNS",
                value: grade.map { "\($0.score)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "5-grade scale based on GCS and presence/absence of motor deficit at admission.",
                notes: "Modern alternative to Hunt and Hess that uses standardized GCS thresholds. Pair with the Fisher Grade (CT-based) for combined clinical + radiographic SAH stratification. The WFNS scale is the score most often used in modern aneurysmal-SAH trials.",
                citations: [drake1988Wfns, openrnRisk11]
            )
        }
    }
}

// MARK: - DN4

public struct DN4CalculatorView: View {
    @CalcPersistedBool(calculatorID: "dn4", key: "burning")          private var burning
    @CalcPersistedBool(calculatorID: "dn4", key: "painfulCold")      private var painfulCold
    @CalcPersistedBool(calculatorID: "dn4", key: "electricShocks")   private var electricShocks
    @CalcPersistedBool(calculatorID: "dn4", key: "tingling")         private var tingling
    @CalcPersistedBool(calculatorID: "dn4", key: "pinsNeedles")      private var pinsNeedles
    @CalcPersistedBool(calculatorID: "dn4", key: "numbness")         private var numbness
    @CalcPersistedBool(calculatorID: "dn4", key: "itching")          private var itching
    @CalcPersistedBool(calculatorID: "dn4", key: "hypoTouch")        private var hypoTouch
    @CalcPersistedBool(calculatorID: "dn4", key: "hypoPin")          private var hypoPin
    @CalcPersistedBool(calculatorID: "dn4", key: "brushingPain")     private var brushingPain

    private var total: Int {
        [burning, painfulCold, electricShocks, tingling, pinsNeedles,
         numbness, itching, hypoTouch, hypoPin, brushingPain].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total >= 4 {
            return ("DN4 ≥ 4 — POSITIVE screen for neuropathic pain per Bouhassira 2005; published sensitivity ≈ 83%, specificity ≈ 90%.", .alert)
        }
        return ("DN4 < 4 — does not meet the published positive-screen cutoff.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "DN4",
            subtitle: "Neuropathic pain screen · 10 items"
        ) {
            CalculatorSection("INTERVIEW · CHARACTER") {
                Toggle("Burning",            isOn: $burning).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Painful cold",        isOn: $painfulCold).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Electric shocks",     isOn: $electricShocks).toggleStyle(.switch)
            }
            CalculatorSection("INTERVIEW · ASSOCIATED") {
                Toggle("Tingling",            isOn: $tingling).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Pins and needles",    isOn: $pinsNeedles).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Numbness",            isOn: $numbness).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Itching",             isOn: $itching).toggleStyle(.switch)
            }
            CalculatorSection("EXAMINATION") {
                Toggle("Hypoesthesia to touch",                   isOn: $hypoTouch).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Hypoesthesia to pinprick",                 isOn: $hypoPin).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Pain provoked by brushing the painful area", isOn: $brushingPain).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "DN4",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 10 binary items. Range 0–10.\nPositive screen for neuropathic pain ≥ 4.",
                notes: "DN4 has the strongest published validation for differentiating neuropathic from nociceptive pain at the bedside. It does not diagnose — the standard reference for diagnostic certainty is the IASP grading system (Treede 2008). Repeat testing after dermatomal/trigger interventions to track response.",
                citations: [bouhassira2005Dn4, openrnRisk11]
            )
        }
    }
}

// MARK: - MDQ

public struct MDQCalculatorView: View {
    @CalcPersistedOptionIDArray(calculatorID: "mdq", key: "items", count: 13) private var symptomIDs
    @CalcPersistedBool(calculatorID: "mdq", key: "samePeriod")     private var samePeriod
    @CalcPersistedOptionID(calculatorID: "mdq", key: "impairment") private var impairmentID

    private let symptomLabels: [String] = [
        "Felt so good or so hyper that other people thought you were not your normal self / got into trouble",
        "So irritable you shouted at people / started fights or arguments",
        "Felt much more self-confident than usual",
        "Got much less sleep than usual and didn't really miss it",
        "Were much more talkative or spoke faster than usual",
        "Thoughts raced through your head / couldn't slow your mind",
        "Were so easily distracted by things that you had trouble concentrating",
        "Had much more energy than usual",
        "Were much more active or did many more things than usual",
        "Were much more social / outgoing than usual",
        "Were much more interested in sex than usual",
        "Did things that were unusual for you / others might have thought were excessive, foolish, risky",
        "Spending money got you or your family into trouble"
    ]

    private let yesNoOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No",  score: 0),
        .init(id: 1, label: "Yes", score: 1)
    ]

    private let impairmentOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No problem",    score: 0),
        .init(id: 1, label: "Minor problem", score: 1),
        .init(id: 2, label: "Moderate problem", score: 2),
        .init(id: 3, label: "Serious problem",  score: 3)
    ]

    private var symptomCount: Int {
        symptomIDs.compactMap { $0 }.filter { $0 == 1 }.count
    }

    private var impairment: CalculatorScoreRow.Option? { impairmentOpts.first { $0.id == impairmentID } }

    private var positive: Bool? {
        guard symptomIDs.allSatisfy({ $0 != nil }), let imp = impairment else { return nil }
        return symptomCount >= 7 && samePeriod && imp.score >= 2
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let p = positive else { return nil }
        if p {
            return ("MDQ POSITIVE — meets all 3 published Hirschfeld 2000 criteria (≥ 7 of 13 symptoms + same-time-period + moderate/serious impairment). Published sensitivity ≈ 73% and specificity ≈ 90% for bipolar I in psychiatric outpatient cohorts.", .alert)
        }
        return ("MDQ does not meet the published positive-screen criteria at this assessment (\(symptomCount)/13 symptoms; same-period \(samePeriod ? "yes" : "no")).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "MDQ",
            subtitle: "Mood Disorder Questionnaire · bipolar screen"
        ) {
            CalculatorSection("HAS THERE EVER BEEN A PERIOD WHEN YOU…") {
                ForEach(Array(symptomLabels.enumerated()), id: \.offset) { idx, label in
                    CalculatorScoreRow(
                        label: "\(idx + 1). \(label)",
                        options: yesNoOpts,
                        selection: Binding(
                            get: {
                                guard let id = symptomIDs[idx] else { return nil }
                                return yesNoOpts.first { $0.id == id }
                            },
                            set: { newValue in
                                var updated = symptomIDs
                                updated[idx] = newValue?.id
                                symptomIDs = updated
                            }
                        )
                    )
                    if idx < symptomLabels.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
            CalculatorSection("CONTEXT") {
                Toggle("Several of these happened during the same period of time", isOn: $samePeriod).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "How problematic were they?", options: impairmentOpts, selection: $impairmentID.option(in: impairmentOpts))
            }
            CalculatorResultDisplay(
                label: "MDQ",
                value: positive.map { $0 ? "POSITIVE" : "NEGATIVE" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Positive screen requires ALL of:\n  • ≥ 7 of 13 symptoms answered yes\n  • Several occurred during the same period\n  • Caused at least 'moderate problem' impairment",
                notes: "MDQ screens for bipolar-spectrum disorder in adults. Lower sensitivity for bipolar II than bipolar I in published cohorts. A positive screen is not a diagnosis — DSM criteria interview is required. Pair with PHQ-9 in any patient who screens positive on MDQ to characterize concurrent depressive symptoms.",
                citations: [hirschfeld2000Mdq, openrnRisk11]
            )
        }
    }
}
