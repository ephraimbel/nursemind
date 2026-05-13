import SwiftUI

private let light1972 = CitationSource(
    id: "light_1972",
    shortName: "Light's Criteria — Light RW et al., Ann Intern Med 1972 (concept citation)",
    detail: "Three biochemical criteria for distinguishing exudative from transudative pleural effusions",
    publisher: "Annals of Internal Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/4642731/",
    lastRetrieved: "2026-05-05"
)

private let openrnResp8 = CitationSource(
    id: "openrn_resp_8",
    shortName: "Open RN Health Alterations — Pleural Effusion / Thoracentesis",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=pleural+effusion+thoracentesis",
    lastRetrieved: "2026-05-05"
)

// MARK: - Light's Criteria

public struct LightCriteriaCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "light", key: "pleuralProtein") private var pleuralProtein
    @CalcPersistedDouble(calculatorID: "light", key: "serumProtein")   private var serumProtein
    @CalcPersistedDouble(calculatorID: "light", key: "pleuralLDH")     private var pleuralLDH
    @CalcPersistedDouble(calculatorID: "light", key: "serumLDH")       private var serumLDH
    @CalcPersistedDouble(calculatorID: "light", key: "serumLDHULN")    private var serumLDHULN

    private var proteinRatio: Double? {
        guard let p = pleuralProtein, let s = serumProtein, s > 0 else { return nil }
        return p / s
    }
    private var ldhRatio: Double? {
        guard let p = pleuralLDH, let s = serumLDH, s > 0 else { return nil }
        return p / s
    }
    private var ldhTwoThirds: Bool? {
        guard let p = pleuralLDH, let u = serumLDHULN, u > 0 else { return nil }
        return p > (u * 2.0 / 3.0)
    }

    private var allDataEntered: Bool {
        proteinRatio != nil && ldhRatio != nil && ldhTwoThirds != nil
    }

    private var isExudate: Bool? {
        guard allDataEntered else { return nil }
        return (proteinRatio! > 0.5) || (ldhRatio! > 0.6) || ldhTwoThirds!
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let exudate = isExudate else { return nil }
        if exudate {
            return ("EXUDATE — meets at least one of the three published Light's criteria. Sensitivity ≈ 98% for exudative effusions in the original validation cohort.", .alert)
        }
        return ("TRANSUDATE — meets none of the published Light's criteria. NPV ≈ 75% for transudate; if clinical suspicion for exudate remains high (e.g., on diuretics), pair with serum-effusion albumin gradient (> 1.2 g/dL favors transudate).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "Light's Criteria",
            subtitle: "Pleural effusion · transudate vs exudate"
        ) {
            CalculatorSection("PROTEIN") {
                CalculatorNumberField(label: "Pleural fluid protein", unit: "g/dL", value: $pleuralProtein)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Serum protein",          unit: "g/dL", value: $serumProtein)
            }
            CalculatorSection("LDH") {
                CalculatorNumberField(label: "Pleural fluid LDH", unit: "IU/L", value: $pleuralLDH)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Serum LDH",          unit: "IU/L", value: $serumLDH)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Serum LDH upper-limit normal", unit: "IU/L", value: $serumLDHULN)
            }
            CalculatorResultDisplay(
                label: "Light's",
                value: isExudate.map { $0 ? "EXUDATE" : "TRANSUDATE" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Effusion is EXUDATIVE if any one of:\n  1. Pleural protein / Serum protein > 0.5\n  2. Pleural LDH / Serum LDH > 0.6\n  3. Pleural LDH > 2/3 × upper-limit-normal serum LDH\nOtherwise TRANSUDATIVE.",
                notes: "Light's criteria over-classify some transudates as exudates, especially in patients on diuretics. When transudate is suspected but Light's reads exudate, the published serum-effusion albumin gradient (SAG; transudate if > 1.2 g/dL) and serum-effusion protein gradient (transudate if > 3.1 g/dL) help confirm.",
                citations: [light1972, openrnResp8]
            )
        }
    }
}
