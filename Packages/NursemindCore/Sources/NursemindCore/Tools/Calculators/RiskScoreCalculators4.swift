import SwiftUI

// MARK: - Shared citation sources

private let wells2003Dvt = CitationSource(
    id: "wells_2003_dvt",
    shortName: "Wells DVT — Wells PS et al., NEJM 2003 (concept citation)",
    detail: "Pretest probability of DVT",
    publisher: "New England Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/14507948/",
    lastRetrieved: "2026-05-04"
)

private let padua2010 = CitationSource(
    id: "barbar_2010_padua",
    shortName: "Padua VTE — Barbar S et al., J Thromb Haemost 2010 (concept citation)",
    detail: "Validated VTE-risk-prediction model for hospitalized medical patients",
    publisher: "Journal of Thrombosis and Haemostasis",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/20738765/",
    lastRetrieved: "2026-05-04"
)

private let cowsWesson = CitationSource(
    id: "wesson_ling_2003_cows",
    shortName: "COWS — Wesson DR & Ling W, J Psychoactive Drugs 2003 (concept citation)",
    detail: "Clinical Opiate Withdrawal Scale; 11-item observational and self-reported measure",
    publisher: "Journal of Psychoactive Drugs",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/12924748/",
    lastRetrieved: "2026-05-04"
)

private let phq9Spitzer = CitationSource(
    id: "spitzer_2001_phq9",
    shortName: "PHQ-9 — Kroenke K, Spitzer RL, Williams JBW, J Gen Intern Med 2001 (concept citation)",
    detail: "Patient Health Questionnaire — 9-item depression severity",
    publisher: "Journal of General Internal Medicine / Pfizer (free use)",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/11556941/",
    lastRetrieved: "2026-05-04"
)

private let gad7Spitzer = CitationSource(
    id: "spitzer_2006_gad7",
    shortName: "GAD-7 — Spitzer RL et al., Arch Intern Med 2006 (concept citation)",
    detail: "Generalized Anxiety Disorder 7-item scale",
    publisher: "Archives of Internal Medicine / Pfizer (free use)",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/16717171/",
    lastRetrieved: "2026-05-04"
)

private let miniCogBorson = CitationSource(
    id: "borson_2000_minicog",
    shortName: "Mini-Cog — Borson S et al., Int J Geriatr Psychiatry 2000 (concept citation)",
    detail: "Brief screening for cognitive impairment",
    publisher: "International Journal of Geriatric Psychiatry",
    license: .factCitationOnly,
    url: "https://mini-cog.com/",
    lastRetrieved: "2026-05-04"
)

private let centorRef = CitationSource(
    id: "centor_mcisaac",
    shortName: "Centor / McIsaac — Centor 1981; McIsaac modification 1998 (concept citation)",
    detail: "Streptococcal pharyngitis pretest probability",
    publisher: "Medical Decision Making / CMAJ",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/10590060/",
    lastRetrieved: "2026-05-04"
)

private let openrnRisk4 = CitationSource(
    id: "openrn_risk_4",
    shortName: "Open RN Health Alterations & Mental Health — Risk Assessment",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=clinical+reference",
    lastRetrieved: "2026-05-04"
)

// MARK: - Wells DVT

public struct WellsDVTCalculatorView: View {
    @CalcPersistedBool(calculatorID: "wells-dvt", key: "activeCancer")        private var activeCancer
    @CalcPersistedBool(calculatorID: "wells-dvt", key: "paralysis")           private var paralysis
    @CalcPersistedBool(calculatorID: "wells-dvt", key: "bedrestSurgery")      private var bedrestSurgery
    @CalcPersistedBool(calculatorID: "wells-dvt", key: "localizedTenderness") private var localizedTenderness
    @CalcPersistedBool(calculatorID: "wells-dvt", key: "entireLegSwollen")    private var entireLegSwollen
    @CalcPersistedBool(calculatorID: "wells-dvt", key: "calfSwellingGT3")     private var calfSwellingGT3
    @CalcPersistedBool(calculatorID: "wells-dvt", key: "pittingEdemaUni")     private var pittingEdemaUni
    @CalcPersistedBool(calculatorID: "wells-dvt", key: "collateralVeins")     private var collateralVeins
    @CalcPersistedBool(calculatorID: "wells-dvt", key: "prevDvt")             private var prevDvt
    @CalcPersistedBool(calculatorID: "wells-dvt", key: "alternativeDx")       private var alternativeDx   // subtracts 2

    private var total: Int {
        var s = 0
        if activeCancer        { s += 1 }
        if paralysis           { s += 1 }
        if bedrestSurgery      { s += 1 }
        if localizedTenderness { s += 1 }
        if entireLegSwollen    { s += 1 }
        if calfSwellingGT3     { s += 1 }
        if pittingEdemaUni     { s += 1 }
        if collateralVeins     { s += 1 }
        if prevDvt             { s += 1 }
        if alternativeDx       { s -= 2 }
        return s
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total >= 3 {
            return ("Wells ≥ 3 — high pretest probability band; published DVT prevalence ≈ 75% (Wells 1997 derivation cohort).", .alert)
        }
        if total >= 1 {
            return ("Wells 1–2 — moderate pretest probability band; published DVT prevalence ≈ 17%.", .caution)
        }
        return ("Wells ≤ 0 — low pretest probability band; published DVT prevalence ≈ 3%.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Wells DVT",
            subtitle: "Pretest probability of deep vein thrombosis"
        ) {
            CalculatorSection("CRITERIA") {
                togglePoint(label: "Active cancer (treated within 6 mo)",         points: "+1", isOn: $activeCancer)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Paralysis or recent immobilization of LE",     points: "+1", isOn: $paralysis)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Bedridden ≥ 3 days OR major surgery within 12 wks", points: "+1", isOn: $bedrestSurgery)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Localized tenderness along deep venous system", points: "+1", isOn: $localizedTenderness)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Entire leg swollen",                            points: "+1", isOn: $entireLegSwollen)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Calf swelling > 3 cm vs. asymptomatic side",    points: "+1", isOn: $calfSwellingGT3)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Pitting edema confined to symptomatic leg",     points: "+1", isOn: $pittingEdemaUni)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Collateral superficial veins (non-varicose)",   points: "+1", isOn: $collateralVeins)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Previously documented DVT",                     points: "+1", isOn: $prevDvt)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Alternative diagnosis at least as likely",      points: "−2", isOn: $alternativeDx)
            }
            CalculatorResultDisplay(
                label: "Wells DVT",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of weighted criteria. Three-tier: ≤ 0 unlikely, 1–2 moderate, ≥ 3 likely.\nTwo-tier: ≤ 1 unlikely, ≥ 2 likely.",
                notes: "Combine with D-dimer for low/moderate-probability patients to rule out DVT without imaging. High pretest probability — proceed directly to compression ultrasound. Bilateral leg DVT rare; calf measurement at 10 cm below the tibial tuberosity is standard.",
                citations: [wells2003Dvt, openrnRisk4]
            )
        }
    }

    private func togglePoint(label: String, points: String, isOn: Binding<Bool>) -> some View {
        HStack {
            Toggle(isOn: isOn) {
                Text(label).font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary).lineLimit(2)
            }
            .toggleStyle(.switch)
            Text(points)
                .font(NMFont.mono)
                .foregroundStyle(NMColor.textTertiary)
                .frame(minWidth: 36, alignment: .trailing)
        }
        .padding(.vertical, NMSpace.base)
    }
}

// MARK: - Padua

public struct PaduaCalculatorView: View {
    @CalcPersistedBool(calculatorID: "padua", key: "activeCancer")      private var activeCancer
    @CalcPersistedBool(calculatorID: "padua", key: "prevVte")           private var prevVte
    @CalcPersistedBool(calculatorID: "padua", key: "reducedMobility")   private var reducedMobility
    @CalcPersistedBool(calculatorID: "padua", key: "thrombophilia")     private var thrombophilia
    @CalcPersistedBool(calculatorID: "padua", key: "traumaSurgery")     private var traumaSurgery
    @CalcPersistedBool(calculatorID: "padua", key: "ageGE70")           private var ageGE70
    @CalcPersistedBool(calculatorID: "padua", key: "hfRespFailure")     private var hfRespFailure
    @CalcPersistedBool(calculatorID: "padua", key: "miStroke")          private var miStroke
    @CalcPersistedBool(calculatorID: "padua", key: "infectionRheum")    private var infectionRheum
    @CalcPersistedBool(calculatorID: "padua", key: "bmiGE30")           private var bmiGE30
    @CalcPersistedBool(calculatorID: "padua", key: "hormonalTreatment") private var hormonalTreatment

    private var total: Int {
        var s = 0
        if activeCancer       { s += 3 }
        if prevVte            { s += 3 }
        if reducedMobility    { s += 3 }
        if thrombophilia      { s += 3 }
        if traumaSurgery      { s += 2 }
        if ageGE70            { s += 1 }
        if hfRespFailure      { s += 1 }
        if miStroke           { s += 1 }
        if infectionRheum     { s += 1 }
        if bmiGE30            { s += 1 }
        if hormonalTreatment  { s += 1 }
        return s
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total >= 4 { return ("Padua ≥ 4 — high-VTE-risk band per Barbar 2010; the published threshold for considering pharmacologic prophylaxis in medical inpatients per ASH/ACCP guidelines.", .alert) }
        return ("Padua < 4 — low-VTE-risk band per Barbar 2010.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Padua Score",
            subtitle: "VTE risk in hospitalized medical patients"
        ) {
            CalculatorSection("3 POINTS EACH") {
                tg("Active cancer",                          $activeCancer)
                Hairline(color: NMColor.borderSubtle)
                tg("Previous VTE",                           $prevVte)
                Hairline(color: NMColor.borderSubtle)
                tg("Reduced mobility (bedrest ≥ 3 days)",    $reducedMobility)
                Hairline(color: NMColor.borderSubtle)
                tg("Known thrombophilia",                    $thrombophilia)
            }
            CalculatorSection("2 POINTS EACH") {
                tg("Recent trauma or surgery (≤ 1 mo)",      $traumaSurgery)
            }
            CalculatorSection("1 POINT EACH") {
                tg("Age ≥ 70",                               $ageGE70)
                Hairline(color: NMColor.borderSubtle)
                tg("Heart and/or respiratory failure",       $hfRespFailure)
                Hairline(color: NMColor.borderSubtle)
                tg("Acute MI or ischemic stroke",            $miStroke)
                Hairline(color: NMColor.borderSubtle)
                tg("Acute infection / rheumatologic disorder", $infectionRheum)
                Hairline(color: NMColor.borderSubtle)
                tg("BMI ≥ 30",                               $bmiGE30)
                Hairline(color: NMColor.borderSubtle)
                tg("Ongoing hormonal treatment",             $hormonalTreatment)
            }
            CalculatorResultDisplay(
                label: "Padua",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 11 weighted risk factors. ≥ 4 = high risk.",
                notes: "For surgical patients, use Caprini Score instead. Always pair with bleeding-risk assessment (e.g., IMPROVE bleed score) before initiating pharmacologic prophylaxis. Mechanical prophylaxis (SCDs) for high-bleed-risk patients with high Padua score.",
                citations: [padua2010, openrnRisk4]
            )
        }
    }

    private func tg(_ label: String, _ binding: Binding<Bool>) -> some View {
        Toggle(isOn: binding) {
            Text(label).font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary).lineLimit(2)
        }
        .toggleStyle(.switch)
        .padding(.vertical, NMSpace.base)
    }
}

// MARK: - COWS

public struct COWSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "cows", key: "pulse")        private var pulseID
    @CalcPersistedOptionID(calculatorID: "cows", key: "sweating")     private var sweatingID
    @CalcPersistedOptionID(calculatorID: "cows", key: "restlessness") private var restlessnessID
    @CalcPersistedOptionID(calculatorID: "cows", key: "pupil")        private var pupilID
    @CalcPersistedOptionID(calculatorID: "cows", key: "bonePain")     private var bonePainID
    @CalcPersistedOptionID(calculatorID: "cows", key: "rhinorrhea")   private var rhinorrheaID
    @CalcPersistedOptionID(calculatorID: "cows", key: "giUpset")      private var giUpsetID
    @CalcPersistedOptionID(calculatorID: "cows", key: "tremor")       private var tremorID
    @CalcPersistedOptionID(calculatorID: "cows", key: "yawning")      private var yawningID
    @CalcPersistedOptionID(calculatorID: "cows", key: "anxiety")      private var anxietyID
    @CalcPersistedOptionID(calculatorID: "cows", key: "gooseflesh")   private var gooseflesh_ID

    private var pulse:        CalculatorScoreRow.Option? { pulseOpts.first  { $0.id == pulseID } }
    private var sweating:     CalculatorScoreRow.Option? { sweatOpts.first  { $0.id == sweatingID } }
    private var restlessness: CalculatorScoreRow.Option? { restOpts.first   { $0.id == restlessnessID } }
    private var pupil:        CalculatorScoreRow.Option? { pupilOpts.first  { $0.id == pupilID } }
    private var bonePain:     CalculatorScoreRow.Option? { boneOpts.first   { $0.id == bonePainID } }
    private var rhinorrhea:   CalculatorScoreRow.Option? { nasalOpts.first  { $0.id == rhinorrheaID } }
    private var giUpset:      CalculatorScoreRow.Option? { giOpts.first     { $0.id == giUpsetID } }
    private var tremor:       CalculatorScoreRow.Option? { tremorOpts.first { $0.id == tremorID } }
    private var yawning:      CalculatorScoreRow.Option? { yawnOpts.first   { $0.id == yawningID } }
    private var anxiety:      CalculatorScoreRow.Option? { anxOpts.first    { $0.id == anxietyID } }
    private var gooseflesh:   CalculatorScoreRow.Option? { gooseOpts.first  { $0.id == gooseflesh_ID } }

    private let pulseOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≤ 80",          score: 0),
        .init(id: 1, label: "81–100",        score: 1),
        .init(id: 2, label: "101–120",       score: 2),
        .init(id: 4, label: "> 120",         score: 4)
    ]
    private let sweatOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — no chills/flushing", score: 0),
        .init(id: 1, label: "1 — subjective chills",  score: 1),
        .init(id: 2, label: "2 — flushed/observed moisture", score: 2),
        .init(id: 3, label: "3 — beads of sweat",     score: 3),
        .init(id: 4, label: "4 — sweat streaming",    score: 4)
    ]
    private let restOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — sits still",            score: 0),
        .init(id: 1, label: "1 — fidgety / sits still with effort", score: 1),
        .init(id: 3, label: "3 — moving frequently",     score: 3),
        .init(id: 5, label: "5 — unable to sit still",   score: 5)
    ]
    private let pupilOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — normal / pinned",  score: 0),
        .init(id: 1, label: "1 — possibly larger",  score: 1),
        .init(id: 2, label: "2 — moderately dilated", score: 2),
        .init(id: 5, label: "5 — so dilated only iris rim visible", score: 5)
    ]
    private let boneOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — none",                            score: 0),
        .init(id: 1, label: "1 — mild diffuse discomfort",         score: 1),
        .init(id: 2, label: "2 — patient reports severe diffuse aching", score: 2),
        .init(id: 4, label: "4 — rubbing joints or muscles",       score: 4)
    ]
    private let nasalOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — not present",            score: 0),
        .init(id: 1, label: "1 — nasal stuffiness",       score: 1),
        .init(id: 2, label: "2 — nose running / tearing", score: 2),
        .init(id: 4, label: "4 — constantly running / streaming tears", score: 4)
    ]
    private let giOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — none",                          score: 0),
        .init(id: 1, label: "1 — stomach cramps",                score: 1),
        .init(id: 2, label: "2 — nausea / loose stool",          score: 2),
        .init(id: 3, label: "3 — vomiting / diarrhea",           score: 3),
        .init(id: 5, label: "5 — multiple episodes diarrhea/emesis", score: 5)
    ]
    private let tremorOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — no tremor",                  score: 0),
        .init(id: 1, label: "1 — tremor felt but not observed", score: 1),
        .init(id: 2, label: "2 — slight tremor observable",   score: 2),
        .init(id: 4, label: "4 — gross tremor or muscle twitching", score: 4)
    ]
    private let yawnOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — none",                       score: 0),
        .init(id: 1, label: "1 — yawning once or twice",      score: 1),
        .init(id: 2, label: "2 — yawning ≥ 3 times",          score: 2),
        .init(id: 4, label: "4 — yawning several times / minute", score: 4)
    ]
    private let anxOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — no irritability / anxiety", score: 0),
        .init(id: 1, label: "1 — patient reports increasing", score: 1),
        .init(id: 2, label: "2 — patient obviously irritable", score: 2),
        .init(id: 4, label: "4 — so irritable / anxious that participation is difficult", score: 4)
    ]
    private let gooseOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — smooth skin",                       score: 0),
        .init(id: 3, label: "3 — piloerection of arm hairs",         score: 3),
        .init(id: 5, label: "5 — prominent piloerection",            score: 5)
    ]

    private var total: Int? {
        let parts = [pulse, sweating, restlessness, pupil, bonePain, rhinorrhea, giUpset, tremor, yawning, anxiety, gooseflesh]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 36 { return ("COWS ≥ 36 — severe-withdrawal band per Wesson 2003.", .alert) }
        if s >= 25 { return ("COWS 25–35 — moderately-severe-withdrawal band.", .alert) }
        if s >= 13 { return ("COWS 13–24 — moderate-withdrawal band; published buprenorphine-induction protocols typically use ≥ 12 as the threshold.", .caution) }
        if s >= 5  { return ("COWS 5–12 — mild-withdrawal band.", .caution) }
        return ("COWS < 5 — minimal or no withdrawal symptoms per published cutoffs.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "COWS",
            subtitle: "Clinical Opiate Withdrawal Scale"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Resting pulse",          options: pulseOpts,  selection: $pulseID.option(in: pulseOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Sweating",               options: sweatOpts,  selection: $sweatingID.option(in: sweatOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Restlessness",           options: restOpts,   selection: $restlessnessID.option(in: restOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Pupil size",             options: pupilOpts,  selection: $pupilID.option(in: pupilOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Bone or joint aches",    options: boneOpts,   selection: $bonePainID.option(in: boneOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Runny nose / tearing",   options: nasalOpts,  selection: $rhinorrheaID.option(in: nasalOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "GI upset",               options: giOpts,     selection: $giUpsetID.option(in: giOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Tremor",                 options: tremorOpts, selection: $tremorID.option(in: tremorOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Yawning",                options: yawnOpts,   selection: $yawningID.option(in: yawnOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Anxiety / irritability", options: anxOpts,    selection: $anxietyID.option(in: anxOpts))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Gooseflesh skin",        options: gooseOpts,  selection: $gooseflesh_ID.option(in: gooseOpts))
            }
            CalculatorResultDisplay(
                label: "COWS",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 11 items with item-specific score ranges. Range 0–48.",
                notes: "Used to time buprenorphine induction (most protocols require COWS ≥ 8–12) and to titrate symptomatic withdrawal medications. Reassess every 1–2 hours during early withdrawal management.",
                citations: [cowsWesson, openrnRisk4]
            )
        }
    }
}

// MARK: - PHQ-9

public struct PHQ9CalculatorView: View {
    @CalcPersistedOptionIDArray(calculatorID: "phq9", key: "items", count: 9) private var itemIDs

    private var items: [CalculatorScoreRow.Option?] {
        itemIDs.map { id in opts.first { $0.id == id } }
    }

    private let phqLabels: [String] = [
        "Little interest or pleasure in doing things",
        "Feeling down, depressed, or hopeless",
        "Trouble falling/staying asleep, or sleeping too much",
        "Feeling tired or having little energy",
        "Poor appetite or overeating",
        "Feeling bad about yourself or that you are a failure",
        "Trouble concentrating on things",
        "Moving or speaking slowly OR being fidgety/restless",
        "Thoughts you would be better off dead or hurting yourself"
    ]

    private let opts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — Not at all",          score: 0),
        .init(id: 1, label: "1 — Several days",        score: 1),
        .init(id: 2, label: "2 — More than half the days", score: 2),
        .init(id: 3, label: "3 — Nearly every day",    score: 3)
    ]

    private var total: Int? {
        guard items.allSatisfy({ $0 != nil }) else { return nil }
        return items.compactMap { $0?.score }.reduce(0, +)
    }

    private var item9Score: Int? { items[8]?.score }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        let suicidalFlag = (item9Score ?? 0) > 0
        let suicidalText = suicidalFlag ? " ⚠ Item 9 (self-harm) endorsed — published guidance flags this regardless of total score." : ""
        switch s {
        case 0...4:   return ("PHQ-9 0–4 — minimal-depression band per Kroenke 2001.\(suicidalText)", suicidalFlag ? .alert : .neutral)
        case 5...9:   return ("PHQ-9 5–9 — mild-depression band per Kroenke 2001.\(suicidalText)", suicidalFlag ? .alert : .caution)
        case 10...14: return ("PHQ-9 10–14 — moderate-depression band per Kroenke 2001.\(suicidalText)", .alert)
        case 15...19: return ("PHQ-9 15–19 — moderately-severe-depression band per Kroenke 2001.\(suicidalText)", .alert)
        default:      return ("PHQ-9 20–27 — severe-depression band per Kroenke 2001.\(suicidalText)", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "PHQ-9",
            subtitle: "Depression severity — past 2 weeks"
        ) {
            CalculatorSection("OVER THE LAST 2 WEEKS, HOW OFTEN HAVE YOU BEEN BOTHERED BY…") {
                ForEach(Array(phqLabels.enumerated()), id: \.offset) { idx, label in
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
                    if idx < phqLabels.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
            CalculatorResultDisplay(
                label: "PHQ-9",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 9 items, each 0–3. Range 0–27.\nItem 9 (self-harm) ALWAYS warrants safety assessment regardless of total.",
                notes: "Validated for adults in primary care and many specialty settings. Self-administered or interview-administered. Functional impairment item ('How difficult have these problems made it for you to…') is not scored but informs clinical impression. Pair with GAD-7 in patients with mixed presentation.",
                citations: [phq9Spitzer, openrnRisk4]
            )
        }
    }
}

// MARK: - GAD-7

public struct GAD7CalculatorView: View {
    @CalcPersistedOptionIDArray(calculatorID: "gad7", key: "items", count: 7) private var itemIDs

    private var items: [CalculatorScoreRow.Option?] {
        itemIDs.map { id in opts.first { $0.id == id } }
    }

    private let gadLabels: [String] = [
        "Feeling nervous, anxious, or on edge",
        "Not being able to stop or control worrying",
        "Worrying too much about different things",
        "Trouble relaxing",
        "Being so restless that it is hard to sit still",
        "Becoming easily annoyed or irritable",
        "Feeling afraid as if something awful might happen"
    ]

    private let opts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — Not at all",              score: 0),
        .init(id: 1, label: "1 — Several days",            score: 1),
        .init(id: 2, label: "2 — More than half the days", score: 2),
        .init(id: 3, label: "3 — Nearly every day",        score: 3)
    ]

    private var total: Int? {
        guard items.allSatisfy({ $0 != nil }) else { return nil }
        return items.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        switch s {
        case 0...4:   return ("GAD-7 0–4 — minimal-anxiety band per Spitzer 2006.", .neutral)
        case 5...9:   return ("GAD-7 5–9 — mild-anxiety band per Spitzer 2006.", .caution)
        case 10...14: return ("GAD-7 10–14 — moderate-anxiety band per Spitzer 2006; cutoff ≥ 10 has published sensitivity 89% / specificity 82% for GAD.", .alert)
        default:      return ("GAD-7 15–21 — severe-anxiety band per Spitzer 2006.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "GAD-7",
            subtitle: "Generalized Anxiety Disorder — past 2 weeks"
        ) {
            CalculatorSection("OVER THE LAST 2 WEEKS, HOW OFTEN HAVE YOU BEEN BOTHERED BY…") {
                ForEach(Array(gadLabels.enumerated()), id: \.offset) { idx, label in
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
                    if idx < gadLabels.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
            CalculatorResultDisplay(
                label: "GAD-7",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 7 items, each 0–3. Range 0–21.\nThresholds: 5 / 10 / 15 represent mild / moderate / severe anxiety.",
                notes: "Sensitive to many anxiety disorders, not specific to GAD. Use alongside PHQ-9 (depression) for a complete mood/anxiety screen. Always pair score with clinical interview, especially for treatment decisions.",
                citations: [gad7Spitzer, openrnRisk4]
            )
        }
    }
}

// MARK: - Mini-Cog

public struct MiniCogCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "mini-cog", key: "recall")    private var recallID
    @CalcPersistedOptionID(calculatorID: "mini-cog", key: "clockDraw") private var clockDrawID

    private var recall:    CalculatorScoreRow.Option? { recallOptions.first { $0.id == recallID } }
    private var clockDraw: CalculatorScoreRow.Option? { clockOptions.first  { $0.id == clockDrawID } }

    private let recallOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — recalls 0 of 3 words",         score: 0),
        .init(id: 1, label: "1 — recalls 1 of 3 words",         score: 1),
        .init(id: 2, label: "2 — recalls 2 of 3 words",         score: 2),
        .init(id: 3, label: "3 — recalls all 3 words",          score: 3)
    ]
    private let clockOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — abnormal clock draw",          score: 0),
        .init(id: 2, label: "2 — normal clock draw",            score: 2)
    ]

    private var total: Int? {
        guard let r = recall, let c = clockDraw else { return nil }
        return r.score + c.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s < 3 { return ("Mini-Cog < 3 — POSITIVE screen per Borson 2003 cutoff; published sensitivity ≈ 76–99% for dementia in validation cohorts.", .alert) }
        return ("Mini-Cog ≥ 3 — negative screen per Borson 2003 cutoff.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Mini-Cog",
            subtitle: "Brief cognitive impairment screen"
        ) {
            CalculatorSection("INSTRUCTIONS") {
                Text("1. Tell the patient three unrelated words (e.g., 'Apple, Penny, Table') and ask them to repeat. 2. Have the patient draw a clock with the time set to a specific time (e.g., 11:10) — circle, all 12 numbers correctly placed, hands in correct position. 3. Ask the patient to recall the three words.")
                    .font(NMFont.body)
                    .foregroundStyle(NMColor.textSecondary)
                    .lineSpacing(3)
                    .padding(.vertical, NMSpace.md)
            }
            CalculatorSection("SCORING") {
                CalculatorScoreRow(label: "Word recall",  options: recallOptions, selection: $recallID.option(in: recallOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Clock draw",   options: clockOptions,  selection: $clockDrawID.option(in: clockOptions))
            }
            CalculatorResultDisplay(
                label: "Mini-Cog",
                value: total.map { "\($0) / 5" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Total = word recall (0–3) + clock draw (0 or 2). Range 0–5.\nCut-off < 3 = positive screen.",
                notes: "Takes < 3 minutes. Less culture- and education-biased than longer instruments. A positive screen requires further evaluation, NOT a diagnosis. Always rule out delirium first in acutely ill patients (Mini-Cog cannot distinguish dementia from delirium).",
                citations: [miniCogBorson, openrnRisk4]
            )
        }
    }
}

// MARK: - Centor / McIsaac

public struct CentorCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "centor", key: "ageGroup") private var ageGroupID
    private var ageGroup: CalculatorScoreRow.Option? { ageOptions.first { $0.id == ageGroupID } }
    @CalcPersistedBool(calculatorID: "centor", key: "tonsillarExudate") private var tonsillarExudate
    @CalcPersistedBool(calculatorID: "centor", key: "lymphadenopathy")  private var lymphadenopathy
    @CalcPersistedBool(calculatorID: "centor", key: "fever")            private var fever
    @CalcPersistedBool(calculatorID: "centor", key: "noCough")          private var noCough

    private let ageOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Age 3–14",   score: 1),
        .init(id: 1, label: "Age 15–44",  score: 0),
        .init(id: 2, label: "Age ≥ 45",   score: -1)
    ]

    private var total: Int? {
        guard let age = ageGroup else { return nil }
        var s = age.score
        if tonsillarExudate { s += 1 }
        if lymphadenopathy  { s += 1 }
        if fever            { s += 1 }
        if noCough          { s += 1 }
        return s
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        switch s {
        case ..<1:    return ("Score ≤ 0 — published group A strep prevalence ≈ 1–2.5%.", .neutral)
        case 1:       return ("Score = 1 — published group A strep prevalence ≈ 5–10%.", .neutral)
        case 2:       return ("Score = 2 — published group A strep prevalence ≈ 11–17%.", .caution)
        case 3:       return ("Score = 3 — published group A strep prevalence ≈ 28–35%.", .alert)
        default:      return ("Score ≥ 4 — published group A strep prevalence ≈ 51–53%.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Centor / McIsaac",
            subtitle: "Streptococcal pharyngitis pretest probability"
        ) {
            CalculatorSection("CRITERIA") {
                CalculatorScoreRow(label: "Age",                                 options: ageOptions, selection: $ageGroupID.option(in: ageOptions))
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Tonsillar exudate or swelling",              isOn: $tonsillarExudate)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Tender anterior cervical lymphadenopathy",   isOn: $lymphadenopathy)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Fever > 38°C (100.4°F)",                     isOn: $fever)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Absence of cough",                           isOn: $noCough)
            }
            CalculatorResultDisplay(
                label: "Centor / McIsaac",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "McIsaac modification adds age scoring to original 4 Centor criteria.\nRange −1 to 5.",
                notes: "IDSA guidelines recommend testing only patients with at least one Centor criterion present, and reserving antibiotics for confirmed strep. Empiric treatment based on score alone results in unnecessary antibiotics. Rapid antigen detection has high specificity but lower sensitivity in children — back-up culture often used.",
                citations: [centorRef, openrnRisk4]
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
