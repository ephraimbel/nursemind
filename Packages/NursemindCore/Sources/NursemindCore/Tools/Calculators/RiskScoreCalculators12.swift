import SwiftUI

// MARK: - Citations

private let pasero2009Poss = CitationSource(
    id: "pasero_2009_poss",
    shortName: "POSS — Pasero C, J PeriAnesth Nurs 2009 (concept citation)",
    detail: "Pasero Opioid-induced Sedation Scale — bedside opioid-related sedation grading",
    publisher: "Journal of PeriAnesthesia Nursing",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/19732698/",
    lastRetrieved: "2026-05-06"
)

private let lewis1997Bristol = CitationSource(
    id: "lewis_1997_bristol",
    shortName: "Bristol Stool Scale — Lewis SJ, Heaton KW, Scand J Gastroenterol 1997 (concept citation)",
    detail: "7-type visual stool-form scale; correlates with intestinal transit time",
    publisher: "Scandinavian Journal of Gastroenterology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/9299672/",
    lastRetrieved: "2026-05-06"
)

private let naegele1812 = CitationSource(
    id: "naegele_1812",
    shortName: "Naegele's Rule — Naegele FK, 1812 (concept citation)",
    detail: "Estimated date of delivery: LMP + 7 days − 3 months + 1 year",
    publisher: "Naegele's Lehrbuch der Geburtshilfe (historical)",
    license: .factCitationOnly,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK430685/",
    lastRetrieved: "2026-05-06"
)

private let ballard1991 = CitationSource(
    id: "ballard_1991_new_ballard",
    shortName: "New Ballard Score — Ballard JL et al., J Pediatr 1991 (concept citation)",
    detail: "12-item neuromuscular + physical maturity scale for newborn gestational-age estimation",
    publisher: "Journal of Pediatrics",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/1880657/",
    lastRetrieved: "2026-05-06"
)

private let bhutani1999 = CitationSource(
    id: "bhutani_1999",
    shortName: "Bhutani Nomogram — Bhutani VK et al., Pediatrics 1999 (concept citation)",
    detail: "Hour-specific total serum bilirubin nomogram predicting subsequent significant hyperbilirubinemia in well newborns ≥ 36 weeks",
    publisher: "Pediatrics",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/9917448/",
    lastRetrieved: "2026-05-06"
)

private let stotts2001Push = CitationSource(
    id: "stotts_2001_push",
    shortName: "PUSH Tool — Stotts NA et al. (NPUAP), J Gerontol 2001 (concept citation)",
    detail: "3-component pressure-ulcer healing assessment from the National Pressure Ulcer Advisory Panel",
    publisher: "Journals of Gerontology / NPUAP",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/11730245/",
    lastRetrieved: "2026-05-06"
)

private let bruera1991Esas = CitationSource(
    id: "bruera_1991_esas",
    shortName: "ESAS — Bruera E et al., J Palliat Care 1991 (concept citation); Watanabe 2011 revision",
    detail: "Edmonton Symptom Assessment System — 9 self-rated symptoms in palliative care",
    publisher: "Journal of Palliative Care",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/1714502/",
    lastRetrieved: "2026-05-06"
)

private let tinetti1986 = CitationSource(
    id: "tinetti_1986",
    shortName: "Tinetti POMA — Tinetti ME, J Am Geriatr Soc 1986 (concept citation)",
    detail: "Performance Oriented Mobility Assessment — 17-item balance + gait assessment for falls risk",
    publisher: "Journal of the American Geriatrics Society",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/3944402/",
    lastRetrieved: "2026-05-06"
)

private let openrnRisk12 = CitationSource(
    id: "openrn_risk_12",
    shortName: "Open RN Health Alterations & Mental Health — Opioids / Bowel / Wound / Newborn / Palliative / Falls",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=opioid+wound+newborn+palliative+falls",
    lastRetrieved: "2026-05-06"
)

// MARK: - POSS

public struct POSSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "poss", key: "level") private var levelID
    private var level: CalculatorScoreRow.Option? { levelOptions.first { $0.id == levelID } }

    private let levelOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "S — Sleep, easy to arouse",                                                              score: 0),
        .init(id: 1, label: "1 — Awake and alert",                                                                    score: 1),
        .init(id: 2, label: "2 — Slightly drowsy, easily aroused",                                                    score: 2),
        .init(id: 3, label: "3 — Frequently drowsy, arousable, drifts off to sleep during conversation",              score: 3),
        .init(id: 4, label: "4 — Somnolent, minimal or no response to verbal and physical stimulation",               score: 4)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = level else { return nil }
        switch l.score {
        case 0...2: return ("POSS S–2 — published acceptable-sedation band per Pasero 2009; opioid-related sedation within expected range.", .neutral)
        case 3:     return ("POSS 3 — published unacceptable-sedation band; the standard threshold for monitoring escalation in opioid-related sedation literature.", .alert)
        default:    return ("POSS 4 — published critical-sedation band; the standard threshold for opioid hold and naloxone-readiness consideration in published guidelines.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "POSS",
            subtitle: "Pasero Opioid-induced Sedation Scale"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Sedation level", options: levelOptions, selection: $levelID.option(in: levelOptions))
            }
            CalculatorResultDisplay(
                label: "POSS",
                value: level.map { $0.score == 0 ? "S" : "\($0.score)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 5-level scale: S (sleep, arousable) → 4 (somnolent, minimal/no response).\nAcceptable: S, 1, 2  ·  Unacceptable: 3, 4.",
                notes: "POSS is the de facto US bedside opioid-sedation scale, endorsed by ASPMN. Assessed at peak opioid effect. Pair with respiratory rate, SpO₂, and EtCO₂ when available — published opioid-induced respiratory depression guidance emphasizes that sedation precedes respiratory depression.",
                citations: [pasero2009Poss, openrnRisk12]
            )
        }
    }
}

// MARK: - Bristol Stool Scale

public struct BristolStoolCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "bristol", key: "type") private var typeID
    private var type: CalculatorScoreRow.Option? { typeOptions.first { $0.id == typeID } }

    private let typeOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "Type 1 — Separate hard lumps (like nuts)",                  score: 1),
        .init(id: 2, label: "Type 2 — Lumpy and sausage-like",                            score: 2),
        .init(id: 3, label: "Type 3 — Sausage-shape with cracks on the surface",          score: 3),
        .init(id: 4, label: "Type 4 — Smooth, soft sausage or snake",                     score: 4),
        .init(id: 5, label: "Type 5 — Soft blobs with clear-cut edges",                   score: 5),
        .init(id: 6, label: "Type 6 — Mushy consistency with ragged edges",               score: 6),
        .init(id: 7, label: "Type 7 — Liquid consistency with no solid pieces",           score: 7)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let t = type else { return nil }
        switch t.score {
        case 1...2: return ("Type 1–2 — published constipation-associated band per Lewis 1997; correlates with prolonged transit time.", .alert)
        case 3...4: return ("Type 3–4 — published 'normal' stool form band.", .neutral)
        case 5:     return ("Type 5 — soft-stool band; lacking fiber per Lewis 1997.", .caution)
        default:    return ("Type 6–7 — published diarrhea-associated band; correlates with rapid transit.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Bristol Stool",
            subtitle: "Stool form · transit-time correlate"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Stool type", options: typeOptions, selection: $typeID.option(in: typeOptions))
            }
            CalculatorResultDisplay(
                label: "Bristol",
                value: type.map { "Type \($0.score)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 7-type categorical visual scale.\nTypes 1–2 → constipation band  ·  3–4 → normal  ·  6–7 → diarrhea band.",
                notes: "Used widely across inpatient and long-term-care settings to standardize bowel-movement documentation. Type 4 is generally considered the optimal stool form. Track changes over time rather than the single value.",
                citations: [lewis1997Bristol, openrnRisk12]
            )
        }
    }
}

// MARK: - Naegele's Rule

public struct NaegeleCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "naegele", key: "lmpInterval") private var lmpInterval

    private var lmpDate: Date? {
        guard let v = lmpInterval else { return nil }
        return Date(timeIntervalSince1970: v)
    }

    private var edd: Date? {
        guard let lmp = lmpDate else { return nil }
        var c = DateComponents()
        c.day = 7
        c.month = -3
        c.year = 1
        return Calendar.current.date(byAdding: c, to: lmp)
    }

    private var gestationalAge: (weeks: Int, days: Int)? {
        guard let lmp = lmpDate else { return nil }
        let days = Calendar.current.dateComponents([.day], from: lmp, to: Date()).day ?? 0
        guard days >= 0 else { return nil }
        return (days / 7, days % 7)
    }

    private var lmpDateBinding: Binding<Date> {
        Binding(
            get: { self.lmpDate ?? Date() },
            set: { self.lmpInterval = $0.timeIntervalSince1970 }
        )
    }

    private var formatter: DateFormatter {
        let f = DateFormatter()
        f.dateStyle = .medium
        return f
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let ga = gestationalAge else { return nil }
        let weeks = ga.weeks
        if weeks >= 42 { return ("Gestational age ≥ 42 weeks — post-term band per published obstetric definitions.", .alert) }
        if weeks >= 39 { return ("Gestational age 39–41 weeks — full-term band per ACOG.", .neutral) }
        if weeks >= 37 { return ("Gestational age 37–38 weeks — early-term band per ACOG.", .neutral) }
        if weeks >= 34 { return ("Gestational age 34–36 weeks — late-preterm band.", .caution) }
        if weeks >= 32 { return ("Gestational age 32–33 weeks — moderate-preterm band.", .caution) }
        if weeks >= 28 { return ("Gestational age 28–31 weeks — very-preterm band.", .alert) }
        return ("Gestational age < 28 weeks — extremely-preterm band.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Naegele's Rule",
            subtitle: "Estimated due date from LMP"
        ) {
            CalculatorSection("LAST MENSTRUAL PERIOD") {
                HStack {
                    Text("LMP date").font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary)
                    Spacer()
                    DatePicker("", selection: lmpDateBinding, in: ...Date(), displayedComponents: .date)
                        .labelsHidden()
                }
                .padding(.vertical, NMSpace.base)
                if lmpInterval != nil {
                    Hairline(color: NMColor.borderSubtle)
                    Button {
                        lmpInterval = nil
                    } label: {
                        Text("Clear date")
                            .font(NMFont.bodySM)
                            .foregroundStyle(NMColor.textTertiary)
                    }
                    .padding(.vertical, NMSpace.base)
                }
            }
            CalculatorResultDisplay(
                label: "EDD",
                value: edd.map { formatter.string(from: $0) },
                interpretation: interpretation.map { "Today: \(gestationalAge.map { "\($0.weeks) wk \($0.days) d" } ?? "—") · \($0.0)" },
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "EDD = LMP + 7 days − 3 months + 1 year (Naegele 1812).\nGestational age = (today − LMP) in completed weeks + days.\nFull-term: 39 0/7 to 40 6/7 weeks per ACOG.",
                notes: "Assumes a regular 28-day cycle and ovulation on day 14. For irregular cycles, longer or shorter cycles, or IVF pregnancies, ACOG endorses first-trimester ultrasound dating over LMP-based dating. Term definitions: early-term 37 0/7–38 6/7 · full-term 39 0/7–40 6/7 · late-term 41 0/7–41 6/7 · post-term ≥ 42 0/7.",
                citations: [naegele1812, openrnRisk12]
            )
        }
    }
}

// MARK: - Ballard Score

public struct BallardCalculatorView: View {
    // Neuromuscular maturity (6 items)
    @CalcPersistedOptionID(calculatorID: "ballard", key: "posture")        private var postureID
    @CalcPersistedOptionID(calculatorID: "ballard", key: "squareWindow")   private var squareID
    @CalcPersistedOptionID(calculatorID: "ballard", key: "armRecoil")      private var armRecoilID
    @CalcPersistedOptionID(calculatorID: "ballard", key: "poplitealAngle") private var poplitealID
    @CalcPersistedOptionID(calculatorID: "ballard", key: "scarfSign")      private var scarfID
    @CalcPersistedOptionID(calculatorID: "ballard", key: "heelToEar")      private var heelEarID

    // Physical maturity (6 items)
    @CalcPersistedOptionID(calculatorID: "ballard", key: "skin")           private var skinID
    @CalcPersistedOptionID(calculatorID: "ballard", key: "lanugo")         private var lanugoID
    @CalcPersistedOptionID(calculatorID: "ballard", key: "plantar")        private var plantarID
    @CalcPersistedOptionID(calculatorID: "ballard", key: "breast")         private var breastID
    @CalcPersistedOptionID(calculatorID: "ballard", key: "eyeEar")         private var eyeEarID
    @CalcPersistedOptionID(calculatorID: "ballard", key: "genitals")       private var genitalsID

    // 6-level scale (-1 to 4) for neuromuscular items; 6-level (-1 to 5) for physical (we'll use uniform -1 to 5)
    private let neuroOpts: [CalculatorScoreRow.Option] = (0...5).map { i in
        .init(id: i, label: "\(i - 1)", score: i - 1)
    }
    private let physicalOpts: [CalculatorScoreRow.Option] = (0...6).map { i in
        .init(id: i, label: "\(i - 1)", score: i - 1)
    }

    private var allItems: [CalculatorScoreRow.Option?] {
        let neuroItems = [postureID, squareID, armRecoilID, poplitealID, scarfID, heelEarID].map { id in
            id.flatMap { i in neuroOpts.first { $0.id == i } }
        }
        let physicalItems = [skinID, lanugoID, plantarID, breastID, eyeEarID, genitalsID].map { id in
            id.flatMap { i in physicalOpts.first { $0.id == i } }
        }
        return neuroItems + physicalItems
    }

    private var total: Int? {
        guard allItems.allSatisfy({ $0 != nil }) else { return nil }
        return allItems.compactMap { $0?.score }.reduce(0, +)
    }

    private var gestationalAge: Double? {
        guard let s = total else { return nil }
        // Linear approximation: GA (weeks) ≈ 0.4 × score + 24
        return 0.4 * Double(s) + 24.0
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let ga = gestationalAge else { return nil }
        if ga < 28 { return ("Estimated GA \(String(format: "%.1f", ga)) weeks — extremely-preterm band.", .alert) }
        if ga < 32 { return ("Estimated GA \(String(format: "%.1f", ga)) weeks — very-preterm band.", .alert) }
        if ga < 34 { return ("Estimated GA \(String(format: "%.1f", ga)) weeks — moderate-preterm band.", .caution) }
        if ga < 37 { return ("Estimated GA \(String(format: "%.1f", ga)) weeks — late-preterm band.", .caution) }
        if ga < 42 { return ("Estimated GA \(String(format: "%.1f", ga)) weeks — term band per ACOG definitions.", .neutral) }
        return ("Estimated GA \(String(format: "%.1f", ga)) weeks — post-term band.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "New Ballard Score",
            subtitle: "Newborn gestational-age estimation"
        ) {
            CalculatorSection("NEUROMUSCULAR MATURITY (each −1 to 4)") {
                CalculatorScoreRow(label: "Posture",         options: neuroOpts, selection: $postureID.option(in: neuroOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Square window (wrist)", options: neuroOpts, selection: $squareID.option(in: neuroOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Arm recoil",      options: neuroOpts, selection: $armRecoilID.option(in: neuroOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Popliteal angle", options: neuroOpts, selection: $poplitealID.option(in: neuroOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Scarf sign",       options: neuroOpts, selection: $scarfID.option(in: neuroOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Heel to ear",      options: neuroOpts, selection: $heelEarID.option(in: neuroOpts))
            }
            CalculatorSection("PHYSICAL MATURITY (each −1 to 5)") {
                CalculatorScoreRow(label: "Skin",        options: physicalOpts, selection: $skinID.option(in: physicalOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Lanugo",      options: physicalOpts, selection: $lanugoID.option(in: physicalOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Plantar surface", options: physicalOpts, selection: $plantarID.option(in: physicalOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Breast",      options: physicalOpts, selection: $breastID.option(in: physicalOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Eye / Ear",   options: physicalOpts, selection: $eyeEarID.option(in: physicalOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Genitals",    options: physicalOpts, selection: $genitalsID.option(in: physicalOpts))
            }
            CalculatorResultDisplay(
                label: "Estimated GA",
                value: gestationalAge.map { String(format: "%.1f wk", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Total maturity score = sum of 12 items (range approx. −10 to +50).\nGA (weeks) ≈ 0.4 × score + 24 (linear approximation of the published Ballard chart).",
                notes: "Most accurate when assessed within the first 12 hours of life for infants < 26 weeks, or within 96 hours for infants ≥ 26 weeks. Use the standardized Ballard examination forms with photographs of each maturity-item position. Pair with prenatal-dating ultrasound and LMP-based dating for the most reliable GA estimate.",
                citations: [ballard1991, openrnRisk12]
            )
        }
    }
}

// MARK: - Bhutani Nomogram

public struct BhutaniCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "bhutani", key: "bili")    private var bili
    @CalcPersistedOptionID(calculatorID: "bhutani", key: "ageBand") private var ageBandID

    private var ageBand: CalculatorScoreRow.Option? { ageOpts.first { $0.id == ageBandID } }

    private let ageOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "12–23 hours",  score: 0),
        .init(id: 1, label: "24–47 hours",  score: 1),
        .init(id: 2, label: "48–71 hours",  score: 2),
        .init(id: 3, label: "72–95 hours",  score: 3),
        .init(id: 4, label: "96–120 hours", score: 4)
    ]

    // Bhutani nomogram cut-points by age band (low / low-int / high-int / high)
    private static let cutoffs: [[Double]] = [
        [4.0,  6.0,  8.0],
        [5.0,  8.0, 11.0],
        [7.0, 11.0, 14.0],
        [8.0, 13.0, 16.0],
        [9.0, 14.0, 17.0]
    ]

    private enum Zone { case low, lowIntermediate, highIntermediate, high }

    private var zone: Zone? {
        guard let v = bili, let band = ageBand else { return nil }
        let cuts = Self.cutoffs[band.score]
        if v >= cuts[2] { return .high }
        if v >= cuts[1] { return .highIntermediate }
        if v >= cuts[0] { return .lowIntermediate }
        return .low
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let z = zone else { return nil }
        switch z {
        case .low:
            return ("Low-risk zone (< 40th percentile per Bhutani 1999) — published low risk of subsequent significant hyperbilirubinemia.", .neutral)
        case .lowIntermediate:
            return ("Low-intermediate-risk zone (40th–75th percentile) — published low-intermediate risk band.", .caution)
        case .highIntermediate:
            return ("High-intermediate-risk zone (75th–95th percentile) — published high-intermediate risk band.", .alert)
        case .high:
            return ("High-risk zone (≥ 95th percentile) — published high risk of subsequent significant hyperbilirubinemia.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Bhutani Nomogram",
            subtitle: "Newborn hyperbilirubinemia risk"
        ) {
            CalculatorSection("AGE") {
                CalculatorScoreRow(label: "Age in hours", options: ageOpts, selection: $ageBandID.option(in: ageOpts))
            }
            CalculatorSection("BILIRUBIN") {
                CalculatorNumberField(label: "Total serum bilirubin", unit: "mg/dL", value: $bili)
            }
            CalculatorResultDisplay(
                label: "Bhutani zone",
                value: zone.map { z in
                    switch z {
                    case .low: return "Low"
                    case .lowIntermediate: return "Low-intermediate"
                    case .highIntermediate: return "High-intermediate"
                    case .high: return "High"
                    }
                },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Hour-specific TSB plotted on the Bhutani 1999 nomogram. Risk zones:\n  Low (< 40th percentile)  ·  Low-intermediate (40th–75th)\n  High-intermediate (75th–95th)  ·  High (≥ 95th).",
                notes: "Validated for well newborns ≥ 36 weeks gestational age, ≥ 2000 g birthweight. NOT validated for ELBW, sick infants, or infants < 36 weeks (use TcB or TSB plotted on the AAP 2022 hour-specific phototherapy nomogram instead). The AAP 2022 update changed phototherapy thresholds; this nomogram remains the standard for risk stratification, not phototherapy initiation.",
                citations: [bhutani1999, openrnRisk12]
            )
        }
    }
}

// MARK: - PUSH Tool

public struct PUSHCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "push", key: "size")    private var sizeID
    @CalcPersistedOptionID(calculatorID: "push", key: "exudate") private var exudateID
    @CalcPersistedOptionID(calculatorID: "push", key: "tissue")  private var tissueID

    private var size:    CalculatorScoreRow.Option? { sizeOpts.first    { $0.id == sizeID } }
    private var exudate: CalculatorScoreRow.Option? { exudateOpts.first { $0.id == exudateID } }
    private var tissue:  CalculatorScoreRow.Option? { tissueOpts.first  { $0.id == tissueID } }

    private let sizeOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0,  label: "0 cm² (closed)",      score: 0),
        .init(id: 1,  label: "< 0.3 cm²",            score: 1),
        .init(id: 2,  label: "0.3–0.6 cm²",          score: 2),
        .init(id: 3,  label: "0.7–1.0 cm²",          score: 3),
        .init(id: 4,  label: "1.1–2.0 cm²",          score: 4),
        .init(id: 5,  label: "2.1–3.0 cm²",          score: 5),
        .init(id: 6,  label: "3.1–4.0 cm²",          score: 6),
        .init(id: 7,  label: "4.1–8.0 cm²",          score: 7),
        .init(id: 8,  label: "8.1–12.0 cm²",         score: 8),
        .init(id: 9,  label: "12.1–24.0 cm²",        score: 9),
        .init(id: 10, label: "> 24.0 cm²",           score: 10)
    ]
    private let exudateOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "None",      score: 0),
        .init(id: 1, label: "Light",     score: 1),
        .init(id: 2, label: "Moderate",  score: 2),
        .init(id: 3, label: "Heavy",     score: 3)
    ]
    private let tissueOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Closed / resurfaced",            score: 0),
        .init(id: 1, label: "Epithelial tissue",              score: 1),
        .init(id: 2, label: "Granulation tissue",             score: 2),
        .init(id: 3, label: "Slough",                          score: 3),
        .init(id: 4, label: "Necrotic tissue (eschar)",        score: 4)
    ]

    private var total: Int? {
        guard let s = size, let e = exudate, let t = tissue else { return nil }
        return s.score + e.score + t.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s == 0 { return ("PUSH = 0 — wound closed/resurfaced per published descriptors.", .neutral) }
        if s <= 6 { return ("PUSH 1–6 — small wound with low exudate and granulating/epithelializing tissue.", .neutral) }
        if s <= 11 { return ("PUSH 7–11 — moderate-burden wound; published intermediate band.", .caution) }
        return ("PUSH ≥ 12 — large wound with significant exudate and/or non-viable tissue.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "PUSH Tool",
            subtitle: "Pressure injury healing assessment"
        ) {
            CalculatorSection("WOUND") {
                CalculatorScoreRow(label: "Length × Width",  options: sizeOpts,    selection: $sizeID.option(in: sizeOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Exudate amount", options: exudateOpts, selection: $exudateID.option(in: exudateOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Predominant tissue type", options: tissueOpts, selection: $tissueID.option(in: tissueOpts))
            }
            CalculatorResultDisplay(
                label: "PUSH",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 3 weighted components. Range 0–17.\nLower scores indicate better wound status; track DECREASING scores as the marker of healing.",
                notes: "Developed by the National Pressure Ulcer Advisory Panel (now NPIAP). Trended weekly to monitor healing — a single value is much less informative than the trend. Pair with the Braden Scale (which assesses prevention risk) for a full pressure-injury picture.",
                citations: [stotts2001Push, openrnRisk12]
            )
        }
    }
}

// MARK: - ESAS-r

public struct ESASCalculatorView: View {
    @CalcPersistedOptionIDArray(calculatorID: "esas", key: "items", count: 9) private var itemIDs

    private let labels: [String] = [
        "Pain",
        "Tiredness (lack of energy)",
        "Drowsiness",
        "Nausea",
        "Lack of appetite",
        "Shortness of breath",
        "Depression (feeling sad)",
        "Anxiety (feeling nervous)",
        "Wellbeing (how you feel overall)"
    ]

    private let opts: [CalculatorScoreRow.Option] = (0...10).map { i in
        .init(id: i, label: i == 0 ? "0 — None" : (i == 10 ? "10 — Worst possible" : "\(i)"), score: i)
    }

    private var items: [CalculatorScoreRow.Option?] {
        itemIDs.map { id in opts.first { $0.id == id } }
    }

    private var total: Int? {
        guard items.allSatisfy({ $0 != nil }) else { return nil }
        return items.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 50 { return ("ESAS total \(s)/90 — high-symptom-burden band; published palliative literature uses this band as the threshold for intensified symptom management.", .alert) }
        if s >= 30 { return ("ESAS total \(s)/90 — moderate-symptom-burden band.", .caution) }
        return ("ESAS total \(s)/90 — low-symptom-burden band.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "ESAS-r",
            subtitle: "Edmonton Symptom Assessment · 9 symptoms"
        ) {
            CalculatorSection("RIGHT NOW, RATE 0–10") {
                ForEach(Array(labels.enumerated()), id: \.offset) { idx, label in
                    CalculatorScoreRow(
                        label: "\(idx + 1). \(label)",
                        options: opts,
                        selection: Binding(
                            get: { items[idx] },
                            set: { newValue in
                                var updated = itemIDs
                                updated[idx] = newValue?.id
                                itemIDs = updated
                            }
                        )
                    )
                    if idx < labels.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
            CalculatorResultDisplay(
                label: "ESAS",
                value: total.map { "\($0)/90" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Each of 9 symptoms rated 0 (none) to 10 (worst possible). Sum 0–90.\nIndividual symptoms ≥ 4 are commonly flagged for follow-up in palliative-care literature.",
                notes: "Patient self-rated when possible; caregiver-proxy when not. The published 'r' (revised) version standardizes the time frame to 'right now' rather than 'past 24 hours'. Pair with PPS for a full palliative-care snapshot. Trend serially — single values are less informative than the trajectory.",
                citations: [bruera1991Esas, openrnRisk12]
            )
        }
    }
}

// MARK: - Tinetti POMA

public struct TinettiCalculatorView: View {
    // Balance items (9)
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "sittingBalance")   private var sittingID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "arises")           private var arisesID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "attemptsToArise")  private var attemptsID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "immediateStandingBalance") private var immediateID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "standingBalance")  private var standingID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "nudged")           private var nudgedID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "eyesClosed")       private var eyesClosedID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "turning360")       private var turningID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "sittingDown")      private var sittingDownID

    // Gait items (8)
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "initiationGait")   private var initiationID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "stepLengthRight")  private var stepLengthRID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "stepLengthLeft")   private var stepLengthLID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "stepSymmetry")     private var symmetryID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "stepContinuity")   private var continuityID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "path")             private var pathID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "trunk")            private var trunkID
    @CalcPersistedOptionID(calculatorID: "tinetti", key: "walkingStance")    private var stanceID

    private let zeroOne: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — Unable / impaired", score: 0),
        .init(id: 1, label: "1 — Normal",            score: 1)
    ]
    private let zeroOneTwo: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — Unable",          score: 0),
        .init(id: 1, label: "1 — Difficulty",      score: 1),
        .init(id: 2, label: "2 — Normal",           score: 2)
    ]

    private var balanceTotal: Int? {
        let parts = [sittingID, arisesID, attemptsID, immediateID, standingID,
                     nudgedID, eyesClosedID, turningID, sittingDownID]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0 }.reduce(0, +)
    }

    private var gaitTotal: Int? {
        let parts = [initiationID, stepLengthRID, stepLengthLID, symmetryID,
                     continuityID, pathID, trunkID, stanceID]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0 }.reduce(0, +)
    }

    private var total: Int? {
        guard let b = balanceTotal, let g = gaitTotal else { return nil }
        return b + g
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s <= 18 { return ("Tinetti ≤ 18 — published high-fall-risk band per Tinetti 1986.", .alert) }
        if s <= 23 { return ("Tinetti 19–23 — published moderate-fall-risk band.", .caution) }
        return ("Tinetti 24–28 — published low-fall-risk band.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Tinetti POMA",
            subtitle: "Performance Oriented Mobility · balance + gait"
        ) {
            CalculatorSection("BALANCE (9 items)") {
                CalculatorScoreRow(label: "Sitting balance",          options: zeroOne,    selection: $sittingID.option(in: zeroOne))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Arises from chair",        options: zeroOneTwo, selection: $arisesID.option(in: zeroOneTwo))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Attempts to arise",        options: zeroOneTwo, selection: $attemptsID.option(in: zeroOneTwo))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Immediate standing balance (5 sec)", options: zeroOneTwo, selection: $immediateID.option(in: zeroOneTwo))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Standing balance",         options: zeroOneTwo, selection: $standingID.option(in: zeroOneTwo))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Nudged (sternum)",          options: zeroOneTwo, selection: $nudgedID.option(in: zeroOneTwo))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Eyes closed",               options: zeroOne,    selection: $eyesClosedID.option(in: zeroOne))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Turning 360°",              options: zeroOneTwo, selection: $turningID.option(in: zeroOneTwo))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Sitting down",              options: zeroOneTwo, selection: $sittingDownID.option(in: zeroOneTwo))
            }
            CalculatorSection("GAIT (8 items)") {
                CalculatorScoreRow(label: "Initiation of gait",        options: zeroOne,    selection: $initiationID.option(in: zeroOne))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Step length — right",        options: zeroOne,    selection: $stepLengthRID.option(in: zeroOne))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Step length — left",         options: zeroOne,    selection: $stepLengthLID.option(in: zeroOne))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Step symmetry",              options: zeroOne,    selection: $symmetryID.option(in: zeroOne))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Step continuity",            options: zeroOne,    selection: $continuityID.option(in: zeroOne))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Path (deviation)",           options: zeroOneTwo, selection: $pathID.option(in: zeroOneTwo))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Trunk (sway/aid use)",       options: zeroOneTwo, selection: $trunkID.option(in: zeroOneTwo))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Walking stance",              options: zeroOne,    selection: $stanceID.option(in: zeroOne))
            }
            CalculatorResultDisplay(
                label: "Tinetti",
                value: total.map { t in
                    let b = balanceTotal ?? 0
                    let g = gaitTotal ?? 0
                    return "\(t) (B \(b)/16 · G \(g)/12)"
                },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 17 observed items: Balance 0–16 + Gait 0–12 = Total 0–28.\nLow risk: 24–28  ·  Moderate risk: 19–23  ·  High risk: ≤ 18.",
                notes: "Performed by direct observation; takes ≈ 10 minutes. Use the patient's habitual aid (cane / walker). Pair with TUG for a quick screen and Berg Balance Scale for more detailed sub-component analysis.",
                citations: [tinetti1986, openrnRisk12]
            )
        }
    }
}
