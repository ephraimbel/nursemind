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
        guard let m = map, let i = icp, m > 0 else { return nil }
        return m - i
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

// MARK: - ARDSNet Predicted Body Weight + Tidal Volume Range

public struct ARDSNetTidalVolumeCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "ardsnet-vt", key: "ht") private var heightCm
    @CalcPersistedRawValue<SexOption>(calculatorID: "ardsnet-vt", key: "sex") private var sex

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
            title: "Tidal Volume · PBW",
            subtitle: "ARDSNet predicted body weight + published mL/kg range"
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
                interpretation: "PBW uses height and sex — not actual weight. Tidal volume set from actual weight overestimates lung size in most adults.",
                level: .neutral
            )
            if let pbw {
                CalculatorSection("PUBLISHED ARDSNET RANGE") {
                    VStack(spacing: 0) {
                        mlPerKgRow(4, pbw: pbw)
                        Hairline(color: NMColor.borderSubtle)
                        mlPerKgRow(6, pbw: pbw)
                        Hairline(color: NMColor.borderSubtle)
                        mlPerKgRow(8, pbw: pbw)
                    }
                }
            }
            CalculatorFormulaSection(
                formula: "Men:   PBW = 50 + 0.91 × (height cm − 152.4)\nWomen: PBW = 45.5 + 0.91 × (height cm − 152.4)",
                notes: "The ARDSNet ARMA trial protocol published an initial tidal volume of 6 mL/kg PBW with a 4–8 mL/kg range, titrated against plateau pressure. Ventilator settings are ordered by the provider and adjusted by respiratory therapy — this tool shows the published reference math only.",
                citations: [ardsnetARMA, nhlbiARDSNet]
            )
        }
    }

    private func mlPerKgRow(_ mlPerKg: Double, pbw: Double) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Text("\(Int(mlPerKg)) mL/kg PBW")
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textSecondary)
            Spacer()
            Text(String(format: "%.0f", mlPerKg * pbw))
                .font(NMFont.monoXL)
                .foregroundStyle(NMColor.textPrimary)
            Text("mL")
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.vertical, NMSpace.md)
    }
}
