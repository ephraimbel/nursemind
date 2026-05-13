import SwiftUI

// MARK: - Shared citation sources

private let kamath2001Meld = CitationSource(
    id: "kamath_2001_meld",
    shortName: "MELD (classic) — Kamath PS et al., Hepatology 2001 (concept citation)",
    detail: "Original Model for End-Stage Liver Disease score from Mayo Clinic",
    publisher: "Hepatology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/11172350/",
    lastRetrieved: "2026-05-04"
)

private let blatchford2000 = CitationSource(
    id: "blatchford_2000",
    shortName: "Glasgow-Blatchford Score — Blatchford O et al., Lancet 2000 (concept citation)",
    detail: "Pre-endoscopy stratification for upper GI bleed risk",
    publisher: "Lancet",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/11073021/",
    lastRetrieved: "2026-05-04"
)

private let openrnHepatic2 = CitationSource(
    id: "openrn_hepatic_2",
    shortName: "Open RN Health Alterations — Hepatic & Gastrointestinal disorders",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=hepatic+liver+gi+bleed",
    lastRetrieved: "2026-05-04"
)

// MARK: - MELD (classic, no sodium)

public struct MELDClassicCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "meld", key: "bili") private var bilirubin
    @CalcPersistedDouble(calculatorID: "meld", key: "inr") private var inr
    @CalcPersistedDouble(calculatorID: "meld", key: "cr") private var creatinine
    @CalcPersistedBool(calculatorID: "meld", key: "dialysis") private var dialysisTwiceInWeek

    private var meld: Double? {
        guard var bili = bilirubin, var ratio = inr, var cr = creatinine else { return nil }
        if bili < 1.0  { bili = 1.0 }
        if ratio < 1.0 { ratio = 1.0 }
        if cr < 1.0    { cr = 1.0 }
        if dialysisTwiceInWeek || cr > 4.0 { cr = 4.0 }
        let raw = 3.78 * log(bili) + 11.2 * log(ratio) + 9.57 * log(cr) + 6.43
        return min(max(raw, 6.0), 40.0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = meld else { return nil }
        let r = Int(s.rounded())
        if r >= 40 { return ("MELD ≥ 40 — capped per OPTN; ~71% 3-month mortality.", .alert) }
        if r >= 30 { return ("MELD 30–39 — ~52% 3-month mortality.", .alert) }
        if r >= 20 { return ("MELD 20–29 — ~20% 3-month mortality.", .alert) }
        if r >= 10 { return ("MELD 10–19 — ~6% 3-month mortality.", .caution) }
        return ("MELD 6–9 — ~2% 3-month mortality.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "MELD (classic)",
            subtitle: "Cirrhosis severity — original Mayo formulation"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Bilirubin",  unit: "mg/dL", value: $bilirubin)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "INR",                       value: $inr)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Creatinine", unit: "mg/dL", value: $creatinine)
                Hairline(color: NMColor.borderSubtle)
                HStack {
                    Toggle(isOn: $dialysisTwiceInWeek) {
                        Text("≥ 2 hemodialysis sessions in past 7 days")
                            .font(NMFont.bodyLG)
                            .foregroundStyle(NMColor.textPrimary)
                            .lineLimit(2)
                    }
                    .toggleStyle(.switch)
                }
                .padding(.vertical, NMSpace.base)
            }
            CalculatorResultDisplay(
                label: "MELD",
                value: meld.map { String(format: "%.0f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "MELD = 3.78·ln(bili) + 11.2·ln(INR) + 9.57·ln(Cr) + 6.43\n(values floored at 1.0; Cr capped at 4.0; result floored 6, capped 40)",
                notes: "Classic MELD (without sodium) was the OPTN allocation score from 2002–2016. MELD-Na replaced it for adult liver-transplant priority. Classic MELD is still used for some prognostic and research purposes and to compute Maddrey's Discriminant Function adjuncts. Use MELD-Na for transplant decisions.",
                citations: [kamath2001Meld, openrnHepatic2]
            )
        }
    }
}

// MARK: - Glasgow-Blatchford Score

public struct GlasgowBlatchfordCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "blatchford", key: "bun") private var bunID
    @CalcPersistedOptionID(calculatorID: "blatchford", key: "hgb") private var hgbID
    @CalcPersistedOptionID(calculatorID: "blatchford", key: "sbp") private var sbpID

    private var bun: CalculatorScoreRow.Option? { bunOptions.first { $0.id == bunID } }
    private var hgb: CalculatorScoreRow.Option? { hgbOptions.first { $0.id == hgbID } }
    private var sbp: CalculatorScoreRow.Option? { sbpOptions.first { $0.id == sbpID } }
    @CalcPersistedBool(calculatorID: "blatchford", key: "hr100")          private var hr100
    @CalcPersistedBool(calculatorID: "blatchford", key: "melena")         private var melena
    @CalcPersistedBool(calculatorID: "blatchford", key: "syncope")        private var syncope
    @CalcPersistedBool(calculatorID: "blatchford", key: "hepaticDisease") private var hepaticDisease
    @CalcPersistedBool(calculatorID: "blatchford", key: "heartFailure")   private var heartFailure
    @State private var sex: SexOption? = nil

    enum SexOption: String, CaseIterable, Identifiable {
        case female, male
        var id: String { rawValue }
        var display: String { rawValue.capitalized }
    }

    // BUN (mg/dL) point assignments
    private let bunOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 18.2",        score: 0),
        .init(id: 1, label: "18.2–22.4",     score: 2),
        .init(id: 2, label: "22.4–28",       score: 3),
        .init(id: 3, label: "28–70",         score: 4),
        .init(id: 4, label: "> 70",          score: 6)
    ]
    private let hgbMaleOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 13",   score: 0),
        .init(id: 1, label: "12–12.9", score: 1),
        .init(id: 2, label: "10–11.9", score: 3),
        .init(id: 3, label: "< 10",   score: 6)
    ]
    private let hgbFemaleOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 12",   score: 0),
        .init(id: 1, label: "10–11.9", score: 1),
        .init(id: 2, label: "< 10",   score: 6)
    ]
    private let sbpOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 110",   score: 0),
        .init(id: 1, label: "100–109", score: 1),
        .init(id: 2, label: "90–99",   score: 2),
        .init(id: 3, label: "< 90",    score: 3)
    ]

    private var hgbOptions: [CalculatorScoreRow.Option] {
        sex == .female ? hgbFemaleOptions : hgbMaleOptions
    }

    private var total: Int? {
        guard let bunV = bun, let hgbV = hgb, let sbpV = sbp else { return nil }
        var s = bunV.score + hgbV.score + sbpV.score
        if hr100         { s += 1 }
        if melena        { s += 1 }
        if syncope       { s += 2 }
        if hepaticDisease { s += 2 }
        if heartFailure  { s += 2 }
        return s
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s == 0 { return ("Glasgow-Blatchford = 0 — very-low-risk band per Blatchford 2000 derivation; published intervention rate near zero in this band.", .neutral) }
        if s <= 5 { return ("Glasgow-Blatchford 1–5 — low-risk band per published cutoffs.", .caution) }
        if s <= 11 { return ("Glasgow-Blatchford 6–11 — moderate-risk band; published intervention rate substantially elevated.", .alert) }
        return ("Glasgow-Blatchford ≥ 12 — high-risk band per published cutoffs; the highest published rate of need for intervention or rebleeding.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "Glasgow-Blatchford",
            subtitle: "Pre-endoscopy upper GI bleed risk"
        ) {
            CalculatorSection("INPUTS") {
                HStack {
                    Text("Sex at birth").font(NMFont.bodyLG)
                    Spacer()
                    Picker("Sex", selection: $sex) {
                        Text("—").tag(SexOption?.none)
                        ForEach(SexOption.allCases) { Text($0.display).tag(SexOption?.some($0)) }
                    }
                    .pickerStyle(.segmented)
                    .frame(maxWidth: 200)
                }
                .padding(.vertical, NMSpace.base)
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "BUN (mg/dL)",      options: bunOptions, selection: $bunID.option(in: bunOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Hemoglobin (g/dL)", options: hgbOptions, selection: $hgbID.option(in: hgbOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Systolic BP",      options: sbpOptions, selection: $sbpID.option(in: sbpOptions))
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "HR ≥ 100",                points: 1, isOn: $hr100)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Melena",                  points: 1, isOn: $melena)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Syncope",                 points: 2, isOn: $syncope)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Hepatic disease",         points: 2, isOn: $hepaticDisease)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Heart failure",           points: 2, isOn: $heartFailure)
            }
            CalculatorResultDisplay(
                label: "Glasgow-Blatchford",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of weighted points across BUN, Hgb, SBP, and 5 binary clinical features. Range 0–23.",
                notes: "A score of 0 has very high negative predictive value for needing intervention — supports outpatient management of selected low-risk UGI-bleed patients. Higher scores correlate with need for transfusion, endoscopic therapy, and surgery. Pair with the Rockall Score (post-endoscopy mortality estimate) for full risk picture.",
                citations: [blatchford2000, openrnHepatic2]
            )
        }
    }

    private func togglePoint(label: String, points: Int, isOn: Binding<Bool>) -> some View {
        HStack {
            Toggle(isOn: isOn) {
                Text(label).font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary)
            }
            .toggleStyle(.switch)
            Text("+\(points)")
                .font(NMFont.mono)
                .foregroundStyle(NMColor.textTertiary)
                .frame(minWidth: 36, alignment: .trailing)
        }
        .padding(.vertical, NMSpace.base)
    }
}
