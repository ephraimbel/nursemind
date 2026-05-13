import SwiftUI

// MARK: - Shared citation sources

private let openrnHemodynamics = CitationSource(
    id: "openrn_hemodynamics",
    shortName: "Open RN Health Alterations — Hemodynamics chapter",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cardiac+heart+arrhythmia",
    lastRetrieved: "2026-05-04"
)

private let openstaxClinicalSkillsTools = CitationSource(
    id: "openstax_clinical_skills_tools",
    shortName: "OpenStax Clinical Nursing Skills — Cardiovascular Assessment",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)

private let ssc2021Tools = CitationSource(
    id: "ssc_2021_tools",
    shortName: "Surviving Sepsis Campaign 2021 (PMC OA) — MAP ≥65 mmHg target",
    detail: "Evans L et al. Crit Care Med 2021",
    publisher: "Society of Critical Care Medicine",
    license: .ccBy4,
    url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8486643/",
    lastRetrieved: "2026-05-04"
)

// MARK: - MAP

public struct MAPCalculatorView: View {
    @State private var systolic: Double?
    @State private var diastolic: Double?

    public init(preset: [String: Double] = [:]) {
        let store = CalculatorStateStore.shared
        _systolic  = State(initialValue: preset["sbp"] ?? store.loadDouble(for: "map", key: "sbp"))
        _diastolic = State(initialValue: preset["dbp"] ?? store.loadDouble(for: "map", key: "dbp"))
    }

    private var result: Double? {
        guard let sbp = systolic, let dbp = diastolic, sbp >= dbp, sbp > 0, dbp > 0 else { return nil }
        return dbp + (sbp - dbp) / 3.0
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r < 65 {
            return ("MAP < 65 mmHg — below the published Surviving Sepsis Campaign 2021 perfusion target for septic shock.", .alert)
        }
        if r > 110 {
            return ("MAP > 110 mmHg — above the typical adult reference range.", .caution)
        }
        return ("MAP within the typical adult perfusion reference range.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "MAP",
            subtitle: "Mean arterial pressure"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Systolic BP", unit: "mmHg", value: $systolic)
                    .onChange(of: systolic) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "map", key: "sbp")
                    }
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Diastolic BP", unit: "mmHg", value: $diastolic)
                    .onChange(of: diastolic) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "map", key: "dbp")
                    }
            }
            CalculatorResultDisplay(
                label: "MAP",
                value: result.map { String(format: "%.0f", $0) },
                unit: "mmHg",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "MAP ≈ DBP + (SBP − DBP) / 3",
                notes: "Approximation valid at typical heart rates. At extremes of HR or in arrhythmia, the arterial-line MAP is more accurate. Common perfusion target: MAP ≥ 65 mmHg in adult septic shock per SSC 2021.",
                citations: [openrnHemodynamics, ssc2021Tools]
            )
        }
    }
}

// MARK: - Cardiac Index

public struct CardiacIndexCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "cardiac-index", key: "co") private var cardiacOutput
    @CalcPersistedDouble(calculatorID: "cardiac-index", key: "bsa") private var bsa

    private var result: Double? {
        guard let co = cardiacOutput, let area = bsa, area > 0, co > 0 else { return nil }
        return co / area
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r < 2.2 { return ("Below typical adult range — concerning for cardiogenic shock or low-output state.", .alert) }
        if r < 2.5 { return ("Low normal — clinical correlation with perfusion endpoints.", .caution) }
        if r > 4.0 { return ("Above typical adult range — high-output state (sepsis early phase, hyperthyroidism, AV fistula).", .caution) }
        return ("Within typical adult range (2.5–4.0 L/min/m²).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "Cardiac Index",
            subtitle: "Cardiac output indexed to body surface area"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Cardiac output", unit: "L/min", value: $cardiacOutput)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "BSA", unit: "m²", value: $bsa)
            }
            CalculatorResultDisplay(
                label: "Cardiac Index",
                value: result.map { String(format: "%.2f", $0) },
                unit: "L/min/m²",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "CI = CO ÷ BSA",
                notes: "Indexes cardiac output to body surface area so adult and pediatric patients can be compared on a single scale. Typical adult range 2.5–4.0 L/min/m². Use BSA from the BSA calculator (Mosteller) if not measured.",
                citations: [openrnHemodynamics, openstaxClinicalSkillsTools]
            )
        }
    }
}
