import SwiftUI

private let whoWaist2008 = CitationSource(
    id: "who_2008_waist",
    shortName: "WHO Waist Circumference and Waist-Hip Ratio Report, 2008 (concept citation)",
    detail: "WHO consensus cutoffs for substantially increased cardiometabolic risk by waist circumference and waist-hip ratio",
    publisher: "World Health Organization",
    license: .factCitationOnly,
    url: "https://www.who.int/publications/i/item/9789241501491",
    lastRetrieved: "2026-05-04"
)

private let ashwell2014Whtr = CitationSource(
    id: "ashwell_2014_whtr",
    shortName: "Waist-Height Ratio meta-analysis — Ashwell M et al., Br J Nutr 2014 (concept citation)",
    detail: "WHtR ≥ 0.5 endorsed as a simple cardiometabolic-risk indicator across age and ethnicity",
    publisher: "British Journal of Nutrition",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/24447449/",
    lastRetrieved: "2026-05-04"
)

private let blackburn1977Wtloss = CitationSource(
    id: "blackburn_1977",
    shortName: "Significant weight loss criteria — Blackburn GL et al., JPEN 1977 (concept citation)",
    detail: "ASPEN-cited percent-weight-change cutoffs for significant and severe involuntary weight loss",
    publisher: "Journal of Parenteral and Enteral Nutrition",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/18650418/",
    lastRetrieved: "2026-05-04"
)

private let openrnAnthro3 = CitationSource(
    id: "openrn_anthro_3",
    shortName: "Open RN Health Alterations — Nutrition / Body Composition",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=nutrition+weight+anthropometry",
    lastRetrieved: "2026-05-04"
)

// MARK: - Waist-Hip Ratio

public struct WaistHipRatioCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "whr", key: "waist") private var waist
    @CalcPersistedDouble(calculatorID: "whr", key: "hip")   private var hip
    @CalcPersistedBool(calculatorID: "whr",   key: "male")  private var maleSex

    private var ratio: Double? {
        guard let w = waist, let h = hip, h > 0 else { return nil }
        return w / h
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = ratio else { return nil }
        if maleSex {
            if r >= 1.00 { return ("WHR ≥ 1.00 (men) — substantially increased cardiometabolic risk per WHO 2008 cutoff.", .alert) }
            if r >= 0.90 { return ("WHR 0.90–0.99 (men) — increased cardiometabolic risk per WHO 2008 cutoff.", .caution) }
            return ("WHR < 0.90 (men) — below the WHO 2008 increased-risk cutoff.", .neutral)
        } else {
            if r >= 0.85 { return ("WHR ≥ 0.85 (women) — substantially increased cardiometabolic risk per WHO 2008 cutoff.", .alert) }
            if r >= 0.80 { return ("WHR 0.80–0.84 (women) — increased cardiometabolic risk per WHO 2008 cutoff.", .caution) }
            return ("WHR < 0.80 (women) — below the WHO 2008 increased-risk cutoff.", .neutral)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.anthropometry.eyebrowName,
            title: "Waist-Hip Ratio",
            subtitle: "Central adiposity · WHO cutoffs"
        ) {
            CalculatorSection("MEASUREMENTS") {
                CalculatorNumberField(label: "Waist circumference", unit: "cm", value: $waist)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Hip circumference",   unit: "cm", value: $hip)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Male (cutoffs differ by sex)", isOn: $maleSex).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "WHR",
                value: ratio.map { String(format: "%.2f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "WHR = waist / hip\n(Use the same units for both — cm and cm, or in and in.)",
                notes: "Waist measured at the midpoint between the lowest rib and iliac crest at end of normal expiration; hip at the maximum circumference over the buttocks (WHO protocol). WHR is more strongly associated with cardiovascular outcomes than BMI in many cohorts. Use as one element of cardiometabolic risk assessment, not as a stand-alone diagnosis.",
                citations: [whoWaist2008, openrnAnthro3]
            )
        }
    }
}

// MARK: - Waist-Height Ratio

public struct WaistHeightRatioCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "whtr", key: "waist")  private var waist
    @CalcPersistedDouble(calculatorID: "whtr", key: "height") private var height

    private var ratio: Double? {
        guard let w = waist, let h = height, h > 0 else { return nil }
        return w / h
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = ratio else { return nil }
        if r >= 0.6  { return ("WHtR ≥ 0.60 — substantially elevated cardiometabolic risk per Ashwell 2014 meta-analysis.", .alert) }
        if r >= 0.5  { return ("WHtR ≥ 0.50 — increased cardiometabolic risk per Ashwell 2014 cutoff ('keep your waist to less than half your height').", .caution) }
        if r >= 0.4  { return ("WHtR 0.40–0.49 — within the typical reference range.", .neutral) }
        return ("WHtR < 0.40 — below the typical reference range; consider whether measurement is accurate or whether underweight is contributing.", .caution)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.anthropometry.eyebrowName,
            title: "Waist-Height Ratio",
            subtitle: "Central adiposity · sex-neutral"
        ) {
            CalculatorSection("MEASUREMENTS") {
                CalculatorNumberField(label: "Waist circumference", unit: "cm", value: $waist)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Height",                unit: "cm", value: $height)
            }
            CalculatorResultDisplay(
                label: "WHtR",
                value: ratio.map { String(format: "%.2f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "WHtR = waist / height\n(Use the same units for both.)\nReference cutoff: 0.50 — 'keep your waist to less than half your height'.",
                notes: "WHtR is sex-neutral, ethnicity-robust, and easier to communicate than BMI or WHR. The 0.50 cutoff identifies central adiposity in adults and adolescents. Like all anthropometric indices, interpret in clinical context — body composition (e.g., athletes) and edema can confound the measurement.",
                citations: [ashwell2014Whtr, openrnAnthro3]
            )
        }
    }
}

// MARK: - Percent Weight Change

public struct PercentWeightChangeCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "pct-wt", key: "previous") private var previousWt
    @CalcPersistedDouble(calculatorID: "pct-wt", key: "current")  private var currentWt
    @CalcPersistedOptionID(calculatorID: "pct-wt", key: "window") private var windowID
    private var window: CalculatorScoreRow.Option? { windowOpts.first { $0.id == windowID } }

    private let windowOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "1 week",   score: 0),
        .init(id: 1, label: "1 month",  score: 1),
        .init(id: 2, label: "3 months", score: 2),
        .init(id: 3, label: "6 months", score: 3)
    ]

    private var pctChange: Double? {
        guard let p = previousWt, let c = currentWt, p > 0 else { return nil }
        return ((p - c) / p) * 100.0
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let pct = pctChange, let w = window else { return nil }
        if pct < 0 {
            return ("Weight gain of \(String(format: "%.1f", -pct))% over the selected window. Significant in fluid-overload contexts (CHF, AKI/CKD, cirrhosis) per published nutrition assessment criteria.", .caution)
        }
        let band = w.score
        let (sigCutoff, severeCutoff): (Double, Double) = switch band {
        case 0:  (1.0, 2.0)        // 1 week
        case 1:  (5.0, 7.5)        // 1 month — Blackburn 1977 / ASPEN
        case 2:  (7.5, 10.0)       // 3 months
        default: (10.0, 15.0)      // 6 months
        }
        if pct >= severeCutoff { return ("Weight loss \(String(format: "%.1f", pct))% — exceeds the severe involuntary-loss cutoff for \(w.label) per Blackburn 1977 / ASPEN criteria (≥ \(String(format: "%.1f", severeCutoff))%).", .alert) }
        if pct >= sigCutoff    { return ("Weight loss \(String(format: "%.1f", pct))% — meets the significant involuntary-loss cutoff for \(w.label) per Blackburn 1977 / ASPEN criteria (≥ \(String(format: "%.1f", sigCutoff))%).", .caution) }
        return ("Weight loss \(String(format: "%.1f", pct))% — below the significant-loss cutoff for \(w.label).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.anthropometry.eyebrowName,
            title: "% Weight Change",
            subtitle: "Nutrition / palliative tracking"
        ) {
            CalculatorSection("WEIGHTS") {
                CalculatorNumberField(label: "Previous weight", unit: "kg", value: $previousWt)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Current weight",  unit: "kg", value: $currentWt)
            }
            CalculatorSection("INTERVAL") {
                CalculatorScoreRow(label: "Window", options: windowOpts, selection: $windowID.option(in: windowOpts))
            }
            CalculatorResultDisplay(
                label: "% change",
                value: pctChange.map { String(format: "%.1f", $0) },
                unit: "%",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "% change = ((previous − current) / previous) × 100\nPositive value = loss; negative = gain.\nSignificant / severe cutoffs (Blackburn 1977 / ASPEN):\n  1 week:   1% / 2%\n  1 month:  5% / 7.5%\n  3 months: 7.5% / 10%\n  6 months: 10% / 15%",
                notes: "The published cutoffs apply to *involuntary* weight loss in the context of nutritional assessment — distinct from intentional dieting. Pair with subjective global assessment and biomarkers (albumin, prealbumin, hand-grip strength) for a complete malnutrition picture. In edematous states, dry-weight changes may be obscured.",
                citations: [blackburn1977Wtloss, openrnAnthro3]
            )
        }
    }
}
