import SwiftUI

// MARK: - Shared citation sources

private let lim2003Curb = CitationSource(
    id: "lim_2003_curb65",
    shortName: "CURB-65 — Lim WS et al., Thorax 2003 (concept citation)",
    detail: "Severity assessment in community-acquired pneumonia",
    publisher: "Thorax / British Thoracic Society",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/12728155/",
    lastRetrieved: "2026-05-04"
)

private let wells2000PE = CitationSource(
    id: "wells_2000_pe",
    shortName: "Wells Score for PE — Wells PS et al., Thromb Haemost 2000 (concept citation)",
    detail: "Pretest probability of pulmonary embolism",
    publisher: "Thrombosis and Haemostasis",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/10744147/",
    lastRetrieved: "2026-05-04"
)

private let openrnRespiratory2 = CitationSource(
    id: "openrn_respiratory_2",
    shortName: "Open RN Health Alterations — Respiratory & VTE",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=respiratory+ventilation+oxygenation",
    lastRetrieved: "2026-05-04"
)

// MARK: - CURB-65

public struct CURB65CalculatorView: View {
    @CalcPersistedBool(calculatorID: "curb-65", key: "confusion") private var confusion
    @CalcPersistedBool(calculatorID: "curb-65", key: "ureaHigh")  private var ureaHigh
    @CalcPersistedBool(calculatorID: "curb-65", key: "rrHigh")    private var rrHigh
    @CalcPersistedBool(calculatorID: "curb-65", key: "bpLow")     private var bpLow
    @CalcPersistedBool(calculatorID: "curb-65", key: "ageGE65")   private var ageGE65

    private var total: Int {
        [confusion, ureaHigh, rrHigh, bpLow, ageGE65].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        switch total {
        case 0...1:
            return ("CURB-65 0–1 — low-severity band; published 30-day mortality ≈ 1.5% (Lim 2003 derivation cohort).", .neutral)
        case 2:
            return ("CURB-65 = 2 — moderate-severity band; published 30-day mortality ≈ 9%.", .caution)
        default:
            return ("CURB-65 ≥ 3 — high-severity band; published 30-day mortality 15–40% across the 3–5 range.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "CURB-65",
            subtitle: "Pneumonia severity score"
        ) {
            CalculatorSection("CRITERIA") {
                togglePoint(label: "C — Confusion (new)",                    points: 1, isOn: $confusion)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "U — Urea > 19 mg/dL (BUN > 7 mmol/L)",  points: 1, isOn: $ureaHigh)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "R — Respiratory rate ≥ 30",              points: 1, isOn: $rrHigh)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "B — SBP < 90 or DBP ≤ 60",               points: 1, isOn: $bpLow)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "65 — Age ≥ 65",                          points: 1, isOn: $ageGE65)
            }
            CalculatorResultDisplay(
                label: "CURB-65",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 binary criteria. Range 0–5.",
                notes: "British Thoracic Society triage tool for community-acquired pneumonia. Use clinical judgment — the score is a guide, not a replacement for assessment of comorbidities, oxygen needs, or social factors.",
                citations: [lim2003Curb, openrnRespiratory2]
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

// MARK: - Wells PE

public struct WellsPECalculatorView: View {
    @CalcPersistedBool(calculatorID: "wells-pe", key: "dvtSigns")       private var dvtSigns
    @CalcPersistedBool(calculatorID: "wells-pe", key: "peLikely")       private var peLikely
    @CalcPersistedBool(calculatorID: "wells-pe", key: "hr100")          private var hr100
    @CalcPersistedBool(calculatorID: "wells-pe", key: "immobilization") private var immobilization
    @CalcPersistedBool(calculatorID: "wells-pe", key: "prevDvtPe")      private var prevDvtPe
    @CalcPersistedBool(calculatorID: "wells-pe", key: "hemoptysis")     private var hemoptysis
    @CalcPersistedBool(calculatorID: "wells-pe", key: "malignancy")     private var malignancy

    private var total: Double {
        var s: Double = 0
        if dvtSigns        { s += 3 }
        if peLikely        { s += 3 }
        if hr100           { s += 1.5 }
        if immobilization  { s += 1.5 }
        if prevDvtPe       { s += 1.5 }
        if hemoptysis      { s += 1 }
        if malignancy      { s += 1 }
        return s
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total > 6 {
            return ("Wells > 6 — high probability (~78% PE prevalence). Proceed to imaging (CT-PA); D-dimer not useful at this probability.", .alert)
        }
        if total > 4 {
            return ("Wells 4.5–6 — PE 'likely' (two-tier model). Proceed to CT-PA or V/Q.", .alert)
        }
        if total >= 2 {
            return ("Wells 2–6 — moderate probability (~28% PE prevalence). D-dimer can rule out if low.", .caution)
        }
        return ("Wells < 2 — low probability (~3% PE prevalence). D-dimer rules out PE if normal; consider PERC rule.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "Wells Score for PE",
            subtitle: "Pretest probability of pulmonary embolism"
        ) {
            CalculatorSection("CRITERIA") {
                togglePoint(label: "Clinical signs/symptoms of DVT",          points: "+3", isOn: $dvtSigns)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "PE is the most likely diagnosis",         points: "+3", isOn: $peLikely)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Heart rate > 100",                        points: "+1.5", isOn: $hr100)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Immobilization or surgery in past 4 weeks", points: "+1.5", isOn: $immobilization)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Previous DVT or PE",                      points: "+1.5", isOn: $prevDvtPe)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Hemoptysis",                              points: "+1", isOn: $hemoptysis)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Malignancy (treated within 6 mo)",        points: "+1", isOn: $malignancy)
            }
            CalculatorResultDisplay(
                label: "Wells Score",
                value: String(format: "%.1f", total),
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Three-tier: < 2 low, 2–6 moderate, > 6 high.\nTwo-tier: ≤ 4 PE unlikely, > 4 PE likely.",
                notes: "Combine with D-dimer per institutional protocol. D-dimer-rule-out works in low and (with age-adjusted thresholds) moderate-probability patients; not in high-probability — go straight to imaging. Pregnancy modifies workup significantly.",
                citations: [wells2000PE, openrnRespiratory2]
            )
        }
    }

    private func togglePoint(label: String, points: String, isOn: Binding<Bool>) -> some View {
        HStack {
            Toggle(isOn: isOn) {
                Text(label).font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary).lineLimit(2)
            }
            .toggleStyle(.switch)
            Text(points)
                .font(NMFont.mono)
                .foregroundStyle(NMColor.textTertiary)
                .frame(minWidth: 44, alignment: .trailing)
        }
        .padding(.vertical, NMSpace.base)
    }
}
