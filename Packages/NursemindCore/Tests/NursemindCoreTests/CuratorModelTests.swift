import Foundation
import Testing
@testable import NursemindCore

// Curator-model invariants — these tests fail loudly if any sample drifts toward
// original synthesis (a section with no citation), broken citation references,
// or missing source attribution.

@Suite("Curator-model invariants — drugs")
struct DrugInvariantTests {

    @Test("Norepinephrine sample passes the curator contract")
    func norepiClean() {
        assertDrugCuratorClean(NorepinephrineSample.entry)
    }

    @Test("Heparin sample passes the curator contract")
    func heparinClean() {
        assertDrugCuratorClean(HeparinSample.entry)
    }

    @Test("Insulin regular passes the curator contract")
    func insulinClean() {
        assertDrugCuratorClean(InsulinRegularSample.entry)
    }

    @Test("Morphine passes the curator contract")
    func morphineClean() {
        assertDrugCuratorClean(MorphineSample.entry)
    }

    @Test("Furosemide passes the curator contract")
    func furosemideClean() {
        assertDrugCuratorClean(FurosemideSample.entry)
    }

    @Test("Every high-alert drug cites ISMP")
    func highAlertCitesIsmp() {
        let highAlertDrugs = ContentRegistry.shared.entries(in: .drug).compactMap { entry -> DrugEntry? in
            if case .drug(let d) = entry, d.isHighAlert { return d } else { return nil }
        }
        for drug in highAlertDrugs {
            let ismpSources = drug.citations.filter { $0.id.contains("ismp") }
            #expect(!ismpSources.isEmpty, "High-alert drug \(drug.title) does not cite ISMP")
        }
    }
}

@Suite("Curator-model invariants — labs")
struct LabInvariantTests {

    @Test("All lab samples have at least one reference range row")
    func referenceRangesPresent() {
        let labs: [LabEntry] = [
            LactateSample.entry, PotassiumSample.entry,
            TroponinSample.entry, GlucoseSample.entry
        ]
        for lab in labs {
            #expect(!lab.referenceRanges.isEmpty, "\(lab.title) has no reference ranges")
            for row in lab.referenceRanges {
                #expect(!row.citationIDs.isEmpty, "\(lab.title) range '\(row.value)' has no citation")
            }
        }
    }

    @Test("All lab interpretation tiers cite a source")
    func interpretationsCited() {
        let labs: [LabEntry] = [
            LactateSample.entry, PotassiumSample.entry,
            TroponinSample.entry, GlucoseSample.entry
        ]
        for lab in labs {
            for tier in lab.interpretationTiers {
                #expect(!tier.citationIDs.isEmpty, "\(lab.title) tier '\(tier.label)' has no citation")
            }
        }
    }
}

@Suite("Curator-model invariants — procedures, diagnoses, reference")
struct OtherCategoryInvariantTests {

    @Test("Procedure steps are numbered consecutively from 1")
    func procedureStepsConsecutive() {
        let procedures: [ProcedureEntry] = [
            IVInsertionSample.entry, HandHygieneSample.entry, FoleyInsertionSample.entry
        ]
        for proc in procedures {
            for (idx, step) in proc.steps.enumerated() {
                #expect(step.number == idx + 1, "\(proc.title) step \(idx) numbered \(step.number)")
                #expect(!step.citationIDs.isEmpty, "\(proc.title) step \(step.number) uncited")
            }
        }
    }

    @Test("Every diagnosis cites its definition")
    func diagnosesCiteDefinitions() {
        let diagnoses: [DiagnosisEntry] = [
            SepsisSample.entry, DKASample.entry, MISample.entry
        ]
        for dx in diagnoses {
            #expect(!dx.definition.citationIDs.isEmpty, "\(dx.title) definition has no citation")
        }
    }

    @Test("Reference entries have at least one section")
    func referenceEntriesNonEmpty() {
        let refs: [ReferenceEntry] = [
            IsolationPrecautionsSample.entry, SBARSample.entry
        ]
        for ref in refs {
            #expect(!ref.sections.isEmpty, "\(ref.title) has no sections")
        }
    }
}

@Suite("ContentRegistry behavior")
struct RegistryTests {

    @Test("Registry indexes all bundled entries by ID")
    func allEntriesIndexed() {
        let registry = ContentRegistry.shared
        for entry in registry.all {
            #expect(registry.entry(byID: entry.id)?.id == entry.id)
        }
    }

    @Test("Registry sorts entries alphabetically by title")
    func entriesAlphabetical() {
        let registry = ContentRegistry.shared
        let titles = registry.all.map(\.title)
        let sorted = titles.sorted { $0.localizedCaseInsensitiveCompare($1) == .orderedAscending }
        #expect(titles == sorted)
    }

    @Test("Search finds Norepinephrine by prefix")
    func searchPrefixMatch() {
        let results = ContentRegistry.shared.search("norepi")
        #expect(results.contains { $0.title == "Norepinephrine" })
    }

    @Test("Search finds Lactate by full word")
    func searchFullWord() {
        let results = ContentRegistry.shared.search("lactate")
        #expect(results.contains { $0.title == "Lactate" })
    }

    @Test("Empty query returns no results")
    func emptyQuery() {
        #expect(ContentRegistry.shared.search("").isEmpty)
        #expect(ContentRegistry.shared.search("   ").isEmpty)
    }

    @Test("Question-shape detector recognizes interrogatives")
    func questionDetector() {
        #expect(ContentRegistry.looksLikeQuestion("How do I titrate norepi?"))
        #expect(ContentRegistry.looksLikeQuestion("when to call rapid response"))
        #expect(!ContentRegistry.looksLikeQuestion("norepi"))
        #expect(!ContentRegistry.looksLikeQuestion("lactate"))
    }

    @Test("Categories are present in expected order")
    func categoriesOrdered() {
        let order = ContentRegistry.shared.allCategories.map(\.rawValue)
        #expect(order == ["drug", "drip", "lab", "procedure", "diagnosis", "scenario", "communication", "reference"])
    }
}

// MARK: - Helpers

func assertDrugCuratorClean(_ drug: DrugEntry) {
    let knownIDs = Set(drug.citations.map(\.id))
    var allCited: [String] = []
    allCited.append(contentsOf: drug.indications.citationIDs)
    allCited.append(contentsOf: drug.mechanism.citationIDs)
    allCited.append(contentsOf: drug.dosing.flatMap(\.citationIDs))
    allCited.append(contentsOf: drug.contraindications?.citationIDs ?? [])
    allCited.append(contentsOf: drug.warnings.flatMap(\.citationIDs))
    allCited.append(contentsOf: drug.adverseReactions.citationIDs)
    allCited.append(contentsOf: drug.drugInteractions.flatMap(\.citationIDs))
    allCited.append(contentsOf: drug.nursingImplications?.flatMap(\.citationIDs) ?? [])
    allCited.append(contentsOf: drug.patientTeaching?.citationIDs ?? [])

    #expect(!drug.indications.citationIDs.isEmpty, "\(drug.title) indications uncited")
    #expect(!drug.mechanism.citationIDs.isEmpty, "\(drug.title) mechanism uncited")
    #expect(!drug.adverseReactions.citationIDs.isEmpty, "\(drug.title) adverse reactions uncited")
    for block in drug.dosing {
        #expect(!block.citationIDs.isEmpty, "\(drug.title) dosing block '\(block.label)' uncited")
    }
    for warn in drug.warnings {
        #expect(!warn.citationIDs.isEmpty, "\(drug.title) warning uncited: \(warn.text)")
    }
    for cited in allCited {
        #expect(knownIDs.contains(cited), "\(drug.title): citation '\(cited)' is not in citations list")
    }
    for source in drug.citations {
        #expect(!source.shortName.isEmpty)
        #expect(!source.url.isEmpty)
        #expect(!source.lastRetrieved.isEmpty)
    }
}
