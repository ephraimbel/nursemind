import SwiftUI

// MARK: - Shared citation source

private let nistConversions = CitationSource(
    id: "nist_si_conversions",
    shortName: "NIST SP 811 — Guide for the Use of the International System of Units",
    detail: "Standard SI / customary unit conversion factors",
    publisher: "National Institute of Standards and Technology",
    license: .publicDomain,
    url: "https://www.nist.gov/pml/special-publication-811",
    lastRetrieved: "2026-05-04"
)

// MARK: - Bidirectional conversion view component

private struct BidirectionalConverter: View {
    let label1: String
    let unit1: String
    @Binding var value1: Double?
    let convert1To2: (Double) -> Double

    let label2: String
    let unit2: String
    @Binding var value2: Double?
    let convert2To1: (Double) -> Double

    @State private var raw1: String = ""
    @State private var raw2: String = ""
    @State private var lastEdited: Int = 1   // 1 or 2; avoids feedback loop
    @FocusState private var focused: Int?

    var body: some View {
        VStack(spacing: 0) {
            row(label: label1, unit: unit1, raw: $raw1, side: 1) { newValue in
                lastEdited = 1
                let trimmed = newValue.trimmingCharacters(in: .whitespaces)
                if trimmed.isEmpty {
                    value1 = nil
                    value2 = nil
                    raw2 = ""
                } else if let parsed = Double(trimmed), parsed.isFinite {
                    value1 = parsed
                    let converted = convert1To2(parsed)
                    value2 = converted
                    raw2 = format(converted)
                }
            }
            Hairline(color: NMColor.borderSubtle)
            row(label: label2, unit: unit2, raw: $raw2, side: 2) { newValue in
                lastEdited = 2
                let trimmed = newValue.trimmingCharacters(in: .whitespaces)
                if trimmed.isEmpty {
                    value1 = nil
                    value2 = nil
                    raw1 = ""
                } else if let parsed = Double(trimmed), parsed.isFinite {
                    value2 = parsed
                    let converted = convert2To1(parsed)
                    value1 = converted
                    raw1 = format(converted)
                }
            }
        }
    }

    private func row(label: String, unit: String, raw: Binding<String>, side: Int, onChange: @escaping (String) -> Void) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: NMSpace.base) {
            Text(label)
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textPrimary)
            Spacer(minLength: NMSpace.base)
            TextField("—", text: raw)
                .keyboardType(.numbersAndPunctuation)
                .multilineTextAlignment(.trailing)
                .font(NMFont.monoXL)
                .foregroundStyle(NMColor.textPrimary)
                .frame(minWidth: 90, maxWidth: 140)
                .focused($focused, equals: side)
                .onChange(of: raw.wrappedValue) { _, newValue in
                    if focused == side {
                        onChange(newValue)
                    }
                }
            Text(unit)
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
                .frame(minWidth: 36, alignment: .leading)
        }
        .padding(.vertical, NMSpace.base)
        .contentShape(Rectangle())
        .onTapGesture { focused = side }
    }

    private func format(_ value: Double) -> String {
        let abs = Swift.abs(value)
        if abs >= 100 || value == value.rounded() {
            return String(format: "%g", value)
        }
        if abs >= 1 { return String(format: "%.2f", value) }
        return String(format: "%.4g", value)
    }
}

// MARK: - Temperature

public struct TemperatureConverterView: View {
    @State private var celsius: Double? = nil
    @State private var fahrenheit: Double? = nil

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.conversions.eyebrowName,
            title: "Temperature",
            subtitle: "°C ↔ °F"
        ) {
            CalculatorSection("CONVERT") {
                BidirectionalConverter(
                    label1: "Celsius",
                    unit1: "°C",
                    value1: $celsius,
                    convert1To2: { c in c * 9.0 / 5.0 + 32.0 },
                    label2: "Fahrenheit",
                    unit2: "°F",
                    value2: $fahrenheit,
                    convert2To1: { f in (f - 32.0) * 5.0 / 9.0 }
                )
            }
            CalculatorFormulaSection(
                formula: "°F = (°C × 9/5) + 32\n°C = (°F − 32) × 5/9",
                notes: "Common reference points: 36.5–37.5 °C = 97.7–99.5 °F (typical adult); 38.0 °C = 100.4 °F (fever threshold for many sepsis bundles); 35.0 °C = 95.0 °F (hypothermia).",
                citations: [nistConversions]
            )
        }
    }
}

// MARK: - Weight

public struct WeightConverterView: View {
    @State private var kg: Double? = nil
    @State private var lb: Double? = nil

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.conversions.eyebrowName,
            title: "Weight",
            subtitle: "kg ↔ lb"
        ) {
            CalculatorSection("CONVERT") {
                BidirectionalConverter(
                    label1: "Kilograms",
                    unit1: "kg",
                    value1: $kg,
                    convert1To2: { k in k / 0.45359237 },
                    label2: "Pounds",
                    unit2: "lb",
                    value2: $lb,
                    convert2To1: { p in p * 0.45359237 }
                )
            }
            CalculatorFormulaSection(
                formula: "1 kg = 2.20462 lb\n1 lb = 0.453592 kg",
                notes: "Many U.S. drug-dose references use mg/kg — patients reporting weight in pounds should be converted to kilograms first. Always document the SOURCE of the patient's weight (measured today vs. self-reported) for medication-dosing safety.",
                citations: [nistConversions]
            )
        }
    }
}

// MARK: - Length

public struct LengthConverterView: View {
    @State private var cm: Double? = nil
    @State private var inches: Double? = nil

    private var feetInches: String? {
        guard let inches else { return nil }
        let totalInches = Int(inches.rounded())
        let ft = totalInches / 12
        let inRem = totalInches % 12
        return "\(ft)′ \(inRem)″"
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.conversions.eyebrowName,
            title: "Length",
            subtitle: "cm ↔ in"
        ) {
            CalculatorSection("CONVERT") {
                BidirectionalConverter(
                    label1: "Centimeters",
                    unit1: "cm",
                    value1: $cm,
                    convert1To2: { c in c / 2.54 },
                    label2: "Inches",
                    unit2: "in",
                    value2: $inches,
                    convert2To1: { i in i * 2.54 }
                )
            }
            if let display = feetInches {
                CalculatorSection("FEET / INCHES") {
                    HStack {
                        Text("Equivalent").font(NMFont.bodyLG)
                        Spacer()
                        Text(display)
                            .font(NMFont.monoXL)
                            .foregroundStyle(NMColor.textPrimary)
                    }
                    .padding(.vertical, NMSpace.base)
                }
            }
            CalculatorFormulaSection(
                formula: "1 in = 2.54 cm\n1 cm = 0.3937 in\n12 in = 1 ft",
                notes: "Patient-reported height in feet and inches: convert to total inches first (5'8\" = 68 in), then multiply by 2.54. BMI and BSA calculators in this app accept centimeters.",
                citations: [nistConversions]
            )
        }
    }
}

// MARK: - Volume

public struct VolumeConverterView: View {
    @State private var ml: Double? = nil
    @State private var floz: Double? = nil

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.conversions.eyebrowName,
            title: "Volume",
            subtitle: "mL ↔ fl oz (US)"
        ) {
            CalculatorSection("CONVERT") {
                BidirectionalConverter(
                    label1: "Milliliters",
                    unit1: "mL",
                    value1: $ml,
                    convert1To2: { m in m / 29.5735295625 },
                    label2: "Fluid ounces",
                    unit2: "fl oz",
                    value2: $floz,
                    convert2To1: { f in f * 29.5735295625 }
                )
            }
            CalculatorFormulaSection(
                formula: "1 fl oz (US) = 29.5735 mL\n1 mL = 0.033814 fl oz",
                notes: "Useful for converting patient-reported intake (e.g., '8 oz of water') to mL for accurate I&O documentation. 1 cup ≈ 240 mL; 1 standard small juice box ≈ 120 mL; 1 standard styrofoam cup ≈ 240 mL — but always use a measured container when accuracy matters.",
                citations: [nistConversions]
            )
        }
    }
}

// MARK: - Lab unit conversion citations

private let ifccConversions = CitationSource(
    id: "ifcc_lab_units",
    shortName: "IFCC SI Conversion Factors — published consensus",
    detail: "International Federation of Clinical Chemistry SI/conventional unit conversion factors for common analytes",
    publisher: "IFCC / U.S. National Library of Medicine",
    license: .factCitationOnly,
    url: "https://www.aacc.org/science-and-research/practical-guides/units-of-measurement",
    lastRetrieved: "2026-05-04"
)

// MARK: - Glucose unit conversion

public struct GlucoseConverterView: View {
    @State private var mgdL: Double? = nil
    @State private var mmolL: Double? = nil

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.conversions.eyebrowName,
            title: "Glucose",
            subtitle: "mg/dL ↔ mmol/L"
        ) {
            CalculatorSection("CONVERT") {
                BidirectionalConverter(
                    label1: "Conventional",
                    unit1: "mg/dL",
                    value1: $mgdL,
                    convert1To2: { v in v * 0.0555 },
                    label2: "SI",
                    unit2: "mmol/L",
                    value2: $mmolL,
                    convert2To1: { v in v / 0.0555 }
                )
            }
            CalculatorFormulaSection(
                formula: "mmol/L = mg/dL × 0.0555\nmg/dL = mmol/L × 18.018",
                notes: "U.S. labs typically report glucose in mg/dL; most other countries report in mmol/L. Common reference points: 100 mg/dL = 5.5 mmol/L; 126 mg/dL = 7.0 mmol/L (ADA fasting diabetes threshold); 200 mg/dL = 11.1 mmol/L (ADA random/2-h OGTT diabetes threshold); 70 mg/dL = 3.9 mmol/L (ADA hypoglycemia level 1 cutoff).",
                citations: [ifccConversions]
            )
        }
    }
}

// MARK: - Creatinine unit conversion

public struct CreatinineConverterView: View {
    @State private var mgdL: Double? = nil
    @State private var umolL: Double? = nil

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.conversions.eyebrowName,
            title: "Creatinine",
            subtitle: "mg/dL ↔ µmol/L"
        ) {
            CalculatorSection("CONVERT") {
                BidirectionalConverter(
                    label1: "Conventional",
                    unit1: "mg/dL",
                    value1: $mgdL,
                    convert1To2: { v in v * 88.4 },
                    label2: "SI",
                    unit2: "µmol/L",
                    value2: $umolL,
                    convert2To1: { v in v / 88.4 }
                )
            }
            CalculatorFormulaSection(
                formula: "µmol/L = mg/dL × 88.4\nmg/dL = µmol/L × 0.01131",
                notes: "Many international labs and renal references (KDIGO, MDRD legacy literature) report creatinine in µmol/L. Reference: 1.0 mg/dL = 88.4 µmol/L; 2.0 mg/dL = 177 µmol/L (RCRI cutoff); 0.3 mg/dL = 26.5 µmol/L (KDIGO AKI delta).",
                citations: [ifccConversions]
            )
        }
    }
}

// MARK: - Bilirubin unit conversion

public struct BilirubinConverterView: View {
    @State private var mgdL: Double? = nil
    @State private var umolL: Double? = nil

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.conversions.eyebrowName,
            title: "Bilirubin",
            subtitle: "mg/dL ↔ µmol/L"
        ) {
            CalculatorSection("CONVERT") {
                BidirectionalConverter(
                    label1: "Conventional",
                    unit1: "mg/dL",
                    value1: $mgdL,
                    convert1To2: { v in v * 17.1 },
                    label2: "SI",
                    unit2: "µmol/L",
                    value2: $umolL,
                    convert2To1: { v in v / 17.1 }
                )
            }
            CalculatorFormulaSection(
                formula: "µmol/L = mg/dL × 17.1\nmg/dL = µmol/L × 0.0585",
                notes: "Common reference points: 1.0 mg/dL = 17.1 µmol/L; 2.5 mg/dL = 42.8 µmol/L (clinical jaundice typically visible at this level); 5 mg/dL ≈ 85 µmol/L. UK/EU labs typically report total bilirubin in µmol/L; U.S. labs in mg/dL.",
                citations: [ifccConversions]
            )
        }
    }
}

// MARK: - BUN ↔ Urea unit conversion

public struct BUNUreaConverterView: View {
    @State private var bunMgDL: Double? = nil
    @State private var ureaMmolL: Double? = nil

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.conversions.eyebrowName,
            title: "BUN ↔ Urea",
            subtitle: "BUN mg/dL ↔ Urea mmol/L"
        ) {
            CalculatorSection("CONVERT") {
                BidirectionalConverter(
                    label1: "BUN",
                    unit1: "mg/dL",
                    value1: $bunMgDL,
                    convert1To2: { v in v * 0.357 },
                    label2: "Urea",
                    unit2: "mmol/L",
                    value2: $ureaMmolL,
                    convert2To1: { v in v / 0.357 }
                )
            }
            CalculatorFormulaSection(
                formula: "Urea (mmol/L) = BUN (mg/dL) × 0.357\nBUN (mg/dL) = Urea (mmol/L) × 2.80\n(BUN measures the nitrogen content of urea; 1 mmol urea = 28 mg N = 2.14 mg urea expressed as mg/dL urea.)",
                notes: "U.S. labs typically report blood urea nitrogen (BUN) in mg/dL; most other countries report serum urea in mmol/L. Both refer to the same underlying analyte, scaled differently. To convert BUN (mg/dL) to urea (mg/dL) within the same unit system: BUN × 2.14.",
                citations: [ifccConversions]
            )
        }
    }
}
