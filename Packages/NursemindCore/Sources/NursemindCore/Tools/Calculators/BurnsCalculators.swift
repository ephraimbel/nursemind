import SwiftUI

// MARK: - Shared citation sources

private let ruleOfNines = CitationSource(
    id: "rule_of_nines",
    shortName: "Rule of Nines (Wallace) — standard burn assessment",
    detail: "Adult body-surface-area estimation for partial- and full-thickness burns",
    publisher: "American Burn Association / Open RN Health Alterations",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=burns+rule+of+nines+wound",
    lastRetrieved: "2026-05-04"
)

private let abaCriteria = CitationSource(
    id: "aba_burn_referral",
    shortName: "American Burn Association Burn Center Referral Criteria (concept citation)",
    detail: "Patients meeting ABA criteria should be transferred to a designated burn center",
    publisher: "American Burn Association",
    license: .factCitationOnly,
    url: "https://ameriburn.org/",
    lastRetrieved: "2026-05-04"
)

private let openrnBurns = CitationSource(
    id: "openrn_burns",
    shortName: "Open RN Health Alterations — Burn Injuries",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=burns+rule+of+nines+wound",
    lastRetrieved: "2026-05-04"
)

// MARK: - Rule of Nines

public struct RuleOfNinesCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "rule-of-nines", key: "head") private var head
    @CalcPersistedDouble(calculatorID: "rule-of-nines", key: "ant") private var anteriorTorso
    @CalcPersistedDouble(calculatorID: "rule-of-nines", key: "post") private var posteriorTorso
    @CalcPersistedDouble(calculatorID: "rule-of-nines", key: "rarm") private var rightArm
    @CalcPersistedDouble(calculatorID: "rule-of-nines", key: "larm") private var leftArm
    @CalcPersistedDouble(calculatorID: "rule-of-nines", key: "rleg") private var rightLeg
    @CalcPersistedDouble(calculatorID: "rule-of-nines", key: "lleg") private var leftLeg
    @CalcPersistedDouble(calculatorID: "rule-of-nines", key: "perineum") private var perineum

    private static let maxes: [String: Double] = [
        "head": 9, "anteriorTorso": 18, "posteriorTorso": 18,
        "rightArm": 9, "leftArm": 9, "rightLeg": 18, "leftLeg": 18, "perineum": 1
    ]

    private var total: Double? {
        let parts = [head, anteriorTorso, posteriorTorso, rightArm, leftArm, rightLeg, leftLeg, perineum]
        let values = parts.compactMap { $0 }
        guard !values.isEmpty else { return nil }
        return values.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let t = total, t > 0 else { return nil }
        if t >= 30 { return ("≥ 30% TBSA — major-burn band; meets the published ABA Burn Center Referral Criteria.", .alert) }
        if t >= 20 { return ("20–30% TBSA — major-burn band; meets the published ABA Burn Center Referral Criteria.", .alert) }
        if t >= 10 { return ("10–20% TBSA — moderate-burn band; meets the published ABA referral criterion for partial-thickness ≥ 10% in adults.", .alert) }
        if t >= 5  { return ("5–10% TBSA — minor-burn band per published ABA categorization.", .caution) }
        return ("Burn covers \(String(format: "%.1f", t))% TBSA. ABA Burn Center Referral Criteria additionally include partial-thickness > 10%, full-thickness > 5%, or burns of face, hands, feet, perineum, joints, electrical, chemical, or inhalation injury.", .caution)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.burns.eyebrowName,
            title: "Rule of Nines",
            subtitle: "Adult burn TBSA estimation"
        ) {
            CalculatorSection("REGION % BURNED") {
                regionRow(label: "Head & neck (max 9%)",       value: $head)
                Hairline(color: NMColor.borderSubtle)
                regionRow(label: "Anterior torso (max 18%)",   value: $anteriorTorso)
                Hairline(color: NMColor.borderSubtle)
                regionRow(label: "Posterior torso (max 18%)",  value: $posteriorTorso)
                Hairline(color: NMColor.borderSubtle)
                regionRow(label: "Right arm (max 9%)",         value: $rightArm)
                Hairline(color: NMColor.borderSubtle)
                regionRow(label: "Left arm (max 9%)",          value: $leftArm)
                Hairline(color: NMColor.borderSubtle)
                regionRow(label: "Right leg (max 18%)",        value: $rightLeg)
                Hairline(color: NMColor.borderSubtle)
                regionRow(label: "Left leg (max 18%)",         value: $leftLeg)
                Hairline(color: NMColor.borderSubtle)
                regionRow(label: "Perineum (max 1%)",          value: $perineum)
            }
            CalculatorResultDisplay(
                label: "Total TBSA",
                value: total.map { String(format: "%.1f", $0) },
                unit: "% TBSA",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Adult body surface assignment:\nHead/neck 9% · Each arm 9% · Anterior torso 18% · Posterior torso 18% · Each leg 18% · Perineum 1%\nTotal = 100%",
                notes: "Wallace's Rule of Nines applies to ADULTS. Pediatric patients have proportionally larger heads and smaller legs — use Lund-Browder chart for accuracy. Estimate first- AND second/third-degree burns separately; only partial- and full-thickness burns count toward TBSA for resuscitation calculations. Patient's PALM (without fingers) is approximately 1% TBSA — useful for scattered or irregular burns.",
                citations: [ruleOfNines, abaCriteria, openrnBurns]
            )
        }
    }

    private func regionRow(label: String, value: Binding<Double?>) -> some View {
        CalculatorNumberField(label: label, unit: "%", value: value)
    }
}
