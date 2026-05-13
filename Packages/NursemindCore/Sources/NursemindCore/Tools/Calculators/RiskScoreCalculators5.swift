import SwiftUI

// MARK: - Shared citation sources

private let ely2001CamIcu = CitationSource(
    id: "ely_2001_cam_icu",
    shortName: "CAM-ICU — Ely EW et al., JAMA 2001 (concept citation)",
    detail: "Adaptation of the Confusion Assessment Method for non-verbal mechanically ventilated ICU patients",
    publisher: "JAMA",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/11730446/",
    lastRetrieved: "2026-05-04"
)

private let chung2008StopBang = CitationSource(
    id: "chung_2008_stop_bang",
    shortName: "STOP-BANG — Chung F et al., Anesthesiology 2008 (concept citation)",
    detail: "8-item screen for obstructive sleep apnea developed for the surgical population",
    publisher: "Anesthesiology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/18431116/",
    lastRetrieved: "2026-05-04"
)

private let chung2016StopBangMeta = CitationSource(
    id: "chung_2016_stop_bang_meta",
    shortName: "STOP-BANG meta-analysis — Chung F et al., Br J Anaesth 2016 (concept citation)",
    detail: "Pooled diagnostic-accuracy data: ≥ 3 sensitivity ≈ 93% for any OSA, ≥ 5 specificity ≈ 75% for moderate-severe OSA",
    publisher: "British Journal of Anaesthesia",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/26873641/",
    lastRetrieved: "2026-05-04"
)

private let rockwood2005Cfs = CitationSource(
    id: "rockwood_2005_cfs",
    shortName: "Clinical Frailty Scale — Rockwood K et al., CMAJ 2005 (concept citation)",
    detail: "9-level visual judgement scale for global fitness/frailty in older adults",
    publisher: "Canadian Medical Association Journal",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/16129869/",
    lastRetrieved: "2026-05-04"
)

private let openrnRisk5 = CitationSource(
    id: "openrn_risk_5",
    shortName: "Open RN Health Alterations & Mental Health — Risk Assessment",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=delirium+frailty+sleep+apnea",
    lastRetrieved: "2026-05-04"
)

// MARK: - CAM-ICU

public struct CAMICUCalculatorView: View {
    @CalcPersistedBool(calculatorID: "cam-icu", key: "feature1") private var feature1   // acute change / fluctuating
    @CalcPersistedBool(calculatorID: "cam-icu", key: "feature2") private var feature2   // inattention
    @CalcPersistedBool(calculatorID: "cam-icu", key: "feature3") private var feature3   // altered LOC (RASS ≠ 0)
    @CalcPersistedBool(calculatorID: "cam-icu", key: "feature4") private var feature4   // disorganized thinking

    private var positive: Bool? {
        // CAM-ICU+ requires Feature 1 AND Feature 2 AND (Feature 3 OR Feature 4)
        guard feature1 || feature2 || feature3 || feature4 else { return nil }
        return feature1 && feature2 && (feature3 || feature4)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let p = positive else { return nil }
        return p
            ? ("CAM-ICU positive — meets validated criteria for ICU delirium (Ely 2001 sensitivity ≈ 93–100%, specificity ≈ 89–100% versus DSM reference standard).", .alert)
            : ("CAM-ICU negative — does not meet criteria at this assessment. Re-screen at least once per shift; delirium can be intermittent.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "CAM-ICU",
            subtitle: "ICU delirium · validated for non-verbal patients"
        ) {
            CalculatorSection("FEATURES") {
                Toggle("1 · Acute change OR fluctuating mental status from baseline", isOn: $feature1).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("2 · Inattention (≥ 2 errors on Letters Attention Test 'A')", isOn: $feature2).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("3 · Altered level of consciousness (RASS ≠ 0)", isOn: $feature3).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("4 · Disorganized thinking (≥ 2 errors on 4 yes/no Qs + commands)", isOn: $feature4).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "CAM-ICU",
                value: positive.map { $0 ? "POSITIVE" : "NEGATIVE" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "CAM-ICU positive = Feature 1 AND Feature 2 AND (Feature 3 OR Feature 4)\n(Patient must be arousable — RASS ≥ −3 — to be assessable.)",
                notes: "Score is undefined when the patient is too deeply sedated to engage (RASS −4 or −5). Originally validated by Ely et al. for mechanically ventilated adults; widely used across ICU populations. Pair with RASS at every assessment.",
                citations: [ely2001CamIcu, openrnRisk5]
            )
        }
    }
}

// MARK: - STOP-BANG

public struct STOPBANGCalculatorView: View {
    @CalcPersistedBool(calculatorID: "stop-bang", key: "snore")    private var snore
    @CalcPersistedBool(calculatorID: "stop-bang", key: "tired")    private var tired
    @CalcPersistedBool(calculatorID: "stop-bang", key: "observed") private var observed
    @CalcPersistedBool(calculatorID: "stop-bang", key: "pressure") private var pressure
    @CalcPersistedBool(calculatorID: "stop-bang", key: "bmi")      private var bmi
    @CalcPersistedBool(calculatorID: "stop-bang", key: "age50")    private var age50
    @CalcPersistedBool(calculatorID: "stop-bang", key: "neck")     private var neck
    @CalcPersistedBool(calculatorID: "stop-bang", key: "male")     private var male

    private var total: Int {
        [snore, tired, observed, pressure, bmi, age50, neck, male].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        switch total {
        case 5...:
            return ("STOP-BANG 5–8 — high probability of moderate-to-severe OSA (Chung 2016 specificity for moderate-severe OSA ≈ 75% at this cutoff).", .alert)
        case 3...4:
            return ("STOP-BANG 3–4 — intermediate risk for OSA. Consider sleep referral, especially if patient has scored on STOP items (snore, tired, observed apnea, BP).", .caution)
        default:
            return ("STOP-BANG 0–2 — low risk for OSA (Chung 2016 sensitivity for any OSA ≈ 93% at cutoff ≥ 3).", .neutral)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "STOP-BANG",
            subtitle: "Obstructive sleep apnea screen"
        ) {
            CalculatorSection("S · T · O · P") {
                Toggle("Snore loudly (audible through closed door)", isOn: $snore).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Tired / fatigued / sleepy during the day",   isOn: $tired).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Observed stop-breathing or choking in sleep", isOn: $observed).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Blood pressure ≥ 140/90 OR treated for HTN",  isOn: $pressure).toggleStyle(.switch)
            }
            CalculatorSection("B · A · N · G") {
                Toggle("BMI > 35 kg/m²",                              isOn: $bmi).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Age > 50 years",                              isOn: $age50).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Neck circumference > 40 cm (15.7 in)",        isOn: $neck).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Male sex",                                    isOn: $male).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "STOP-BANG",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 8 binary items. Range 0–8.\nLow: 0–2  ·  Intermediate: 3–4  ·  High: 5–8.",
                notes: "Originally validated as a pre-operative screen but widely used across populations. Cutoffs are weighted: an alternative 'modified' algorithm gives extra weight to BMI > 35, neck > 40, and male sex. Does not diagnose OSA — polysomnography or home sleep study confirms.",
                citations: [chung2008StopBang, chung2016StopBangMeta, openrnRisk5]
            )
        }
    }
}

// MARK: - Clinical Frailty Scale

public struct ClinicalFrailtyCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "cfs", key: "level") private var levelID
    private var level: CalculatorScoreRow.Option? { levelOptions.first { $0.id == levelID } }

    private let levelOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "1 · Very fit",                                     score: 1),
        .init(id: 2, label: "2 · Well",                                         score: 2),
        .init(id: 3, label: "3 · Managing well",                                score: 3),
        .init(id: 4, label: "4 · Living with very mild frailty (vulnerable)",   score: 4),
        .init(id: 5, label: "5 · Living with mild frailty",                     score: 5),
        .init(id: 6, label: "6 · Living with moderate frailty",                 score: 6),
        .init(id: 7, label: "7 · Living with severe frailty",                   score: 7),
        .init(id: 8, label: "8 · Living with very severe frailty",              score: 8),
        .init(id: 9, label: "9 · Terminally ill",                               score: 9)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = level else { return nil }
        switch l.score {
        case 1...3:  return ("CFS 1–3 — robust to managing well. Reference baseline for older adults.", .neutral)
        case 4:      return ("CFS 4 — vulnerable. Symptoms have started limiting daily activities.", .caution)
        case 5...6:  return ("CFS 5–6 — mild-to-moderate frailty. Higher post-operative complication risk per published surgical-outcome cohorts.", .caution)
        case 7...8:  return ("CFS 7–8 — severe-to-very-severe frailty. Substantially higher mortality risk in hospitalized older adults per Rockwood 2005 derivation cohort.", .alert)
        default:     return ("CFS 9 — terminal illness with life expectancy < 6 months.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Clinical Frailty Scale",
            subtitle: "Rockwood 9-level global frailty"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Level", options: levelOptions, selection: $levelID.option(in: levelOptions))
            }
            CalculatorResultDisplay(
                label: "CFS",
                value: level.map { "\($0.score)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single-item visual judgement scale; 1 (very fit) → 9 (terminally ill).\nScore reflects the patient's status approximately 2 weeks before acute illness, not at the moment of admission.",
                notes: "Designed for adults ≥ 65 living with chronic disease. Not validated in young adults or patients with stable single-system disability (e.g., spinal cord injury). Widely used in ICU, peri-operative, and geriatric medicine for prognosis and shared decision-making.",
                citations: [rockwood2005Cfs, openrnRisk5]
            )
        }
    }
}
