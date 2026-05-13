import SwiftUI

// MARK: - Shared citation sources

private let antman2000Timi = CitationSource(
    id: "antman_2000_timi",
    shortName: "TIMI Risk Score for UA/NSTEMI — Antman EM et al., JAMA 2000 (concept citation)",
    detail: "Validated 7-variable risk score for unstable angina / non-ST elevation MI",
    publisher: "JAMA",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/10938172/",
    lastRetrieved: "2026-05-04"
)

private let killipKimball1967 = CitationSource(
    id: "killip_kimball_1967",
    shortName: "Killip Class — Killip & Kimball, Am J Cardiol 1967 (concept citation)",
    detail: "Original four-class clinical assessment of acute MI",
    publisher: "American Journal of Cardiology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/6059183/",
    lastRetrieved: "2026-05-04"
)

private let abiAhaPad = CitationSource(
    id: "aha_pad_abi",
    shortName: "ABI for PAD diagnosis — AHA/ACC PAD Guideline (concept citation)",
    detail: "Lower-extremity peripheral artery disease assessment with ankle-brachial index",
    publisher: "American Heart Association / American College of Cardiology",
    license: .factCitationOnly,
    url: "https://www.acc.org/Clinical-Topics",
    lastRetrieved: "2026-05-04"
)

private let openrnCardio4 = CitationSource(
    id: "openrn_cardio_4",
    shortName: "Open RN Health Alterations — Cardiac & Vascular Assessment",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=clinical+reference",
    lastRetrieved: "2026-05-04"
)

// MARK: - TIMI

public struct TIMICalculatorView: View {
    @CalcPersistedBool(calculatorID: "timi", key: "ageGE65")          private var ageGE65
    @CalcPersistedBool(calculatorID: "timi", key: "threeRiskFactors") private var threeRiskFactors
    @CalcPersistedBool(calculatorID: "timi", key: "knownCAD")         private var knownCAD
    @CalcPersistedBool(calculatorID: "timi", key: "asaInLast7d")      private var asaInLast7d
    @CalcPersistedBool(calculatorID: "timi", key: "severeAngina")     private var severeAngina
    @CalcPersistedBool(calculatorID: "timi", key: "stDeviationGE05")  private var stDeviationGE05
    @CalcPersistedBool(calculatorID: "timi", key: "positiveTroponin") private var positiveTroponin

    private var total: Int {
        [ageGE65, threeRiskFactors, knownCAD, asaInLast7d,
         severeAngina, stDeviationGE05, positiveTroponin]
            .filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        switch total {
        case 0...1: return ("TIMI 0–1 — low-risk band; published 14-day MACE rate ≈ 5%.", .neutral)
        case 2:     return ("TIMI 2 — low-intermediate-risk band; published 14-day MACE rate ≈ 8%.", .caution)
        case 3:     return ("TIMI 3 — intermediate-risk band; published 14-day MACE rate ≈ 13%.", .caution)
        case 4:     return ("TIMI 4 — high-intermediate-risk band; published 14-day MACE rate ≈ 20%.", .alert)
        case 5:     return ("TIMI 5 — high-risk band; published 14-day MACE rate ≈ 26%.", .alert)
        default:    return ("TIMI 6–7 — very-high-risk band; published 14-day MACE rate ≈ 41%.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "TIMI",
            subtitle: "UA / NSTEMI — 14-day MACE risk"
        ) {
            CalculatorSection("CRITERIA") {
                togglePoint(label: "Age ≥ 65",                                                isOn: $ageGE65)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "≥ 3 CAD risk factors (HTN, hypercholesterolemia, DM, smoking, FHx)", isOn: $threeRiskFactors)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Known CAD (≥ 50% stenosis)",                              isOn: $knownCAD)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "ASA use within last 7 days",                              isOn: $asaInLast7d)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Severe angina (≥ 2 episodes in 24 h)",                    isOn: $severeAngina)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "ST deviation ≥ 0.5 mm",                                   isOn: $stDeviationGE05)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Positive cardiac biomarker (troponin)",                   isOn: $positiveTroponin)
            }
            CalculatorResultDisplay(
                label: "TIMI",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 7 binary criteria. Range 0–7.\nMACE at 14 days: death, new/recurrent MI, urgent revascularization.",
                notes: "Validated for unstable angina and NSTEMI; not for STEMI. Use HEART Score for undifferentiated chest pain in the ED. Score does not replace clinical judgment — patients with TIMI 0–1 and ongoing concerning features still warrant evaluation.",
                citations: [antman2000Timi, openrnCardio4]
            )
        }
    }

    private func togglePoint(label: String, isOn: Binding<Bool>) -> some View {
        HStack {
            Toggle(isOn: isOn) {
                Text(label).font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary).lineLimit(2)
            }
            .toggleStyle(.switch)
            Text("+1")
                .font(NMFont.mono)
                .foregroundStyle(NMColor.textTertiary)
                .frame(minWidth: 36, alignment: .trailing)
        }
        .padding(.vertical, NMSpace.base)
    }
}

// MARK: - Killip Class

public struct KillipClassCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "killip", key: "classChoice") private var classChoiceID
    private var classChoice: CalculatorScoreRow.Option? { options.first { $0.id == classChoiceID } }

    private let options: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "Class I — no clinical signs of heart failure",                            score: 1),
        .init(id: 2, label: "Class II — rales / S3 gallop / elevated JVP",                             score: 2),
        .init(id: 3, label: "Class III — frank pulmonary edema",                                       score: 3),
        .init(id: 4, label: "Class IV — cardiogenic shock (SBP < 90, oliguria, hypoperfusion)",        score: 4)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let c = classChoice else { return nil }
        switch c.score {
        case 1: return ("Killip I — published 30-day mortality ≈ 6% (Killip 1967 derivation cohort).", .neutral)
        case 2: return ("Killip II — published 30-day mortality ≈ 17%.", .caution)
        case 3: return ("Killip III — published 30-day mortality ≈ 38%.", .alert)
        default: return ("Killip IV — published 30-day mortality ≈ 81%; defines cardiogenic shock band per the original 1967 classification.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "Killip Class",
            subtitle: "Acute MI clinical severity"
        ) {
            CalculatorSection("CLASSIFICATION") {
                CalculatorScoreRow(label: "Killip class", options: options, selection: $classChoiceID.option(in: options))
            }
            CalculatorResultDisplay(
                label: "Killip",
                value: classChoice.map { roman($0.score) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Bedside four-class clinical assessment of left-ventricular failure in acute MI.",
                notes: "Original 1967 mortality data. Modern reperfusion has reduced absolute mortality across all classes, but the relative gradient persists. Re-classify with each clinical reassessment — Killip class is a snapshot, not a static label.",
                citations: [killipKimball1967, openrnCardio4]
            )
        }
    }

    private func roman(_ n: Int) -> String { ["", "I", "II", "III", "IV"][n] }
}

// MARK: - Pulse Pressure

public struct PulsePressureCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "pulse-pressure", key: "sbp") private var sbp
    @CalcPersistedDouble(calculatorID: "pulse-pressure", key: "dbp") private var dbp

    private var result: Double? {
        guard let sbp, let dbp, sbp >= dbp, sbp > 0, dbp > 0 else { return nil }
        return sbp - dbp
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r > 60 { return ("Wide pulse pressure (> 60 mmHg) — consider aortic regurgitation, hyperthyroidism, severe anemia, AV fistula, fever, late septic shock.", .caution) }
        if r < 25 { return ("Narrow pulse pressure (< 25 mmHg) — concerning for cardiac tamponade, severe aortic stenosis, cardiogenic shock, hypovolemic shock.", .alert) }
        return ("Within typical adult range (30–50 mmHg).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "Pulse Pressure",
            subtitle: "SBP − DBP"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Systolic BP",  unit: "mmHg", value: $sbp)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Diastolic BP", unit: "mmHg", value: $dbp)
            }
            CalculatorResultDisplay(
                label: "Pulse Pressure",
                value: result.map { String(format: "%.0f", $0) },
                unit: "mmHg",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Pulse Pressure = SBP − DBP",
                notes: "A wide pulse pressure (especially with normal-to-high SBP) reflects increased stroke volume or decreased arterial compliance. A narrow pulse pressure indicates reduced stroke volume — assess perfusion and look for tamponade physiology in the right context.",
                citations: [openrnCardio4]
            )
        }
    }
}

// MARK: - ABI

public struct ABICalculatorView: View {
    @CalcPersistedDouble(calculatorID: "abi", key: "ankle_sbp") private var ankleSBP
    @CalcPersistedDouble(calculatorID: "abi", key: "arm_sbp") private var armSBP

    private var result: Double? {
        guard let ankle = ankleSBP, ankle > 0,
              let arm = armSBP, arm > 0 else { return nil }
        return ankle / arm
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r > 1.4 { return ("ABI > 1.4 — non-compressible vessels (calcified arteries, often diabetes, ESRD). ABI is unreliable; consider toe-brachial index (TBI) or imaging.", .caution) }
        if r >= 1.0 { return ("ABI 1.0–1.4 — normal range; PAD unlikely.", .neutral) }
        if r >= 0.9 { return ("ABI 0.9–0.99 — borderline; reassess for symptoms; consider exercise testing.", .caution) }
        if r >= 0.5 { return ("ABI 0.5–0.89 — peripheral artery disease (PAD); refer to vascular medicine for risk-factor optimization and possible imaging.", .alert) }
        return ("ABI < 0.5 — severe PAD / critical limb ischemia. Urgent vascular consultation; risk of limb loss.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "ABI",
            subtitle: "Ankle-Brachial Index — peripheral artery disease"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Higher ankle SBP (DP or PT)", unit: "mmHg", value: $ankleSBP)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Higher arm SBP",              unit: "mmHg", value: $armSBP)
            }
            CalculatorResultDisplay(
                label: "ABI",
                value: result.map { String(format: "%.2f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "ABI = highest ankle SBP ÷ highest arm SBP\n(measured separately for right and left legs)",
                notes: "Use Doppler probe for the most accurate ankle pressures. Calculate ABI for each leg separately — report the lower of the two for diagnosis. ABI is a screening tool for PAD; a normal ABI does not rule out symptomatic claudication if exercise-only symptoms are present (consider exercise ABI).",
                citations: [abiAhaPad, openrnCardio4]
            )
        }
    }
}
