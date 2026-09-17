import Foundation

extension ContentRegistry {
    static func bundledMedlinePlusReferences() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(contentsOf: bundledMedlinePlusOncologyGenetics())
        entries.append(contentsOf: bundledMedlinePlusNeurologySensory())
        entries.append(contentsOf: bundledMedlinePlusMentalBehavioral())
        entries.append(contentsOf: bundledMedlinePlusGastrointestinal())
        entries.append(contentsOf: bundledMedlinePlusReproductive())
        entries.append(contentsOf: bundledMedlinePlusInfectiousDisease())
        entries.append(contentsOf: bundledMedlinePlusEndocrineMetabolic())
        entries.append(contentsOf: bundledMedlinePlusRenalUrinary())
        entries.append(contentsOf: bundledMedlinePlusHematology())
        entries.append(contentsOf: bundledMedlinePlusCardiopulmonaryImaging())
        entries.append(contentsOf: bundledMedlinePlusAllergyRheumatology())
        entries.append(contentsOf: bundledMedlinePlusDiagnosticPreparation())
        entries.append(contentsOf: bundledMedlinePlusPediatricFamilyScreening())
        entries.append(contentsOf: bundledMedlinePlusGeneticConditions())
        return entries
    }

    private static func bundledMedlinePlusOncologyGenetics() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusBcrAbl1GeneticTestSample.entry))
        entries.append(.reference(MedlinePlusBeta2MicroglobulinB2mTumorMarkerTestSample.entry))
        entries.append(.reference(MedlinePlusBrafGeneticTestSample.entry))
        entries.append(.reference(MedlinePlusBrcaTestSample.entry))
        entries.append(.reference(MedlinePlusBreastBiopsySample.entry))
        entries.append(.reference(MedlinePlusEstrogenReceptorProgesteroneReceptorTestsSample.entry))
        entries.append(.reference(MedlinePlusFreeLightChainsSample.entry))
        entries.append(.reference(MedlinePlusHer2TumorMarkerTestSample.entry))
        entries.append(.reference(MedlinePlusLungCancerGeneticTestsSample.entry))
        entries.append(.reference(MedlinePlusPdl1ImmunotherapyTestsSample.entry))
        entries.append(.reference(MedlinePlusPtenGeneticTestSample.entry))
        entries.append(.reference(MedlinePlusSentinelLymphNodeBiopsySample.entry))
        entries.append(.reference(MedlinePlusThyroglobulinSample.entry))
        entries.append(.reference(MedlinePlusTp53GeneticTestSample.entry))
        entries.append(.reference(MedlinePlusPharmacogeneticTestsSample.entry))
        return entries
    }

    private static func bundledMedlinePlusNeurologySensory() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusAutonomicTestingSample.entry))
        entries.append(.reference(MedlinePlusBalanceTestsSample.entry))
        entries.append(.reference(MedlinePlusCognitiveTestingSample.entry))
        entries.append(.reference(MedlinePlusConcussionTestsSample.entry))
        entries.append(.reference(MedlinePlusElectromyographyEmgAndNerveConductionStudiesSample.entry))
        entries.append(.reference(MedlinePlusHearingTestsForAdultsSample.entry))
        entries.append(.reference(MedlinePlusMyastheniaGravisTestsSample.entry))
        entries.append(.reference(MedlinePlusMyelographySample.entry))
        entries.append(.reference(MedlinePlusVideonystagmographyVngSample.entry))
        entries.append(.reference(MedlinePlusSleepStudySample.entry))
        entries.append(.reference(MedlinePlusGlaucomaTestsSample.entry))
        entries.append(.reference(MedlinePlusCsfImmunoglobulinGIggIndexSample.entry))
        entries.append(.reference(MedlinePlusFallRiskAssessmentSample.entry))
        entries.append(.reference(MedlinePlusVisionScreeningSample.entry))
        return entries
    }

    private static func bundledMedlinePlusMentalBehavioral() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusAdhdScreeningSample.entry))
        entries.append(.reference(MedlinePlusAlcoholUseScreeningTestsSample.entry))
        entries.append(.reference(MedlinePlusDepressionScreeningSample.entry))
        entries.append(.reference(MedlinePlusMentalHealthScreeningSample.entry))
        entries.append(.reference(MedlinePlusObsessiveCompulsiveDisorderOcdTestSample.entry))
        entries.append(.reference(MedlinePlusPanicDisorderTestSample.entry))
        entries.append(.reference(MedlinePlusSuicideRiskScreeningSample.entry))
        entries.append(.reference(MedlinePlusHowToCopeWithMedicalTestAnxietySample.entry))
        return entries
    }

    private static func bundledMedlinePlusGastrointestinal() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusAnoscopySample.entry))
        entries.append(.reference(MedlinePlusAppendicitisTestsSample.entry))
        entries.append(.reference(MedlinePlusBariumSwallowSample.entry))
        entries.append(.reference(MedlinePlusCalprotectinStoolTestSample.entry))
        entries.append(.reference(MedlinePlusChymotrypsinInStoolSample.entry))
        entries.append(.reference(MedlinePlusColorectalCancerScreeningTestsSample.entry))
        entries.append(.reference(MedlinePlusElastographySample.entry))
        entries.append(.reference(MedlinePlusEsophagealPhTestSample.entry))
        entries.append(.reference(MedlinePlusFecalOccultBloodTestFobtSample.entry))
        entries.append(.reference(MedlinePlusGastricEmptyingTestsSample.entry))
        entries.append(.reference(MedlinePlusLactoseToleranceTestsSample.entry))
        entries.append(.reference(MedlinePlusOvaAndParasiteTestSample.entry))
        entries.append(.reference(MedlinePlusStoolElastaseSample.entry))
        entries.append(.reference(MedlinePlusWhiteBloodCellWbcInStoolSample.entry))
        entries.append(.reference(MedlinePlusXyloseTestingSample.entry))
        entries.append(.reference(MedlinePlusHelicobacterPyloriHPyloriTestsSample.entry))
        return entries
    }

    private static func bundledMedlinePlusReproductive() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusAmniocentesisAmnioticFluidTestSample.entry))
        entries.append(.reference(MedlinePlusBacterialVaginosisTestSample.entry))
        entries.append(.reference(MedlinePlusChlamydiaTestSample.entry))
        entries.append(.reference(MedlinePlusChorionicVillusSamplingCvsSample.entry))
        entries.append(.reference(MedlinePlusColposcopySample.entry))
        entries.append(.reference(MedlinePlusEstrogenLevelsTestSample.entry))
        entries.append(.reference(MedlinePlusFollicleStimulatingHormoneFshLevelsTestSample.entry))
        entries.append(.reference(MedlinePlusGonorrheaTestSample.entry))
        entries.append(.reference(MedlinePlusHumanPapillomavirusHpvTestSample.entry))
        entries.append(.reference(MedlinePlusHysteroscopySample.entry))
        entries.append(.reference(MedlinePlusLuteinizingHormoneLhLevelsTestSample.entry))
        entries.append(.reference(MedlinePlusPapSmearSample.entry))
        entries.append(.reference(MedlinePlusPrenatalCellFreeDnaScreeningSample.entry))
        entries.append(.reference(MedlinePlusPrenatalPanelSample.entry))
        entries.append(.reference(MedlinePlusProgesteroneTestSample.entry))
        entries.append(.reference(MedlinePlusSemenAnalysisSample.entry))
        entries.append(.reference(MedlinePlusSexuallyTransmittedInfectionStiTestsSample.entry))
        entries.append(.reference(MedlinePlusShbgBloodTestSample.entry))
        entries.append(.reference(MedlinePlusTrichomoniasisTestSample.entry))
        return entries
    }

    private static func bundledMedlinePlusInfectiousDisease() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusAntibioticSensitivityTestSample.entry))
        entries.append(.reference(MedlinePlusAntibodySerologyTestsSample.entry))
        entries.append(.reference(MedlinePlusBacteriaCultureTestSample.entry))
        entries.append(.reference(MedlinePlusChickenpoxAndShinglesTestsSample.entry))
        entries.append(.reference(MedlinePlusDengueFeverTestSample.entry))
        entries.append(.reference(MedlinePlusFluInfluenzaTestSample.entry))
        entries.append(.reference(MedlinePlusFungalCultureTestSample.entry))
        entries.append(.reference(MedlinePlusGramStainSample.entry))
        entries.append(.reference(MedlinePlusHepatitisTestingSample.entry))
        entries.append(.reference(MedlinePlusHerpesHsvTestSample.entry))
        entries.append(.reference(MedlinePlusLegionellaTestsSample.entry))
        entries.append(.reference(MedlinePlusLymeDiseaseTestsSample.entry))
        entries.append(.reference(MedlinePlusMeaslesAndMumpsTestsSample.entry))
        entries.append(.reference(MedlinePlusMeningococcalDiseaseTestsSample.entry))
        entries.append(.reference(MedlinePlusMononucleosisMonoTestsSample.entry))
        entries.append(.reference(MedlinePlusMrsaTestsSample.entry))
        entries.append(.reference(MedlinePlusNasalSwabSample.entry))
        entries.append(.reference(MedlinePlusParainfluenzaTestsSample.entry))
        entries.append(.reference(MedlinePlusPcrTestsSample.entry))
        entries.append(.reference(MedlinePlusPneumococcalDiseaseTestsSample.entry))
        entries.append(.reference(MedlinePlusRapidTestsSample.entry))
        entries.append(.reference(MedlinePlusRespiratoryPathogensPanelSample.entry))
        entries.append(.reference(MedlinePlusRespiratorySyncytialVirusRsvTestsSample.entry))
        entries.append(.reference(MedlinePlusWhoopingCoughDiagnosisSample.entry))
        entries.append(.reference(MedlinePlusYeastInfectionTestsSample.entry))
        entries.append(.reference(MedlinePlusZikaVirusTestSample.entry))
        entries.append(.reference(MedlinePlusCytomegalovirusCmvTestsSample.entry))
        return entries
    }

    private static func bundledMedlinePlusEndocrineMetabolic() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusAdrenocorticotropicHormoneActhSample.entry))
        entries.append(.reference(MedlinePlusAlkalinePhosphataseSample.entry))
        entries.append(.reference(MedlinePlusAmylaseTestSample.entry))
        entries.append(.reference(MedlinePlusCalcitoninTestSample.entry))
        entries.append(.reference(MedlinePlusColdStimulationTestSample.entry))
        entries.append(.reference(MedlinePlusDheaSulfateTestSample.entry))
        entries.append(.reference(MedlinePlusDiabetesTestsSample.entry))
        entries.append(.reference(MedlinePlusDiabeticFootExamSample.entry))
        entries.append(.reference(MedlinePlusGammaGlutamylTransferaseGgtTestSample.entry))
        entries.append(.reference(MedlinePlusGlobulinTestSample.entry))
        entries.append(.reference(MedlinePlusGlucagonBloodTestSample.entry))
        entries.append(.reference(MedlinePlusGrowthHormoneTestsSample.entry))
        entries.append(.reference(MedlinePlusImmunoglobulinsBloodTestSample.entry))
        entries.append(.reference(MedlinePlusInsulinInBloodSample.entry))
        entries.append(.reference(MedlinePlusProlactinLevelsSample.entry))
        entries.append(.reference(MedlinePlus17HydroxyprogesteroneSample.entry))
        return entries
    }

    private static func bundledMedlinePlusRenalUrinary() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusBilirubinInUrineSample.entry))
        entries.append(.reference(MedlinePlusBloodInUrineSample.entry))
        entries.append(.reference(MedlinePlusCalciumInUrineTestSample.entry))
        entries.append(.reference(MedlinePlusCrystalsInUrineSample.entry))
        entries.append(.reference(MedlinePlusEpithelialCellsInUrineSample.entry))
        entries.append(.reference(MedlinePlusGlucoseInUrineTestSample.entry))
        entries.append(.reference(MedlinePlusIntravenousPyelogramIvpSample.entry))
        entries.append(.reference(MedlinePlusKetonesInUrineSample.entry))
        entries.append(.reference(MedlinePlusKidneyStoneAnalysisSample.entry))
        entries.append(.reference(MedlinePlusMucusInUrineSample.entry))
        entries.append(.reference(MedlinePlusNitritesInUrineSample.entry))
        entries.append(.reference(MedlinePlusPhosphateInUrineSample.entry))
        entries.append(.reference(MedlinePlusUrobilinogenInUrineSample.entry))
        return entries
    }

    private static func bundledMedlinePlusHematology() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusBloodDifferentialSample.entry))
        entries.append(.reference(MedlinePlusCoagulationFactorTestsSample.entry))
        entries.append(.reference(MedlinePlusG6pdTestSample.entry))
        entries.append(.reference(MedlinePlusHemoglobinElectrophoresisSample.entry))
        entries.append(.reference(MedlinePlusLactateDehydrogenaseLdhIsoenzymesTestSample.entry))
        entries.append(.reference(MedlinePlusMcvMeanCorpuscularVolumeSample.entry))
        entries.append(.reference(MedlinePlusMpvBloodTestSample.entry))
        entries.append(.reference(MedlinePlusPorphyrinTestsSample.entry))
        entries.append(.reference(MedlinePlusProteinCAndProteinSTestsSample.entry))
        entries.append(.reference(MedlinePlusRdwRedCellDistributionWidthSample.entry))
        entries.append(.reference(MedlinePlusRedBloodCellRbcCountSample.entry))
        entries.append(.reference(MedlinePlusRedBloodCellRbcIndicesSample.entry))
        entries.append(.reference(MedlinePlusRedBloodCellAntibodyScreenSample.entry))
        entries.append(.reference(MedlinePlusBoneMarrowTestsSample.entry))
        return entries
    }

    private static func bundledMedlinePlusCardiopulmonaryImaging() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusDopplerUltrasoundSample.entry))
        entries.append(.reference(MedlinePlusEchocardiographySample.entry))
        entries.append(.reference(MedlinePlusFluoroscopySample.entry))
        entries.append(.reference(MedlinePlusHeartDiseaseRiskAssessmentSample.entry))
        entries.append(.reference(MedlinePlusLipoproteinABloodTestSample.entry))
        entries.append(.reference(MedlinePlusPetScanSample.entry))
        entries.append(.reference(MedlinePlusPleuralFluidAnalysisSample.entry))
        entries.append(.reference(MedlinePlusStressTestsSample.entry))
        entries.append(.reference(MedlinePlusSonogramSample.entry))
        entries.append(.reference(MedlinePlusVqScanSample.entry))
        entries.append(.reference(MedlinePlusLaparoscopySample.entry))
        return entries
    }

    private static func bundledMedlinePlusAllergyRheumatology() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusAllergySkinTestSample.entry))
        entries.append(.reference(MedlinePlusAutoantibodyTestingSample.entry))
        entries.append(.reference(MedlinePlusFoodAllergyTestingSample.entry))
        entries.append(.reference(MedlinePlusSmoothMuscleAntibodySmaTestSample.entry))
        entries.append(.reference(MedlinePlusSynovialFluidAnalysisSample.entry))
        return entries
    }

    private static func bundledMedlinePlusDiagnosticPreparation() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusAtHomeMedicalTestsSample.entry))
        entries.append(.reference(MedlinePlusBasicMetabolicPanelBmpSample.entry))
        entries.append(.reference(MedlinePlusCompleteBloodCountCbcSample.entry))
        entries.append(.reference(MedlinePlusComprehensiveMetabolicPanelCmpSample.entry))
        entries.append(.reference(MedlinePlusDentalExamSample.entry))
        entries.append(.reference(MedlinePlusDifferentialDiagnosisSample.entry))
        entries.append(.reference(MedlinePlusElectrolytePanelSample.entry))
        entries.append(.reference(MedlinePlusHeavyMetalTestingSample.entry))
        entries.append(.reference(MedlinePlusSkinCancerScreeningSample.entry))
        entries.append(.reference(MedlinePlusVitaminETocopherolTestSample.entry))
        entries.append(.reference(MedlinePlusObesityScreeningSample.entry))
        entries.append(.reference(MedlinePlusOpioidTestingSample.entry))
        entries.append(.reference(MedlinePlusTricyclicAntidepressantTcaScreenSample.entry))
        return entries
    }

    private static func bundledMedlinePlusPediatricFamilyScreening() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusAutismSpectrumDisorderAsdScreeningSample.entry))
        entries.append(.reference(MedlinePlusDevelopmentalAndBehavioralScreeningTestsSample.entry))
        entries.append(.reference(MedlinePlusDownSyndromeTestsSample.entry))
        entries.append(.reference(MedlinePlusFetalAlcoholSpectrumDisordersFasdScreeningSample.entry))
        entries.append(.reference(MedlinePlusHearingTestsForChildrenSample.entry))
        entries.append(.reference(MedlinePlusHowToPrepareYourChildForALabTestSample.entry))
        entries.append(.reference(MedlinePlusGalactosemiaTestsSample.entry))
        entries.append(.reference(MedlinePlusPhenylketonuriaPkuScreeningSample.entry))
        entries.append(.reference(MedlinePlusCordBloodTestingAndBankingSample.entry))
        entries.append(.reference(MedlinePlusPostpartumDepressionScreeningSample.entry))
        return entries
    }

    private static func bundledMedlinePlusGeneticConditions() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(MedlinePlusAlportSyndromeSample.entry))
        entries.append(.reference(MedlinePlusFabryDiseaseSample.entry))
        entries.append(.reference(MedlinePlusGaucherDiseaseSample.entry))
        entries.append(.reference(MedlinePlusPompeDiseaseSample.entry))
        entries.append(.reference(MedlinePlusSpinalMuscularAtrophySample.entry))
        entries.append(.reference(MedlinePlusMyotonicDystrophySample.entry))
        entries.append(.reference(MedlinePlusCharcotMarieToothDiseaseSample.entry))
        entries.append(.reference(MedlinePlusFriedreichAtaxiaSample.entry))
        entries.append(.reference(MedlinePlusTuberousSclerosisComplexSample.entry))
        entries.append(.reference(MedlinePlusNeurofibromatosisType1Sample.entry))
        entries.append(.reference(MedlinePlusOsteogenesisImperfectaSample.entry))
        entries.append(.reference(MedlinePlusEhlersDanlosSyndromeSample.entry))
        entries.append(.reference(MedlinePlusNoonanSyndromeSample.entry))
        entries.append(.reference(MedlinePlusWilliamsSyndromeSample.entry))
        entries.append(.reference(MedlinePlusPraderWilliSyndromeSample.entry))
        entries.append(.reference(MedlinePlusAngelmanSyndromeSample.entry))
        entries.append(.reference(MedlinePlusFragileXSyndromeSample.entry))
        entries.append(.reference(MedlinePlusRettSyndromeSample.entry))
        entries.append(.reference(MedlinePlus22q112DeletionSyndromeSample.entry))
        entries.append(.reference(MedlinePlusAchondroplasiaSample.entry))
        entries.append(.reference(MedlinePlusKlinefelterSyndromeSample.entry))
        entries.append(.reference(MedlinePlusPhenylketonuriaSample.entry))
        entries.append(.reference(MedlinePlusGalactosemiaSample.entry))
        entries.append(.reference(MedlinePlusMediumChainAcylCoaDehydrogenaseDeficiencySample.entry))
        entries.append(.reference(MedlinePlusMapleSyrupUrineDiseaseSample.entry))
        entries.append(.reference(MedlinePlusOrnithineTranscarbamylaseDeficiencySample.entry))
        entries.append(.reference(MedlinePlusHereditaryHemorrhagicTelangiectasiaSample.entry))
        entries.append(.reference(MedlinePlusVonHippelLindauSyndromeSample.entry))
        entries.append(.reference(MedlinePlusLynchSyndromeSample.entry))
        entries.append(.reference(MedlinePlusFamilialAdenomatousPolyposisSample.entry))
        entries.append(.reference(MedlinePlusLiFraumeniSyndromeSample.entry))
        entries.append(.reference(MedlinePlusPrimaryCiliaryDyskinesiaSample.entry))
        entries.append(.reference(MedlinePlusNeurofibromatosisType2Sample.entry))
        entries.append(.reference(MedlinePlusUsherSyndromeSample.entry))
        return entries
    }

}
