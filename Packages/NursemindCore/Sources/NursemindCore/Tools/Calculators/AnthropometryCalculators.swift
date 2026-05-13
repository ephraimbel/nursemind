import SwiftUI

// MARK: - Shared citation sources

private let cdcBmi = CitationSource(
    id: "cdc_bmi",
    shortName: "CDC Adult BMI Categories",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html",
    lastRetrieved: "2026-05-04"
)

private let mosteller = CitationSource(
    id: "mosteller_bsa",
    shortName: "BSA — Mosteller, NEJM 1987 (concept citation)",
    detail: "Simplified body-surface-area formula widely adopted in clinical practice",
    publisher: "New England Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/3657876/",
    lastRetrieved: "2026-05-04"
)

private let devine = CitationSource(
    id: "devine_ibw",
    shortName: "IBW — Devine 1974 formula (concept citation)",
    detail: "Original Devine formula: men 50 + 2.3 × (in over 5 ft); women 45.5 + 2.3 × (in over 5 ft)",
    publisher: "Drug Intell Clin Pharm",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/",
    lastRetrieved: "2026-05-04"
)

private let openrnAnthro = CitationSource(
    id: "openrn_anthro",
    shortName: "Open RN Health Assessment — Anthropometric measurements",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthassessment/?s=anthropometry+bmi+ibw",
    lastRetrieved: "2026-05-04"
)

// MARK: - BMI

public struct BMICalculatorView: View {
    @State private var weightKg: Double?
    @State private var heightCm: Double?

    public init(preset: [String: Double] = [:]) {
        let store = CalculatorStateStore.shared
        _weightKg = State(initialValue: preset["weight_kg"] ?? store.loadDouble(for: "bmi", key: "wt"))
        _heightCm = State(initialValue: preset["height_cm"] ?? store.loadDouble(for: "bmi", key: "ht"))
    }

    private var result: Double? {
        guard let w = weightKg, w > 0, let h = heightCm, h > 0 else { return nil }
        let meters = h / 100.0
        return w / (meters * meters)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r < 18.5 { return ("Underweight (CDC < 18.5).", .caution) }
        if r < 25.0 { return ("Healthy weight (CDC 18.5–24.9).", .neutral) }
        if r < 30.0 { return ("Overweight (CDC 25.0–29.9).", .caution) }
        if r < 35.0 { return ("Obesity Class I (CDC 30.0–34.9).", .alert) }
        if r < 40.0 { return ("Obesity Class II (CDC 35.0–39.9).", .alert) }
        return ("Obesity Class III (CDC ≥ 40.0).", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.anthropometry.eyebrowName,
            title: "BMI",
            subtitle: "Body mass index"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Weight", unit: "kg", value: $weightKg)
                    .onChange(of: weightKg) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "bmi", key: "wt")
                    }
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Height", unit: "cm", value: $heightCm)
                    .onChange(of: heightCm) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "bmi", key: "ht")
                    }
            }
            CalculatorResultDisplay(
                label: "BMI",
                value: result.map { String(format: "%.1f", $0) },
                unit: "kg/m²",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "BMI = weight (kg) ÷ height² (m)",
                notes: "BMI is a screening tool, not a diagnostic body-composition measure. It does not distinguish lean mass from fat mass; athletic, muscular, elderly, and pregnant individuals may have BMI values that misrepresent health risk. Pediatric BMI uses age- and sex-specific percentiles, not these categories.",
                citations: [cdcBmi, openrnAnthro]
            )
        }
    }
}

// MARK: - BSA (Mosteller)

public struct BSACalculatorView: View {
    @CalcPersistedDouble(calculatorID: "bsa", key: "wt") private var weightKg
    @CalcPersistedDouble(calculatorID: "bsa", key: "ht") private var heightCm

    private var result: Double? {
        guard let w = weightKg, w > 0, let h = heightCm, h > 0 else { return nil }
        return ((w * h) / 3600.0).squareRoot()
    }

    private var interpretation: String? {
        guard let r = result else { return nil }
        if r < 1.0 { return "Within typical small-adult / pediatric range." }
        if r > 2.5 { return "Above typical adult range — verify input units." }
        return "Within typical adult range (1.5–2.0 m² is common)."
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.anthropometry.eyebrowName,
            title: "BSA",
            subtitle: "Body surface area · Mosteller"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Weight", unit: "kg", value: $weightKg)
                    .onChange(of: weightKg) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "bmi", key: "wt")
                    }
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Height", unit: "cm", value: $heightCm)
                    .onChange(of: heightCm) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "bmi", key: "ht")
                    }
            }
            CalculatorResultDisplay(
                label: "BSA",
                value: result.map { String(format: "%.2f", $0) },
                unit: "m²",
                interpretation: interpretation,
                level: .neutral
            )
            CalculatorFormulaSection(
                formula: "BSA = √[ (weight in kg × height in cm) ÷ 3600 ]",
                notes: "Mosteller formula widely used because it is easy to compute at the bedside and approximates the older DuBois & DuBois formula closely enough for most clinical purposes (cardiac index, oncology dosing references, BSA-indexed labs).",
                citations: [mosteller, openrnAnthro]
            )
        }
    }
}

// MARK: - IBW (Devine)

public struct IBWCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "ibw", key: "ht") private var heightCm
    @CalcPersistedRawValue<SexOption>(calculatorID: "ibw", key: "sex") private var sex

    enum SexOption: String, CaseIterable, Identifiable {
        case female, male
        var id: String { rawValue }
        var display: String { rawValue.capitalized }
    }

    private var result: Double? {
        guard let h = heightCm, h > 0, let s = sex else { return nil }
        let inches = h / 2.54
        let inchesOver5Ft = max(inches - 60.0, 0)
        let base: Double = (s == .male) ? 50.0 : 45.5
        return base + 2.3 * inchesOver5Ft
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.anthropometry.eyebrowName,
            title: "IBW",
            subtitle: "Ideal body weight · Devine 1974"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Height", unit: "cm", value: $heightCm)
                    .onChange(of: heightCm) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "bmi", key: "ht")
                    }
                Hairline(color: NMColor.borderSubtle)
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
            }
            CalculatorResultDisplay(
                label: "Ideal body weight",
                value: result.map { String(format: "%.1f", $0) },
                unit: "kg",
                interpretation: "Devine formula. Use clinical judgment — IBW is a reference point, not a treatment target.",
                level: .neutral
            )
            CalculatorFormulaSection(
                formula: "Men:   IBW = 50 + 2.3 × (inches over 5 ft)\nWomen: IBW = 45.5 + 2.3 × (inches over 5 ft)\n(1 in = 2.54 cm)",
                notes: "Originally developed by Devine for aminoglycoside dosing, IBW is widely used as an input to ventilator tidal-volume settings (4–8 mL/kg IBW for ARDS lung-protective ventilation). Adjusted body weight (AdjBW) is preferred over IBW for some drug-dosing calculations in obese patients per institutional protocol.",
                citations: [devine, openrnAnthro]
            )
        }
    }
}
