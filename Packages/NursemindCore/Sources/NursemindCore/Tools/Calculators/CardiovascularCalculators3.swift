import SwiftUI

// MARK: - Shared citation sources

private let allgoeWerneShockIndex = CitationSource(
    id: "allgower_burri_1967",
    shortName: "Shock Index — Allgöwer & Burri 1967 (concept citation)",
    detail: "HR/SBP ratio as a hemodynamic shock screen",
    publisher: "Deutsche Medizinische Wochenschrift",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/6058748/",
    lastRetrieved: "2026-05-04"
)

private let bazettQTc = CitationSource(
    id: "bazett_1920",
    shortName: "QTc Bazett — Bazett HC, Heart 1920 (concept citation)",
    detail: "Original heart-rate correction for QT interval",
    publisher: "Heart",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/14411520/",
    lastRetrieved: "2026-05-04"
)

private let fridericiaQTc = CitationSource(
    id: "fridericia_1920",
    shortName: "QTc Fridericia — Fridericia LS 1920 (concept citation)",
    detail: "Cube-root QT correction; more accurate at extreme heart rates",
    publisher: "Acta Medica Scandinavica",
    license: .factCitationOnly,
    url: "https://onlinelibrary.wiley.com/journal/16000463",
    lastRetrieved: "2026-05-04"
)

private let nyhaCriteria = CitationSource(
    id: "nyha_class",
    shortName: "NYHA Functional Classification (concept citation)",
    detail: "I (no limit) → IV (symptoms at rest)",
    publisher: "New York Heart Association / American Heart Association",
    license: .factCitationOnly,
    url: "https://professional.heart.org/",
    lastRetrieved: "2026-05-04"
)

private let openrnCardio3 = CitationSource(
    id: "openrn_cardio_3",
    shortName: "Open RN Health Alterations — Cardiac Assessment",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cardiac+heart+arrhythmia",
    lastRetrieved: "2026-05-04"
)

// MARK: - Shock Index

public struct ShockIndexCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "shock-index", key: "hr") private var hr
    @CalcPersistedDouble(calculatorID: "shock-index", key: "sbp") private var sbp

    private var result: Double? {
        guard let hr, let sbp, sbp > 0, hr > 0 else { return nil }
        return hr / sbp
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r >= 1.0 { return ("Shock Index ≥ 1.0 — strongly suggests hemodynamic compromise; mortality and transfusion risk meaningfully elevated.", .alert) }
        if r >= 0.7 { return ("Shock Index 0.7–1.0 — borderline; trend over time and reassess context (fever, pain, anxiety).", .caution) }
        return ("Shock Index < 0.7 — typical adult range.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "Shock Index",
            subtitle: "HR ÷ SBP — early hemodynamic warning"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Heart rate", unit: "bpm",  value: $hr)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Systolic BP", unit: "mmHg", value: $sbp)
            }
            CalculatorResultDisplay(
                label: "Shock Index",
                value: result.map { String(format: "%.2f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Shock Index = HR ÷ SBP",
                notes: "Useful early-warning marker, especially in trauma, sepsis, and obstetric hemorrhage where 'normal' BP can mask compensated shock. A rising Shock Index is more meaningful than any single value. Modified Shock Index (HR ÷ MAP) is sometimes used in critical-care contexts.",
                citations: [allgoeWerneShockIndex, openrnCardio3]
            )
        }
    }
}

// MARK: - QTc

public struct QTcCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "qtc", key: "qt_ms") private var qtMs
    @CalcPersistedDouble(calculatorID: "qtc", key: "hr") private var hr

    private var rrSeconds: Double? {
        guard let hr, hr > 0 else { return nil }
        return 60.0 / hr
    }

    private var bazett: Double? {
        guard let qt = qtMs, let rr = rrSeconds else { return nil }
        return qt / sqrt(rr)
    }

    private var fridericia: Double? {
        guard let qt = qtMs, let rr = rrSeconds else { return nil }
        return qt / pow(rr, 1.0 / 3.0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let b = bazett else { return nil }
        if b > 500 { return ("QTc > 500 ms — markedly prolonged. Substantially increased torsades risk; review and discontinue QT-prolonging meds, replete K and Mg, continuous cardiac monitoring.", .alert) }
        if b > 460 { return ("QTc 460–500 ms — prolonged. Review medications, electrolytes (K, Mg), and risk factors.", .caution) }
        return ("QTc within typical range (< 460 ms).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "QTc",
            subtitle: "Heart-rate-corrected QT — Bazett & Fridericia"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "QT interval", unit: "ms",  value: $qtMs)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Heart rate",  unit: "bpm", value: $hr)
            }
            CalculatorResultDisplay(
                label: "QTc Bazett",
                value: bazett.map { String(format: "%.0f", $0) },
                unit: "ms",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            if let f = fridericia {
                CalculatorSection("FRIDERICIA") {
                    HStack {
                        Text("QTc Fridericia").font(NMFont.bodyLG)
                        Spacer()
                        Text(String(format: "%.0f ms", f))
                            .font(NMFont.monoXL)
                            .foregroundStyle(NMColor.textPrimary)
                    }
                    .padding(.vertical, NMSpace.base)
                }
            }
            CalculatorFormulaSection(
                formula: "RR (s) = 60 ÷ HR\nBazett:    QTc = QT ÷ √RR\nFridericia: QTc = QT ÷ ∛RR",
                notes: "Bazett over- or under-corrects at HR extremes; Fridericia is more reliable at HR < 60 or > 100. AHA-recommended cut-offs: prolonged > 460 ms (women) or > 450 ms (men); markedly prolonged > 500 ms regardless of sex. Always verify automated QT measurement against manual interpretation in suspected long QT.",
                citations: [bazettQTc, fridericiaQTc, openrnCardio3]
            )
        }
    }
}

// MARK: - NYHA Class

public struct NYHAClassCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "nyha", key: "classChoice") private var classChoiceID
    private var classChoice: CalculatorScoreRow.Option? { classOptions.first { $0.id == classChoiceID } }

    private let classOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "Class I — no symptoms with ordinary activity",       score: 1),
        .init(id: 2, label: "Class II — slight limitation; symptoms with ordinary activity", score: 2),
        .init(id: 3, label: "Class III — marked limitation; symptoms with less than ordinary activity", score: 3),
        .init(id: 4, label: "Class IV — symptoms at rest; any activity discomfort", score: 4)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let c = classChoice else { return nil }
        switch c.score {
        case 1: return ("NYHA I — no functional limitation; baseline reference band per AHA/ACC/ESC heart-failure classifications.", .neutral)
        case 2: return ("NYHA II — slight limitation; symptoms with ordinary activity per NYHA criteria.", .caution)
        case 3: return ("NYHA III — marked limitation; symptoms with less than ordinary activity per NYHA criteria.", .alert)
        default: return ("NYHA IV — symptoms at rest; advanced heart-failure band per NYHA criteria.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "NYHA Class",
            subtitle: "Heart failure functional classification"
        ) {
            CalculatorSection("CLASSIFICATION") {
                CalculatorScoreRow(label: "Functional class", options: classOptions, selection: $classChoiceID.option(in: classOptions))
            }
            CalculatorResultDisplay(
                label: "NYHA",
                value: classChoice.map { roman($0.score) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Subjective four-class scale of patient-reported functional limitation.",
                notes: "Pair NYHA with ACC/AHA Stages A–D, which describe disease progression rather than symptoms. Both inform but do not replace objective measures (LVEF, BNP, peak VO₂). NYHA shifts with treatment; reassess at every encounter.",
                citations: [nyhaCriteria, openrnCardio3]
            )
        }
    }

    private func roman(_ n: Int) -> String {
        ["", "I", "II", "III", "IV"][n]
    }
}
