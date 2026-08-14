import SwiftUI

// MARK: - Shared citation sources

private let btfGuidelines = CitationSource(
    id: "btf_tbi_4th_2017",
    shortName: "Brain Trauma Foundation — Guidelines for the Management of Severe TBI, 4th ed (concept citation)",
    detail: "Carney N et al. Neurosurgery 2017 — CPP target 60–70 mmHg",
    publisher: "Brain Trauma Foundation",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/27654000/",
    lastRetrieved: "2026-07-02"
)

private let openrnNeuro = CitationSource(
    id: "openrn_neuro_tools",
    shortName: "Open RN Health Alterations — Neurological chapters",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=intracranial+pressure",
    lastRetrieved: "2026-07-02"
)

private let ardsnetARMA = CitationSource(
    id: "ardsnet_arma_2000",
    shortName: "ARDSNet ARMA trial — NEJM 2000 (concept citation)",
    detail: "Ventilation with lower tidal volumes for acute lung injury and ARDS",
    publisher: "New England Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/10793162/",
    lastRetrieved: "2026-07-02"
)

private let nhlbiARDSNet = CitationSource(
    id: "nhlbi_ardsnet_protocol",
    shortName: "NIH NHLBI ARDS Network — Mechanical Ventilation Protocol Summary",
    publisher: "NIH · National Heart, Lung, and Blood Institute",
    license: .factCitationOnly,
    url: "http://www.ardsnet.org/files/ventilator_protocol_2008-07.pdf",
    lastRetrieved: "2026-07-02"
)

// MARK: - Cerebral Perfusion Pressure

public struct CPPCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "cpp", key: "map") private var map
    @CalcPersistedDouble(calculatorID: "cpp", key: "icp") private var icp

    private var result: Double? {
        guard let m = map, let i = icp else { return nil }
        return ClinicalFormula.cerebralPerfusionPressure(map: m, icp: i)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r < 60 {
            return ("CPP < 60 mmHg — below the Brain Trauma Foundation guideline target range (60–70 mmHg) for severe TBI.", .alert)
        }
        if r > 100 {
            return ("CPP > 100 mmHg — above the range typically described in published guidelines.", .caution)
        }
        return ("Within the range described by BTF guidelines (target 60–70 mmHg in severe TBI).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "CPP",
            subtitle: "Cerebral perfusion pressure"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "MAP", unit: "mmHg", value: $map)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "ICP", unit: "mmHg", value: $icp)
            }
            CalculatorResultDisplay(
                label: "CPP",
                value: result.map { String(format: "%.0f", $0) },
                unit: "mmHg",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral,
                scale: ResultScale(from: 30, bands: [
                    .init(upTo: 60, .alert),
                    .init(upTo: 100, .neutral),
                    .init(upTo: 130, .caution)
                ]),
                scaleValue: result
            )
            CalculatorFormulaSection(
                formula: "CPP = MAP − ICP",
                notes: "Requires an invasive ICP monitor (EVD or parenchymal). Transducer leveling convention (tragus vs phlebostatic axis) changes the number — follow the institutional standard. BTF 4th-edition guidelines describe a CPP target of 60–70 mmHg in severe TBI; the care team sets the patient-specific goal.",
                citations: [btfGuidelines, openrnNeuro]
            )
        }
    }
}

// MARK: - Predicted Body Weight

public struct PredictedBodyWeightCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "pbw", key: "ht") private var heightCm
    @CalcPersistedRawValue<SexOption>(calculatorID: "pbw", key: "sex") private var sex

    enum SexOption: String, CaseIterable, Identifiable {
        case female, male
        var id: String { rawValue }
        var display: String { rawValue.capitalized }
    }

    private var pbw: Double? {
        guard let h = heightCm, h > 0, let s = sex else { return nil }
        let base: Double = (s == .male) ? 50.0 : 45.5
        return base + 0.91 * (h - 152.4)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "Predicted Body Weight",
            subtitle: "Height-based estimate"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Height", unit: "cm", value: $heightCm)
                Hairline(color: NMColor.borderSubtle)
                HStack {
                    Text("Sex at birth").font(NMFont.bodyLG)
                    Spacer()
                    Picker("Sex", selection: $sex) {
                        Text("—").tag(SexOption?.none)
                        ForEach(SexOption.allCases) { Text($0.display).tag(SexOption?.some($0)) }
                    }
                    .pickerStyle(.segmented)
                    .frame(maxWidth: 200)
                }
                .padding(.vertical, NMSpace.base)
            }
            CalculatorResultDisplay(
                label: "Predicted body weight",
                value: pbw.map { String(format: "%.1f", $0) },
                unit: "kg",
                interpretation: "PBW uses height and sex — not actual weight — because lung size tracks height, not body mass.",
                level: .neutral
            )
            CalculatorFormulaSection(
                formula: "Men:   PBW = 50 + 0.91 × (height cm − 152.4)\nWomen: PBW = 45.5 + 0.91 × (height cm − 152.4)",
                notes: "PBW is the reference body-weight estimate used across the published critical-care ventilation literature (ARDSNet ARMA). Ventilator settings are ordered by the provider and adjusted by respiratory therapy.",
                citations: [ardsnetARMA, nhlbiARDSNet]
            )
        }
    }
}
