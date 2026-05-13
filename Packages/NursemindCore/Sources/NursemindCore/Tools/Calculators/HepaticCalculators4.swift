import SwiftUI

// MARK: - Shared citation sources

private let pugh1973 = CitationSource(
    id: "pugh_1973_child_pugh",
    shortName: "Child-Pugh — Pugh RN et al., Br J Surg 1973 (concept citation)",
    detail: "Surgical risk stratification in cirrhosis using 5 weighted clinical/lab variables",
    publisher: "British Journal of Surgery",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/4541913/",
    lastRetrieved: "2026-05-04"
)

private let sterling2006Fib4 = CitationSource(
    id: "sterling_2006_fib4",
    shortName: "FIB-4 — Sterling RK et al., Hepatology 2006 (concept citation)",
    detail: "Non-invasive marker of hepatic fibrosis, originally developed in HCV/HIV co-infection",
    publisher: "Hepatology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/16729309/",
    lastRetrieved: "2026-05-04"
)

private let mcPherson2010Fib4 = CitationSource(
    id: "mcpherson_2010_fib4_nafld",
    shortName: "FIB-4 in NAFLD — McPherson S et al., Gut 2010 (concept citation)",
    detail: "Validated FIB-4 cutoffs (<1.30 / >2.67) for ruling out and identifying advanced NAFLD fibrosis",
    publisher: "Gut",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/20627992/",
    lastRetrieved: "2026-05-04"
)

private let wai2003Apri = CitationSource(
    id: "wai_2003_apri",
    shortName: "APRI — Wai CT et al., Hepatology 2003 (concept citation)",
    detail: "AST-to-Platelet Ratio Index for predicting significant fibrosis and cirrhosis in HCV",
    publisher: "Hepatology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/12883497/",
    lastRetrieved: "2026-05-04"
)

private let openrnHepatic4 = CitationSource(
    id: "openrn_hepatic_4",
    shortName: "Open RN Health Alterations — Liver Function Tests & Cirrhosis",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cirrhosis+liver+function",
    lastRetrieved: "2026-05-04"
)

// MARK: - Child-Pugh

public struct ChildPughCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "child-pugh", key: "enceph")  private var encephID
    @CalcPersistedOptionID(calculatorID: "child-pugh", key: "ascites") private var ascitesID
    @CalcPersistedOptionID(calculatorID: "child-pugh", key: "bili")    private var biliID
    @CalcPersistedOptionID(calculatorID: "child-pugh", key: "albumin") private var albuminID
    @CalcPersistedOptionID(calculatorID: "child-pugh", key: "inr")     private var inrID

    private var enceph:  CalculatorScoreRow.Option? { encephOptions.first  { $0.id == encephID } }
    private var ascites: CalculatorScoreRow.Option? { ascitesOptions.first { $0.id == ascitesID } }
    private var bili:    CalculatorScoreRow.Option? { biliOptions.first    { $0.id == biliID } }
    private var albumin: CalculatorScoreRow.Option? { albuminOptions.first { $0.id == albuminID } }
    private var inr:     CalculatorScoreRow.Option? { inrOptions.first     { $0.id == inrID } }

    private let encephOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "None",                      score: 1),
        .init(id: 2, label: "Grade 1–2 (or suppressed)", score: 2),
        .init(id: 3, label: "Grade 3–4 (or refractory)", score: 3)
    ]
    private let ascitesOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "None",                       score: 1),
        .init(id: 2, label: "Mild / diuretic-responsive", score: 2),
        .init(id: 3, label: "Moderate–severe / refractory", score: 3)
    ]
    private let biliOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "< 2 mg/dL",   score: 1),
        .init(id: 2, label: "2–3 mg/dL",   score: 2),
        .init(id: 3, label: "> 3 mg/dL",   score: 3)
    ]
    private let albuminOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "> 3.5 g/dL",     score: 1),
        .init(id: 2, label: "2.8–3.5 g/dL",   score: 2),
        .init(id: 3, label: "< 2.8 g/dL",     score: 3)
    ]
    private let inrOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "< 1.7",      score: 1),
        .init(id: 2, label: "1.7–2.3",    score: 2),
        .init(id: 3, label: "> 2.3",      score: 3)
    ]

    private var total: Int? {
        guard let a = enceph, let b = ascites, let c = bili, let d = albumin, let e = inr else { return nil }
        return a.score + b.score + c.score + d.score + e.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 10 { return ("Class C (10–15) — published 1-year survival ≈ 45%, 2-year ≈ 35%. Most severe decompensation per Pugh 1973.", .alert) }
        if s >= 7  { return ("Class B (7–9) — published 1-year survival ≈ 80%, 2-year ≈ 60%. Moderate hepatic decompensation.", .caution) }
        return ("Class A (5–6) — published 1-year survival ≈ 100%, 2-year ≈ 85%. Compensated cirrhosis.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "Child-Pugh",
            subtitle: "Cirrhosis severity · 1- and 2-year survival"
        ) {
            CalculatorSection("CRITERIA") {
                CalculatorScoreRow(label: "Encephalopathy", options: encephOptions,  selection: $encephID.option(in: encephOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Ascites",        options: ascitesOptions, selection: $ascitesID.option(in: ascitesOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Bilirubin",      options: biliOptions,    selection: $biliID.option(in: biliOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Albumin",        options: albuminOptions, selection: $albuminID.option(in: albuminOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "INR",            options: inrOptions,     selection: $inrID.option(in: inrOptions))
            }
            CalculatorResultDisplay(
                label: "Child-Pugh",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 categorical variables (each 1–3 points). Range 5–15.\nClass A: 5–6  ·  Class B: 7–9  ·  Class C: 10–15.",
                notes: "Bilirubin cutoffs differ in primary biliary cholangitis (1, 1–4, > 4 mg/dL). MELD-Na has largely replaced Child-Pugh for OPTN transplant allocation but Child-Pugh remains the reference for surgical-risk stratification (variceal hemorrhage, TIPS candidacy, peri-operative mortality).",
                citations: [pugh1973, openrnHepatic4]
            )
        }
    }
}

// MARK: - FIB-4

public struct FIB4CalculatorView: View {
    @CalcPersistedDouble(calculatorID: "fib4", key: "age")       private var age
    @CalcPersistedDouble(calculatorID: "fib4", key: "ast")       private var ast
    @CalcPersistedDouble(calculatorID: "fib4", key: "platelets") private var platelets
    @CalcPersistedDouble(calculatorID: "fib4", key: "alt")       private var alt

    private var fib4: Double? {
        guard let a = age, let s = ast, let p = platelets, let l = alt,
              p > 0, l > 0 else { return nil }
        return (a * s) / (p * sqrt(l))
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let v = fib4 else { return nil }
        if v >= 3.25 {
            return ("FIB-4 ≥ 3.25 — high likelihood of advanced (F3–F4) fibrosis (Sterling 2006 PPV ≈ 65% in HCV/HIV; McPherson 2010 PPV ≈ 80% in NAFLD).", .alert)
        }
        if v >= 1.45 {
            return ("FIB-4 1.45–3.25 — indeterminate; original cutoff cannot reliably rule in or rule out advanced fibrosis. NAFLD-specific upper cutoff is 2.67 (McPherson 2010).", .caution)
        }
        return ("FIB-4 < 1.45 — advanced fibrosis unlikely (Sterling 2006 NPV ≈ 90%). NAFLD-specific lower cutoff is 1.30 (McPherson 2010).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "FIB-4",
            subtitle: "Non-invasive hepatic fibrosis index"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Age",        unit: "years",  value: $age)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "AST",        unit: "U/L",    value: $ast)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Platelets",  unit: "×10⁹/L", value: $platelets)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "ALT",        unit: "U/L",    value: $alt)
            }
            CalculatorResultDisplay(
                label: "FIB-4",
                value: fib4.map { String(format: "%.2f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "FIB-4 = (Age × AST) / (Platelets × √ALT)\nUnits: age years, AST/ALT U/L, platelets ×10⁹/L.\nCutoffs (general): < 1.45 advanced fibrosis unlikely · ≥ 3.25 advanced fibrosis likely.\nNAFLD-specific cutoffs: < 1.30 / ≥ 2.67.",
                notes: "Performance is best in middle-aged adults; both cutoffs lose sensitivity in patients > 65 (consider age-adjusted upper cutoff ≥ 2.0 in elderly per AASLD 2023). FIB-4 is a screen, not a diagnosis — confirm advanced fibrosis with elastography or biopsy when indicated.",
                citations: [sterling2006Fib4, mcPherson2010Fib4, openrnHepatic4]
            )
        }
    }
}

// MARK: - APRI

public struct APRICalculatorView: View {
    @CalcPersistedDouble(calculatorID: "apri", key: "ast")        private var ast
    @CalcPersistedDouble(calculatorID: "apri", key: "ast_uln")    private var astULN
    @CalcPersistedDouble(calculatorID: "apri", key: "platelets")  private var platelets

    private var apri: Double? {
        guard let s = ast, let u = astULN, let p = platelets, u > 0, p > 0 else { return nil }
        return ((s / u) / p) * 100.0
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let v = apri else { return nil }
        if v > 2.0  { return ("APRI > 2.0 — cirrhosis likely (Wai 2003 PPV ≈ 65% in HCV).", .alert) }
        if v > 1.5  { return ("APRI > 1.5 — significant fibrosis (≥ F2) likely.", .caution) }
        if v >= 0.5 { return ("APRI 0.5–1.5 — indeterminate; cannot reliably rule fibrosis in or out.", .caution) }
        return ("APRI < 0.5 — significant fibrosis unlikely (Wai 2003 NPV ≈ 86% in HCV).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "APRI",
            subtitle: "AST-to-Platelet Ratio Index"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "AST",                   unit: "U/L",    value: $ast)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "AST upper-limit normal", unit: "U/L",    value: $astULN)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Platelets",             unit: "×10⁹/L", value: $platelets)
            }
            CalculatorResultDisplay(
                label: "APRI",
                value: apri.map { String(format: "%.2f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "APRI = (AST / AST_ULN) / Platelets × 100\nUnits: AST U/L, ULN U/L, platelets ×10⁹/L.\nCutoffs (HCV-derived): < 0.5 fibrosis unlikely · > 1.5 significant fibrosis · > 2.0 cirrhosis likely.",
                notes: "Originally derived in HCV; performance varies in NAFLD/HBV. WHO endorses APRI for low-resource HCV/HBV staging when elastography is unavailable. Pair with FIB-4 — concordant low values give the strongest rule-out.",
                citations: [wai2003Apri, openrnHepatic4]
            )
        }
    }
}
