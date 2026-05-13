import SwiftUI

private let taylor2001Dic = CitationSource(
    id: "taylor_2001_dic",
    shortName: "DIC ISTH overt-DIC criteria — Taylor FB et al., Thromb Haemost 2001 (concept citation)",
    detail: "ISTH Scientific & Standardization Committee scoring algorithm for overt disseminated intravascular coagulation",
    publisher: "Thrombosis & Haemostasis",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/11816725/",
    lastRetrieved: "2026-05-04"
)

private let bendapudi2017Plasmic = CitationSource(
    id: "bendapudi_2017_plasmic",
    shortName: "PLASMIC — Bendapudi PK et al., Lancet Haematol 2017 (concept citation)",
    detail: "Validated 7-criterion bedside score for predicting severe ADAMTS13 deficiency (TTP)",
    publisher: "The Lancet Haematology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/28259520/",
    lastRetrieved: "2026-05-04"
)

private let openrnHeme3 = CitationSource(
    id: "openrn_heme_3",
    shortName: "Open RN Health Alterations — DIC, TTP, Microangiopathic Hemolysis",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=DIC+TTP+platelet",
    lastRetrieved: "2026-05-04"
)

// MARK: - DIC ISTH

public struct DICISTHCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "dic-isth", key: "platelets")  private var plateletsID
    @CalcPersistedOptionID(calculatorID: "dic-isth", key: "ddimer")     private var ddimerID
    @CalcPersistedOptionID(calculatorID: "dic-isth", key: "pt")         private var ptID
    @CalcPersistedOptionID(calculatorID: "dic-isth", key: "fibrinogen") private var fibrinogenID

    private var platelets:  CalculatorScoreRow.Option? { plateletsOpts.first  { $0.id == plateletsID } }
    private var ddimer:     CalculatorScoreRow.Option? { ddimerOpts.first     { $0.id == ddimerID } }
    private var pt:         CalculatorScoreRow.Option? { ptOpts.first         { $0.id == ptID } }
    private var fibrinogen: CalculatorScoreRow.Option? { fibrinogenOpts.first { $0.id == fibrinogenID } }

    private let plateletsOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "> 100 ×10⁹/L",      score: 0),
        .init(id: 1, label: "50–100 ×10⁹/L",     score: 1),
        .init(id: 2, label: "< 50 ×10⁹/L",       score: 2)
    ]
    private let ddimerOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No increase",                     score: 0),
        .init(id: 2, label: "Moderate increase",               score: 2),
        .init(id: 3, label: "Strong increase",                 score: 3)
    ]
    private let ptOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Prolongation < 3 sec",            score: 0),
        .init(id: 1, label: "Prolongation 3–6 sec",            score: 1),
        .init(id: 2, label: "Prolongation > 6 sec",            score: 2)
    ]
    private let fibrinogenOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 1.0 g/L",                       score: 0),
        .init(id: 1, label: "< 1.0 g/L",                       score: 1)
    ]

    private var total: Int? {
        guard let p = platelets, let d = ddimer, let pr = pt, let f = fibrinogen else { return nil }
        return p.score + d.score + pr.score + f.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 5 { return ("ISTH score ≥ 5 — meets the published criteria for OVERT DIC (Taylor 2001).", .alert) }
        return ("ISTH score < 5 — does not meet overt DIC criteria; consider trending the score serially in evolving consumptive coagulopathy.", .caution)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hematology.eyebrowName,
            title: "DIC ISTH",
            subtitle: "Overt DIC scoring · ISTH SSC"
        ) {
            CalculatorSection("LAB CRITERIA") {
                CalculatorScoreRow(label: "Platelet count",                    options: plateletsOpts, selection: $plateletsID.option(in: plateletsOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "D-dimer / FDP increase",            options: ddimerOpts,    selection: $ddimerID.option(in: ddimerOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Prolonged PT",                       options: ptOpts,        selection: $ptID.option(in: ptOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Fibrinogen",                         options: fibrinogenOpts, selection: $fibrinogenID.option(in: fibrinogenOpts))
            }
            CalculatorResultDisplay(
                label: "ISTH",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 4 weighted lab criteria. Range 0–8.\nOvert DIC = score ≥ 5.\nApply only when an underlying disorder known to be associated with DIC is present (sepsis, trauma, malignancy, obstetric complication, etc.).",
                notes: "DIC is a clinical-laboratory diagnosis — the ISTH score formalizes the laboratory pattern but does not replace recognition of the underlying trigger. Trend the score serially: a non-overt score that climbs over 24–48 hours is meaningful even before reaching the ≥ 5 cutoff.",
                citations: [taylor2001Dic, openrnHeme3]
            )
        }
    }
}

// MARK: - PLASMIC

public struct PLASMICCalculatorView: View {
    @CalcPersistedBool(calculatorID: "plasmic", key: "pltUnder30")     private var pltUnder30
    @CalcPersistedBool(calculatorID: "plasmic", key: "hemolysis")      private var hemolysis        // retics > 2.5% OR undetectable haptoglobin OR indirect bili > 2.0
    @CalcPersistedBool(calculatorID: "plasmic", key: "noActiveCancer") private var noActiveCancer
    @CalcPersistedBool(calculatorID: "plasmic", key: "noTransplant")   private var noTransplant     // no history of solid organ or stem cell transplant
    @CalcPersistedBool(calculatorID: "plasmic", key: "mcvUnder90")     private var mcvUnder90
    @CalcPersistedBool(calculatorID: "plasmic", key: "inrUnder15")     private var inrUnder15
    @CalcPersistedBool(calculatorID: "plasmic", key: "crUnder20")      private var crUnder20

    private var total: Int {
        [pltUnder30, hemolysis, noActiveCancer, noTransplant, mcvUnder90, inrUnder15, crUnder20].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total >= 6 { return ("PLASMIC 6–7 — high probability of severe ADAMTS13 deficiency (TTP); published PPV ≈ 72%, sensitivity ≈ 90% for ADAMTS13 < 10% in Bendapudi 2017 cohort.", .alert) }
        if total == 5 { return ("PLASMIC 5 — intermediate probability; ADAMTS13 testing supports the differential.", .caution) }
        return ("PLASMIC 0–4 — low probability of severe ADAMTS13 deficiency; consider alternative microangiopathic etiologies (atypical HUS, drug-induced, malignant hypertension, complement-mediated).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hematology.eyebrowName,
            title: "PLASMIC",
            subtitle: "TTP probability · ADAMTS13 deficiency"
        ) {
            CalculatorSection("CRITERIA") {
                Toggle("Platelet count < 30 ×10⁹/L",                                            isOn: $pltUnder30).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Combined hemolysis (retics > 2.5%, undetectable haptoglobin, OR indirect bili > 2.0)", isOn: $hemolysis).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("No active cancer",                                                       isOn: $noActiveCancer).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("No history of solid organ or stem-cell transplant",                      isOn: $noTransplant).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("MCV < 90 fL",                                                            isOn: $mcvUnder90).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("INR < 1.5",                                                              isOn: $inrUnder15).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Creatinine < 2.0 mg/dL",                                                 isOn: $crUnder20).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "PLASMIC",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 7 binary criteria. Range 0–7.\nLow: 0–4  ·  Intermediate: 5  ·  High: 6–7.",
                notes: "Use only in patients with suspected thrombotic microangiopathy (thrombocytopenia + microangiopathic hemolysis without alternative explanation). PLASMIC is a probability score for severe ADAMTS13 deficiency — confirmation requires ADAMTS13 activity testing. Helps prioritize patients for empiric plasma-exchange initiation while awaiting confirmatory results.",
                citations: [bendapudi2017Plasmic, openrnHeme3]
            )
        }
    }
}
