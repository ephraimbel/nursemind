import Foundation

// Curator-model lab entries (round 30 — ID depth: fungal + tropical diagnostics).

private let openrnLabsR30 = CitationSource(
    id: "openrn_labs_round30",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcLabsR30 = CitationSource(
    id: "cdc_labs_round30",
    shortName: "CDC + WHO + IDSA concept citations",
    publisher: "CDC · WHO · IDSA",
    license: .publicDomain,
    url: "https://www.cdc.gov/parasites/index.html",
    lastRetrieved: "2026-05-13"
)
private let specialtyLabsR30 = CitationSource(
    id: "specialty_labs_round30",
    shortName: "IDSA + ECCMID + MMSA concept citations",
    publisher: "IDSA · ECCMID · MMSA",
    license: .factCitationOnly,
    url: "https://www.idsociety.org/practice-guideline/",
    lastRetrieved: "2026-05-13"
)

private let labsTagsR30 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .infection
)

public enum CryptococcalAntigenSample {
    public static let entry: LabEntry = LabEntry(
        id: "cryptococcal-antigen",
        title: "Cryptococcal antigen (CrAg) + India ink",
        subtitle: "Cryptococcus screening in AIDS + transplant · serum + CSF · lateral flow assay rapid · India ink classic but less sensitive · CSF positive = meningitis",
        specimen: "Serum (preemptive screening); CSF (for meningitis diagnosis); lateral flow assay (LFA — rapid, point-of-care); latex agglutination (older); India ink (CSF microscopic — classic teaching)",
        nclexTags: labsTagsR30,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative CrAg (serum + CSF)", label: "Cryptococcal infection unlikely (sensitivity >95%); rule out other CNS infections", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Positive serum CrAg (asymptomatic HIV+ CD4 <100)", label: "Early disseminated cryptococcosis OR pulmonary — PREEMPTIVE TREATMENT with fluconazole 800 mg PO daily × 2 weeks → 400 mg × 8 weeks → 200 mg maintenance until CD4 recovery", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Positive CSF CrAg", label: "CRYPTOCOCCAL MENINGITIS confirmed; institute treatment + ICP management", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Positive India ink microscopy", label: "Encapsulated yeast cells with refractile clear capsule halo; specific but less sensitive than CrAg (~70-90%)", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Titer ≥1:512 in CSF", label: "Heavy fungal burden; correlates with worse outcomes; ICU + aggressive ICP management", citationIDs: ["specialty_labs_round30"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative CrAg",
                summary: "Negative cryptococcal antigen — cryptococcal infection unlikely (high NPV). Consider alternative causes of symptoms per primary source.",
                nursingActions: [
                    "Continue evaluation for other causes.",
                    "If high clinical suspicion + immunocompromised: repeat OR pursue alternative diagnostics (CSF culture, India ink, blood culture).",
                    "Document baseline for future reference.",
                    "Maintain awareness — surveillance positive serum CrAg in HIV+ CD4 <100 even with no symptoms."
                ],
                citationIDs: ["specialty_labs_round30"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Positive — cryptococcosis confirmed",
                summary: "Positive cryptococcal antigen — diagnostic for cryptococcal disease. Determine extent (serum + CSF + chest CT + abdominal imaging) + treatment per primary source.",
                nursingActions: [
                    "EMERGENT lumbar puncture if not already done — assess CNS involvement + CSF analysis + opening pressure.",
                    "STAGE — serum CrAg + CSF CrAg + chest CT + ophthalmologic + neurologic exam.",
                    "INDUCTION ANTIFUNGAL — liposomal amphotericin B 3-4 mg/kg IV + flucytosine 100 mg/kg/day × 2 weeks (CNS disease); fluconazole high-dose × 2 weeks (preemptive serum-only positive without CNS involvement).",
                    "CONSOLIDATION (8 weeks) — fluconazole 800 mg PO daily.",
                    "MAINTENANCE — fluconazole 200 mg PO daily until CD4 >100 × 3 months on ART + asymptomatic.",
                    "ELEVATED ICP MANAGEMENT (CNS disease) — repeat therapeutic LPs daily until OP <200 mm H2O OR clinical improvement; sometimes lumbar drain or VP shunt.",
                    "HIV testing + ART initiation 4-6 weeks AFTER antifungal start (to avoid severe IRIS death).",
                    "PREEMPTIVE THERAPY (asymptomatic serum CrAg+ in HIV) — fluconazole prevents progression to meningitis.",
                    "Coordinate ID + critical care + ophthalmology + neurology + IR for lumbar drain."
                ],
                citationIDs: ["specialty_labs_round30"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Positive cryptococcal antigen",
                causes: ["Cryptococcus neoformans var. grubii (var. neoformans serotype A — most common globally)", "Cryptococcus neoformans var. neoformans (serotype D)", "Cryptococcus gattii (serotype B + C — endemic Pacific Northwest, Australia, southern California; can affect immunocompetent)", "HIV/AIDS CD4 <100 (most common AIDS OI in resource-limited)", "Solid organ + hematopoietic stem cell transplant", "Chronic corticosteroids OR biologics", "Hematologic malignancy", "Sarcoidosis + idiopathic CD4 lymphocytopenia"],
                citationIDs: ["specialty_labs_round30"]
            )
        ],
        nursingActions: [
            AttributedBullet("UNIVERSAL SCREENING of serum CrAg in HIV-positive patients with CD4 <100 per WHO guidance; high preemptive treatment value — prevents progression to meningitis.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("CSF CrAg with opening pressure essential for meningitis diagnosis + ICP management.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("LATERAL FLOW ASSAY (LFA) — rapid 10-minute point-of-care; serum + CSF; superior to latex agglutination.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("India ink less sensitive than CrAg (~70-90% vs >95%); historical teaching value.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("Quantitative titers — higher titers worse prognosis; not routinely repeated for monitoring (declines but persists; clinical + CSF culture preferred).", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("C. gattii — increasingly recognized in immunocompetent in endemic areas (Pacific Northwest, Australia); may have similar workup.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("Transplant recipients — surveillance CrAg if symptoms; preemptive controversial in this population.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("Long-term cryptococcal cure — clinical response + CSF culture negative at end of induction predicts.", citationIDs: ["specialty_labs_round30"])
        ],
        watchFor: [
            AttributedBullet("ELEVATED ICP — opening pressure >250 mm H2O in CSF; vision loss + herniation risk; daily LPs to OP <200; lumbar drain or shunt for refractory.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("IRIS upon ART initiation in HIV+ — paradoxical worsening; CORTICOSTEROIDS for severe; differentiate from treatment failure.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("BREAKTHROUGH on fluconazole maintenance — resistance + non-adherence; susceptibility testing + alternative therapy.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("VISION LOSS — ICP-mediated; preventable with prompt ICP management; ophthalmology.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("MORTALITY — HIV+ 10-30% in resource-rich, 50-70% in resource-limited.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("LONG-TERM SEQUELAE — cognitive, cranial nerve, hearing, vision deficits; rehabilitation.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("ENVIRONMENTAL — pigeon droppings + bird-related; outdoor avian exposure history.", citationIDs: ["specialty_labs_round30"])
        ],
        citations: [openrnLabsR30, cdcLabsR30, specialtyLabsR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum GalactomannanBDGSample {
    public static let entry: LabEntry = LabEntry(
        id: "galactomannan-bdg",
        title: "Aspergillus galactomannan + beta-D-glucan",
        subtitle: "Invasive fungal biomarkers · galactomannan for Aspergillus + BDG broad fungal (PCP + others) · serum + BAL · false positives common · serial trending",
        specimen: "Serum (galactomannan + BDG) + bronchoalveolar lavage (BAL galactomannan more sensitive); ELISA index ≥0.5 positive for galactomannan; BDG ≥80 pg/mL positive",
        nclexTags: labsTagsR30,
        referenceRanges: [
            ReferenceRangeRow(value: "Galactomannan serum index <0.5 (or <0.7 single value)", label: "Negative for invasive aspergillosis", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Galactomannan serum index ≥0.5 OR BAL ≥1.0 + clinical context", label: "Suggests invasive aspergillosis (probable / proven per EORTC/MSGERC) — initiate empiric or targeted therapy", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Galactomannan rising trend", label: "Disease progression OR treatment failure; consider alternative diagnosis or resistant strain", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Beta-D-glucan ≥80 pg/mL", label: "Suggests fungal infection — Aspergillus + Candida + PCP (P. jirovecii) + Fusarium + others; NOT mucormycosis or cryptococcus", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Both negative", label: "Lower likelihood of invasive fungal infection but doesn't exclude (especially mucormycosis, cryptococcosis — BDG-negative)", citationIDs: ["specialty_labs_round30"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative — fungal infection less likely",
                summary: "Negative galactomannan + BDG suggests low likelihood of invasive aspergillosis or other fungal infection. Mucormycosis + cryptococcus may still be present (BDG-negative). Clinical context essential per primary source.",
                nursingActions: [
                    "Continue evaluation for alternative causes (bacterial, viral, mycobacterial, non-infectious).",
                    "If high clinical suspicion: repeat serial testing; consider BAL galactomannan if pulmonary; tissue biopsy.",
                    "Mucormycosis suspected — alternative diagnostics (chest CT REVERSE HALO SIGN, tissue biopsy, PCR); BDG WILL BE NEGATIVE.",
                    "Cryptococcus — separate cryptococcal antigen testing.",
                    "Empiric antifungal — based on clinical risk + host factors."
                ],
                citationIDs: ["specialty_labs_round30"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Positive — invasive fungal infection workup",
                summary: "Positive galactomannan and/or BDG — suggests invasive aspergillosis or other fungal infection per host risk + clinical features. Confirmation + targeted treatment per primary source.",
                nursingActions: [
                    "ID consultation + multidisciplinary management.",
                    "CHEST CT — halo sign (early), air crescent sign (later), nodules, cavities, consolidation suggest invasive aspergillosis; reverse halo suggests mucormycosis.",
                    "BAL with galactomannan + microscopy + culture + PCR for definitive identification + susceptibility.",
                    "TISSUE BIOPSY for histopathology + culture — gold standard.",
                    "TREATMENT — voriconazole OR isavuconazole 1st-line invasive aspergillosis; liposomal amphotericin B if mucormycosis suspected; TMP-SMX + steroids for PCP; fluconazole / echinocandin for candidemia.",
                    "REDUCE IMMUNOSUPPRESSION when feasible; GVHD treatment optimization; coordinate transplant + heme onc.",
                    "Serial monitoring — galactomannan trending q3-7 days; declining = response; rising = failure or resistance.",
                    "RULE OUT FALSE POSITIVES — piperacillin-tazobactam (older), beta-lactams, mucositis, infant formula, intravenous fluids with cellulose, plasma-Lyte; reagent + assay-specific.",
                    "Environmental — HEPA filtration in transplant units; avoid mold exposure."
                ],
                citationIDs: ["specialty_labs_round30"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Positive galactomannan",
                causes: ["Invasive aspergillosis (most common, A. fumigatus, A. flavus, A. niger, A. terreus)", "False positives — piperacillin-tazobactam (older formulations < 2014; newer reformulated less issue), beta-lactams, mucositis, IVIG + albumin, parenteral nutrition, infant formula, intravenous fluids with cellulose filtration"],
                citationIDs: ["specialty_labs_round30"]
            ),
            CauseGroup(
                title: "Positive beta-D-glucan (broad fungal)",
                causes: ["Invasive candidiasis + candidemia", "Invasive aspergillosis", "Pneumocystis jirovecii pneumonia (PCP / PJP)", "Fusariosis, Acremonium, Paecilomyces, other rare molds", "False positives — IVIG + albumin, hemodialysis with cellulose, surgical gauze, beta-lactam antibiotics, BACTEREMIA (variable)", "NEGATIVE in mucormycosis + cryptococcosis (do NOT exclude these)"],
                citationIDs: ["specialty_labs_round30"]
            )
        ],
        nursingActions: [
            AttributedBullet("SERIAL galactomannan q3-7 days — diagnostic sensitivity + treatment response trending more reliable than single value.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("BAL GALACTOMANNAN — significantly more sensitive than serum for invasive pulmonary aspergillosis; bronchoscopy when feasible.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("BDG ALONE — non-specific; combine with galactomannan + clinical for specificity.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("MUCORMYCOSIS — galactomannan + BDG NEGATIVE; high suspicion in DKA, COVID, neutropenia → urgent CT + biopsy + amphotericin B + isavuconazole + surgical debridement.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("EORTC/MSGERC CRITERIA — combine host factors + clinical + radiographic + mycological criteria for probable, proven, possible IFD classification.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("HIGH-RISK PROPHYLAXIS — posaconazole + isavuconazole in AML on induction + allogeneic SCT GVHD + chronic granulomatous disease + transplant.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("BREAKTHROUGH on prophylaxis — voriconazole or amphotericin B coverage + susceptibility testing for azole-resistant strains.", citationIDs: ["specialty_labs_round30"])
        ],
        watchFor: [
            AttributedBullet("AZOLE-RESISTANT ASPERGILLUS — environmental azole use in agriculture; isavuconazole, amphotericin B alternatives.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("COINFECTION — mucormycosis + aspergillosis (especially severe COVID-19 + diabetes + DKA); amphotericin B coverage.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("BREAKTHROUGH INFECTION on prophylaxis — susceptibility testing + alternative coverage.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("FALSE POSITIVES — piperacillin-tazobactam, beta-lactams, mucositis; clinical correlation; serial testing for trend.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("MASSIVE HEMOPTYSIS — pulmonary angio-invasion; emergent bronchial artery embolization OR surgical.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("CNS DISSEMINATION — high mortality; intensified therapy + sometimes surgery.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("PCP — clinical features + LDH + BDG + induced sputum / BAL; galactomannan NEGATIVE.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("CANDIDA — blood culture + BDG; T2 magnetic resonance assay rapid; species susceptibility.", citationIDs: ["specialty_labs_round30"])
        ],
        citations: [openrnLabsR30, cdcLabsR30, specialtyLabsR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MalariaSmearSample {
    public static let entry: LabEntry = LabEntry(
        id: "malaria-smear-rdt",
        title: "Malaria smears (thick + thin) + rapid diagnostic test (RDT)",
        subtitle: "Gold standard giemsa-stained smears · species + parasitemia · thick sensitive thin speciates · RDTs HRP-2/pLDH point-of-care · repeat q12h if negative",
        specimen: "Fingerstick capillary OR EDTA venous blood; thick + thin smears Giemsa-stained; RDT immunochromatographic strip detects HRP-2 (P. falciparum) + pLDH (all species)",
        nclexTags: labsTagsR30,
        referenceRanges: [
            ReferenceRangeRow(value: "Thick + thin smears NEGATIVE", label: "Malaria less likely; REPEAT q12-24 hours × 3 days if high suspicion (intermittent parasitemia)", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Thick smear POSITIVE — speciate with thin smear", label: "Confirms malaria; thin smear speciates + quantifies parasitemia (% RBCs infected)", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Parasitemia <2%", label: "Uncomplicated; oral antimalarial usually appropriate", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "Parasitemia ≥2% in non-immune + ≥5% in semi-immune", label: "Severe malaria criterion; IV antimalarial + ICU; high mortality", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "RDT positive — HRP-2 (P. falciparum specific)", label: "Highly suggestive P. falciparum; confirm with smear + treat as falciparum", citationIDs: ["specialty_labs_round30"]),
            ReferenceRangeRow(value: "RDT positive — pLDH (any Plasmodium)", label: "Confirms malaria but doesn't speciate; smear for speciation", citationIDs: ["specialty_labs_round30"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative — repeat if high suspicion",
                summary: "Negative smears + RDT — malaria less likely but doesn't exclude; intermittent parasitemia possible; REPEAT q12-24 hours × 48-72 hours in patients with appropriate exposure + clinical suspicion per primary source.",
                nursingActions: [
                    "Repeat thick + thin smears q12-24 hours × 48-72 hours if symptomatic + endemic exposure.",
                    "Consider PCR for low parasitemia + atypical species.",
                    "Evaluate alternative causes — typhoid, dengue, leptospirosis, viral, bacterial sepsis, leishmaniasis (depending region).",
                    "Maintain empiric antimalarial consideration if symptoms severe + epidemiologic risk high (rare scenario)."
                ],
                citationIDs: ["specialty_labs_round30"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Positive — confirm species + severity",
                summary: "Positive malaria — speciate + quantify parasitemia + assess severity. P. falciparum = highest priority + risk of severe disease. P. vivax/ovale require radical cure with primaquine per primary source.",
                nursingActions: [
                    "EMERGENT clinical assessment — severity criteria, parasitemia level, organ involvement.",
                    "SPECIATION — P. falciparum (severe), P. vivax / ovale (relapse, G6PD screen for primaquine), P. malariae, P. knowlesi.",
                    "PARASITEMIA quantification — % RBCs infected; ≥2% non-immune + ≥5% semi-immune = severe.",
                    "SEVERE FALCIPARUM (cerebral, ARDS, AKI, hypoglycemia, hyperparasitemia, shock) — IV ARTESUNATE + ICU + supportive.",
                    "UNCOMPLICATED FALCIPARUM — Artemether-lumefantrine (Coartem) OR atovaquone-proguanil OR quinine + doxycycline.",
                    "P. VIVAX / OVALE — chloroquine OR ACT + PRIMAQUINE 30 mg PO daily × 14 days for RADICAL CURE (G6PD screen mandatory).",
                    "P. MALARIAE / KNOWLESI — chloroquine.",
                    "CHLOROQUINE-RESISTANT P. VIVAX (Indonesia, PNG) — ACT or quinine + doxycycline.",
                    "Comprehensive — CBC, BMP, LFTs, glucose, ABG/lactate, G6PD, INR/PT, HIV, type/screen if severe.",
                    "Travel + exposure + prophylaxis adherence history; CDC malaria hotline 24/7 for guidance.",
                    "Counsel — prophylaxis non-adherence common cause; PRIMAQUINE RADICAL CURE essential for P. vivax/ovale (G6PD safe).",
                    "Public health — report to CDC + local health department."
                ],
                citationIDs: ["specialty_labs_round30"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Plasmodium species",
                causes: ["P. falciparum (severe, sub-Saharan Africa primary, also Asia + Latin America)", "P. vivax (relapsing, Asia + Latin America + Horn of Africa)", "P. ovale (relapsing, West Africa)", "P. malariae (chronic, sub-Saharan Africa)", "P. knowlesi (simian zoonosis, Southeast Asia)"],
                citationIDs: ["specialty_labs_round30"]
            ),
            CauseGroup(
                title: "Differential diagnosis",
                causes: ["Typhoid fever (Salmonella typhi)", "Dengue fever", "Leptospirosis", "Influenza + other viral", "Bacterial sepsis", "Leishmaniasis (visceral)", "African trypanosomiasis", "Chagas (Latin America)", "Tick-borne (Lyme, RMSF, Q fever depending region)", "HIV / TB / other infections"],
                citationIDs: ["specialty_labs_round30"]
            )
        ],
        nursingActions: [
            AttributedBullet("THICK + THIN SMEARS — gold standard; thick concentrate parasites + sensitivity; thin speciation + parasitemia; q12-24h × 48-72h if negative + high suspicion per primary source.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("RDT — point-of-care 15-30 minute; useful when microscopy unavailable; confirm + speciate with smear when possible; HRP-2 negative doesn't exclude non-falciparum.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("PCR — most sensitive + speciates; not routine; useful low parasitemia / mixed infection / unclear species; reference labs.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("PARASITEMIA QUANTIFICATION — % infected RBCs on thin smear; trend during treatment (should decline rapidly with effective therapy).", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("TRAVEL + EXPOSURE history detailed — region, dates, prophylaxis (adherence), mosquito exposure.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("CDC MALARIA HOTLINE 24/7 — guidance on diagnosis + treatment + IV artesunate access; (770) 488-7788.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("G6PD SCREEN BEFORE PRIMAQUINE — severe hemolysis if deficient; mandatory.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("PROPHYLAXIS for travelers — adherence critical; counsel before + during + after exposure.", citationIDs: ["specialty_labs_round30"])
        ],
        watchFor: [
            AttributedBullet("SEVERE FALCIPARUM — cerebral malaria + multi-organ failure; mortality 15-20% even with treatment; IV artesunate + ICU.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("MIXED INFECTION — multiple species; thin smear + PCR; treat both if severe.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("HRP-2 DELETIONS — false-negative RDT in some African + South American strains; smear backup.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("LOW PARASITEMIA — initial smears negative; repeat essential.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("INTERPRETATION pitfalls — non-specific changes on smear; experienced microscopist + dual review.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("RELAPSE — P. vivax/ovale hypnozoites; primaquine radical cure essential.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("PROPHYLAXIS BREAKTHROUGH — non-adherence common cause; counsel.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("PREGNANCY — falciparum severe risk; quinine + clindamycin 1st trimester; ACT 2-3rd trimester.", citationIDs: ["specialty_labs_round30"]),
            AttributedBullet("BLACK WATER FEVER — massive hemolysis + hemoglobinuria + AKI; severe falciparum.", citationIDs: ["specialty_labs_round30"])
        ],
        citations: [openrnLabsR30, cdcLabsR30, specialtyLabsR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}
