import SwiftUI

/// Maps a calculator id to its specific view. Each id corresponds to a
/// single SwiftUI calculator view defined in Tools/Calculators/.
///
/// The router also owns the pin/recent toolbar — every calculator inherits the
/// same affordances without per-view changes, parallel to LibraryEntryView.
public struct CalculatorDetailRouter: View {
    let calculatorID: String
    let preset: [String: Double]
    @State private var prefs = UserPreferences.shared

    public init(calculatorID: String, preset: [String: Double] = [:]) {
        self.calculatorID = calculatorID
        self.preset = preset
    }

    public var body: some View {
        content
            .environment(\.currentCalculatorID, calculatorID)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        prefs.togglePinCalculator(calculatorID)
                    } label: {
                        Image(systemName: prefs.isPinnedCalculator(calculatorID) ? "star.fill" : "star")
                            .foregroundStyle(prefs.isPinnedCalculator(calculatorID) ? NMColor.accent : NMColor.textPrimary)
                    }
                    .accessibilityLabel(prefs.isPinnedCalculator(calculatorID) ? "Unpin calculator" : "Pin calculator")
                }
            }
            .onAppear {
                prefs.recordCalculatorView(calculatorID)
            }
    }

    @ViewBuilder
    private var content: some View {
        switch calculatorID {
        // Cardiovascular
        case "map":              MAPCalculatorView(preset: preset)
        case "cardiac-index":    CardiacIndexCalculatorView()
        case "shock-index":      ShockIndexCalculatorView()
        case "qtc":              QTcCalculatorView()
        case "nyha":             NYHAClassCalculatorView()
        case "cha2ds2-vasc":     CHA2DS2VAScCalculatorView()
        case "has-bled":         HASBLEDCalculatorView()
        case "heart":            HEARTScoreCalculatorView()
        case "timi":             TIMICalculatorView()
        case "killip":           KillipClassCalculatorView()
        case "pulse-pressure":   PulsePressureCalculatorView()
        case "abi":              ABICalculatorView()
        case "rcri":             RCRICalculatorView()
        case "fick-co":          FickCOCalculatorView()
        case "grace":            GRACECalculatorView()
        case "sgarbossa":        SgarbossaCalculatorView()
        case "timi-stemi":       TIMISTEMICalculatorView()

        // Respiratory
        case "pf-ratio":         PFRatioCalculatorView()
        case "oxygenation-index":OxygenationIndexCalculatorView()
        case "aa-gradient":      AAGradientCalculatorView()
        case "perc":             PERCRuleCalculatorView()
        case "pack-years":       PackYearsCalculatorView()
        case "curb-65":          CURB65CalculatorView()
        case "wells-pe":         WellsPECalculatorView()
        case "minute-vent":      MinuteVentilationCalculatorView()
        case "rsbi":             RSBICalculatorView()
        case "bode":             BODEIndexCalculatorView()
        case "psi":              PSICalculatorView()
        case "borg":             ModifiedBorgCalculatorView()
        case "mmrc":             MMRCCalculatorView()
        case "pesi":             PESICalculatorView()
        case "spesi":            SPESICalculatorView()
        case "geneva-pe":        GenevaPECalculatorView()
        case "light":            LightCriteriaCalculatorView()

        // Renal · Metabolic
        case "gfr":              GFRCalculatorView(preset: preset)
        case "crcl":             CockcroftGaultCalculatorView(preset: preset)
        case "anion-gap":        AnionGapCalculatorView(preset: preset)
        case "corrected-na":     CorrectedSodiumCalculatorView(preset: preset)
        case "corrected-ca":     CorrectedCalciumCalculatorView(preset: preset)
        case "fena":             FENaCalculatorView()
        case "fwd":              FreeWaterDeficitCalculatorView()
        case "osmolality":       PlasmaOsmolalityCalculatorView()
        case "na-correction-rate": SodiumCorrectionRateCalculatorView()
        case "osmolar-gap":      OsmolarGapCalculatorView()
        case "delta-gap":        DeltaGapCalculatorView()
        case "winters":          WintersFormulaCalculatorView()
        case "a1c-eag":          A1cEAGCalculatorView()
        case "kdigo-aki":        KDIGOAKICalculatorView()

        // Hepatic
        case "meld":             MELDClassicCalculatorView()
        case "meld-na":          MELDNaCalculatorView()
        case "blatchford":       GlasgowBlatchfordCalculatorView()
        case "maddrey":          MaddreyDFCalculatorView()
        case "lille":            LilleScoreCalculatorView()
        case "rockall":          RockallScoreCalculatorView()
        case "child-pugh":       ChildPughCalculatorView()
        case "fib4":             FIB4CalculatorView()
        case "apri":             APRICalculatorView()
        case "aims-65":          AIMS65CalculatorView()
        case "bisap":            BISAPCalculatorView()
        case "meld-3":           MELD3CalculatorView()
        case "ranson":           RansonCalculatorView()
        case "kings":            KingsCollegeCalculatorView()

        // Hematology
        case "anc":              ANCCalculatorView()
        case "hit-4ts":          HIT4TsCalculatorView()
        case "mascc":            MASCCCalculatorView()
        case "corrected-retic":  CorrectedReticCalculatorView()
        case "dic-isth":         DICISTHCalculatorView()
        case "plasmic":          PLASMICCalculatorView()
        case "khorana":          KhoranaCalculatorView()

        // Burns
        case "rule-of-nines":    RuleOfNinesCalculatorView()
        case "lund-browder":     LundBrowderCalculatorView()

        // Risk Scores
        case "mews":             MEWSCalculatorView()
        case "news2":            NEWS2CalculatorView()
        case "qsofa":            QSOFACalculatorView()
        case "sofa":             SOFACalculatorView()
        case "gcs":              GCSCalculatorView()
        case "rass":             RASSCalculatorView()
        case "cam":              CAMCalculatorView()
        case "apgar":            ApgarCalculatorView()
        case "flacc":            FLACCCalculatorView()
        case "ciwa-ar":          CIWAArCalculatorView()
        case "caprini":          CapriniCalculatorView()
        case "morse":            MorseFallCalculatorView()
        case "braden":           BradenCalculatorView()
        case "wells-dvt":        WellsDVTCalculatorView()
        case "padua":            PaduaCalculatorView()
        case "cows":             COWSCalculatorView()
        case "phq9":             PHQ9CalculatorView()
        case "gad7":             GAD7CalculatorView()
        case "mini-cog":         MiniCogCalculatorView()
        case "centor":           CentorCalculatorView()
        case "cam-icu":          CAMICUCalculatorView()
        case "stop-bang":        STOPBANGCalculatorView()
        case "cfs":              ClinicalFrailtyCalculatorView()
        case "abcd2":            ABCD2CalculatorView()
        case "audit-c":          AUDITCCalculatorView()
        case "aldrete":          AldreteScoreCalculatorView()
        case "karnofsky":        KarnofskyCalculatorView()
        case "ecog":             ECOGCalculatorView()
        case "gcs-pupils":       GCSPupilsCalculatorView()
        case "nihss":            NIHSSCalculatorView()
        case "charlson":         CharlsonCalculatorView()
        case "peds-gcs":         PediatricGCSCalculatorView()
        case "lace":             LACEIndexCalculatorView()
        case "pps":              PPSCalculatorView()
        case "apache-2":         APACHE2CalculatorView()
        case "cssrs":            CSSRSCalculatorView()
        case "mrs":              MRSCalculatorView()
        case "hunt-hess":        HuntHessCalculatorView()
        case "ich":              ICHScoreCalculatorView()
        case "asa-ps":           ASAStatusCalculatorView()
        case "mallampati":       MallampatiCalculatorView()
        case "sirs":             SIRSCalculatorView()
        case "westley":          WestleyCroupCalculatorView()
        case "barthel":          BarthelIndexCalculatorView()
        case "bishop":           BishopCalculatorView()
        case "epworth":          EpworthCalculatorView()
        case "audit-full":       AUDITCalculatorView()
        case "apfel":            ApfelCalculatorView()
        case "lawton":           LawtonIADLCalculatorView()
        case "tug":              TUGCalculatorView()
        case "pews":             PEWSCalculatorView()
        case "wfns":             WFNSCalculatorView()
        case "dn4":              DN4CalculatorView()
        case "mdq":              MDQCalculatorView()
        case "poss":             POSSCalculatorView()
        case "bristol":          BristolStoolCalculatorView()
        case "naegele":          NaegeleCalculatorView()
        case "ballard":          BallardCalculatorView()
        case "bhutani":          BhutaniCalculatorView()
        case "push":             PUSHCalculatorView()
        case "esas":             ESASCalculatorView()
        case "tinetti":          TinettiCalculatorView()

        // Anthropometry
        case "bmi":              BMICalculatorView(preset: preset)
        case "bsa":              BSACalculatorView()
        case "ibw":              IBWCalculatorView()
        case "adjbw":            AdjBWCalculatorView()
        case "mifflin":          MifflinStJeorCalculatorView()
        case "whr":              WaistHipRatioCalculatorView()
        case "whtr":             WaistHeightRatioCalculatorView()
        case "pct-wt":           PercentWeightChangeCalculatorView()

        // Conversions
        case "conv-temp":        TemperatureConverterView()
        case "conv-weight":      WeightConverterView()
        case "conv-length":      LengthConverterView()
        case "conv-volume":      VolumeConverterView()
        case "conv-glucose":     GlucoseConverterView()
        case "conv-creatinine":  CreatinineConverterView()
        case "conv-bilirubin":   BilirubinConverterView()
        case "conv-bun-urea":    BUNUreaConverterView()

        default:
            VStack {
                Text("Calculator not found")
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                Text("ID: \(calculatorID)")
                    .font(NMFont.mono)
                    .foregroundStyle(NMColor.textTertiary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(GrainBackground())
        }
    }
}
