import SwiftUI

// MARK: - Shared citation sources

private let adjbwRef = CitationSource(
    id: "adjbw_ref",
    shortName: "Adjusted Body Weight — standard pharmacology reference",
    detail: "AdjBW = IBW + 0.4 × (actual − IBW)",
    publisher: "Open RN Nursing Pharmacology",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=anthropometry+dosing+weight",
    lastRetrieved: "2026-05-04"
)

private let mifflin1990 = CitationSource(
    id: "mifflin_1990",
    shortName: "Mifflin-St Jeor — Mifflin MD et al., Am J Clin Nutr 1990 (concept citation)",
    detail: "Resting metabolic rate predictor; preferred over Harris-Benedict in most clinical contexts",
    publisher: "American Journal of Clinical Nutrition",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/2305711/",
    lastRetrieved: "2026-05-04"
)

private let openrnAnthro2 = CitationSource(
    id: "openrn_anthro_2",
    shortName: "Open RN Health Assessment — Anthropometric measurements",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthassessment/?s=anthropometry+bmi+ibw",
    lastRetrieved: "2026-05-04"
)

// MARK: - AdjBW

public struct AdjBWCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "adjbw", key: "ht") private var heightCm
    @CalcPersistedDouble(calculatorID: "adjbw", key: "actual") private var actualKg
    @CalcPersistedRawValue<SexOption>(calculatorID: "adjbw", key: "sex") private var sex

    enum SexOption: String, CaseIterable, Identifiable {
        case female, male
        var id: String { rawValue }
        var display: String { rawValue.capitalized }
    }

    private var ibw: Double? {
        guard let h = heightCm, h > 0, let s = sex else { return nil }
        let inches = h / 2.54
        let inchesOver5Ft = max(inches - 60.0, 0)
        let base: Double = (s == .male) ? 50.0 : 45.5
        return base + 2.3 * inchesOver5Ft
    }

    private var adjbw: Double? {
        guard let i = ibw, let a = actualKg, a > i else { return ibw }
        return i + 0.4 * (a - i)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let actual = actualKg, let i = ibw else { return nil }
        if actual < i {
            return ("Actual weight ≤ IBW. Use ACTUAL body weight for most weight-based dosing in this scenario.", .neutral)
        }
        let pctOver = ((actual - i) / i) * 100
        if pctOver >= 30 {
            return ("Actual weight ≥ 30% above IBW (BMI typically > 30). AdjBW commonly used for hydrophilic drug dosing (e.g., aminoglycosides, vancomycin, LMWH per institutional protocol). Verify drug-specific guidance.", .alert)
        }
        if pctOver >= 20 {
            return ("Actual weight 20–30% above IBW. AdjBW may be used for select drugs per institutional protocol.", .caution)
        }
        return ("Actual weight close to IBW. Many institutions use actual or IBW; AdjBW typically not needed.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.anthropometry.eyebrowName,
            title: "Adjusted Body Weight",
            subtitle: "Drug-dosing weight in obesity"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Height",        unit: "cm", value: $heightCm)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Actual weight", unit: "kg", value: $actualKg)
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
            if let i = ibw {
                CalculatorSection("REFERENCE") {
                    HStack {
                        Text("IBW (Devine)").font(NMFont.bodyLG)
                        Spacer()
                        Text(String(format: "%.1f kg", i))
                            .font(NMFont.monoXL)
                            .foregroundStyle(NMColor.textPrimary)
                    }
                    .padding(.vertical, NMSpace.base)
                }
            }
            CalculatorResultDisplay(
                label: "AdjBW",
                value: adjbw.map { String(format: "%.1f", $0) },
                unit: "kg",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "IBW (Devine) — see IBW calculator.\nAdjBW = IBW + 0.4 × (actual − IBW)\n(use actual weight if actual ≤ IBW)",
                notes: "AdjBW is a calculated weight used as INPUT to certain drug-dose calculations, primarily hydrophilic agents in obese patients (aminoglycosides, vancomycin, enoxaparin in select protocols). It is NOT a drug dose itself. Always follow institutional and drug-specific dosing references — AdjBW vs. IBW vs. actual weight choice varies by drug.",
                citations: [adjbwRef, openrnAnthro2]
            )
        }
    }
}

// MARK: - Mifflin-St Jeor

public struct MifflinStJeorCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "mifflin", key: "wt") private var weightKg
    @CalcPersistedDouble(calculatorID: "mifflin", key: "ht") private var heightCm
    @CalcPersistedDouble(calculatorID: "mifflin", key: "age") private var age
    @CalcPersistedRawValue<SexOption>(calculatorID: "mifflin", key: "sex") private var sex
    @CalcPersistedRawValue<ActivityFactor>(calculatorID: "mifflin", key: "act") private var activityFactor

    enum SexOption: String, CaseIterable, Identifiable {
        case female, male
        var id: String { rawValue }
        var display: String { rawValue.capitalized }
    }

    enum ActivityFactor: String, CaseIterable, Identifiable {
        case sedentary, light, moderate, very, extra
        var id: String { rawValue }
        var display: String {
            switch self {
            case .sedentary: return "Sedentary (×1.2)"
            case .light:     return "Light (×1.375)"
            case .moderate:  return "Moderate (×1.55)"
            case .very:      return "Very active (×1.725)"
            case .extra:     return "Extra active (×1.9)"
            }
        }
        var multiplier: Double {
            switch self {
            case .sedentary: return 1.2
            case .light:     return 1.375
            case .moderate:  return 1.55
            case .very:      return 1.725
            case .extra:     return 1.9
            }
        }
    }

    private var rmr: Double? {
        guard let w = weightKg, w > 0,
              let h = heightCm, h > 0,
              let a = age, a > 0, a < 130,
              let s = sex else { return nil }
        let base = 10.0 * w + 6.25 * h - 5.0 * a
        return s == .male ? base + 5 : base - 161
    }

    private var tdee: Double? {
        guard let r = rmr, let f = activityFactor else { return nil }
        return r * f.multiplier
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.anthropometry.eyebrowName,
            title: "Mifflin-St Jeor",
            subtitle: "Resting metabolic rate"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Weight", unit: "kg",    value: $weightKg)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Height", unit: "cm",    value: $heightCm)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Age",    unit: "years", value: $age)
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
                Hairline(color: NMColor.borderSubtle)
                VStack(alignment: .leading, spacing: NMSpace.sm) {
                    Text("Activity factor (for TDEE)").font(NMFont.bodyLG)
                    Picker("Activity", selection: $activityFactor) {
                        Text("—").tag(ActivityFactor?.none)
                        ForEach(ActivityFactor.allCases) { Text($0.display).tag(ActivityFactor?.some($0)) }
                    }
                    .pickerStyle(.menu)
                }
                .padding(.vertical, NMSpace.base)
            }
            CalculatorResultDisplay(
                label: "RMR",
                value: rmr.map { String(format: "%.0f", $0) },
                unit: "kcal/day",
                interpretation: tdee.map { "Estimated total daily energy expenditure (TDEE): \(String(format: "%.0f", $0)) kcal/day with selected activity factor." },
                level: .neutral
            )
            CalculatorFormulaSection(
                formula: "Men:   RMR = (10 × wt) + (6.25 × ht) − (5 × age) + 5\nWomen: RMR = (10 × wt) + (6.25 × ht) − (5 × age) − 161\n(weight in kg; height in cm)\nTDEE = RMR × activity factor",
                notes: "Mifflin-St Jeor is preferred over the older Harris-Benedict equations in most clinical contexts. Estimates resting metabolic rate; multiply by activity factor for total daily energy expenditure. For ICU patients, indirect calorimetry remains the gold standard; predictive equations under-estimate in critically ill, hypermetabolic, or burn patients.",
                citations: [mifflin1990, openrnAnthro2]
            )
        }
    }
}
