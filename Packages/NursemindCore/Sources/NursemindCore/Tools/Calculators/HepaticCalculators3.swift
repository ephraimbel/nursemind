import SwiftUI

// MARK: - Shared citation sources

private let maddrey1978 = CitationSource(
    id: "maddrey_1978",
    shortName: "Maddrey Discriminant Function — Maddrey WC et al., Gastroenterology 1978 (concept citation)",
    detail: "DF = 4.6 × (PT − control PT) + total bilirubin (mg/dL); DF ≥ 32 = severe alcoholic hepatitis",
    publisher: "Gastroenterology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/352788/",
    lastRetrieved: "2026-05-04"
)

private let louvet2007Lille = CitationSource(
    id: "louvet_2007_lille",
    shortName: "Lille Score — Louvet A et al., Hepatology 2007 (concept citation)",
    detail: "Predicts steroid response at day 7 in alcoholic hepatitis",
    publisher: "Hepatology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/17654743/",
    lastRetrieved: "2026-05-04"
)

private let rockall1996 = CitationSource(
    id: "rockall_1996",
    shortName: "Rockall Score — Rockall TA et al., Gut 1996 (concept citation)",
    detail: "Predicts mortality after upper GI bleeding",
    publisher: "Gut / British Society of Gastroenterology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/8675081/",
    lastRetrieved: "2026-05-04"
)

private let openrnHepatic3 = CitationSource(
    id: "openrn_hepatic_3",
    shortName: "Open RN Health Alterations — Hepatic Disorders chapter",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=hepatic+liver+gi+bleed",
    lastRetrieved: "2026-05-04"
)

// MARK: - Maddrey Discriminant Function

public struct MaddreyDFCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "maddrey", key: "pt") private var ptPatient
    @CalcPersistedDouble(calculatorID: "maddrey", key: "pt_control") private var ptControl
    @CalcPersistedDouble(calculatorID: "maddrey", key: "bili") private var bilirubin

    private var df: Double? {
        guard let pt = ptPatient, let control = ptControl, let bili = bilirubin else { return nil }
        return 4.6 * (pt - control) + bili
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let v = df else { return nil }
        if v >= 32 { return ("DF ≥ 32 — severe-alcoholic-hepatitis band per Maddrey 1978; published 30-day mortality 30–50% in untreated cohorts. The Lille Score is the published day-7 corticosteroid-response check used in this band.", .alert) }
        if v >= 20 { return ("DF 20–31 — moderate-severity band per Maddrey 1978; below the published DF ≥ 32 corticosteroid-eligibility threshold.", .caution) }
        return ("DF < 20 — mild alcoholic hepatitis. Supportive care; abstinence is the most important intervention.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "Maddrey DF",
            subtitle: "Discriminant Function for alcoholic hepatitis"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Patient PT",    unit: "seconds", value: $ptPatient)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Control PT",    unit: "seconds", value: $ptControl)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Total bilirubin", unit: "mg/dL", value: $bilirubin)
            }
            CalculatorResultDisplay(
                label: "Maddrey DF",
                value: df.map { String(format: "%.1f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "DF = 4.6 × (patient PT − control PT) + total bilirubin (mg/dL)",
                notes: "Threshold of 32 originally derived for steroid-treatment selection. Modern guidelines also use MELD ≥ 21 as an alternative threshold for steroids. Glasgow Alcoholic Hepatitis Score (GAHS) and ABIC are alternative tools. Steroid contraindications: active bleeding, infection, hepatorenal syndrome, severe hepatic encephalopathy.",
                citations: [maddrey1978, openrnHepatic3]
            )
        }
    }
}

// MARK: - Lille Score

public struct LilleScoreCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "lille", key: "age") private var age
    @CalcPersistedDouble(calculatorID: "lille", key: "alb") private var albumin
    @CalcPersistedDouble(calculatorID: "lille", key: "bili_d0") private var biliDay0
    @CalcPersistedDouble(calculatorID: "lille", key: "bili_d7") private var biliDay7
    @CalcPersistedDouble(calculatorID: "lille", key: "pt") private var prothrombin
    @CalcPersistedBool(calculatorID: "lille", key: "renal_insuf") private var renalInsufficiency

    private var rExp: Double? {
        guard let age, let albumin, let biliDay0, let biliDay7, let prothrombin else { return nil }
        let evolution = biliDay0 - biliDay7
        let renal: Double = renalInsufficiency ? 1 : 0
        let r = 3.19
            - 0.101 * age
            - 0.147 * albumin
            + 0.0165 * evolution
            - 0.206 * renal
            - 0.0065 * biliDay0
            - 0.0096 * prothrombin
        return r
    }

    private var lille: Double? {
        guard let r = rExp else { return nil }
        let expNegR = exp(-r)
        return expNegR / (1.0 + expNegR)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = lille else { return nil }
        if l >= 0.45 { return ("Lille ≥ 0.45 — non-responder band per Louvet 2007; published 6-month survival ≈ 25% on continued steroids.", .alert) }
        return ("Lille < 0.45 — responder band per Louvet 2007; published 6-month survival ≈ 85% on a continued 28-day steroid course.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "Lille Score",
            subtitle: "Steroid response in alcoholic hepatitis (day 7)"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Age",                   unit: "years",  value: $age)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Albumin (day 0)",       unit: "g/L",    value: $albumin)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Bilirubin day 0",       unit: "μmol/L", value: $biliDay0)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Bilirubin day 7",       unit: "μmol/L", value: $biliDay7)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Prothrombin time",      unit: "seconds", value: $prothrombin)
                Hairline(color: NMColor.borderSubtle)
                Toggle(isOn: $renalInsufficiency) {
                    Text("Renal insufficiency (Cr > 1.3 mg/dL)")
                        .font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary).lineLimit(2)
                }
                .toggleStyle(.switch)
                .padding(.vertical, NMSpace.base)
            }
            CalculatorResultDisplay(
                label: "Lille Score",
                value: lille.map { String(format: "%.2f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "R = 3.19 − 0.101·age − 0.147·alb − 0.0165·(bili₀ − bili₇) − 0.206·renal − 0.0065·bili₀ − 0.0096·PT\nLille = exp(−R) ÷ (1 + exp(−R))\n(albumin in g/L, bilirubin in μmol/L, PT in seconds)",
                notes: "Compute on DAY 7 of corticosteroid therapy in severe alcoholic hepatitis (Maddrey DF ≥ 32). Cut-off 0.45 stratifies steroid responders vs. non-responders. Unit conversions: albumin g/L = g/dL × 10; bilirubin μmol/L = mg/dL × 17.1.",
                citations: [louvet2007Lille, openrnHepatic3]
            )
        }
    }
}

// MARK: - Rockall Score

public struct RockallScoreCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "rockall", key: "ageGroup")       private var ageGroupID
    @CalcPersistedOptionID(calculatorID: "rockall", key: "shockGroup")     private var shockGroupID
    @CalcPersistedOptionID(calculatorID: "rockall", key: "comorbidGroup")  private var comorbidGroupID
    @CalcPersistedOptionID(calculatorID: "rockall", key: "diagnosisGroup") private var diagnosisGroupID
    @CalcPersistedOptionID(calculatorID: "rockall", key: "stigmataGroup")  private var stigmataGroupID

    private var ageGroup:       CalculatorScoreRow.Option? { ageOptions.first       { $0.id == ageGroupID } }
    private var shockGroup:     CalculatorScoreRow.Option? { shockOptions.first     { $0.id == shockGroupID } }
    private var comorbidGroup:  CalculatorScoreRow.Option? { comorbidOptions.first  { $0.id == comorbidGroupID } }
    private var diagnosisGroup: CalculatorScoreRow.Option? { diagnosisOptions.first { $0.id == diagnosisGroupID } }
    private var stigmataGroup:  CalculatorScoreRow.Option? { stigmataOptions.first  { $0.id == stigmataGroupID } }

    private let ageOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 60",      score: 0),
        .init(id: 1, label: "60–79",     score: 1),
        .init(id: 2, label: "≥ 80",      score: 2)
    ]
    private let shockOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No shock (HR < 100, SBP ≥ 100)",        score: 0),
        .init(id: 1, label: "Tachycardia (HR ≥ 100, SBP ≥ 100)",     score: 1),
        .init(id: 2, label: "Hypotension (SBP < 100)",               score: 2)
    ]
    private let comorbidOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "None",                                            score: 0),
        .init(id: 1, label: "CHF, IHD, or other major comorbidity",            score: 2),
        .init(id: 2, label: "Renal failure, liver failure, or metastatic CA",  score: 3)
    ]
    private let diagnosisOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Mallory-Weiss tear / no lesion / no stigmata",    score: 0),
        .init(id: 1, label: "All other diagnoses",                             score: 1),
        .init(id: 2, label: "Malignancy of upper GI tract",                    score: 2)
    ]
    private let stigmataOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "None / dark spot only",                                  score: 0),
        .init(id: 1, label: "Blood in upper GI tract / adherent clot / spurter / vessel", score: 2)
    ]

    private var total: Int? {
        let parts = [ageGroup, shockGroup, comorbidGroup, diagnosisGroup, stigmataGroup]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 8 { return ("Rockall ≥ 8 — published mortality ≈ 41% (Rockall 1996 derivation cohort).", .alert) }
        if s >= 5 { return ("Rockall 5–7 — published mortality ≈ 11–25%.", .alert) }
        if s >= 3 { return ("Rockall 3–4 — published mortality ≈ 5–10%.", .caution) }
        return ("Rockall 0–2 — published mortality < 5%.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "Rockall Score",
            subtitle: "Post-endoscopy upper GI bleed mortality"
        ) {
            CalculatorSection("PRE-ENDOSCOPY") {
                CalculatorScoreRow(label: "Age",          options: ageOptions,      selection: $ageGroupID.option(in: ageOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Shock",        options: shockOptions,    selection: $shockGroupID.option(in: shockOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Comorbidity",  options: comorbidOptions, selection: $comorbidGroupID.option(in: comorbidOptions))
            }
            CalculatorSection("POST-ENDOSCOPY") {
                CalculatorScoreRow(label: "Diagnosis",                     options: diagnosisOptions, selection: $diagnosisGroupID.option(in: diagnosisOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Stigmata of recent hemorrhage", options: stigmataOptions,  selection: $stigmataGroupID.option(in: stigmataOptions))
            }
            CalculatorResultDisplay(
                label: "Rockall",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 weighted variables. Range 0–11.\nPre-endoscopy alone: range 0–7 (used to identify low-risk discharge candidates).",
                notes: "Pair with Glasgow-Blatchford (better at predicting need for intervention) for a complete UGI-bleed risk picture. Pre-endoscopy Rockall < 1 supports early discharge in selected patients.",
                citations: [rockall1996, openrnHepatic3]
            )
        }
    }
}
