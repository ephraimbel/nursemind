import SwiftUI

private let borg1982 = CitationSource(
    id: "borg_1982",
    shortName: "Modified Borg / CR-10 — Borg GAV, Med Sci Sports Exerc 1982 (concept citation)",
    detail: "Category-Ratio 10 scale of perceived exertion / dyspnea — the standard self-rated breathlessness instrument",
    publisher: "Medicine and Science in Sports and Exercise",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/7154893/",
    lastRetrieved: "2026-05-04"
)

private let openrnResp5 = CitationSource(
    id: "openrn_resp_5",
    shortName: "Open RN Health Alterations — Dyspnea Assessment",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=dyspnea+breathing+exertion",
    lastRetrieved: "2026-05-04"
)

// MARK: - Modified Borg Dyspnea Scale

public struct ModifiedBorgCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "borg", key: "level") private var levelID
    private var level: CalculatorScoreRow.Option? { levelOptions.first { $0.id == levelID } }

    private let levelOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0,  label: "0 · Nothing at all",                score: 0),
        .init(id: 1,  label: "0.5 · Very, very slight",           score: 0),
        .init(id: 2,  label: "1 · Very slight",                   score: 1),
        .init(id: 3,  label: "2 · Slight",                        score: 2),
        .init(id: 4,  label: "3 · Moderate",                      score: 3),
        .init(id: 5,  label: "4 · Somewhat severe",               score: 4),
        .init(id: 6,  label: "5 · Severe",                        score: 5),
        .init(id: 7,  label: "6 · —",                             score: 6),
        .init(id: 8,  label: "7 · Very severe",                   score: 7),
        .init(id: 9,  label: "8 · —",                             score: 8),
        .init(id: 10, label: "9 · Very, very severe (almost max)", score: 9),
        .init(id: 11, label: "10 · Maximal",                      score: 10)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = level else { return nil }
        switch l.score {
        case 0...2:  return ("Borg 0–2 — none-to-slight perceived breathlessness.", .neutral)
        case 3...4:  return ("Borg 3–4 — moderate-to-somewhat-severe breathlessness.", .caution)
        case 5...6:  return ("Borg 5–6 — severe breathlessness.", .alert)
        default:     return ("Borg 7–10 — very severe to maximal breathlessness.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "Modified Borg",
            subtitle: "Self-rated dyspnea · 0–10"
        ) {
            CalculatorSection("PATIENT-RATED") {
                CalculatorScoreRow(label: "Breathlessness now", options: levelOptions, selection: $levelID.option(in: levelOptions))
            }
            CalculatorResultDisplay(
                label: "Borg",
                value: level.map { String(format: "%.1f", $0.id == 1 ? 0.5 : Double($0.score)) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single category-ratio scale: 0 (nothing) → 10 (maximal). 0.5 sits between 0 and 1.\nPatient self-rates current dyspnea or exertion.",
                notes: "Used widely in pulmonary rehab, exercise testing (6-minute walk), and bedside dyspnea trending. Document the activity context — Borg 4 walking to the bathroom means something different from Borg 4 on a stationary bike. Pediatric and developmentally-delayed patients may need an alternative scale.",
                citations: [borg1982, openrnResp5]
            )
        }
    }
}
