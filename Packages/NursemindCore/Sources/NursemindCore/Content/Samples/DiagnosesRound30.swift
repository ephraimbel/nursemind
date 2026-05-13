import Foundation

// Curator-model diagnosis entries (round 30 — ID depth: HIV opportunistic infections + tropical + chronic viral hepatitis).

private let openrnDxR30 = CitationSource(
    id: "openrn_dx_round30",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR30 = CitationSource(
    id: "cdc_dx_round30",
    shortName: "CDC + NIH treatment guidelines + DHHS concept citations",
    publisher: "CDC · NIH · DHHS",
    license: .publicDomain,
    url: "https://clinicalinfo.hiv.gov/en/guidelines",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR30 = CitationSource(
    id: "specialty_dx_round30",
    shortName: "IDSA + HIVMA + IDSA + AASLD + WHO + ATS concept citations",
    publisher: "IDSA · HIVMA · AASLD · WHO · ATS",
    license: .factCitationOnly,
    url: "https://www.idsociety.org/practice-guideline/",
    lastRetrieved: "2026-05-13"
)

private let oiTagR30 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)
private let fungalTagR30 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let parasiteTagR30 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let hepatitisTagR30 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)

public enum PCPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pneumocystis-pneumonia",
        title: "Pneumocystis jirovecii pneumonia (PCP / PJP)",
        subtitle: "Immunocompromised pneumonia · CD4 <200 (AIDS-defining) · dry cough + dyspnea + ground-glass · TMP-SMX 1st-line + steroids if severe · prophylaxis CD4 <200",
        nclexTags: oiTagR30,
        definition: AttributedProse(
            "Opportunistic pneumonia caused by Pneumocystis jirovecii (formerly P. carinii) — ubiquitous fungus that causes disease in severely immunocompromised — AIDS (CD4 <200), transplant, hematologic malignancy, chronic corticosteroids, biologics, congenital immunodeficiency. AIDS-defining illness. TMP-SMX is first-line treatment + prophylaxis. Adjunct corticosteroids for severe (PaO2 <70 or A-a gradient >35) per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Inhaled or reactivated Pneumocystis jirovecii proliferates in alveoli of immunocompromised hosts → diffuse alveolar damage + inflammation + foamy exudate + impaired gas exchange. Cysts + trophic forms identified by silver stain, immunofluorescence, PCR. Disease severity correlates with degree of immunodeficiency.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("INSIDIOUS onset over days-weeks — DYSPNEA on exertion, DRY nonproductive cough, fatigue, fever (usually moderate), weight loss.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("HYPOXEMIA — pulse ox declines with exertion (early sign) → at rest in advanced; respiratory failure.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CHEST FINDINGS — bilateral diffuse crackles; often LESS prominent than imaging suggests.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("LACTATE DEHYDROGENASE (LDH) elevated >300 IU/L — sensitive but non-specific.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("BETA-D-GLUCAN elevated in serum — sensitive for fungal infection (PCP + other fungi).", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("PNEUMOTHORAX — spontaneous; from cyst rupture; up to ~10% PCP cases.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — HIV/AIDS CD4 <200 (especially CD4 <100), solid organ + hematopoietic stem cell transplant, hematologic malignancy + chemotherapy, chronic corticosteroids (>20 mg prednisone × >4 weeks), biologics (TNF-α inhibitors, rituximab), severe combined immunodeficiency, autoimmune disease on immunosuppression.", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HRCT CHEST — bilateral ground-glass opacities (predominantly perihilar + diffuse); occasionally cystic lesions, nodules, pneumothorax; relatively spared lung apices per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HYPOXEMIA — pulse oximetry on RT exertion (drops >5% with exertion); ABG showing hypoxia + widened A-a gradient.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LDH elevated (>500 sensitive) + beta-D-glucan + fever + weight loss + dyspnea in immunocompromised patient → high suspicion.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("INDUCED SPUTUM — hypertonic saline nebulization → expectorated sputum; silver stain (Gomori methenamine), immunofluorescence stain, PCR for P. jirovecii; sensitivity ~50-90%.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BRONCHOALVEOLAR LAVAGE (BAL) — if induced sputum non-diagnostic; gold standard ~95% sensitivity; same stains + PCR.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("TRANSBRONCHIAL OR OPEN LUNG BIOPSY — rarely needed.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV TESTING — universal if not previously diagnosed; CD4 + viral load + comprehensive workup.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Coinfections — TB, CMV, fungal, bacterial pneumonia; comprehensive workup.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("RESPIRATORY STATUS — pulse ox, oxygen requirement, respiratory rate, work of breathing; severity score.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DISEASE SEVERITY — PaO2 (mild >70, moderate 70-90 difference, severe <70), A-a gradient, clinical; guides need for steroids.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BAL or induced sputum + LFTs + Cr + CBC + electrolytes.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing universal; if positive — CD4 + viral load + resistance + STI screen + comprehensive OI workup.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Isolation — droplet precautions (during induced sputum), private room.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("FIRST-LINE TREATMENT — TMP-SMX (trimethoprim-sulfamethoxazole) — IV or PO depending severity — TMP 15-20 mg/kg/day + SMX 75-100 mg/kg/day divided q6-8 hours × 21 days per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ADJUNCT CORTICOSTEROIDS for moderate-severe disease (PaO2 <70 OR A-a gradient ≥35) — prednisone 40 mg PO BID × 5 days → 40 mg daily × 5 days → 20 mg daily × 11 days OR equivalent IV; reduces mortality + respiratory failure.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ALTERNATIVE — PRIMAQUINE + CLINDAMYCIN — for severe TMP-SMX intolerant (G6PD screen for primaquine).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ALTERNATIVE — IV PENTAMIDINE — for severe; hypotension + hypoglycemia + pancreatitis + QT toxicity; second-line.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ALTERNATIVE — ATOVAQUONE (mild-moderate) + dapsone-trimethoprim — when sulfa intolerant.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV-COINFECTED — START ART within 2 weeks of PCP treatment initiation (avoid earlier = IRIS risk); rapid viral suppression + immune restoration.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SUPPORTIVE — oxygen, mechanical ventilation if severe, ICU; HFNC vs CPAP vs intubation.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PROPHYLAXIS — SECONDARY (after treatment) until CD4 >200 × 3 months on ART; TMP-SMX 1 DS (160/800 mg) PO daily OR 1 DS 3 days/week OR alternatives (dapsone, atovaquone, pentamidine aerosolized).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PRIMARY PROPHYLAXIS in HIV — CD4 <200 OR oropharyngeal candidiasis OR thrush; same regimen; discontinue when CD4 >200 × 3 months on ART.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Transplant prophylaxis — TMP-SMX × 6-12 months post-transplant.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("RESPIRATORY FAILURE → ICU + intubation + mechanical ventilation; mortality high in ICU PCP.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("WORSENING DESPITE STEROIDS — alternative drug regimen + ID consultation; resistance uncommon.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DRUG TOXICITIES — TMP-SMX (severe — SJS/TEN, severe rash, AKI, hyperkalemia, hyponatremia, hepatic, cytopenias).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PRIMAQUINE — G6PD-DEFICIENT hemolysis; mandatory screen.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PENTAMIDINE — hypotension, hypoglycemia / hyperglycemia + diabetes, pancreatitis, QT prolongation.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PNEUMOTHORAX — cyst rupture; emergent chest tube.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("IMMUNE RECONSTITUTION INFLAMMATORY SYNDROME (IRIS) — worsening after ART start; corticosteroids continued; differentiate from worsening PCP.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("COINFECTIONS — TB, CMV, bacterial pneumonia + fungal; comprehensive workup + treatment.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LATE diagnosis = high mortality; early treatment empirically while workup ongoing in high-risk patients.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ToxoplasmosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "toxoplasmosis",
        title: "Toxoplasmosis (CNS + ocular + congenital)",
        subtitle: "T. gondii · AIDS CD4 <100 = CNS reactivation · ring-enhancing brain lesions · pyrimethamine + sulfadiazine + leucovorin · congenital triad",
        nclexTags: parasiteTagR30,
        definition: AttributedProse(
            "Infection by intracellular protozoan Toxoplasma gondii. Acquired by oocyst ingestion (cat litter, undercooked meat, contaminated water). Primary infection — asymptomatic OR mononucleosis-like. Reactivation in immunocompromised (AIDS CD4 <100) → cerebral toxoplasmosis (focal neurologic deficits + ring-enhancing lesions). Ocular — chorioretinitis. Congenital — Sabin tetrad. Treatment — pyrimethamine + sulfadiazine + leucovorin per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Toxoplasma gondii — cats are definitive host (sexual reproduction in cat intestine + oocyst shedding); humans + other mammals are intermediate hosts. Human infection — ingestion of oocysts (cat litter, contaminated produce) OR tissue cysts (undercooked meat) OR transplacental. Bradyzoites in tissue cysts (latent) reactivate when cellular immunity drops → encephalitis + ocular + disseminated.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("CEREBRAL TOXOPLASMOSIS (immunocompromised — AIDS CD4 <100) — subacute headache + fever + focal neurologic deficits (hemiparesis, ataxia, cranial nerve palsies, seizures, aphasia, altered mental status); weeks to months progression.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("OCULAR TOXOPLASMOSIS — chorioretinitis; blurred vision, floaters, eye pain; necrotizing retinal lesions with vitritis; can be congenital or acquired.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CONGENITAL TOXOPLASMOSIS — Sabin tetrad (chorioretinitis, intracranial calcifications, hydrocephalus, convulsions); microcephaly, hepatosplenomegaly, jaundice, rash; mild may be asymptomatic at birth + sequelae years later.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("ACQUIRED in immunocompetent — mostly ASYMPTOMATIC OR mononucleosis-like (fever, lymphadenopathy, fatigue, myalgia, splenomegaly) — self-limited.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("DISSEMINATED in profound immunosuppression — pneumonitis, myocarditis, multi-organ.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — HIV/AIDS (especially CD4 <100), transplant, hematologic malignancy, chemotherapy, congenital (maternal primary infection during pregnancy), cat exposure (litter), undercooked meat consumption.", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BRAIN MRI with contrast — multiple RING-ENHANCING LESIONS (commonly basal ganglia, gray-white junction, posterior fossa) — characteristic but not pathognomonic (differentiate from CNS lymphoma, abscess, metastasis) per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SEROLOGY — Toxoplasma IgG (prior exposure; +/- reactivation) + IgM (recent infection); CD4 <100 + IgG+ + brain lesions = empirical treatment + observe response.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("EMPIRIC TREATMENT TRIAL — pyrimethamine + sulfadiazine + leucovorin × 2-3 weeks; clinical + radiographic improvement supports diagnosis; lack of improvement → biopsy.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BRAIN BIOPSY — for ATYPICAL imaging, NEGATIVE serology, or NON-response to empiric treatment; differentiate from CNS lymphoma.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CSF — may be normal or mild lymphocytic pleocytosis; PCR for Toxoplasma DNA (sensitive but variable specificity).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("OCULAR — chorioretinitis on dilated retinal exam; characteristic lesions; serology supports.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CONGENITAL workup — TORCH testing, head US/CT, ophthalmologic exam, neurodevelopmental.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV TESTING + CD4 + viral load if new diagnosis or unknown status.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("MULTIPLE RING-ENHANCING brain lesions in immunocompromised → TOXOPLASMOSIS empiric treatment + monitor response vs CNS lymphoma.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DIFFERENTIATE FROM CNS LYMPHOMA — solitary vs multiple lesions, response to anti-toxo treatment in 2-3 weeks, biopsy if doubtful, EBV PCR (lymphoma).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV with CD4 <100 — initiate ART after toxo treatment; PCP + MAC prophylaxis.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Pregnancy — primary infection during pregnancy → fetal risk; spiramycin (less teratogen) + monitoring + amniocentesis + pyrimethamine after 1st trimester if confirmed transmission.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Multidisciplinary — ID + neurology + ophthalmology + neurosurgery (biopsy).", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("CEREBRAL TOXOPLASMOSIS treatment — PYRIMETHAMINE 200 mg PO load → 50-75 mg PO daily + SULFADIAZINE 1-1.5 g PO QID + LEUCOVORIN 10-25 mg PO daily × 6 weeks per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ALTERNATIVE — pyrimethamine + clindamycin + leucovorin (sulfa-intolerant); TMP-SMX (alternative); atovaquone-based.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CHRONIC SUPPRESSION — pyrimethamine 25-50 mg + sulfadiazine 500-1000 mg QID + leucovorin 10-25 mg daily; continue until CD4 >200 × 6 months on ART.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CORTICOSTEROIDS — dexamethasone 4-10 mg IV/PO q6 hours for significant edema / mass effect; taper as improvement.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SEIZURE management — anticonvulsants if seizures.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV ART — start after 2-3 weeks of toxo treatment to avoid severe IRIS; continue both lifelong.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PRIMARY PROPHYLAXIS — TMP-SMX 1 DS PO daily for HIV+ with CD4 <100 + IgG+; alternative — atovaquone, dapsone + pyrimethamine + leucovorin.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("OCULAR TOXOPLASMOSIS — same regimen + ocular steroids (delayed); vision threat.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CONGENITAL — pyrimethamine + sulfadiazine + leucovorin × 12 months; ophthalmology + neurology + audiology follow-up.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PREGNANCY — spiramycin 1g PO q8h until confirmed fetal infection; then pyrimethamine + sulfadiazine + leucovorin AFTER 16 weeks.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Counseling on toxo prevention — cat litter avoidance (others do it), cook meat thoroughly, wash produce, gloves for gardening, no raw shellfish.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("MEDICATION TOXICITY — pyrimethamine + sulfa → cytopenias (LEUCOVORIN essential), kidney stones (hydration), SJS, hepatotoxicity.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("FAILURE to respond to empiric treatment in 2-3 weeks → CNS LYMPHOMA workup with biopsy + PET; EBV PCR in CSF.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("INTRACRANIAL EDEMA + mass effect → herniation; steroids + neurosurgery consultation.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("IRIS upon ART initiation — paradoxical worsening; differentiate from disease progression vs drug failure.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("OCULAR — sequelae include vision loss, recurrent chorioretinitis years later.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CONGENITAL — neurodevelopmental delay + visual + hearing sequelae; intensive multidisciplinary follow-up + early intervention.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("RELAPSE — 80% relapse without chronic suppression in immunocompromised; lifelong suppression until immune restoration.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PROPHYLAXIS adherence — discontinuation criteria CD4 >200 × 6 months ART; close follow-up.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CryptococcalMeningitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cryptococcal-meningitis",
        title: "Cryptococcal meningitis",
        subtitle: "C. neoformans · AIDS CD4 <100 + transplant · subacute HA + fever + neuro · ICP HIGH + LP drainage · induction-consolidation-maintenance · CrAg screening",
        nclexTags: fungalTagR30,
        definition: AttributedProse(
            "Subacute fungal meningoencephalitis caused by Cryptococcus neoformans (most common globally) or C. gattii (some endemic areas + immunocompetent). Major OI in HIV/AIDS (CD4 <100), transplant recipients, lymphoma + chronic steroid users. Subacute headache + fever + altered mental status + elevated ICP. CSF cryptococcal antigen (CrAg) + India ink + culture. Treatment — induction (ampho B + flucytosine) → consolidation (fluconazole high-dose) → maintenance (fluconazole) × until CD4 recovery per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Cryptococcus neoformans encapsulated yeast (pigeon droppings, soil) — inhaled → pulmonary infection (often asymptomatic in immunocompetent; granulomatous containment) → hematogenous dissemination to CNS in immunocompromised → meningoencephalitis with diffuse + perivascular inflammation + intracranial pressure elevation (organisms + polysaccharide capsule + inflammation).",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("SUBACUTE meningoencephalitis — headache (~75%), fever (~65%), nausea/vomiting (~55%), altered mental status, behavioral changes; days-weeks onset.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("FOCAL neurologic deficits — cranial nerve palsies (especially II, III, VI), papilledema, hemiparesis, seizures; ELEVATED INTRACRANIAL PRESSURE.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("PHOTOPHOBIA + neck stiffness — moderate; LESS prominent than bacterial meningitis.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("RESPIRATORY — pulmonary cryptococcosis preceding or concurrent (cough, dyspnea, infiltrates).", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CUTANEOUS — umbilicated papules (molluscum-like) in disseminated AIDS cryptococcosis.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("VISUAL — papilledema, decreased visual acuity from ICP elevation; vision loss preventable with ICP management.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — HIV/AIDS (especially CD4 <100), solid organ transplant, hematologic malignancy, chronic high-dose corticosteroids, sarcoidosis, idiopathic CD4 lymphocytopenia, environmental (pigeon droppings); C. gattii from eucalyptus tree areas (Pacific Northwest, Australia).", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CSF CRYPTOCOCCAL ANTIGEN (CrAg) — high sensitivity + specificity; positive in serum + CSF; lateral flow assay rapid; SERUM CrAg also positive in dissemination per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CSF INDIA INK — encapsulated yeast (refractile clear halo around organism); sensitive (~70-90%) but less than CrAg.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CSF CULTURE — confirms + speciates (C. neoformans var. neoformans vs C. neoformans var. gattii); susceptibility for high-grade disease.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CSF analysis — opening pressure HIGH (~70% with OP >250 mm H2O), low glucose, high protein, lymphocytic pleocytosis (variable + can be normal); LARGE opening pressure measurement essential.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SERUM CRYPTOCOCCAL ANTIGEN — screen in HIV+ with CD4 <100 + AIDS-related symptoms or as universal CD4 surveillance; preemptive treatment in CrAg+ no symptoms.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MRI BRAIN — meningeal enhancement, dilated perivascular spaces (Virchow-Robin), cryptococcomas; hydrocephalus.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV TESTING + CD4 + viral load + comprehensive workup.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Differentials — TB meningitis, neurosyphilis, listeriosis, viral encephalitis, lymphoma.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("INTRACRANIAL PRESSURE management EMERGENT — opening pressure >250 mm H2O → REPEAT therapeutic LPs daily until OP <200 mm H2O or symptomatic improvement; some require lumbar drain or VP shunt.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Multidisciplinary — ID + neurology + neurosurgery (shunt) + hospitalist + ophthalmology.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing + ART start timing (delay 4-6 weeks after antifungal induction to avoid severe IRIS).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Transplant recipients — reduce immunosuppression + treat OI.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Serum CrAg surveillance — preemptive treatment.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("INDUCTION (2 weeks) — LIPOSOMAL AMPHOTERICIN B 3-4 mg/kg IV daily + FLUCYTOSINE 100 mg/kg/day PO divided q6 hours × 2 weeks (preferred) OR amphotericin B deoxycholate 0.7-1 mg/kg/day + flucytosine (more nephrotoxic) per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CONSOLIDATION (8 weeks) — FLUCONAZOLE 800 mg PO daily × 8 weeks (after induction completion + clinical improvement).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MAINTENANCE — FLUCONAZOLE 200 mg PO daily; CONTINUE until CD4 >100 × 3 months on ART + asymptomatic + CSF culture negative (typically 1-2 years minimum).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("INTRACRANIAL PRESSURE — REPEAT therapeutic LPs daily until OP <200 mm H2O + symptomatic improvement; some need lumbar drain or VP shunt.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ALTERNATIVE for induction (resource-limited) — high-dose fluconazole 1200 mg PO daily + flucytosine × 2 weeks; less effective than amphotericin-based.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV/AIDS — DELAY ART initiation 4-6 WEEKS after antifungal induction to avoid severe IRIS-mediated death; some protocols sooner but balance.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Transplant — reduce immunosuppression as feasible; combine antifungal + reduce calcineurin inhibitor.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PREEMPTIVE THERAPY — CrAg+ asymptomatic HIV/AIDS — fluconazole 800 mg PO daily × 2 weeks → 400 mg × 8 weeks → 200 mg daily maintenance until immune recovery.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Multidisciplinary care — ID + neurology + IR (LP/shunt) + ophthalmology + pharmacology + nutrition.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("ELEVATED ICP → vision loss, herniation, death — aggressive LP drainage; ophthalmology + neurology coordination.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("AMPHOTERICIN B TOXICITY — nephrotoxicity (Cr, K+, Mg++), infusion reactions, fever, hypokalemia, hypomagnesemia, anemia; liposomal less toxic; pre-medicate diphenhydramine + acetaminophen; hydrate.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("FLUCYTOSINE TOXICITY — bone marrow suppression, hepatotoxicity, GI; monitor levels (target peak 50-100 mcg/mL).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("FLUCONAZOLE-related — hepatotoxicity, QT prolongation, drug interactions.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("IRIS upon ART start — paradoxical worsening neurologic + meningeal symptoms; corticosteroids + supportive; differentiate from treatment failure.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("TREATMENT FAILURE — refractory disease; check culture + susceptibility; high-dose / dual antifungal + ID specialist; mortality high.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MORTALITY — high without treatment (~100%); even with treatment ~10-30% in resource-rich + ~50-70% in resource-limited.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LONG-TERM neurologic sequelae — cognitive impairment, cranial nerve deficits, vision loss; intensive rehabilitation.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DisseminatedHistoplasmosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "disseminated-histoplasmosis",
        title: "Disseminated histoplasmosis",
        subtitle: "Mississippi/Ohio River valley + Latin America · AIDS CD4 <100 · fever + pancytopenia + hepatosplenomegaly + Addison-like · ampho B → itraconazole",
        nclexTags: fungalTagR30,
        definition: AttributedProse(
            "Disseminated disease from Histoplasma capsulatum dimorphic fungus — endemic in Mississippi + Ohio River valleys (US), Latin America, Caribbean, parts of Africa + Southeast Asia. Acquired by inhalation of soil contaminated with bird + bat droppings. Most infections asymptomatic in immunocompetent; disseminated disease in immunocompromised (AIDS CD4 <100, transplant, biologics) — fever, hepatosplenomegaly, pancytopenia, Addison-like adrenal insufficiency, oropharyngeal ulcers, skin lesions. Treatment — liposomal amphotericin induction → itraconazole maintenance per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Histoplasma capsulatum thermally dimorphic fungus — environmental MYCELIA form in soil produce microconidia (infectious) → inhaled → convert to YEAST form in lungs at body temperature → phagocytosed by macrophages → multiply intracellularly → dissemination via lymphatics + blood. Granulomatous response controls in immunocompetent; uncontrolled dissemination in immunocompromised → multi-organ involvement.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("FEVER — chronic, non-specific; weeks-months onset.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("HEPATOSPLENOMEGALY + lymphadenopathy.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("PANCYTOPENIA — anemia, leukopenia, thrombocytopenia from bone marrow involvement.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("ADRENAL INSUFFICIENCY — addisonian features (fatigue, hypotension, hyperpigmentation, hyperkalemia, hyponatremia) from adrenal granulomas.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("OROPHARYNGEAL ULCERS — characteristic painless deep ulcers; biopsy yields organisms.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CUTANEOUS — papules + ulcers + erythema nodosum + multiforme.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CARDIAC — endocarditis, pericarditis, mediastinal fibrosis (chronic).", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("PULMONARY — pneumonitis (acute), cavitary disease + granulomas + calcifications (chronic), often coexists with dissemination.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CNS — meningitis, focal lesions (less common but morbid).", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("GI — diarrhea, mucosal lesions, perforation.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — endemic exposure (Mississippi + Ohio River valleys, Latin America, Caribbean, bird/bat caves, construction in endemic area, demolition), HIV/AIDS (especially CD4 <100), transplant, TNF-α inhibitors + biologics, chemotherapy, age >60 + immunosuppression.", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("URINE + SERUM HISTOPLASMA POLYSACCHARIDE ANTIGEN — sensitive (90%+ in disseminated AIDS) + specific; rapid; tracks response per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BLOOD CULTURES — bone marrow + peripheral; positive in disseminated; takes weeks.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BONE MARROW BIOPSY + culture + cytology — sensitive in disseminated; granulomas + intracellular yeast in macrophages.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HISTOPATHOLOGY — silver stain (GMS) + PAS — intracellular small budding yeast within macrophages (\"halo\" appearance).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BAL + lung biopsy if pulmonary involvement.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LIVER BIOPSY — granulomas + yeast.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ORAL ULCER BIOPSY + culture — high yield if mucocutaneous.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing + CD4 + viral load + comprehensive workup.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HISTOPLASMA SEROLOGY — complement fixation + immunodiffusion; not as sensitive in immunocompromised; useful chronic disease.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ADRENAL function — cortisol, ACTH, electrolytes.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("HEMODYNAMIC stability — sepsis-like presentation; adrenal insufficiency emergent.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ENDEMIC EXPOSURE history — travel + occupation + construction + bird/bat exposure.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing if new diagnosis; CD4 assessment; comprehensive OI workup.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Multidisciplinary — ID + endocrinology (adrenal) + pulmonology + hematology + ophthalmology (if CNS / ocular).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Mortality — high if untreated; aggressive workup + empiric treatment in high-risk presentation.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("SEVERE DISEASE INDUCTION — LIPOSOMAL AMPHOTERICIN B 3-5 mg/kg IV daily × 1-2 weeks until clinical improvement per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MAINTENANCE — ITRACONAZOLE 200 mg PO TID × 3 days → 200 mg BID continuation; serum level monitoring (trough >1 mcg/mL); duration ≥12 months total + immune recovery.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MILD-MODERATE — itraconazole 200 mg PO TID × 3 days → 200 mg BID × 6-12 weeks → 200 mg daily; duration ≥6-12 months.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ADRENAL INSUFFICIENCY treatment — STRESS DOSE HYDROCORTISONE + replacement (likely permanent); monitor electrolytes.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CHRONIC SUPPRESSION (HIV+) — itraconazole 200 mg PO daily until CD4 >150 × 6 months on ART + 1+ year therapy + asymptomatic + negative antigen.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ART INITIATION — within 2 weeks of antifungal initiation; balance vs IRIS risk.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Alternative — voriconazole, posaconazole, isavuconazole — for refractory or intolerant.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Antigen monitoring — repeat urine/serum antigen q3-6 months; declining → response; rising → relapse.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("ADRENAL CRISIS — emergent; hypotension + hyponatremia + hyperkalemia + hypoglycemia; IV hydrocortisone + fluids + electrolyte correction.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HEPATOMEGALY + HEPATIC dysfunction — antifungal hepatotoxicity (itraconazole, voriconazole); monitor LFTs.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("AMPHOTERICIN B TOXICITY — nephrotoxicity, electrolytes, infusion reactions; liposomal preferred.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ITRACONAZOLE drug interactions (CYP3A4 inhibitor + substrate) — EXTENSIVE; cardiac risk; LFT monitoring.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("IRIS upon ART — paradoxical worsening; corticosteroids + supportive.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CARDIAC complications — endocarditis (vegetation, embolic events), pericarditis, mediastinal fibrosis (chronic, causes superior vena cava + airway compression).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CNS dissemination — meningitis OR focal lesions; longer + intensified treatment.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("RELAPSE — common; chronic suppression essential.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Mortality — without treatment ~100% in immunocompromised; 5-25% with treatment.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum InvasiveAspergillosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "invasive-aspergillosis",
        title: "Invasive aspergillosis",
        subtitle: "Angio-invasive A. fumigatus + species · severely immunocompromised (transplant + heme malignancy + neutropenia) · halo + air crescent signs · voriconazole/isavuconazole · biopsy",
        nclexTags: fungalTagR30,
        definition: AttributedProse(
            "Invasive angio-invasive infection by Aspergillus species (most A. fumigatus) — predominantly severely immunocompromised patients (transplant recipients, hematologic malignancies, prolonged severe neutropenia <500). Distinct from ABPA (hypersensitivity) + aspergilloma (fungal ball in cavity) + chronic pulmonary aspergillosis (structural lung disease). High mortality. Voriconazole + isavuconazole first-line; surgical resection adjunct; reduce immunosuppression per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Aspergillus fumigatus (most common) + A. flavus, A. niger, A. terreus, A. nidulans — ubiquitous environmental molds. Inhaled conidia germinate into invasive hyphae in immunocompromised hosts → ANGIO-INVASION + tissue necrosis + thrombosis + dissemination → primarily lungs + CNS + sinuses + skin. Severe neutropenia is major risk factor.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("PULMONARY (most common) — fever, cough, dyspnea, pleuritic chest pain, hemoptysis; persistent fever DESPITE antibiotics in neutropenic patient → suspect.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("SINUSITIS — sinus pain, congestion, eschar / black nasal discharge, facial pain, headache; characteristic in heme malignancy + neutropenic.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CNS — focal deficits + headache + altered mental status + seizures from cerebral abscess / hemorrhage.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CUTANEOUS — eschar / necrotizing skin lesions from disseminated.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("DISSEMINATED — multi-organ involvement; sepsis-like presentation.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — HEMATOPOIETIC STEM CELL TRANSPLANT (especially allogeneic + GVHD on steroids), SOLID ORGAN TRANSPLANT (especially lung + heart), HEMATOLOGIC MALIGNANCY (especially acute leukemia + lymphoma in chemo-induced neutropenia), prolonged severe NEUTROPENIA (<500 + >2 weeks), HIGH-DOSE corticosteroids, biologics, GVHD, severe COVID-19 + critically ill ICU patients, congenital chronic granulomatous disease.", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HRCT CHEST — early findings include HALO SIGN (ground-glass halo around solid nodule — angio-invasion); later AIR CRESCENT SIGN (cavitating nodule); cavities + consolidation per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("GALACTOMANNAN ANTIGEN — serum + BAL; sensitive + specific for invasive aspergillosis; rising trend suggests progression; FALSE POSITIVES — piperacillin-tazobactam (older formulations), beta-lactams, infant formula, mucositis.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BETA-D-GLUCAN — sensitive but non-specific (also positive in PCP + many fungi).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ASPERGILLUS PCR — serum + BAL; sensitive + rapid.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BIOPSY + culture — definitive diagnosis; angio-invasive septate hyphae with 45° branching on PAS / GMS stain; speciation + susceptibility.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BLOOD cultures — usually NEGATIVE (does not grow well in blood); BAL + tissue better.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BRAIN MRI for CNS suspicion — multifocal abscesses + hemorrhage.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Sinus CT — opacification, eschar, bone erosion (angio-invasive in sinus).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("EORTC/MSGERC criteria — proven, probable, possible classification; clinical + host + radiographic + mycological criteria.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("HIGH-RISK NEUTROPENIC patient + persistent fever despite broad antibiotics → EMPIRIC antifungal coverage for invasive aspergillosis.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CT chest + galactomannan + beta-D-glucan + cultures; bronchoscopy + biopsy if clinically feasible.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("REDUCE IMMUNOSUPPRESSION when feasible; GVHD treatment optimization; coordinate transplant + heme onc.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Multidisciplinary — ID + transplant / heme onc + pulmonology + neurology (if CNS) + surgery (if resectable).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Mortality — high; aggressive treatment + sometimes combination antifungal + surgical resection.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("FIRST-LINE — VORICONAZOLE 6 mg/kg IV q12h × 24 hours load → 4 mg/kg IV q12h OR 200 mg PO BID maintenance; gold standard per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ALTERNATIVE FIRST-LINE — ISAVUCONAZOLE 200 mg IV/PO q8h × 6 doses load → 200 mg daily maintenance; comparable efficacy + less hepatotoxic + less drug interactions than voriconazole.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ALTERNATIVE — LIPOSOMAL AMPHOTERICIN B 3-5 mg/kg IV daily; second-line; preferred for mucormycosis-coinfection suspicion.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("COMBINATION antifungal (azole + echinocandin) — refractory / severe; ECHINOCANDINS (caspofungin, micafungin, anidulafungin) — adjunct only, NOT monotherapy.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DURATION — minimum 6-12 weeks; until clinical + radiographic resolution + immune recovery; longer in CNS + severe.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SURGICAL RESECTION — focal disease (sinus, pulmonary, cerebral); especially for hemoptysis, persistent infection, single lesion adjacent to great vessels.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("REDUCE IMMUNOSUPPRESSION when feasible — taper steroids + adjust other immunosuppressants; balance with rejection / GVHD risk.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("VORICONAZOLE TDM — therapeutic drug monitoring; target trough 2-5 mcg/mL; CYP2C19 polymorphisms affect metabolism.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIGH-RISK PROPHYLAXIS — posaconazole + isavuconazole + voriconazole for AML on induction + allogeneic SCT GVHD + chronic granulomatous disease.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY HIGH — 30-50% even with treatment in immunocompromised; CNS + dissemination higher; immune recovery critical.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("VORICONAZOLE TOXICITY — hepatotoxicity, visual disturbances + visual hallucinations, photosensitivity + skin cancer, QT prolongation, extensive CYP drug interactions; therapeutic drug monitoring.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("AMPHOTERICIN B TOXICITY — nephrotoxicity, electrolytes, infusion reactions.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MASSIVE HEMOPTYSIS — pulmonary angio-invasion eroding into vessels; emergent bronchial artery embolization OR surgical resection.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DISSEMINATION + CNS involvement — high mortality; intensified therapy + sometimes surgery.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BREAKTHROUGH on prophylaxis — voriconazole-resistant strains (azole-resistant A. fumigatus); susceptibility testing.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("AZOLE-RESISTANT Aspergillus — environmental azole use in agriculture; isavuconazole, amphotericin B alternatives.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("COINFECTION — mucormycosis (especially with severe COVID + diabetes + DKA); amphotericin B coverage.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ENVIRONMENTAL precautions — HEPA filtration in transplant units; avoid construction sites + gardening + composting; mask in high-risk environments.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MucormycosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "mucormycosis",
        title: "Mucormycosis (zygomycosis)",
        subtitle: "Angio-invasive Mucorales · DIABETES + DKA + STEROID + COVID-19 · rhino-orbital-cerebral classic · BLACK ESCHAR · liposomal ampho B + isavuconazole + URGENT DEBRIDEMENT",
        nclexTags: fungalTagR30,
        definition: AttributedProse(
            "Devastating angio-invasive fungal infection by Mucorales (Rhizopus, Mucor, Lichtheimia, Cunninghamella) — predominantly in uncontrolled diabetes (especially DKA), iron overload, immunocompromised, severe COVID-19 (\"black fungus\" epidemic in India 2020-2021). Forms — rhino-orbital-cerebral (most common, classic black nasal/palatal eschar), pulmonary, cutaneous, GI, disseminated. Mortality up to 50-90% without aggressive treatment. EMERGENT — liposomal amphotericin B + isavuconazole + SURGICAL DEBRIDEMENT + reverse predisposing factors per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Mucorales fungi (Rhizopus oryzae most common) — environmental molds, soil, decaying organic matter. Inhalation + cutaneous + GI exposure. Hyperglycemia + acidosis (DKA) impair neutrophil function; iron release in DKA + deferoxamine therapy provides growth factor. ANGIO-INVASION — broad non-septate hyphae 90° branching invade vessels → thrombosis + tissue necrosis + dissemination. NO neutrophil response in immunocompromised — rapid progression hours-days.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("RHINO-ORBITAL-CEREBRAL (most common form) — sinus pain, facial pain, congestion, headache; BLACK ESCHAR on palate / nasal turbinate (necrotic) — pathognomonic; orbital involvement → proptosis + ophthalmoplegia + vision loss; CNS extension → meningitis + abscess + seizures.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("PULMONARY — fever, cough, dyspnea, hemoptysis, pleuritic pain; angio-invasive pneumonia.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CUTANEOUS — necrotizing ulcers + eschar; from trauma + IV catheter + surgical site + tape adhesive in diabetes; rapidly progressive.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("GI — abdominal pain, GI bleeding, perforation; from oral/ingestion in malnourished + neonatal.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("DISSEMINATED — sepsis-like, multi-organ.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — UNCONTROLLED DIABETES + DKA (most common in resource-limited), iron overload (deferoxamine), HEMATOLOGIC MALIGNANCY + neutropenia, transplant, immunosuppression (steroids, biologics), severe COVID-19 (Indian \"black fungus\" epidemic from corticosteroids + diabetes), trauma/burns.", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — high suspicion in DKA + sinus/orbital symptoms + black eschar → emergent workup; tempo of hours.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("IMAGING — CT/MRI sinus + orbit + brain — opacification, bone erosion (turbinate, hard palate, skull base), intracranial extension; chest CT — REVERSE HALO SIGN (central ground-glass with rim of consolidation), nodules, cavities, pleural effusion per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BIOPSY + culture — gold standard; deep tissue + necrotic + viable margins; histopathology — BROAD NON-SEPTATE hyphae with 90° BRANCHING (vs septate 45° aspergillus) on H&E + PAS + GMS stains.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("GALACTOMANNAN + beta-D-glucan — NEGATIVE (in contrast to aspergillus + other fungi); helps differentiate.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MOLECULAR PCR — emerging; serum + tissue; rapid identification + speciation.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Differentiate from aspergillus + endemic mycoses + bacterial sinusitis with abscess (TB, actinomycosis).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Glucose, ketones, electrolytes, blood gas + DKA workup if suspected.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV + immune status assessment.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("CORRECT PREDISPOSING — DKA management (insulin + fluids), discontinue deferoxamine if iron-overloaded, reduce immunosuppression, control diabetes glucose.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("EMERGENT SURGICAL CONSULTATION — ENT + neurosurgery for rhino-orbital-cerebral, thoracic surgery for pulmonary; aggressive debridement.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ID + critical care + multidisciplinary.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Imaging + biopsy ASAP; do not delay treatment waiting for results.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Mortality high — survival depends on speed of diagnosis + initiation of antifungal + surgical debridement + reversal of predisposing factors.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("LIPOSOMAL AMPHOTERICIN B 5-10 mg/kg IV daily — first-line antifungal; high-dose tolerable due to liposomal formulation; central line + electrolyte monitoring per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ISAVUCONAZOLE 200 mg PO/IV q8h × 6 doses → 200 mg daily — alternative or step-down; ONLY oral azole FDA-approved + IDSA-recommended; less toxic than amphotericin.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("POSACONAZOLE — alternative; less data than isavuconazole.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("AGGRESSIVE SURGICAL DEBRIDEMENT — mandatory + emergent; recurrent + serial debridement; do not delay; tissue must be viable to deliver antifungal.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("REVERSE PREDISPOSING — DKA correction (insulin + fluids), iron chelation discontinuation, reduce immunosuppression as feasible, glucose control.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HYPERBARIC OXYGEN therapy — adjunct in some centers; limited evidence; theoretical reduction of hypoxic + acidic environment.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DURATION — minimum 6-12 weeks IV + step-down to oral isavuconazole until disease resolution + immune recovery; sometimes lifelong.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Multidisciplinary — ID + critical care + ENT + neurosurgery + thoracic surgery + endocrinology + nutrition + pharmacy.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PROPHYLAXIS — posaconazole or isavuconazole in highest-risk (AML on induction + GVHD + DKA recovery period); preventing mucormycosis in COVID-19 patients on corticosteroids.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY 50-90% without treatment; even with aggressive therapy 30-50%; CNS involvement higher.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("VISION LOSS / BLINDNESS — orbital involvement; emergent ophthalmology + surgical eye exenteration if necessary to save life.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CNS DISSEMINATION — cavernous sinus thrombosis, stroke from angio-invasion, abscesses; emergent.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("AMPHOTERICIN B TOXICITY — nephrotoxicity, electrolytes, infusion reactions; liposomal less toxic; monitor.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ISAVUCONAZOLE — relatively safer; QT shortening; drug interactions.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PSYCHOSOCIAL — devastating disfigurement, vision loss, prolonged hospitalization + complications.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DIABETES + DKA prevention — patient education + glycemic control.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("COVID-19 STEROID-INDUCED MUCORMYCOSIS — limit steroid duration + dose; control diabetes + DKA; awareness.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("RECURRENCE — angio-invasion + viable organisms; long-term antifungal + immune recovery.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MACSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "mycobacterium-avium-complex",
        title: "Disseminated Mycobacterium avium complex (MAC / MAI)",
        subtitle: "Atypical mycobacterium · AIDS CD4 <50 · fever + weight loss + diarrhea + hepatosplenomegaly · blood/BM culture · azithromycin + ethambutol + rifabutin",
        nclexTags: oiTagR30,
        definition: AttributedProse(
            "Disseminated infection by Mycobacterium avium complex (MAC) — non-tuberculous environmental mycobacteria (M. avium, M. intracellulare, M. chimaera) — major AIDS OI when CD4 <50; ubiquitous in water + soil. Disseminated MAC presents with chronic fever, weight loss, diarrhea, hepatosplenomegaly, bone marrow involvement, anemia. Treatment — multidrug regimen (clarithromycin or azithromycin + ethambutol + rifabutin) + ART for HIV per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Ubiquitous environmental mycobacteria (water, soil, dust) — inhaled / ingested → typically asymptomatic exposure; in profound immunosuppression (CD4 <50) → uncontrolled replication + dissemination via lymphatics + blood → invasion of organs (bone marrow, liver, spleen, gut, lymph nodes). Granulomatous response impaired by immunosuppression → bacteremia + multi-organ disease.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("FEVER — chronic; sometimes \"FUO\" (fever of unknown origin).", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("NIGHT SWEATS + chills + significant weight loss + cachexia.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CHRONIC DIARRHEA — often watery; weight loss + malnutrition.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("HEPATOSPLENOMEGALY + abdominal pain + lymphadenopathy (intra-abdominal).", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("ANEMIA — bone marrow involvement; symptomatic fatigue.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("ALKALINE PHOSPHATASE elevation — hepatic + bone marrow.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("LYMPHADENOPATHY — abdominal + peripheral; sometimes localized.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("PULMONARY MAC (separate entity) — older / structural lung disease (bronchiectasis, smoking) — chronic cough, sputum, hemoptysis; \"Lady Windermere syndrome\" in elderly females.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — HIV/AIDS CD4 <50 (highest disseminated risk); CD4 50-100 reduced risk with ART; PULMONARY MAC — structural lung disease, smoking, female, elderly, immunocompetent.", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BLOOD CULTURES — most sensitive for disseminated; ISOLATOR-LYSIS centrifugation method preferred; takes 1-4 weeks; positive in ~95% disseminated; serial cultures if suspicion high per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BONE MARROW BIOPSY + culture — high yield in disseminated; granulomas + AFB.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LYMPH NODE BIOPSY — excisional + culture.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LIVER BIOPSY — granulomas with AFB.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("GI biopsy if symptomatic (duodenal aspirate, colonic biopsy).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ACID-FAST STAIN — beaded AFB; differentiate species + susceptibility.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Rule out TB (negative QuantiFERON + smear/PCR + culture); MAC requires different treatment.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing + CD4 + viral load + comprehensive OI workup.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Pulmonary MAC criteria — ATS/IDSA: clinical (chronic cough, dyspnea) + radiologic (nodular bronchiectasis OR cavitary) + microbiologic (≥2 positive sputum cultures OR positive BAL OR positive biopsy).", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("Multidisciplinary — ID + HIV + pulmonology (pulmonary MAC) + GI.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Susceptibility testing — clarithromycin macrolide essential.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing + ART planning.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("OI screening — CMV, PCP, toxoplasmosis, TB.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Nutritional + functional + symptom management.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("DISSEMINATED MAC treatment — CLARITHROMYCIN 500 mg PO BID OR AZITHROMYCIN 500-600 mg PO daily + ETHAMBUTOL 15 mg/kg PO daily + RIFABUTIN 300 mg PO daily × 12 months + immune recovery per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CHRONIC SUPPRESSION — discontinue when CD4 >100 × 6 months on ART + clinical improvement; consider stopping ethambutol earlier if susceptibility confirmed.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PRIMARY PROPHYLAXIS — discontinued by HIVMA guidelines (effective ART reduces need); historically AZITHROMYCIN 1200 mg PO weekly for CD4 <50 — limited utility in ART era.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ART initiation — within 2 weeks of MAC treatment + balance IRIS risk.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PULMONARY MAC — different regimen + longer; AZITHROMYCIN 250-500 mg PO 3×/week + ETHAMBUTOL 15-25 mg/kg 3×/week + RIFAMPIN 600 mg 3×/week × 12+ months after culture negative; cavitary disease longer + sometimes amikacin.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("REFRACTORY pulmonary MAC — AMIKACIN inhaled liposomal (Arikayce) FDA-approved adjunct; intramuscular amikacin; bedaquiline / linezolid + ID specialist.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Symptomatic management — antidiarrheals (loperamide, octreotide), pain, nutrition, blood transfusion for anemia.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Drug interaction screening — extensive CYP3A4 effects on rifabutin (decreases ART levels), macrolides (QT, drug interactions); pharmacist consultation.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("MACROLIDE RESISTANCE — clarithromycin / azithromycin resistance development; ALWAYS combination therapy + susceptibility testing.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DRUG TOXICITIES — clarithromycin (QT prolongation, ototoxicity, drug interactions), ethambutol (OPTIC NEURITIS — color vision testing + visual acuity baseline + monthly), rifabutin (uveitis, hepatic, drug interactions with ART), azithromycin (QT, hepatic).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("OPTIC NEURITIS on ethambutol — visual acuity + color vision monthly; stop if changes; dose-related + duration-related.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("UVEITIS on rifabutin — eye pain + vision changes; discontinue + ophthalmology.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DRUG INTERACTIONS — rifabutin induces CYP3A4 → ↓ ART levels; clarithromycin substrate + inhibitor; complex management with HIV care.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("IRIS upon ART initiation — paradoxical worsening MAC; NSAIDs OR steroids; differentiate vs treatment failure.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MORTALITY — improved dramatically with ART era; without ART previously a leading cause of AIDS death.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Pulmonary MAC — chronic + difficult; cavitary disease + bronchiectasis progressive; surgical resection selected cases.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PMLSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "progressive-multifocal-leukoencephalopathy",
        title: "Progressive multifocal leukoencephalopathy (PML)",
        subtitle: "JC virus reactivation · AIDS + natalizumab + rituximab + ibrutinib · subacute focal neuro deficits · NO antiviral · ART + reduce immunosuppression · IRIS",
        nclexTags: oiTagR30,
        definition: AttributedProse(
            "Demyelinating CNS disease from JC (John Cunningham) polyomavirus reactivation in profoundly immunocompromised — AIDS (CD4 <200), natalizumab (MS, IBD), rituximab + other anti-CD20, ibrutinib + other BTK inhibitors, organ transplant immunosuppression. Subacute progressive focal neurologic deficits + characteristic white matter lesions on MRI. No specific antiviral; treatment is immune restoration (ART for HIV; discontinue offending immunosuppressant) — high mortality + morbidity even with treatment per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "JC virus is ubiquitous polyomavirus (60-90% adult seroprevalence) — primary infection asymptomatic + virus remains latent in kidneys + lymph + bone marrow. In severe immunosuppression → reactivation + CNS entry → lytic infection of oligodendrocytes → DEMYELINATION + neurologic deficits + progressive deterioration; multifocal lesions without mass effect typically.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("SUBACUTE focal neurologic deficits — hemiparesis (~33%), visual deficits (visual field defects), cognitive / behavioral changes, dysarthria, ataxia, sensory disturbance, seizures.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("PROGRESSIVE over weeks-months; subacute → chronic.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("NO HEADACHE OR FEVER typically — differentiates from many CNS OIs.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CRANIAL NERVE deficits, ataxia, motor weakness — variable + multifocal.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("PSYCHIATRIC + cognitive — depression, executive dysfunction, dementia-like in advanced.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — HIV/AIDS (CD4 <200, especially <100), NATALIZUMAB (Tysabri — MS, Crohn's; JC index stratification), RITUXIMAB + other anti-CD20 (lymphoma, autoimmune, MS), IBRUTINIB + BTK inhibitors, EFALIZUMAB (psoriasis, withdrawn), DIMETHYL FUMARATE (MS), FINGOLIMOD + S1P modulators (MS), organ transplant immunosuppression, hematologic malignancy chemotherapy.", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MRI BRAIN — multifocal white matter lesions, T2 hyperintense, T1 hypointense, NO mass effect, NO contrast enhancement (vs. ring-enhancing toxoplasmosis), subcortical + cortical / juxtacortical sparing of cortical gray matter; subcortical U-fibers involvement (vs many other entities) per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CSF JC VIRUS PCR — sensitive ~75-90%, specific ~99%; quantitative — higher load worse prognosis.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BRAIN BIOPSY — gold standard when needed; characteristic findings (oligodendrocyte demyelination + ground-glass intranuclear inclusions + bizarre astrocytes); JC virus immunohistochemistry + PCR.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CSF — usually NORMAL cell count + protein (mild abnormalities possible); JC PCR primary test.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("JC ANTIBODY (anti-JCV) — risk stratification BEFORE starting natalizumab; index <0.9 lower risk; >1.5 high risk.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing + CD4 + viral load if immune-suppressed reason unclear.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Medication review — natalizumab (Tysabri), rituximab, ibrutinib, BTK inhibitors, S1P modulators, dimethyl fumarate, etc.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Differentials — toxoplasmosis (ring-enhancing), CNS lymphoma, cryptococcoma, TB, leukoencephalopathy from chemotherapy, demyelinating MS lesions.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify + REVERSE the immunosuppression cause — discontinue natalizumab + rituximab + offending drug; coordinate with MS / IBD / heme onc team.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing + ART start (rapid) if HIV-positive.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Neurology + ID + relevant specialty (MS, transplant, heme onc) multidisciplinary.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Plasma exchange for natalizumab (removes drug + restores immune function).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Rehabilitation + palliative care + advance directive.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("NO SPECIFIC ANTIVIRAL for JC virus; treatment is IMMUNE RESTORATION per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV-ASSOCIATED PML — initiate ART rapidly + optimize regimen; CSF-penetrating ART (e.g., dolutegravir, darunavir); CD4 recovery → JC clearance; long-term survival improved.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("NATALIZUMAB-ASSOCIATED PML — discontinue immediately + PLASMA EXCHANGE × 5 sessions over 1-2 weeks to remove drug + restore immune function; reconstitution rapid but IRIS risk high.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("RITUXIMAB / OTHER PML — discontinue offending drug; recovery slower (B-cell + immune reconstitution months).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("IRIS management — paradoxical inflammatory worsening; CORTICOSTEROIDS (prednisone 1 mg/kg/day taper) for severe; supportive.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("EXPERIMENTAL — MIRTAZAPINE (5-HT2A antagonist reducing JC virus uptake); pembrolizumab + nivolumab (checkpoint inhibitors restoring T-cell function); donor JC-specific T cells (research); MEFLOQUINE (no benefit shown).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SUPPORTIVE — PT/OT/speech, anticonvulsants for seizures, swallowing assessment, nutritional, hospice consideration.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Monitor — clinical neuro exam, MRI q3-6 months, CSF JC PCR trend.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY HIGH — 30-50% even with ART + immune restoration; previously almost 100% pre-ART era.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PERSISTENT MORBIDITY — survivors often have residual deficits; rehabilitation + adaptive devices.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("IRIS — paradoxical worsening upon immune restoration (ART, plasma exchange, drug discontinuation); CORTICOSTEROIDS for severe; differentiate from disease progression.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DRUG-INDUCED PML — VIGILANCE in patients on natalizumab + similar drugs; JC antibody index + duration; risk stratification + frequent monitoring.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("NATALIZUMAB long-term — risk increases with duration + prior immunosuppression + JC antibody index.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("EARLY DIAGNOSIS critical — better outcomes with early treatment; high suspicion in immunocompromised with subacute neurologic deficits.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PALLIATIVE — end-of-life planning; advance directives.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Other JC virus diseases — JC encephalopathy, JC neuropathy, granule cell neuronopathy.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum KaposiSarcomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "kaposi-sarcoma",
        title: "Kaposi sarcoma (KS)",
        subtitle: "HHV-8-driven · AIDS + transplant + classical Mediterranean + endemic African · purple-red mucocutaneous lesions · ART + chemo + local therapy",
        nclexTags: oiTagR30,
        definition: AttributedProse(
            "Multicentric angioproliferative tumor caused by HUMAN HERPESVIRUS 8 (HHV-8 / KSHV) — four clinical forms — AIDS-related (HIV+; was MOST common pre-ART), iatrogenic / transplant-associated, classic Mediterranean (elderly Jewish + Mediterranean males), endemic African (sub-Saharan, can be aggressive). Cutaneous + mucosal lesions common; visceral involvement worse prognosis. AIDS-KS treatment — ART (often sufficient for limited); chemotherapy (liposomal anthracyclines, paclitaxel) for advanced; immune checkpoint inhibitors emerging per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Human herpesvirus 8 (HHV-8 / Kaposi sarcoma-associated herpesvirus / KSHV) — gamma herpesvirus; lifelong latent infection + immunosuppression triggers reactivation. Viral genes promote endothelial cell proliferation + angiogenesis + immune evasion → spindle cell-rich lesions with vascular structures; HIV co-infection enables HHV-8-driven angiogenesis. Multicentric, can affect any organ.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("MUCOCUTANEOUS lesions — purplish-red / violaceous papules + plaques + nodules; can be brown / black in dark skin; usually multiple bilateral; commonly lower extremities, face, oral mucosa, genitals.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("ORAL LESIONS — hard palate, gingiva; common AIDS-KS initial presentation.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("LYMPHADENOPATHY — generalized or regional.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("LYMPHEDEMA — bulky lower extremity involvement.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("VISCERAL INVOLVEMENT — pulmonary (cough, dyspnea, hemoptysis; \"flame-shaped\" infiltrates on CXR), GI (bleeding, obstruction, perforation; endoscopic violet papules), hepatic, splenic — worse prognosis.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("ASYMPTOMATIC initially; insidious progression.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — HIV/AIDS, organ transplant on immunosuppression (especially calcineurin inhibitors), HHV-8 endemic regions (sub-Saharan Africa, Mediterranean), classical KS — elderly Mediterranean + Eastern European Jewish men, MSM HIV-positive (highest AIDS-KS rates).", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL appearance + biopsy — punch biopsy of cutaneous lesion gold standard; histopathology — spindle cells, vascular slits, extravasated RBCs, hemosiderin; HHV-8 LANA immunohistochemistry confirms per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HHV-8 SEROLOGY — KSHV antibody; surveillance.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("STAGING — visceral assessment for advanced AIDS-KS or symptomatic — chest CT, abdominal CT, GI endoscopy (gastric + colonic), bronchoscopy if pulmonary suspicion; bone marrow if cytopenias.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing + CD4 + viral load + comprehensive workup.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("AIDS Clinical Trials Group (ACTG) staging — T (tumor extent), I (immune status — CD4), S (systemic illness).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Differentiate from bacillary angiomatosis (Bartonella in AIDS), hemangiosarcoma, melanoma, dermatofibrosarcoma.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("HIV management + ART optimization — viral suppression often partial regression of limited KS.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Staging — extent, organ involvement, symptoms.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Multidisciplinary — HIV/ID + oncology + dermatology + radiation oncology.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Psychosocial — body image, stigma, AIDS-related disclosure, support.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Patient + caregiver education + linkage to care.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("AIDS-KS — START / OPTIMIZE ART — virologic suppression + immune restoration; CD4 recovery often induces partial regression of limited disease per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LOCAL THERAPY for limited cutaneous — INTRALESIONAL VINCRISTINE OR VINBLASTINE, cryotherapy, laser, topical alitretinoin, radiation therapy.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SYSTEMIC CHEMOTHERAPY — for advanced / visceral / refractory — LIPOSOMAL DOXORUBICIN (PEGYLATED — Doxil) first-line; PACLITAXEL second-line; ETOPOSIDE alternative; VINORELBINE; sometimes bortezomib.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("IMMUNE CHECKPOINT INHIBITORS — pembrolizumab + nivolumab — emerging for refractory KS; clinical trials.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("RADIATION THERAPY — for symptomatic lesions, lymphedema, large bulky disease.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("TRANSPLANT-ASSOCIATED — reduce / switch immunosuppression (mTOR inhibitor sirolimus/everolimus has anti-KS activity); chemotherapy / local for refractory.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Supportive — wound care, lymphedema (compression, manual drainage), pain management, antiemetics, neutropenia prophylaxis with chemotherapy.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HHV-8 antiviral — ganciclovir + foscarnet in research; not standard.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PROPHYLAXIS — primary prophylaxis NOT recommended; HHV-8 vaccine in development.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("VISCERAL involvement — pulmonary + GI worse prognosis; sometimes acute presentation (hemorrhage, respiratory failure, obstruction).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("KS-ASSOCIATED IRIS — paradoxical worsening upon ART initiation; transient + responsive to chemotherapy.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LIPOSOMAL DOXORUBICIN cardiotoxicity — cumulative; LVEF monitoring; lifetime dose limits.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PACLITAXEL — peripheral neuropathy, neutropenia, hypersensitivity, alopecia.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LYMPHEDEMA — chronic; lifestyle management + compression.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PROGNOSIS — AIDS-KS: improved dramatically with ART; visceral disease + poor immune status worse; transplant-KS: variable; classical KS: indolent + good prognosis.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Other HHV-8 diseases — multicentric Castleman disease (MCD), primary effusion lymphoma (PEL), KSHV inflammatory cytokine syndrome (KICS).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PSYCHOSOCIAL — disfiguring lesions; stigma; counseling; support.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MalariaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "malaria",
        title: "Malaria (Plasmodium spp.)",
        subtitle: "P. falciparum severe (cerebral, ARDS, AKI) · P. vivax/ovale relapse · thick + thin smears · RDT · ACT for falciparum · primaquine for radical cure",
        nclexTags: parasiteTagR30,
        definition: AttributedProse(
            "Mosquito-borne febrile illness from Plasmodium species — P. falciparum (severe, cerebral malaria, complications, sub-Saharan Africa), P. vivax (relapsing, Asia + Latin America), P. ovale (relapsing, West Africa), P. malariae (chronic, less severe), P. knowlesi (Southeast Asia, simian zoonosis). Travel history + endemic exposure essential. Thick + thin smears + RDTs diagnostic. Artemisinin-based combination therapy (ACT) for P. falciparum; chloroquine OR ACT for non-falciparum; PRIMAQUINE for radical cure of P. vivax/ovale (eradicates hypnozoites) per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Plasmodium sporozoites inoculated by Anopheles mosquito → hepatocytes → schizonts release merozoites → infect RBCs → asexual cycle (causes hemolysis + cytokine release + clinical illness) + sexual cycle (gametocytes ingested by mosquito → transmission). P. vivax + P. ovale form HYPNOZOITES in liver → relapses months-years after primary infection. P. falciparum sequesters in microvasculature → cerebral malaria + ARDS + AKI + multi-organ.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("FEVER — cyclical paroxysms (q48h tertian — P. vivax/ovale; q72h quartan — P. malariae; irregular P. falciparum); rigors, chills, sweats, headache, myalgia, nausea, vomiting.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("HEPATOSPLENOMEGALY + jaundice + anemia from hemolysis.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("SEVERE FALCIPARUM (5-15% of cases) — CEREBRAL MALARIA (altered mental status, seizures, coma), severe anemia, ARDS, AKI, hypoglycemia, lactic acidosis, shock, DIC, jaundice, hyperparasitemia (>5%) — emergency.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("RECURRENT P. vivax/ovale — episodes weeks-months apart from hypnozoite relapses.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("ASYMPTOMATIC initially or non-specific flu-like — easily missed; high index of suspicion in travelers.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — TRAVEL to endemic regions (sub-Saharan Africa primary, also Asia, Latin America, Pacific) within 1 year (most within 1 month); IMMIGRANTS from endemic regions; pregnancy (severe falciparum risk); children + non-immune adults; HIV/AIDS + immunocompromised (severe disease); inadequate / non-compliant prophylaxis.", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("THICK + THIN BLOOD SMEARS — gold standard; thick smear sensitive (detects ~10 parasites/μL); thin smear speciates + quantifies parasitemia; REPEAT q12h × 48h if initial negative + high suspicion per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("RAPID DIAGNOSTIC TESTS (RDTs) — immunochromatographic; detect HRP-2 (P. falciparum) + pLDH (all species); useful when microscopy unavailable; less sensitive than expert microscopy.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MOLECULAR PCR — most sensitive + speciation; not routine; useful low parasitemia or unclear species.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CBC — anemia + thrombocytopenia (often <100K); hemolysis labs (LDH, indirect bili).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("COMPREHENSIVE — BMP (AKI, hypoglycemia, lactate), LFTs (jaundice), coagulation (DIC), G6PD screen (before primaquine).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SEVERITY ASSESSMENT — WHO criteria for severe falciparum: cerebral (GCS), severe anemia, ARDS, AKI, lactate >5, hypoglycemia, hyperparasitemia >5%, hyperbilirubinemia, bleeding/DIC, shock.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CDC malaria hotline 24/7 for guidance.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("EMERGENT in suspected severe falciparum — rapid diagnosis, IV antimalarial, ICU, supportive care.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Travel + exposure history detailed.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Multidisciplinary — ID + critical care + tropical medicine specialist; CDC consultation.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Parasitemia + species determination — guides therapy.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("G6PD screen before primaquine for radical cure.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("UNCOMPLICATED P. FALCIPARUM — ARTEMISININ-BASED COMBINATION THERAPY (ACT): ARTEMETHER-LUMEFANTRINE (Coartem) — 4 tabs at 0, 8, 24, 36, 48, 60 hours (6 doses with fatty meal) OR ATOVAQUONE-PROGUANIL (Malarone) 4 tabs PO daily × 3 days OR QUININE + DOXYCYCLINE/CLINDAMYCIN × 7 days per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SEVERE P. FALCIPARUM — IV ARTESUNATE 2.4 mg/kg IV at 0, 12, 24 hours → daily × 7 days OR until oral tolerated; oral ACT follow-up; CDC supplies IV artesunate; quinidine alternative (older + cardiac risk).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("P. VIVAX / OVALE — CHLOROQUINE 1 g PO load → 500 mg at 6, 24, 48 hours (uncomplicated); ACT alternative; ALWAYS FOLLOW with PRIMAQUINE 30 mg PO daily × 14 days for RADICAL CURE (hypnozoite eradication) — G6PD SCREEN MANDATORY (severe hemolysis in deficient).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("P. MALARIAE / KNOWLESI — CHLOROQUINE; no radical cure needed.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CHLOROQUINE-RESISTANT P. VIVAX (Indonesia, PNG, etc.) — ACT or quinine + doxycycline.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PROPHYLAXIS — region-dependent — chloroquine OR atovaquone-proguanil OR doxycycline OR mefloquine OR primaquine; start 1-2 days before to 1 week before depending; continue during + after returning (variable).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SEVERE complications — ICU; hypoglycemia (IV dextrose), seizures (anticonvulsants), AKI (hemodialysis), ARDS (mechanical ventilation), severe anemia (transfusion), DIC (FFP + cryoprecipitate).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BREASTFEEDING — most antimalarials acceptable; coordinate.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PREGNANCY — falciparum severe risk; quinine + clindamycin in 1st trimester; ACT in 2-3rd trimester; primaquine contraindicated (theoretical fetal G6PD-deficient hemolysis).", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("SEVERE FALCIPARUM — cerebral malaria + multi-organ failure; mortality 15-20% even with treatment; emergent IV artesunate + ICU.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HYPOGLYCEMIA — sequestration in placenta during pregnancy + during quinine therapy; IV dextrose.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HEMOLYSIS — chronic anemia; can be massive in severe; transfusion.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PRIMAQUINE in G6PD-DEFICIENT — severe acute hemolytic anemia; mandatory screening.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("RELAPSE from P. vivax/ovale — months-years; primaquine radical cure essential.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("BLACK WATER FEVER — massive hemolysis + hemoglobinuria + AKI in severe falciparum.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("QUININE / QUINIDINE TOXICITY — cinchonism (tinnitus, HA, blurred vision), hypoglycemia, prolonged QT, hypotension; cardiac monitoring.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ARTEMISININ RESISTANCE — emerging Southeast Asia; surveillance + region-specific protocols.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PROPHYLAXIS NON-ADHERENCE — common cause of malaria in travelers; counsel pre-travel + provide adequate supply.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MOSQUITO AVOIDANCE — DEET 30%+, permethrin-treated clothing, bed nets, indoor residual spraying, dusk-dawn avoidance (Anopheles).", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum StrongyloidiasisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "strongyloidiasis",
        title: "Strongyloidiasis (Strongyloides stercoralis)",
        subtitle: "Autoinfection-capable nematode · chronic GI + cutaneous · HYPERINFECTION emergent in immunosuppressed · screen before steroids · IVERMECTIN",
        nclexTags: parasiteTagR30,
        definition: AttributedProse(
            "Intestinal parasite Strongyloides stercoralis — unique among helminths because of AUTOINFECTION cycle (filariform larvae penetrate intestinal mucosa or perianal skin → re-enter host without external environment) → persistent infection × decades. Most asymptomatic / chronic mild GI + cutaneous. EMERGENT — HYPERINFECTION + DISSEMINATION in immunosuppressed (corticosteroids, transplant, HTLV-1, malnutrition, alcohol) → multi-organ infection + gram-negative sepsis + 70% mortality. SCREEN before corticosteroids / immunosuppression in patients from endemic areas; ivermectin first-line per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Strongyloides stercoralis nematode — filariform larvae penetrate skin (soil exposure) → blood → lungs → ascend trachea → swallowed → adult females in small intestine → rhabditiform larvae shed in stool. AUTOINFECTION — some larvae transform to filariform in gut + re-penetrate intestinal mucosa or perianal skin → re-enter circulation → perpetuate infection without re-exposure → persists decades. HYPERINFECTION — immunosuppression releases inhibition → massive autoinfection + multi-organ + sepsis.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("CHRONIC INTESTINAL — abdominal pain, intermittent diarrhea, nausea, dyspepsia, malabsorption; often mild + non-specific × decades.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("CUTANEOUS — LARVA CURRENS (\"racing larva\") — pruritic linear urticarial track moving at ~5-10 cm/hour (autoinfection penetration); perianal + buttock + trunk; often missed.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("PULMONARY (Löffler-like) — cough, wheeze, dyspnea, eosinophilic pneumonia; larval migration through lungs.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("EOSINOPHILIA — peripheral; common chronic finding; ABSENT in immunosuppressed + hyperinfection.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("HYPERINFECTION SYNDROME — massive autoinfection → severe diarrhea + abdominal pain + ileus + GI bleeding + protein-losing enteropathy + ARDS + pneumonia + meningitis (E. coli/Klebsiella translocating with larvae) + sepsis + shock; 70%+ mortality.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("DISSEMINATED — larvae in CNS, kidney, peritoneum, eyes, etc.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — ENDEMIC EXPOSURE (Latin America, Caribbean, sub-Saharan Africa, Southeast Asia, southeastern USA) — soil exposure historical; HTLV-1 co-infection (immune impairment); STEROIDS / TRANSPLANT / MALIGNANCY immunosuppression; alcohol; HIV less risk than HTLV-1.", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("SEROLOGY — Strongyloides IgG (ELISA) — sensitive ~95% in chronic; persists even after treatment (titer doesn't reflect cure); cross-reactivity with other helminths per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("STOOL EXAMINATION — rhabditiform larvae (NOT eggs) on direct smear; less sensitive (~30%); Baermann concentration method increases sensitivity; agar plate culture (allow larvae to migrate).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DUODENAL aspirate / biopsy — sensitive; especially in hyperinfection.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SPUTUM, BAL, CSF, urine, peritoneal fluid — in hyperinfection / disseminated; filariform larvae.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("EOSINOPHILIA — chronic; ABSENT in hyperinfection (immunosuppression blunts).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HTLV-1 testing in endemic exposure / refractory infection.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PCR — emerging; sensitive + species identification.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Differentiate from other helminths, eosinophilic disorders, IBD.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("SCREEN PATIENTS FROM ENDEMIC AREAS BEFORE STEROIDS / CHEMO / IMMUNOSUPPRESSION — strongyloides serology + stool examination; aggressive treatment if positive to prevent hyperinfection.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HYPERINFECTION — EMERGENT; high-dose ivermectin + supportive ICU; ID consultation; mortality high.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HTLV-1 — refractory / multiple treatments needed; co-management.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Multidisciplinary — ID + GI + critical care if hyperinfection.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Family / household screening if shared exposure.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("UNCOMPLICATED — IVERMECTIN 200 mcg/kg PO ONCE + repeat in 2 weeks per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HYPERINFECTION / DISSEMINATED — IVERMECTIN 200 mcg/kg PO DAILY until stool + sputum cleared × 2 weeks; some protocols add subcutaneous ivermectin (veterinary route, off-label for life-threatening); reduce immunosuppression as feasible.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ALTERNATIVE — ALBENDAZOLE 400 mg PO BID × 7 days; less effective than ivermectin; for ivermectin-resistant or unavailable.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PREEMPTIVE treatment in endemic-exposed patients receiving immunosuppression — ivermectin BEFORE steroids / transplant / chemo / biologics.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("SUPPORTIVE in hyperinfection — fluids, electrolytes, broad antibiotics (gram-negative sepsis from translocation), mechanical ventilation, vasopressors.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("REDUCE immunosuppression — taper steroids + adjust other; balance with underlying disease.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("TEST OF CURE — clinical + stool examination 2-4 weeks post-treatment; eosinophilia decline; serology persists.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Family + household screening if shared rural exposure history.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("HYPERINFECTION SYNDROME — devastating; 70%+ mortality; AVOIDABLE with screening + preemptive treatment before immunosuppression.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("STEROID-PRECIPITATED hyperinfection — patients from endemic areas given corticosteroids without screening → emergent crisis.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("GRAM-NEGATIVE SEPSIS — bacterial translocation from larvae carrying gut flora; broad-spectrum antibiotics.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MENINGITIS — E. coli / Klebsiella; emergent CSF analysis + antibiotics.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ARDS — pulmonary larval invasion + sepsis; mechanical ventilation.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HTLV-1 co-infection — refractory; ART for HTLV-1 (limited efficacy); ID specialist.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("AUTOINFECTION persistence × DECADES — patients from endemic areas may carry infection long after leaving.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("EOSINOPHILIA absent in hyperinfection — DOES NOT exclude (immunosuppression blunts).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ENVIRONMENT — barefoot exposure rural areas; counsel.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NeurosyphilisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "neurosyphilis",
        title: "Neurosyphilis",
        subtitle: "T. pallidum CNS · early (meningitis, ocular, otologic) + late (general paresis, tabes dorsalis) · CSF VDRL + RPR · IV penicillin G × 10-14 days · HIV coinfection",
        nclexTags: oiTagR30,
        definition: AttributedProse(
            "Tertiary or early CNS infection by Treponema pallidum spirochete — at ANY stage of syphilis (early: 1-2 years post-infection — meningitis, ocular, otologic; late: years-decades — general paresis, tabes dorsalis, gummas, meningovascular). HIV co-infection accelerates progression. Diagnosis — CSF VDRL/FTA-ABS + serum RPR/treponemal tests. Treatment — IV penicillin G 18-24 million units daily × 10-14 days per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "Treponema pallidum disseminates to CNS in 20-40% of untreated primary syphilis; most clear without treatment in immunocompetent. CNS invasion → meningitis (acute), meningovascular syphilis (vasculitis, stroke), general paresis (cortical dementia), tabes dorsalis (dorsal columns + roots — sensory ataxia, lightning pains, Argyll Robertson pupils). HIV co-infection — accelerated + atypical course + earlier neurologic complications.",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("EARLY (months-years post-infection) — MENINGITIS (HA, neck stiffness, mental status changes, cranial nerve palsies — especially CN VII, VIII, II); OCULAR (panuveitis, optic neuritis, retinitis); OTOLOGIC (sensorineural hearing loss, vertigo); meningovascular (stroke from arteritis).", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("LATE (years-decades) — GENERAL PARESIS (cortical dementia + psychiatric, personality change, megalomania, paranoia, declining cognition); TABES DORSALIS (dorsal column + root — SENSORY ATAXIA wide-based gait + Romberg+, LIGHTNING PAINS, ARGYLL ROBERTSON PUPILS — accommodation+, light-, optic atrophy, urinary incontinence); GUMMAS (focal lesions); meningovascular continued.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("ARGYLL ROBERTSON PUPILS — small, irregular, react to accommodation but NOT to light; characteristic of late syphilis (especially tabes).", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("OCULAR — uveitis is increasingly recognized + may be presenting symptom; vision loss preventable with treatment.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("OTIC — sensorineural hearing loss; vertigo; reversible with treatment.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — UNTREATED SYPHILIS, MSM + multiple partners (highest US epidemic), HIV CO-INFECTION (accelerated + complicated course), lack of prenatal care.", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("SERUM TESTS — non-treponemal (RPR, VDRL — quantitative, reflects activity, may be NEGATIVE in late) + treponemal (FTA-ABS, TPPA, EIA — positive lifelong); reverse sequence screening common.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CSF — increased WBC (lymphocytic), elevated protein, CSF VDRL (specific but insensitive ~50%), CSF FTA-ABS (sensitive but less specific — negative excludes neurosyphilis) per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("INDICATIONS FOR LP — neurologic + ophthalmologic + otologic + cardiovascular symptoms in any stage syphilis; treatment failure (no 4-fold RPR decline); HIV co-infection with any positive syphilis serology + late or unknown stage; suspected late syphilis.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CSF VDRL positive → diagnostic in clinical context; CSF FTA-ABS negative → essentially excludes; CSF cell count >5 cells/μL in HIV-uninfected (or >20 in HIV) + protein elevation supportive.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing universal; CD4 + viral load + STI panel.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Ophthalmology + audiology evaluations if visual / hearing symptoms.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("MRI BRAIN — non-specific; cerebral atrophy in general paresis, dorsal column atrophy in tabes, vasculitis in meningovascular.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("LUMBAR PUNCTURE for neurologic / ophthalmologic / otologic symptoms in any syphilis stage.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV testing universal — co-infection accelerates + complicates.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ID + neurology + ophthalmology + audiology multidisciplinary.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Public health REPORTING + partner notification + treatment.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("STI screening + counseling + safer sex.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("AQUEOUS CRYSTALLINE PENICILLIN G — 3-4 million units IV q4 hours (18-24 million units daily) × 10-14 days; preferred per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("ALTERNATIVE — PROCAINE PENICILLIN G 2.4 million units IM daily + PROBENECID 500 mg PO QID × 10-14 days (better outpatient feasibility but probenecid causes nausea + GI; less preferred).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("FOLLOW with BENZATHINE PENICILLIN G 2.4 million units IM weekly × 3 weeks (some experts; not standard).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PENICILLIN ALLERGY — DESENSITIZATION + penicillin (allergy testing + careful desensitization); alternatives (ceftriaxone 2 g IV/IM daily × 10-14 days) less data; doxycycline + tetracycline less effective for CNS.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("JARISCH-HERXHEIMER REACTION — within hours of treatment; fever, chills, HA, myalgia from spirochete death + cytokine release; supportive (acetaminophen, fluids); NOT allergy; counsel patient.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("FOLLOW-UP CSF analysis — 3-6 months post-treatment to confirm resolution (normalizing protein, decreasing cell count, declining VDRL); retreatment if persistent abnormalities.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV CO-INFECTION — same treatment regimen; monitor closely; ART initiation.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Public health partner notification + treatment + STI screening.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Counseling on safer sex + ongoing surveillance + reinfection risk.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("PERMANENT NEUROLOGIC DEFICITS — early diagnosis + treatment essential; late syphilis sequelae often partial reversal only.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("OCULAR involvement — vision loss preventable + reversible with prompt treatment.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("OTIC involvement — hearing loss preventable + reversible with prompt treatment.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("JARISCH-HERXHEIMER REACTION — anticipate + counsel + supportive care.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PENICILLIN ALLERGY — desensitize for neurosyphilis (no equivalent alternative); coordination with allergy.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV CO-INFECTION — atypical / accelerated course; CSF abnormalities; ART + close monitoring.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("REINFECTION — common in MSM + high-risk; surveillance + repeat screening; condoms + PrEP.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("TREATMENT FAILURE — persistent CSF abnormalities or rising RPR; retreatment + ID specialist.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CONGENITAL SYPHILIS — maternal untreated → transplacental transmission; screen all pregnancies + treat aggressively.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PUBLIC HEALTH — increasing US syphilis incidence; aggressive screening + treatment + partner notification.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ChronicHepatitisBSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "chronic-hepatitis-b",
        title: "Chronic hepatitis B (CHB)",
        subtitle: "HBsAg+ >6 months · phases (immune tolerant → active → inactive → reactivation) · HBV DNA + LFTs · TAF + entecavir 1st-line · cirrhosis + HCC surveillance",
        nclexTags: hepatitisTagR30,
        definition: AttributedProse(
            "Chronic hepatitis B (CHB) — HBsAg positive ≥6 months. Phases — immune tolerant (HBeAg+, high DNA, normal ALT — pediatric/perinatal acquired), immune active (HBeAg+ → seroconversion to anti-HBe+, elevated ALT, declining DNA), inactive carrier (HBsAg+, anti-HBe+, low DNA, normal ALT), reactivation (HBeAg-, mutant virus, elevated ALT + DNA). Long-term risks — cirrhosis + HCC. Treatment with NUC (TAF, entecavir) for active disease; lifelong + surveillance per primary source.",
            citationIDs: ["specialty_dx_round30", "openrn_dx_round30"]
        ),
        pathophysiology: AttributedProse(
            "HBV — DNA virus; transmitted parenteral (IVDU, transfusion, needlestick), sexual, perinatal, household. Replication via reverse transcriptase + cccDNA template in hepatocyte nucleus (cccDNA = persistent reservoir, target of cure research). Hepatocyte injury immune-mediated (CTL response). Co-infection HIV + HDV alters course. Drug treatment suppresses replication but rarely eradicates (cccDNA persists).",
            citationIDs: ["specialty_dx_round30"]
        ),
        presentation: [
            AttributedBullet("Often ASYMPTOMATIC until cirrhosis or hepatic decompensation.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Fatigue, malaise, anorexia, RUQ discomfort — non-specific.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Cirrhosis — jaundice, ascites, edema, GI bleeding (varices), encephalopathy, coagulopathy, hypoalbuminemia, thrombocytopenia (hypersplenism).", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("HCC — RUQ mass, weight loss, abdominal pain; often asymptomatic until advanced.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Extrahepatic — polyarteritis nodosa (vasculitis), membranous nephropathy, mixed cryoglobulinemia (less common than HCV), serum sickness, aplastic anemia.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Acute exacerbation — sudden ALT increase from immune-mediated flare; may be severe.", citationIDs: ["openrn_dx_round30"]),
            AttributedBullet("Risk factors — perinatal (high-prevalence regions Asia + sub-Saharan Africa — most chronic cases), parenteral (IVDU, transfusion pre-1991), sexual, occupational (healthcare workers), household contacts; HIV co-infection; HDV co-infection (worse outcomes).", citationIDs: ["specialty_dx_round30"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HEPATITIS B SEROLOGY — HBsAg+ ≥6 months = chronic; full panel — anti-HBc IgM (acute) vs IgG (past/chronic), anti-HBs (immunity), HBeAg (high replication), anti-HBe (seroconverted), per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HBV DNA quantitative — viral load; correlates with disease activity + treatment response; <2000 inactive, >20,000 active treatment indication.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LFTs — ALT/AST (active vs inactive), bilirubin, INR, albumin (synthetic function), alk phos + GGT.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("LIVER FIBROSIS assessment — TRANSIENT ELASTOGRAPHY (FibroScan) — non-invasive measure of liver stiffness; serum fibrosis markers (FIB-4, APRI); MRI elastography in select; LIVER BIOPSY gold standard but less used now.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CO-INFECTIONS — HCV, HIV, HDV (Hepatitis D requires HBV — anti-HDV in CHB with severe disease).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HCC SURVEILLANCE — ultrasound + AFP q6 months in cirrhotic + selected non-cirrhotic high-risk groups (Asian men >40, women >50, family history HCC, HIV co-infection).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Liver imaging — US, CT, MRI for nodules / lesions; HCC characterization.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HBV genotype — sometimes; influences treatment + interferon response.", citationIDs: ["specialty_dx_round30"])
        ],
        priorityAssessments: [
            AttributedBullet("Assess phase + treatment indication — HBeAg, HBV DNA, ALT, fibrosis stage, age + family history HCC.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Hepatology referral.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Vaccinate family + close contacts (HBV vaccine).", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HCV + HIV + HDV co-infection screening.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HCC surveillance + cirrhosis workup if advanced fibrosis.", citationIDs: ["specialty_dx_round30"])
        ],
        commonInterventions: [
            AttributedBullet("TREATMENT INDICATIONS — HBeAg+ with HBV DNA >20,000 IU/mL + ALT >2× ULN; HBeAg- with HBV DNA >2000 IU/mL + ALT >2× ULN; advanced fibrosis (F3-F4) regardless of ALT; cirrhosis regardless of DNA; immunosuppressed patients about to start chemotherapy / biologics; HIV co-infection per primary source.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("FIRST-LINE — ENTECAVIR 0.5 mg PO daily (1 mg if lamivudine-experienced) OR TENOFOVIR ALAFENAMIDE (TAF) 25 mg PO daily — high genetic barrier, well-tolerated; TENOFOVIR DISOPROXIL FUMARATE (TDF) alternative — more renal/bone toxicity than TAF.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("PEGYLATED INTERFERON ALPHA — alternative for select HBeAg+ patients with genotype A or B, elevated ALT, low HBV DNA, no cirrhosis; 48 weeks SC weekly; ~30% HBeAg seroconversion; many side effects.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("DURATION — NUCs typically lifelong; HBeAg seroconversion + sustained suppression × 1-3 years → consider stopping (high relapse rate); cirrhotic — continue lifelong.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HBeAg seroconversion + HBsAg loss (functional cure) — primary treatment goals; HBsAg loss uncommon but improving with new agents.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HCC SURVEILLANCE — ultrasound + AFP q6 months in cirrhotic + high-risk; persistent even with viral suppression.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("VACCINATION — HBV vaccination for all close contacts + household + sexual partners; HAV vaccine to all CHB; HCV testing; HIV testing.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Pregnancy — HBV DNA >200,000 → TAF or TDF in 3rd trimester to reduce transmission; HBIG + HBV vaccine to newborn within 12 hours of birth.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("IMMUNOSUPPRESSION-INDUCED REACTIVATION — patients with past or current HBV on rituximab + chemotherapy + biologics + transplant → reactivation; SCREEN before + prophylactic ENTECAVIR or TAF throughout treatment + 6-12 months after.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Liver transplant — for decompensated cirrhosis + early HCC; HBIG + NUC post-transplant prevent recurrence.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HDV co-infection — pegylated interferon × 12+ months; bulevirtide newer; aggressive disease.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Lifestyle — alcohol minimization (synergistic liver damage), weight management (NAFLD comorbidity), counsel.", citationIDs: ["specialty_dx_round30"])
        ],
        watchFor: [
            AttributedBullet("HCC — increased risk in CHB even without cirrhosis (especially Asian + family history); surveillance ultrasound + AFP q6 months.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("CIRRHOSIS + DECOMPENSATION — varices, ascites, encephalopathy, coagulopathy; comprehensive cirrhosis management.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("REACTIVATION FROM IMMUNOSUPPRESSION — devastating; severe acute hepatitis flare; prophylaxis essential; SCREEN before chemotherapy + biologics + immunosuppressants + transplant.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HDV CO-INFECTION — worse outcomes; faster cirrhosis + HCC progression; aggressive treatment.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HCV CO-INFECTION — both treatable; HCV first usually then HBV management.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("HIV CO-INFECTION — TAF + FTC active against both; ART selection considers HBV; HBV may flare upon discontinuing ART.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("FAMILY transmission — vertical perinatal most common; HBV vaccine + HBIG newborn within 12 hours prevents 95%.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("NUC RESISTANCE — uncommon with TAF / entecavir (high genetic barrier); lamivudine + adefovir resistance higher.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("FUNCTIONAL CURE — HBsAg loss; ongoing research; combinations of antivirals + immunomodulators.", citationIDs: ["specialty_dx_round30"]),
            AttributedBullet("Pregnancy + breastfeeding — TAF preferred for safety + efficacy in pregnancy; newborn HBV vaccine + HBIG.", citationIDs: ["specialty_dx_round30"])
        ],
        citations: [openrnDxR30, cdcDxR30, specialtyDxR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}
