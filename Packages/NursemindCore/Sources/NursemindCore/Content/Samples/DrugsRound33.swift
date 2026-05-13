import Foundation

// Curator-model drug entries (round 33 — oncology depth: targeted therapy + immunotherapy + hormonal + chemo).

private let openfdaR33 = CitationSource(
    id: "openfda_round33",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-13"
)
private let openrnPharmR33 = CitationSource(
    id: "openrn_pharm_round33",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let specialtyR33 = CitationSource(
    id: "specialty_round33",
    shortName: "NCCN + ASCO + ESMO + ONS concept citations",
    publisher: "NCCN · ASCO · ESMO · ONS",
    license: .factCitationOnly,
    url: "https://www.nccn.org/guidelines/",
    lastRetrieved: "2026-05-13"
)
private let ismpR33 = CitationSource(
    id: "ismp_round33",
    shortName: "ISMP High-Alert Medications 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-13"
)

public enum PalbociclibSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "palbociclib",
        title: "Palbociclib (Ibrance) + CDK4/6 inhibitors",
        subtitle: "HR+ HER2- breast cancer with aromatase inhibitor or fulvestrant · NEUTROPENIA most common · oral · QTc + interstitial lung disease · ribociclib + abemaciclib similar class",
        category: "CDK4/6 inhibitor — HR+ HER2- metastatic breast cancer",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective cyclin-dependent kinase 4/6 (CDK4/6) inhibitor — blocks cell cycle progression"),
            KeyValueRow(key: "Use", value: "HR+ (hormone receptor positive) HER2- metastatic breast cancer in combination with aromatase inhibitor (letrozole, anastrozole) OR fulvestrant; first-line + later-line; also early-stage adjuvant"),
            KeyValueRow(key: "Dose", value: "125 mg PO once daily × 21 days + 7 days off (28-day cycle); take with or without food (capsules); tablet take with food"),
            KeyValueRow(key: "Monitor", value: "CBC q2 weeks × 2 cycles → monthly; LFTs; signs of infection; QTc (ribociclib > abemaciclib > palbociclib); interstitial lung disease symptoms"),
            KeyValueRow(key: "Watch", value: "NEUTROPENIA (~80% — dose-limiting); CBC q2 weeks; INFECTIONS surveillance; INTERSTITIAL LUNG DISEASE (rare but reported); QTc prolongation (ribociclib > abemaciclib > palbociclib); hepatotoxicity (abemaciclib > others); diarrhea (abemaciclib most)")
        ],
        indications: AttributedProse(
            "Hormone receptor-positive (HR+) HER2-negative metastatic breast cancer — combination with AROMATASE INHIBITOR (letrozole, anastrozole) first-line OR with FULVESTRANT after endocrine therapy progression; early-stage adjuvant in selected high-risk; transformative for advanced breast cancer outcomes per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Selective inhibitor of cyclin-dependent kinases 4 + 6 (CDK4/6) → prevents phosphorylation of retinoblastoma protein (Rb) → blocks cell cycle progression from G1 to S phase → tumor growth inhibition. Works synergistically with endocrine therapy to overcome resistance.",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "Palbociclib", body: "125 mg PO once daily × 21 days then 7 days off (28-day cycle); take with or without food per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Ribociclib (Kisqali)", body: "600 mg PO once daily × 21 days then 7 days off (28-day cycle).", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Abemaciclib (Verzenio)", body: "150 mg PO BID continuously (no rest period); 200 mg BID for monotherapy.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Dose adjustments", body: "Reduce for neutropenia, hepatic toxicity, diarrhea (abemaciclib); typical reductions to 100 mg → 75 mg palbociclib; permanent discontinuation for ILD; dose adjustments based on CTCAE grade.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Hepatic / renal", body: "Severe hepatic — reduce dose; severe renal — limited data; consult.", citationIDs: ["openfda_round33"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to specific CDK4/6 inhibitor; severe hepatic impairment; concomitant strong CYP3A4 inhibitors should be managed carefully (dose reductions).",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("NEUTROPENIA — most common dose-limiting toxicity (~80%); CBC q2 weeks × 2 cycles → monthly; hold/reduce for Grade 3-4 (ANC <1000); resume when ANC recovered.", citationIDs: ["openfda_round33"]),
            AttributedBullet("INFECTIONS — increased risk from neutropenia + immunosuppression; counsel + monitor; bacterial + viral + fungal; particularly URTI + UTI + pneumonia.", citationIDs: ["openfda_round33"]),
            AttributedBullet("INTERSTITIAL LUNG DISEASE / PNEUMONITIS — rare but serious; pulmonary symptoms (dyspnea, cough, hypoxia) → emergent eval; permanent discontinuation if confirmed.", citationIDs: ["openfda_round33"]),
            AttributedBullet("QTc PROLONGATION — RIBOCICLIB highest; ECG baseline + after 14 days + clinically; correct K + Mg; avoid QT-prolonging drugs.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HEPATOTOXICITY — abemaciclib > others; LFTs baseline + monthly; hold/reduce for Grade 3-4 elevations.", citationIDs: ["openfda_round33"]),
            AttributedBullet("DIARRHEA — abemaciclib most (~80%); loperamide PRN + hydration; dose reduction if severe + dehydration.", citationIDs: ["openfda_round33"]),
            AttributedBullet("FATIGUE — common; reassure + supportive.", citationIDs: ["openfda_round33"]),
            AttributedBullet("EMBRYO-FETAL TOXICITY — Category D; reliable contraception during + ≥3 weeks after; counsel.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CYP3A4 INTERACTIONS — strong inhibitors increase levels (azole antifungals, macrolides, protease inhibitors); strong inducers reduce (rifampin, carbamazepine, phenytoin); dose adjust + avoid concurrent.", citationIDs: ["openfda_round33"])
        ],
        adverseReactions: AttributedProse(
            "Neutropenia, fatigue, infection, diarrhea (abemaciclib), nausea, alopecia, leukopenia, anemia, thrombocytopenia, increased LFTs, headache, decreased appetite, stomatitis, asthenia, ILD/pneumonitis (rare).",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INHIBITORS — azole antifungals, macrolides, protease inhibitors, grapefruit; increase CDK4/6 levels significantly; AVOID or reduce dose; counsel grapefruit.", citationIDs: ["openfda_round33"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS — rifampin, carbamazepine, phenytoin, phenobarbital, St. John's wort; significantly reduce CDK4/6; AVOID.", citationIDs: ["openfda_round33"]),
            AttributedBullet("QT-PROLONGING DRUGS — additive QTc risk (ribociclib most concerning); fluoroquinolones, macrolides, antiarrhythmics, antipsychotics; avoid.", citationIDs: ["openfda_round33"]),
            AttributedBullet("OTHER MYELOSUPPRESSIVE — chemotherapy, methotrexate, AZT; additive cytopenias.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HORMONAL THERAPY (aromatase inhibitor, fulvestrant) — designed combination; standard.", citationIDs: ["specialty_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC, CMP, LFTs, ECG (QTc baseline), reproductive status + pregnancy test, comprehensive medications + grapefruit counseling.", citationIDs: ["specialty_round33"]),
            AttributedBullet("CBC + LFTs q2 weeks × 2 cycles → monthly; hold for Grade 3-4 neutropenia + recovery; dose reductions per protocol.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Counsel — neutropenia + infection signs (fever — emergent + neutropenic fever evaluation + antibiotics), bleeding, fatigue, GI upset, dyspnea (ILD); avoid grapefruit; pregnancy counseling + reliable contraception.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("Take ABEMACICLIB with food to reduce diarrhea; PALBOCICLIB with or without food; loperamide on hand for abemaciclib diarrhea.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Concurrent ENDOCRINE THERAPY — letrozole 2.5 mg, anastrozole 1 mg, exemestane 25 mg, OR fulvestrant 500 mg IM q4 weeks; counseling about combined therapy.", citationIDs: ["specialty_round33"]),
            AttributedBullet("ILD MONITORING — counsel respiratory symptoms emergent; emergent workup if dyspnea + cough + hypoxia.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Pregnancy — Category D; men + women contraception; pregnancy planning.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Cost + insurance — specialty oncology drug; financial assistance + manufacturer programs.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Long-term — continue until disease progression OR unacceptable toxicity; transition to other lines.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This oral medicine treats your hormone-receptor-positive breast cancer in combination with hormone therapy. Take 21 days on + 7 days off (palbociclib) OR daily (abemaciclib). Tell us about fever (very important — call right away), bruising, severe diarrhea, shortness of breath, yellow eyes. Avoid grapefruit. Use reliable birth control. Get bloodwork every 2 weeks at first.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum OlaparibSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "olaparib",
        title: "Olaparib (Lynparza) + PARP inhibitors",
        subtitle: "BRCA1/2 mutated cancers · BREAST + OVARIAN + PROSTATE + PANCREATIC · synthetic lethality with BRCA · MDS/AML risk · niraparib + talazoparib + rucaparib similar class",
        category: "PARP inhibitor — BRCA1/2-mutated cancers",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Poly(ADP-ribose) polymerase (PARP) inhibitor — synthetic lethality with BRCA1/2 deficient cells"),
            KeyValueRow(key: "Use", value: "BRCA1/2 mutated cancers — ovarian (maintenance, 1L + recurrent), breast (germline BRCA, metastatic), prostate (BRCA + HRD castration-resistant), pancreatic (BRCA-mutated metastatic); FDA-approved expanding"),
            KeyValueRow(key: "Dose", value: "300 mg PO BID (tablets) OR 400 mg PO BID (older capsules); food does not affect tablet; capsules with food (older)"),
            KeyValueRow(key: "Monitor", value: "CBC monthly (cytopenias), LFTs, signs of MDS/AML (boxed), cancer-specific tumor markers"),
            KeyValueRow(key: "Watch", value: "BOXED — myelodysplastic syndrome (MDS) + acute myeloid leukemia (AML) rare but devastating; CYTOPENIAS (especially anemia, thrombocytopenia); PNEUMONITIS rare; venous thromboembolism (niraparib > others); teratogen; CYP3A4 substrate")
        ],
        indications: AttributedProse(
            "BRCA1/2 mutated cancers — ovarian (front-line maintenance after platinum chemo, recurrent platinum-sensitive); breast (germline BRCA1/2 metastatic, post-chemotherapy); prostate (BRCA-mutated + HRR mutations metastatic castration-resistant); pancreatic (germline BRCA-mutated metastatic, maintenance after platinum). PARP inhibitors expanding FDA approvals; precision medicine cornerstone per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "PARP enzymes repair single-strand DNA breaks via base excision repair. Olaparib + other PARP inhibitors bind to PARP enzyme → trap PARP-DNA complex → unrepaired single-strand breaks → replication-coupled double-strand breaks. In BRCA1/2-deficient (or HRD-deficient) cells, homologous recombination repair impaired → cells cannot repair the resulting DSBs → SYNTHETIC LETHALITY (cell death). Selective for tumors with HR defects; normal cells less affected.",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "Tablets (preferred)", body: "300 mg PO BID; with or without food; standard formulation; multiple cancer types per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Capsules (older — being phased out)", body: "400 mg PO BID with food; less convenient.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Dose adjustments", body: "Reduce to 250 mg → 200 mg BID for Grade ≥3 toxicity (cytopenias, ALT/AST); hold for severe; permanent discontinuation for MDS/AML or severe pneumonitis.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Hepatic / renal", body: "Mild-moderate — no adjustment; severe hepatic — limited data; severe renal — reduce dose; consult.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Pediatric", body: "Limited; not routine.", citationIDs: ["openfda_round33"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to olaparib; pregnancy (Category D — teratogen); breastfeeding; severe hepatic impairment (relative).",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("BOXED — MYELODYSPLASTIC SYNDROME (MDS) + ACUTE MYELOID LEUKEMIA (AML) — rare ~1-3%; usually after prolonged use (≥2 years); permanent discontinuation if confirmed; CBC monitoring + bone marrow biopsy if persistent cytopenias.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CYTOPENIAS — anemia (~85%), thrombocytopenia (~25%), neutropenia; CBC weekly initially → monthly; transfusion + dose adjustments + G-CSF as needed.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PNEUMONITIS — rare; respiratory symptoms (cough, dyspnea, hypoxia) → emergent eval + discontinuation if confirmed.", citationIDs: ["openfda_round33"]),
            AttributedBullet("VENOUS THROMBOEMBOLISM — niraparib > olaparib; counsel + thrombosis surveillance.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HEPATOTOXICITY — LFT elevations possible; monitor monthly.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CYP3A4 SUBSTRATE — strong inhibitors increase olaparib (azole antifungals, macrolides, protease inhibitors, grapefruit); inducers reduce (rifampin, anticonvulsants, St. John's wort); avoid OR dose adjust.", citationIDs: ["openfda_round33"]),
            AttributedBullet("EMBRYO-FETAL TOXICITY — Category D; reliable contraception during + 6 months after (women), 3 months after (men); pregnancy counseling.", citationIDs: ["openfda_round33"]),
            AttributedBullet("LACTATION — avoid breastfeeding × 1 month after.", citationIDs: ["openfda_round33"])
        ],
        adverseReactions: AttributedProse(
            "Anemia, fatigue, nausea, vomiting, neutropenia, decreased appetite, leukopenia, headache, thrombocytopenia, abdominal pain, diarrhea, dyspepsia, increased Cr, stomatitis, MDS/AML (rare), pneumonitis (rare).",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INHIBITORS — significantly increase olaparib; AVOID or reduce dose to 150 mg BID (50% reduction).", citationIDs: ["openfda_round33"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS — significantly reduce; AVOID.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Other myelosuppressive — chemotherapy, AZT, methotrexate; additive cytopenias.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Other genotoxic agents — additive bone marrow toxicity.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Concurrent hormonal therapy — sometimes combined per protocol.", citationIDs: ["specialty_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC + diff (anemia, thrombocytopenia, neutropenia), CMP, LFTs, BRCA testing confirmed + HRD testing, comprehensive medications + grapefruit counseling, pregnancy test, BUN/Cr.", citationIDs: ["specialty_round33"]),
            AttributedBullet("CBC WEEKLY × 4 weeks → MONTHLY; LFTs monthly initially; persistent cytopenias > 4 weeks → bone marrow biopsy (MDS/AML).", citationIDs: ["openfda_round33"]),
            AttributedBullet("Counsel — anemia + transfusion may be needed; bleeding (thrombocytopenia), infection (neutropenia), severe nausea/vomiting (antiemetics PRN), fatigue, persistent unusual cytopenias call (MDS concern).", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("Hold + reduce dose for Grade 3-4 toxicity; resume when recovered; permanent discontinuation for MDS/AML.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Pregnancy — Category D; reliable contraception during + 6 months after women, 3 months after men; both partners contraception; pregnancy planning + genetic counseling for BRCA.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Genetic counseling — BRCA1/2 carriers + family screening + cascade testing.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Long-term — continue until progression OR unacceptable toxicity; MDS/AML risk increases with duration ≥2 years.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Multidisciplinary — oncology + genetic counselor + hematology if MDS concerns.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cost + insurance — specialty oncology drug; financial assistance.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This oral medicine treats BRCA-mutated cancers (ovarian, breast, prostate, pancreatic). Take twice daily. Avoid grapefruit. Watch for severe fatigue (anemia — may need transfusion), bruising/bleeding (low platelets), infections, breathing trouble, severe nausea. We monitor blood counts closely. Birth control essential — this can cause birth defects. Get genetic counseling for family screening.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NivolumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "nivolumab",
        title: "Nivolumab (Opdivo) + anti-PD-1 immunotherapy",
        subtitle: "PD-1 checkpoint inhibitor · MELANOMA + NSCLC + RCC + HEAD/NECK + HCC + ESOPHAGEAL + GASTRIC · irAE risk all systems · IV q2 weeks · combination + monotherapy",
        category: "Anti-PD-1 immune checkpoint inhibitor — multi-cancer",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anti-PD-1 monoclonal antibody — blocks PD-1 inhibitory receptor on T cells → restores immune activity against tumor"),
            KeyValueRow(key: "Use", value: "Multiple cancers — melanoma (monotherapy + combination with ipilimumab), NSCLC, renal cell carcinoma, head + neck squamous cell, hepatocellular carcinoma, urothelial, MSI-high/MMR-deficient colorectal, esophageal + gastric + cardiac adenocarcinoma, classical Hodgkin lymphoma, mesothelioma"),
            KeyValueRow(key: "Dose", value: "240 mg IV every 2 weeks (OR 480 mg IV every 4 weeks) for most indications; 3 mg/kg IV q2 weeks alternative; combination doses with ipilimumab vary by cancer type"),
            KeyValueRow(key: "Monitor", value: "TSH/T4 + cortisol + LFTs + Cr + CBC every cycle; symptoms of any organ irAE; chest imaging for pneumonitis"),
            KeyValueRow(key: "Watch", value: "IMMUNE-RELATED ADVERSE EVENTS (irAEs) — colitis, pneumonitis, hepatitis, endocrinopathies (hypophysitis, thyroiditis, adrenal, T1DM), nephritis, dermatitis, myocarditis (severe), neurologic; ALL organ systems can be affected; CORTICOSTEROIDS first-line for moderate-severe irAEs; HIGH-ALERT")
        ],
        indications: AttributedProse(
            "Multiple cancer indications — melanoma (1st-line + adjuvant + combination with ipilimumab), NSCLC (1L + subsequent lines), renal cell carcinoma (1L + subsequent), head + neck squamous, hepatocellular, urothelial, MSI-high/MMR-deficient colorectal, esophageal + gastric + cardiac adenocarcinoma, classical Hodgkin lymphoma, mesothelioma. PEMBROLIZUMAB (Keytruda) is similar mechanism + indications. Transforming oncology outcomes per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Humanized anti-PD-1 IgG4 monoclonal antibody — binds PD-1 receptor on T cells → blocks interaction with PD-L1/PD-L2 ligands on tumor cells + immune cells → RESTORES T-cell activation against tumor → enhanced anti-tumor immunity. Removes 'immune brake' that tumors exploit to evade immune surveillance. Effect generally durable when responsive; some pseudoprogression (initial appearance of growth before response).",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "Most indications (monotherapy)", body: "240 mg IV every 2 weeks OR 480 mg IV every 4 weeks (flat dosing); infusion over 30 minutes per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Weight-based alternative", body: "3 mg/kg IV every 2 weeks (older protocol).", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Combination with ipilimumab", body: "Varies by cancer; e.g., melanoma: nivolumab 1 mg/kg + ipilimumab 3 mg/kg × 4 doses → nivolumab 240/480 mg q2-4 weeks maintenance.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Renal / hepatic", body: "Mild-moderate — no adjustment; severe — limited data, generally use with caution.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Pediatric", body: "Limited; specific pediatric oncology indications (Hodgkin lymphoma).", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Duration", body: "Continue until progression OR unacceptable toxicity; some protocols define treatment duration (1-2 years).", citationIDs: ["specialty_round33"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to nivolumab or any component; pregnancy (theoretical; Category C); active autoimmune disease (relative — case by case); prior severe irAE leading to permanent discontinuation.",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("IMMUNE-RELATED ADVERSE EVENTS (irAEs) — can affect ANY ORGAN SYSTEM; CTCAE grading + management algorithm; MOST COMMON — colitis, pneumonitis, hepatitis, endocrinopathies; RARE BUT SEVERE — myocarditis, neurologic, hematologic.", citationIDs: ["specialty_round33"]),
            AttributedBullet("PNEUMONITIS — cough, dyspnea, hypoxia, fever; chest imaging; STEROIDS (prednisone 1-2 mg/kg) for Grade 2+; STOP nivolumab; sometimes permanent discontinuation Grade 3-4.", citationIDs: ["specialty_round33"]),
            AttributedBullet("COLITIS — diarrhea, abdominal pain, blood in stool; STOP nivolumab + steroids; infliximab + vedolizumab for steroid-refractory; perforation/megacolon rare.", citationIDs: ["specialty_round33"]),
            AttributedBullet("HEPATITIS — elevated LFTs; STOP nivolumab + steroids; methylprednisolone IV for severe.", citationIDs: ["specialty_round33"]),
            AttributedBullet("ENDOCRINOPATHIES — hypophysitis (low ACTH, TSH, gonadotropins, prolactin elevated; MRI pituitary), thyroiditis (transient thyrotoxicosis → hypothyroidism — usually permanent), adrenal insufficiency, T1DM with DKA possible; hormone replacement, NOT corticosteroids initially.", citationIDs: ["specialty_round33"]),
            AttributedBullet("MYOCARDITIS — emergent; fatal in 25-50%; troponin elevation, ECG changes, arrhythmia, HF; high-dose steroids + ATG + plasmapheresis for severe; ECG + troponin at every cycle.", citationIDs: ["specialty_round33"]),
            AttributedBullet("NEUROLOGIC — Guillain-Barré-like, myasthenia gravis-like, encephalitis, transverse myelitis, peripheral neuropathies; emergent; immunosuppression + supportive.", citationIDs: ["specialty_round33"]),
            AttributedBullet("DERMATITIS — rash + pruritus + bullous; topical or oral steroids based on severity; Stevens-Johnson syndrome rare.", citationIDs: ["specialty_round33"]),
            AttributedBullet("NEPHRITIS — interstitial; rising Cr; steroids; renal biopsy in some.", citationIDs: ["specialty_round33"]),
            AttributedBullet("INFUSION REACTIONS — uncommon (3-10%); fever, chills, hypersensitivity; pre-medication helpful in subsequent if reactions.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PSEUDOPROGRESSION — apparent disease growth before response; common; reimage 4-6 weeks before declaring failure.", citationIDs: ["specialty_round33"]),
            AttributedBullet("PREGNANCY — Category C; avoid; counsel.", citationIDs: ["openfda_round33"]),
            AttributedBullet("AUTOIMMUNE disease history — case-by-case; rebalance immune system can flare underlying autoimmunity.", citationIDs: ["specialty_round33"])
        ],
        adverseReactions: AttributedProse(
            "Fatigue, rash, pruritus, diarrhea/colitis, nausea, decreased appetite, cough, pneumonitis, arthralgia, hepatitis, endocrinopathies, nephritis, myocarditis (rare), neurologic events (rare).",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("OTHER IMMUNOTHERAPIES — ipilimumab combination commonly used (increased irAE risk + efficacy); other PD-1/PD-L1 not combined.", citationIDs: ["specialty_round33"]),
            AttributedBullet("CORTICOSTEROIDS — counter-intuitive; high-dose pre-treatment may reduce efficacy; chronic moderate use OK; reserve for irAE management when needed.", citationIDs: ["specialty_round33"]),
            AttributedBullet("IMMUNOSUPPRESSANTS — TNF-alpha inhibitors, methotrexate, etc., for irAE management; coordinate timing + temporary discontinuation of nivolumab.", citationIDs: ["specialty_round33"]),
            AttributedBullet("LIVE VACCINES — avoid; inactivated OK but reduced response.", citationIDs: ["specialty_round33"]),
            AttributedBullet("CHEMOTHERAPY — sometimes combined; specific protocols.", citationIDs: ["specialty_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive — CBC, CMP (Cr, LFTs), TSH/T4, cortisol, ACTH, autoimmune screen, ECG + troponin (cardiac), chest CT, hepatitis serologies, HIV; PD-L1 expression + tumor mutational burden for some indications.", citationIDs: ["specialty_round33"]),
            AttributedBullet("PRE-TREATMENT — autoimmune disease evaluation; assess for immunocompromise; vaccinations updated (no live within month).", citationIDs: ["specialty_round33"]),
            AttributedBullet("MONITORING — each cycle: TSH + T4 + cortisol + LFTs + Cr + CBC + lipase + amylase + troponin + clinical assessment for irAEs.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Patient + family education — irAE recognition + reporting + ALL ORGAN systems can be affected; emergency action plan; ID bracelet/wallet card.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("ALERT FOR — diarrhea + abdominal pain (colitis), cough + dyspnea (pneumonitis), elevated LFTs (hepatitis), fatigue + thirst/polyuria + DKA signs (T1DM + diabetes), severe headache + visual changes (hypophysitis), severe weakness (myasthenia + GBS-like), palpitations + chest pain (myocarditis — emergent), rash + Stevens-Johnson features, AKI signs.", citationIDs: ["specialty_round33"]),
            AttributedBullet("irAE MANAGEMENT — Grade 1 supportive; Grade 2 hold + prednisone 1 mg/kg + symptom monitoring; Grade 3-4 STOP + high-dose IV steroids ± immunosuppressant (infliximab, vedolizumab, MMF); resume after recovery if clinically appropriate.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Multidisciplinary irAE — oncology + endocrinology + gastroenterology + pulmonology + nephrology + cardiology + neurology + ID; protocol-driven response.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Pseudoprogression — counsel + reimage in 4-6 weeks before declaring failure; some pseudo-responses also reported.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Pregnancy + reproductive — counsel; contraception during + after; pregnancy registry encouraged.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cost + insurance — specialty oncology drug; financial assistance + manufacturer assistance.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This IV immunotherapy boosts your immune system to attack the cancer. You'll get it every 2-4 weeks. Side effects can affect ANY part of your body — call us immediately for: diarrhea + bloody stool, breathing trouble + cough, yellow eyes/skin, severe fatigue + thirst, palpitations + chest pain, severe weakness, new rash + fever, decreased urine output. We monitor blood tests every cycle. Carry an immunotherapy wallet card.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IpilimumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ipilimumab",
        title: "Ipilimumab (Yervoy)",
        subtitle: "Anti-CTLA-4 checkpoint inhibitor · MELANOMA + RCC + COMBINATIONS · HIGHER irAE rate than anti-PD-1 · IV q3 weeks × 4 doses · combination with nivolumab common",
        category: "Anti-CTLA-4 immune checkpoint inhibitor — melanoma + combinations",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anti-CTLA-4 monoclonal antibody — blocks CTLA-4 inhibitory receptor on T cells → enhances early T-cell activation"),
            KeyValueRow(key: "Use", value: "Melanoma (monotherapy + combination with nivolumab), renal cell carcinoma (combination with nivolumab), MSI-high colorectal cancer (combination), NSCLC (combination), mesothelioma (combination); generally USED IN COMBINATION with anti-PD-1"),
            KeyValueRow(key: "Dose", value: "3 mg/kg IV every 3 weeks × 4 doses (melanoma monotherapy); 1 mg/kg IV every 3 weeks × 4 doses (combination with nivolumab); infusion over 90 minutes"),
            KeyValueRow(key: "Monitor", value: "All checkpoint inhibitor monitoring (CBC, CMP, LFTs, TSH, troponin, ECG, clinical irAEs); HIGHER irAE rates than anti-PD-1"),
            KeyValueRow(key: "Watch", value: "HIGHER irAE rates than anti-PD-1 (~60-80% any grade with combo); colitis + hypophysitis particularly; less efficacious as monotherapy than anti-PD-1; mainly combination role; HIGH-ALERT")
        ],
        indications: AttributedProse(
            "Melanoma (monotherapy + combination with nivolumab); renal cell carcinoma + MSI-high colorectal cancer + NSCLC + esophageal + mesothelioma (combinations with nivolumab + chemotherapy). Less efficacious as monotherapy than anti-PD-1 in most cancers but provides additional benefit + survival improvement when combined. Higher irAE rate is trade-off per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Anti-CTLA-4 IgG1 monoclonal antibody — blocks CTLA-4 on T cells. CTLA-4 acts early in T-cell activation (vs PD-1 which acts later in the immune response) → blocking CTLA-4 enhances T-cell priming + proliferation in lymph nodes. Synergy with PD-1 blockade for combined immune activation. CTLA-4 blockade more commonly causes broader immune activation including more frequent irAEs.",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "Melanoma monotherapy", body: "3 mg/kg IV every 3 weeks × 4 doses; complete course = 4 doses; infusion over 90 minutes per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Combination with nivolumab", body: "Most common: ipilimumab 3 mg/kg + nivolumab 1 mg/kg q3 weeks × 4 doses → nivolumab maintenance 240/480 mg q2-4 weeks (melanoma); alternative: 1 mg/kg + 3 mg/kg q3 weeks × 4 (renal, NSCLC, MSI-high CRC); cancer-specific protocols.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Adjuvant melanoma", body: "10 mg/kg q3 weeks × 4 → q12 weeks × 3 years (older), now replaced by anti-PD-1 adjuvant.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Pediatric (rare)", body: "Limited; specialty consultation.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific adjustment; severe organ impairment — case-by-case.", citationIDs: ["openfda_round33"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to ipilimumab or any component; pregnancy; severe autoimmune disease (relative — case-by-case); prior severe irAE leading to discontinuation.",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("HIGHER irAE rates than anti-PD-1 — ~60-80% any grade with combination; ~30-40% Grade 3-4; ALL organs can be affected; specific patterns more common with CTLA-4 (colitis, hypophysitis) vs PD-1 (pneumonitis, thyroid).", citationIDs: ["specialty_round33"]),
            AttributedBullet("COLITIS — significant; more frequent + severe than with anti-PD-1; STOP ipilimumab + STEROIDS (prednisone 1-2 mg/kg) for Grade 2+; infliximab + vedolizumab for steroid-refractory; perforation rare.", citationIDs: ["specialty_round33"]),
            AttributedBullet("HYPOPHYSITIS — more common with ipilimumab + combination than PD-1 alone; headache + visual changes + low ACTH/TSH/cortisol/gonadotropins; MRI pituitary; HORMONE REPLACEMENT (hydrocortisone + levothyroxine + sex hormones as needed) — usually PERMANENT pituitary deficiency.", citationIDs: ["specialty_round33"]),
            AttributedBullet("HEPATITIS — LFT elevations + jaundice + abdominal pain; STOP + steroids; methylprednisolone IV for severe; mycophenolate for steroid-refractory.", citationIDs: ["specialty_round33"]),
            AttributedBullet("DERMATITIS — common; rash + pruritus + bullous forms; severe Stevens-Johnson rare; topical/oral steroids + dermatology.", citationIDs: ["specialty_round33"]),
            AttributedBullet("ALL OTHER irAEs — pneumonitis, nephritis, myocarditis, neurologic, endocrinopathies (thyroiditis, adrenal, T1DM); same management as other ICIs; cardiology/neurology/endocrinology/etc. consultation as needed.", citationIDs: ["specialty_round33"]),
            AttributedBullet("MYOCARDITIS — fatal in 25-50%; rare but devastating; troponin + ECG + clinical assessment at every cycle; high-dose steroids + ATG + plasmapheresis for severe.", citationIDs: ["specialty_round33"]),
            AttributedBullet("INFUSION REACTIONS — uncommon (~5-10%); fever, chills, hypersensitivity; pre-medication for subsequent if reactions.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PREGNANCY — Category C; avoid; counsel.", citationIDs: ["openfda_round33"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea/colitis, fatigue, pruritus, rash, nausea, decreased appetite, hepatitis, endocrinopathies (hypophysitis, thyroiditis, adrenal), pneumonitis, nephritis, myocarditis (rare), neurologic events (rare), severe Stevens-Johnson/TEN (rare).",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("ANTI-PD-1 (nivolumab, pembrolizumab) — common combination for melanoma + RCC + others; INCREASED irAE rates + improved efficacy; cancer-specific protocols.", citationIDs: ["specialty_round33"]),
            AttributedBullet("CORTICOSTEROIDS — for irAE management; potential efficacy reduction debate.", citationIDs: ["specialty_round33"]),
            AttributedBullet("IMMUNOSUPPRESSANTS — for severe irAE management; coordinate timing of further ipilimumab.", citationIDs: ["specialty_round33"]),
            AttributedBullet("LIVE VACCINES — avoid; inactivated OK but reduced response.", citationIDs: ["specialty_round33"]),
            AttributedBullet("CHEMOTHERAPY — sometimes combined per cancer-specific protocols.", citationIDs: ["specialty_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — same as nivolumab + specific endocrine panel (more hypophysitis), enhanced GI monitoring.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Monitoring — same as nivolumab + cycle endocrine checks (cortisol, ACTH, TSH/T4, prolactin, FSH/LH, glucose).", citationIDs: ["specialty_round33"]),
            AttributedBullet("Enhanced irAE counseling for combination therapy — patient + family alerted to higher rates + more severe irAEs.", citationIDs: ["specialty_round33"]),
            AttributedBullet("ALERT FOR — diarrhea (colitis is most common irAE with ipilimumab); severe headache + visual changes (hypophysitis — particularly with combination + 4-12 weeks after start); other irAEs same as nivolumab.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Hypophysitis — usually 8-12 weeks after start; lifelong hormone replacement; coordinate endocrinology.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Colitis prevention + early treatment — antidiarrheals NOT first-line (mask diagnosis); steroids early for Grade 2+; budesonide for mild + reduce systemic steroid exposure.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Combination with nivolumab — increased irAEs + survival benefit; multidisciplinary irAE protocol coordination.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Treatment completion — typically 4 doses; ipilimumab discontinued after induction; nivolumab continued for maintenance OR until progression/toxicity.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Multidisciplinary management — oncology + endocrinology + GI + pulmonology + hepatology + cardiology + neurology + dermatology.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cost + insurance — specialty oncology; financial assistance programs.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This IV immunotherapy is typically combined with another immunotherapy (nivolumab) for melanoma + other cancers. Side effects are more frequent than other immunotherapies. CALL US RIGHT AWAY for diarrhea (any), severe headache + vision changes, yellow eyes, breathing trouble, severe fatigue, severe rash. We monitor very closely. Hormone replacement may be lifelong if pituitary/adrenal/thyroid affected.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AtezolizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "atezolizumab",
        title: "Atezolizumab (Tecentriq) + anti-PD-L1",
        subtitle: "PD-L1 checkpoint inhibitor · NSCLC + SCLC + bladder + HCC + TNBC + alveolar soft part sarcoma · IV q3 weeks · similar irAE profile to anti-PD-1",
        category: "Anti-PD-L1 immune checkpoint inhibitor — multi-cancer",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anti-PD-L1 monoclonal antibody — blocks PD-L1 ligand interaction with PD-1"),
            KeyValueRow(key: "Use", value: "NSCLC (1L + subsequent, combination with chemo), SCLC (1L combination), bladder/urothelial cancer, hepatocellular carcinoma, triple-negative breast cancer (BRCA-mutated combinations), alveolar soft part sarcoma; durvalumab + avelumab similar class with different indications"),
            KeyValueRow(key: "Dose", value: "1200 mg IV every 3 weeks (most indications); 840 mg q2 weeks OR 1680 mg q4 weeks alternative schedules"),
            KeyValueRow(key: "Monitor", value: "Same as anti-PD-1 — CBC, CMP, LFTs, TSH/T4, cortisol, ECG/troponin (cardiac), clinical irAE assessment"),
            KeyValueRow(key: "Watch", value: "irAE profile similar to anti-PD-1; pneumonitis + hepatitis + colitis + endocrinopathies + dermatitis + myocarditis (severe); less commonly used as monotherapy compared to anti-PD-1; PD-L1 expression sometimes guides selection")
        ],
        indications: AttributedProse(
            "NSCLC (1L combination with chemo + immunotherapy + bevacizumab; adjuvant; subsequent line); small cell lung cancer (1L combination with chemo); urothelial/bladder cancer; hepatocellular carcinoma (combination with bevacizumab); triple-negative breast cancer (PD-L1+ in combination with chemo); alveolar soft part sarcoma. Durvalumab + avelumab similar with different cancer indications per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Humanized anti-PD-L1 IgG1 monoclonal antibody — binds PD-L1 ligand on tumor cells + immune cells → blocks interaction with PD-1 receptor on T cells → enhances anti-tumor immune response. Similar mechanism to anti-PD-1 but targets ligand vs receptor; may have slightly different efficacy + toxicity profile but generally interchangeable conceptually.",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "Most indications", body: "1200 mg IV every 3 weeks; infusion 30-60 minutes per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Alternative dosing", body: "840 mg IV every 2 weeks OR 1680 mg IV every 4 weeks (flat dosing); cancer-specific protocols.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Combination therapy", body: "With chemotherapy or bevacizumab — specific protocols per cancer indication.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Renal / hepatic", body: "Mild-moderate — no adjustment; severe — limited data, generally avoid or extreme caution.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Duration", body: "Continue until progression OR unacceptable toxicity; some protocols define 1-2 year treatment duration.", citationIDs: ["specialty_round33"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to atezolizumab or any component; pregnancy; severe autoimmune disease (relative).",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("irAEs — same profile as anti-PD-1; ALL organs affected; CTCAE grading + management algorithm.", citationIDs: ["specialty_round33"]),
            AttributedBullet("PNEUMONITIS — same management as nivolumab; STOP + steroids; permanent discontinuation for Grade 3-4.", citationIDs: ["specialty_round33"]),
            AttributedBullet("COLITIS — STOP + steroids; infliximab/vedolizumab for refractory.", citationIDs: ["specialty_round33"]),
            AttributedBullet("HEPATITIS — STOP + steroids.", citationIDs: ["specialty_round33"]),
            AttributedBullet("ENDOCRINOPATHIES — hypophysitis (less than CTLA-4), thyroiditis, adrenal, T1DM; hormone replacement.", citationIDs: ["specialty_round33"]),
            AttributedBullet("MYOCARDITIS — emergent; same management as other ICIs.", citationIDs: ["specialty_round33"]),
            AttributedBullet("NEUROLOGIC events — Guillain-Barré-like, myasthenia gravis-like, encephalitis, peripheral neuropathy; immunosuppression + supportive.", citationIDs: ["specialty_round33"]),
            AttributedBullet("DERMATITIS + RASH — topical + oral steroids based on severity.", citationIDs: ["specialty_round33"]),
            AttributedBullet("NEPHRITIS — interstitial; steroids; renal biopsy.", citationIDs: ["specialty_round33"]),
            AttributedBullet("INFUSION REACTIONS — uncommon; pre-medication if needed for subsequent doses.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PD-L1 EXPRESSION — guides selection in some indications (NSCLC); not predictive in all.", citationIDs: ["specialty_round33"])
        ],
        adverseReactions: AttributedProse(
            "Fatigue, decreased appetite, rash, pruritus, diarrhea/colitis, cough, dyspnea, arthralgia, fever, nausea, hepatitis, endocrinopathies, nephritis, myocarditis (rare), pneumonitis, neurologic events.",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("Combination with CHEMOTHERAPY + ANTI-VEGF (bevacizumab) — specific protocols; combinations more effective + irAE profile.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Other immunotherapies (anti-CTLA-4 ipilimumab + anti-PD-1) — investigation; not routine combination.", citationIDs: ["specialty_round33"]),
            AttributedBullet("LIVE VACCINES — avoid during therapy.", citationIDs: ["specialty_round33"]),
            AttributedBullet("CORTICOSTEROIDS + immunosuppressants — for irAEs.", citationIDs: ["specialty_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE + monitoring — same as nivolumab + ipilimumab; comprehensive irAE surveillance.", citationIDs: ["specialty_round33"]),
            AttributedBullet("PD-L1 expression testing — guides selection in NSCLC, urothelial, TNBC; PD-L1 staining (22C3, SP142, SP263 assays vary by drug + cancer).", citationIDs: ["specialty_round33"]),
            AttributedBullet("Combination therapies — atezolizumab + chemo for NSCLC + SCLC + TNBC; atezolizumab + bevacizumab for HCC; protocol-specific.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Pediatric — rare use; alveolar soft part sarcoma indication; consult.", citationIDs: ["specialty_round33"]),
            AttributedBullet("irAE management — same approach as nivolumab + ipilimumab; multidisciplinary.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Counsel — irAE recognition + emergency action plan + wallet card; pregnancy avoidance.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("Pseudoprogression — possible; reimage in 4-6 weeks before declaring failure.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cost + insurance — specialty oncology; financial assistance.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This IV immunotherapy is similar to nivolumab/pembrolizumab. We may combine it with chemotherapy. Side effects are similar — call us right away for diarrhea, breathing trouble, severe fatigue, yellow eyes, palpitations, severe rash. We monitor blood tests every cycle.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AbirateroneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "abiraterone",
        title: "Abiraterone (Zytiga) + enzalutamide adjacency",
        subtitle: "CYP17 inhibitor · castration-resistant prostate cancer · combined with steroid + ADT · MINERALOCORTICOID effects (HTN + hypokalemia + edema) · hepatotoxicity · monitor cortisol",
        category: "CYP17 inhibitor — castration-resistant prostate cancer",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective inhibitor of CYP17 enzyme (17α-hydroxylase + C17,20-lyase) → blocks androgen biosynthesis in testes + adrenals + tumor"),
            KeyValueRow(key: "Use", value: "Castration-resistant prostate cancer (mCRPC + nmCRPC); high-risk metastatic hormone-sensitive prostate cancer with ADT; combination with prednisone or methylprednisolone REQUIRED"),
            KeyValueRow(key: "Dose", value: "1000 mg PO once daily on EMPTY STOMACH (2 hours after eating + 1 hour before next meal) + PREDNISONE 5 mg PO BID; with ADT (LHRH agonist or surgical castration)"),
            KeyValueRow(key: "Monitor", value: "PSA + tumor response + LFTs monthly × 3 months → q3 months; BP + K + cortisol (occasional); signs of mineralocorticoid excess (edema, HTN)"),
            KeyValueRow(key: "Watch", value: "MINERALOCORTICOID EXCESS — HYPERTENSION + HYPOKALEMIA + EDEMA — manage with eplerenone, K replacement, diuretics, BP control; PREDNISONE REQUIRED to prevent secondary adrenal insufficiency; HEPATOTOXICITY; food significantly increases levels (must take empty stomach)")
        ],
        indications: AttributedProse(
            "Castration-resistant prostate cancer (CRPC) — metastatic + non-metastatic; high-risk metastatic hormone-sensitive prostate cancer in combination with ADT. Must combine with PREDNISONE OR METHYLPREDNISOLONE (replaces glucocorticoid blocked by CYP17 inhibition, prevents secondary adrenal insufficiency + mineralocorticoid excess). Used with ADT (LHRH agonist or surgical castration) per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Selective inhibitor of CYP17 enzyme (17α-hydroxylase + C17,20-lyase) — blocks 2 essential steps in androgen biosynthesis. Inhibits androgen production in TESTES + ADRENALS + tumor (intratumoral androgens). Combined CYP17 blockade reduces blood + tissue androgens to undetectable levels in many. BLOCKS GLUCOCORTICOID biosynthesis → secondary adrenal insufficiency PREVENTED by added prednisone/methylprednisolone. BLOCKS some mineralocorticoid pathway leading to compensatory rise → HTN + hypokalemia + edema.",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "mCRPC", body: "1000 mg PO ONCE DAILY on EMPTY STOMACH (2 hours after eating + 1 hour before next meal) + PREDNISONE 5 mg PO BID; with ongoing ADT per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "nmCRPC", body: "Same dose; combination with ADT.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Metastatic hormone-sensitive prostate cancer", body: "Same dose + methylprednisolone 4 mg PO BID (instead of prednisone 5 mg) — different glucocorticoid in this setting.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Hepatic adjustment", body: "Moderate hepatic — 250 mg PO daily; severe — AVOID.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Renal", body: "No specific adjustment; severe renal — caution.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Empty stomach essential", body: "Food significantly increases bioavailability (~7-10x) — risk of toxicity; ALWAYS take empty stomach.", citationIDs: ["openfda_round33"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to abiraterone or any component; severe hepatic impairment; pregnancy (men only, but precautions in case of partner pregnancy).",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("MINERALOCORTICOID EXCESS — HYPERTENSION + HYPOKALEMIA + EDEMA — common; BP at every visit + K monthly; manage with eplerenone (preferred to spironolactone — antiandrogenic); K replacement; diuretics; HTN management.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PREDNISONE/METHYLPREDNISOLONE REQUIRED — prevents adrenal insufficiency from CYP17 blockade; counsel + adherence; stress dosing for illness/surgery.", citationIDs: ["openfda_round33"]),
            AttributedBullet("ADRENAL INSUFFICIENCY — if prednisone interrupted or inadequate; hypotension, weakness, hypoglycemia; STRESS DOSING for illness/surgery; medical alert.", citationIDs: ["specialty_round33"]),
            AttributedBullet("HEPATOTOXICITY — LFTs monthly × 3 months → q3 months; ALT/AST >5× ULN — hold; >20× ULN — discontinue.", citationIDs: ["openfda_round33"]),
            AttributedBullet("FOOD SIGNIFICANT — increases bioavailability 7-10×; ALWAYS empty stomach (2 hours after, 1 hour before food); risk of toxicity if with food.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CYP3A4 INTERACTIONS — strong inducers (rifampin) significantly reduce abiraterone; strong inhibitors not as significant.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CYP2D6 INHIBITION — abiraterone inhibits CYP2D6; affects metoprolol, dextromethorphan, codeine + many other drugs; counsel.", citationIDs: ["openfda_round33"]),
            AttributedBullet("WARFARIN — INR variability; monitor.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PARTNERS pregnancy — Category X for partner if pregnant; abiraterone in semen; condoms recommended × 7 days after stopping.", citationIDs: ["openfda_round33"])
        ],
        adverseReactions: AttributedProse(
            "Fatigue, joint swelling/pain, hot flashes, diarrhea, headache, hypertension, hypokalemia, edema, urinary tract infection, hepatic enzyme elevation, adrenal insufficiency.",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INDUCERS (rifampin, carbamazepine, phenytoin, phenobarbital, St. John's wort) — significantly reduce abiraterone; AVOID.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CYP2D6 SUBSTRATES — abiraterone inhibits CYP2D6; metoprolol, dextromethorphan, codeine, others; monitor + alternate.", citationIDs: ["openfda_round33"]),
            AttributedBullet("WARFARIN — INR variability; monitor.", citationIDs: ["openfda_round33"]),
            AttributedBullet("SPIRONOLACTONE — antiandrogenic effect; AVOID; use eplerenone for hyperaldosteronism if needed.", citationIDs: ["openfda_round33"]),
            AttributedBullet("LHRH agonists (leuprolide) + GnRH antagonists (degarelix) — concurrent for ADT; standard.", citationIDs: ["specialty_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive prostate cancer workup, PSA, testosterone, ADT history, BP, K, Cr, LFTs, ECG, comorbidities, comprehensive medications.", citationIDs: ["specialty_round33"]),
            AttributedBullet("EMPTY STOMACH education — 2 hours after, 1 hour before food; common reason for poor outcomes is non-adherence to this; counsel + reminders; same time daily.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("PREDNISONE adherence — counsel as essential; stress dosing; emergency injection kit + medical alert ID.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Monthly LFTs × 3 months → q3 months; PSA q3 months; BP at every visit; K monthly initially.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Counsel — fatigue, joint pain, hot flashes (common); BP elevation + edema + weakness (low K — sign mineralocorticoid excess); yellow eyes/skin + dark urine (hepatotoxicity); thirst/polyuria (DM); adrenal insufficiency signs.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("Mineralocorticoid excess management — eplerenone (preferred over spironolactone), K replacement, diuretics, BP control, sodium restriction.", citationIDs: ["specialty_round33"]),
            AttributedBullet("CONTINUE ADT — abiraterone WITH LHRH agonist or surgical castration; complete androgen blockade.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Alternative — ENZALUTAMIDE (Xtandi) — androgen receptor inhibitor without prednisone; different mechanism; both effective.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cost + insurance — specialty oncology; financial assistance programs; partnership with specialty pharmacy.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This medicine treats castration-resistant prostate cancer. ALWAYS take on empty stomach — 2 hours after eating + 1 hour before food. Always take with prednisone (or methylprednisolone) — do NOT miss doses. Watch for swelling, weakness, high BP, yellow eyes. Get bloodwork monthly initially. Use condoms × 7 days after stopping. Continue your other hormone therapy.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EnzalutamideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "enzalutamide",
        title: "Enzalutamide (Xtandi) + apalutamide + darolutamide",
        subtitle: "Androgen receptor inhibitor · castration-resistant + hormone-sensitive prostate cancer · NO steroid required (vs abiraterone) · seizure risk + fatigue · with food OK",
        category: "Androgen receptor inhibitor — prostate cancer",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Second-generation androgen receptor (AR) inhibitor — blocks AR binding, nuclear translocation, DNA binding"),
            KeyValueRow(key: "Use", value: "Castration-resistant prostate cancer (mCRPC + nmCRPC); high-risk metastatic + non-metastatic hormone-sensitive prostate cancer; apalutamide + darolutamide similar class with refined safety profiles"),
            KeyValueRow(key: "Dose", value: "160 mg PO once daily (4 × 40 mg capsules); with or without food; APALUTAMIDE 240 mg PO daily; DAROLUTAMIDE 600 mg PO BID with food"),
            KeyValueRow(key: "Monitor", value: "PSA + tumor response, BP, falls, seizure history, fractures (DEXA), LFTs"),
            KeyValueRow(key: "Watch", value: "SEIZURE risk (~1% — assess seizure history); FATIGUE common; FALLS + FRACTURES; HOT FLASHES + sexual dysfunction; HYPERTENSION; PRES (posterior reversible encephalopathy) rare; ischemic events with apalutamide")
        ],
        indications: AttributedProse(
            "Castration-resistant prostate cancer (CRPC) — metastatic + non-metastatic; high-risk metastatic + non-metastatic hormone-sensitive prostate cancer (HSPC); used with ongoing ADT. NO requirement for concurrent prednisone (unlike abiraterone). Apalutamide + darolutamide similar second-generation androgen receptor inhibitors with refined safety profiles per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Second-generation androgen receptor (AR) inhibitor — competitively binds AR ligand-binding domain → blocks androgen-AR binding; INHIBITS nuclear translocation of AR; INHIBITS DNA binding + transcription of androgen-responsive genes; reduces tumor growth + PSA. Higher AR affinity than first-generation bicalutamide; less proliferation-inducing.",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "Enzalutamide", body: "160 mg PO ONCE daily (4 × 40 mg capsules); with or without food per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Apalutamide (Erleada)", body: "240 mg PO once daily; with or without food.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Darolutamide (Nubeqa)", body: "600 mg PO BID with food (improves absorption); does not cross blood-brain barrier (reduced CNS effects vs enzalutamide).", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Hepatic", body: "Mild-moderate (Child-Pugh A-B) — no adjustment; severe (Child-Pugh C) — AVOID enzalutamide.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Renal", body: "Severe renal impairment — limited data.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Concurrent ADT", body: "Continue LHRH agonist or surgical castration; complete androgen blockade essential.", citationIDs: ["openfda_round33"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to enzalutamide or any component; pregnant partner (drug in semen, theoretical fetal risk).",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("SEIZURE risk — ~1% with enzalutamide; assess seizure history + risk factors; AVOID in patients with seizure disorder OR conditions that lower threshold (recent stroke, traumatic brain injury, alcohol abuse).", citationIDs: ["openfda_round33"]),
            AttributedBullet("FATIGUE — common (~30-40%); reassure + supportive; rule out anemia + hypothyroidism + depression.", citationIDs: ["openfda_round33"]),
            AttributedBullet("FALLS + FRACTURES — increased risk especially with apalutamide; assess fall risk + bone density (DEXA) + supplementation (calcium + vitamin D) + bisphosphonate or denosumab if osteoporosis.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HYPERTENSION — monitor BP + manage; common.", citationIDs: ["openfda_round33"]),
            AttributedBullet("POSTERIOR REVERSIBLE ENCEPHALOPATHY SYNDROME (PRES) — rare; headache + seizures + vision changes + altered mental status; emergent MRI; discontinue + supportive.", citationIDs: ["openfda_round33"]),
            AttributedBullet("ISCHEMIC HEART DISEASE + cardiovascular events — particularly apalutamide; assess CV risk + management.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HOT FLASHES + sexual dysfunction — common with ADT-related therapy; counsel.", citationIDs: ["openfda_round33"]),
            AttributedBullet("RASH — apalutamide more often; usually mild + manageable.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HYPOTHYROIDISM — apalutamide; monitor TSH.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CYP3A4 INDUCER — affects many drugs (warfarin, statins, etc.); review medications + alternatives.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PARTNERS pregnancy — Category X for partner pregnancy; condoms × 3 months after stopping; counsel.", citationIDs: ["openfda_round33"])
        ],
        adverseReactions: AttributedProse(
            "Fatigue, back pain, decreased appetite, constipation, arthralgia, diarrhea, hot flashes, peripheral edema, hypertension, fall, fracture, dizziness, seizure (rare), PRES (rare).",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INDUCER — enzalutamide induces CYP3A4 + many drugs reduced (warfarin, statins, oral contraceptives, immunosuppressants, antiretrovirals, antifungals, anticonvulsants); review medications carefully; alternatives or dose adjustments.", citationIDs: ["openfda_round33"]),
            AttributedBullet("STRONG CYP2C8 INHIBITORS (gemfibrozil) — significantly increase enzalutamide; avoid OR reduce dose.", citationIDs: ["openfda_round33"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS — minimal effect on enzalutamide (already strong inducer); but additive effects on other drugs.", citationIDs: ["openfda_round33"]),
            AttributedBullet("WARFARIN — INR effects variable; monitor.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Other QT-prolonging drugs — minimal interaction generally.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CONCURRENT ABIRATERONE — typically not combined; sequential preferred; investigation.", citationIDs: ["specialty_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive prostate cancer assessment, PSA + testosterone, seizure history + CNS risk factors, BP, DEXA + bone health, comorbidities, comprehensive medications.", citationIDs: ["specialty_round33"]),
            AttributedBullet("MEDICATION REVIEW critical — enzalutamide is strong CYP3A4 inducer; many drug interactions; pharmacist consultation; alternatives or dose adjustments.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Seizure assessment — history; AVOID if recent stroke + TBI + alcohol abuse + seizure disorder.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Monitoring — PSA q3 months; BP at each visit; fall risk + fracture screening; DEXA at baseline + q1-2 years; CBC + LFTs periodic.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Counsel — fatigue + hot flashes common; fall prevention; report seizures (emergent), severe headache + vision changes + altered mental status (PRES — emergent), severe rash, weakness, BP elevation.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("Bone health — calcium + vitamin D + DEXA + bisphosphonate or denosumab for osteoporosis; ADT-induced bone loss.", citationIDs: ["specialty_round33"]),
            AttributedBullet("CONTINUE ADT — LHRH agonist or surgical castration; complete androgen blockade.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Comparison — ABIRATERONE requires prednisone but no concern for seizure; ENZALUTAMIDE + ANALOGUES no prednisone but seizure + cognitive effects; choose based on patient profile.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cost + insurance — specialty oncology; financial assistance.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Multidisciplinary — urology/oncology + cardiology (CV risk) + neurology (seizure history).", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This pill treats prostate cancer. Take 4 capsules at the same time daily; with or without food. Tell us about ALL medicines + supplements — many interactions. Report severe headache + vision changes (rare brain syndrome — emergent), seizures, severe rash, weakness, falls. Get DEXA bone scan + take calcium + vitamin D. Use condoms × 3 months after stopping. Continue your hormone shots.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CapecitabineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "capecitabine",
        title: "Capecitabine (Xeloda) + 5-FU prodrug",
        subtitle: "Oral 5-FU prodrug · colorectal + breast + gastric + pancreatic · HAND-FOOT SYNDROME + diarrhea + cardiotoxicity · DPYD GENOTYPING for severe risk",
        category: "Oral fluoropyrimidine prodrug — multiple cancers",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Oral prodrug of 5-fluorouracil (5-FU) — activated to 5-FU intracellularly by thymidine phosphorylase"),
            KeyValueRow(key: "Use", value: "Colorectal cancer (adjuvant + metastatic), breast cancer (adjuvant + metastatic), gastric/gastroesophageal cancer, pancreatic cancer (combination), other GI cancers"),
            KeyValueRow(key: "Dose", value: "1250 mg/m² PO BID for 14 days every 21 days (typical monotherapy); 1000 mg/m² PO BID for 14 days every 21 days (combination); adjust for renal function + DPYD genotype"),
            KeyValueRow(key: "Monitor", value: "CBC + LFTs + Cr each cycle; hand-foot syndrome assessment; diarrhea; cardiac symptoms; DPYD genotyping pre-treatment"),
            KeyValueRow(key: "Watch", value: "HAND-FOOT SYNDROME (palmar-plantar erythrodysesthesia) — common; DIARRHEA can be severe; DPYD-DEFICIENT patients have severe + sometimes fatal toxicity; CARDIOTOXICITY (chest pain, MI); MUCOSITIS")
        ],
        indications: AttributedProse(
            "Colorectal cancer (adjuvant + metastatic, alone or in FOLFOX/FOLFIRI-like regimens — XELOX, CAPOX), breast cancer (adjuvant + metastatic with letrozole, paclitaxel, or trastuzumab), gastric/gastroesophageal cancer (with platinum + targeted therapy), pancreatic cancer (combination with gemcitabine OR FOLFIRINOX), other GI cancers, cholangiocarcinoma per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Oral prodrug of 5-fluorouracil (5-FU); converted via three-step enzymatic activation — 5'-deoxy-5-fluorocytidine (5'-DFCR) → 5'-deoxy-5-fluorouridine (5'-DFUR) → 5-FU; TUMOR-SELECTIVE activation by THYMIDINE PHOSPHORYLASE (higher in tumors than normal tissues). 5-FU inhibits thymidylate synthase → reduces thymidine availability for DNA synthesis + incorporates into RNA → cell death. Selective for proliferating cells.",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "Colorectal cancer monotherapy", body: "1250 mg/m² PO BID for 14 days every 21 days; adjust for BSA + renal function + toxicity per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Colorectal cancer combination (XELOX)", body: "1000 mg/m² PO BID for 14 days every 21 days with oxaliplatin 130 mg/m² IV day 1.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Breast cancer", body: "1250 mg/m² PO BID for 14 days every 21 days; OR 1000 mg/m² PO BID with combinations.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Renal adjustment", body: "CrCl 30-50 — reduce dose 75% (initial 950 mg/m² BID); CrCl <30 — AVOID.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "DPYD genotype-guided dosing", body: "DPYD*2A, c.2846A>T variants — significantly reduced dose required (~50%); homozygous deficient — AVOID; HETEROZYGOUS deficient — significant dose reduction + close monitoring; pre-treatment genotyping increasingly standard.", citationIDs: ["specialty_round33"]),
            DosingBlock(label: "Hepatic adjustment", body: "Hepatic dysfunction from liver metastases or hepatitis — caution; mild-moderate may not require adjustment; severe — AVOID.", citationIDs: ["openfda_round33"])
        ],
        contraindications: AttributedProse(
            "Severe renal impairment (CrCl <30); DPYD complete deficiency (homozygous DPYD*2A); pregnancy (teratogen); breastfeeding; hypersensitivity to capecitabine, 5-FU, or excipients.",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("HAND-FOOT SYNDROME (palmar-plantar erythrodysesthesia) — common (~50%); painful red palms + soles; counsel + topical urea/cocoa butter; reduce dose for Grade 2+; emollients + analgesics + avoid heat/friction + dose holiday.", citationIDs: ["openfda_round33"]),
            AttributedBullet("DIARRHEA — can be severe; loperamide 2-4 mg q2 hours up to 16 mg/day for Grade 2+; HOLD capecitabine for Grade 3-4 diarrhea + hydration + supportive; can be life-threatening + lethal.", citationIDs: ["openfda_round33"]),
            AttributedBullet("DPYD DEFICIENCY — DPYD enzyme essential for 5-FU clearance; deficient patients have prolonged exposure + severe toxicity (sometimes fatal); DPYD GENOTYPING increasingly standard pre-treatment; homozygous deficient — AVOID; heterozygous — significant dose reduction.", citationIDs: ["specialty_round33"]),
            AttributedBullet("CARDIOTOXICITY — coronary spasm + chest pain + MI; particularly with high doses + history of CAD; usually reversible with discontinuation; ECG + cardiac symptoms; hold for cardiac toxicity.", citationIDs: ["openfda_round33"]),
            AttributedBullet("MUCOSITIS — oral + GI; usually manageable; severe cases need dose modification.", citationIDs: ["openfda_round33"]),
            AttributedBullet("MYELOSUPPRESSION — anemia + neutropenia + thrombocytopenia; CBC monitoring; less severe than IV 5-FU.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HEPATOTOXICITY — LFT elevations; monitor.", citationIDs: ["openfda_round33"]),
            AttributedBullet("EMBRYO-FETAL TOXICITY — Category D; teratogen; reliable contraception during + 6 months after (women + men); pregnancy counseling.", citationIDs: ["openfda_round33"]),
            AttributedBullet("WARFARIN INTERACTION — capecitabine inhibits warfarin metabolism → INR can rise dramatically; close monitoring; sometimes switch to LMWH.", citationIDs: ["openfda_round33"]),
            AttributedBullet("DEHYDRATION — diarrhea + mucositis + reduced oral intake; aggressive hydration; recognize signs.", citationIDs: ["openfda_round33"])
        ],
        adverseReactions: AttributedProse(
            "Hand-foot syndrome (palmar-plantar erythrodysesthesia), diarrhea, nausea, vomiting, abdominal pain, mucositis, fatigue, alopecia (mild), neutropenia, lymphopenia, thrombocytopenia, hyperbilirubinemia, dermatitis, cardiotoxicity.",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("WARFARIN — significant interaction; INR rises substantially; close monitoring; sometimes switch to LMWH.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PHENYTOIN — capecitabine increases phenytoin levels; monitor.", citationIDs: ["openfda_round33"]),
            AttributedBullet("LEUCOVORIN — synergistic with 5-FU; sometimes combined.", citationIDs: ["openfda_round33"]),
            AttributedBullet("ANTACIDS (especially aluminum + magnesium) — minor effect on absorption.", citationIDs: ["openfda_round33"]),
            AttributedBullet("RADIATION — concurrent radiation increases toxicity; specific protocols.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Other chemotherapy combinations — XELOX, CAPOX, combinations per protocol.", citationIDs: ["specialty_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive cancer workup, DPYD genotyping (increasingly standard), CBC, LFTs, Cr, BSA calculation, comorbidities, INR if on warfarin, pregnancy test, baseline cardiac function.", citationIDs: ["specialty_round33"]),
            AttributedBullet("DPYD genotyping — partial or complete deficiency increases severe toxicity risk; reduce or avoid dose; emerging standard pre-treatment.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Patient education — handout for hand-foot syndrome prevention (avoid heat, friction, pressure; emollients), diarrhea management (loperamide, hydration, when to call), mucositis (oral care, soft diet), cardiac symptoms (chest pain — emergent), pregnancy avoidance.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("Monitoring — CBC + LFTs + Cr each cycle; toxicity assessment; tumor response.", citationIDs: ["specialty_round33"]),
            AttributedBullet("DOSE ADJUSTMENTS — for Grade 2+ toxicity; standard dose reduction algorithms (typically 25% reduction); hold for severe; restart at reduced dose after recovery.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Warfarin patients — closer INR monitoring; consider switching to LMWH.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Cardiac patients — caution + cardiac monitoring; reduce dose or alternative if significant CAD.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Pregnancy + lactation — contraception × 6 months after (women + men); avoid breastfeeding × 2 weeks after.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Multidisciplinary — oncology + GI + cardiology + pharmacy + nutrition.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cost + insurance — generic available + lower cost than IV chemotherapy.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This oral chemo pill treats colorectal, breast, and other cancers. Take twice daily on schedule (usually 14 days on, 7 days off). Watch for painful red/peeling hands + feet (use emollients, avoid heat), severe diarrhea (call us, take loperamide), mouth sores, chest pain (call right away — heart effects). We tested your DPYD gene for safety. Use birth control × 6 months after stopping. Tell us about warfarin or seizure medicines.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum OxaliplatinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "oxaliplatin",
        title: "Oxaliplatin (Eloxatin)",
        subtitle: "Platinum chemo · colorectal + gastric + pancreatic adjuvant + metastatic · ACUTE + CHRONIC peripheral neuropathy · cold-triggered acute · cumulative chronic · FOLFOX + CAPOX",
        category: "Platinum chemotherapy — colorectal + gastric + pancreatic cancer",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Third-generation platinum-containing chemotherapy — DNA cross-linking agent"),
            KeyValueRow(key: "Use", value: "Colorectal cancer (adjuvant + metastatic, FOLFOX regimen — folinic acid + 5-FU + oxaliplatin; CAPOX — capecitabine + oxaliplatin), gastric/gastroesophageal cancer, pancreatic cancer (FOLFIRINOX), small bowel adenocarcinoma"),
            KeyValueRow(key: "Dose", value: "85 mg/m² IV every 2 weeks (FOLFOX, FOLFIRINOX) OR 130 mg/m² IV every 3 weeks (CAPOX); infusion 2-6 hours through central or peripheral line; dilute in D5W (NOT NS — chloride-containing precipitates oxaliplatin)"),
            KeyValueRow(key: "Monitor", value: "CBC + CMP + Cr + LFTs every cycle; peripheral neuropathy assessment; infusion reactions; hand-foot syndrome (with capecitabine)"),
            KeyValueRow(key: "Watch", value: "ACUTE peripheral neuropathy (~95%) — cold-triggered dysesthesias face/hands/throat, usually resolves between cycles; CHRONIC cumulative neuropathy — dose-limiting + persistent (~40% Grade 2+); HYPERSENSITIVITY reactions; cold-water/cold-food avoidance counseling; D5W only (NOT NS)")
        ],
        indications: AttributedProse(
            "Colorectal cancer — adjuvant (Stage III) + metastatic (1st + 2nd line) as part of FOLFOX (folinic acid + 5-FU + oxaliplatin) OR CAPOX (capecitabine + oxaliplatin); gastric/gastroesophageal cancer (combination); pancreatic cancer (FOLFIRINOX); small bowel adenocarcinoma. Backbone of GI cancer chemotherapy per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Third-generation platinum-containing chemotherapy — forms DNA cross-links (intra-strand + inter-strand) → blocks DNA replication + transcription → cell cycle arrest + apoptosis. Different DNA adduct pattern than cisplatin (less crystalline structure). Resistance mechanisms similar to other platinums but different chemistry. Synergistic with 5-FU + leucovorin in FOLFOX regimen.",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "FOLFOX (every 2 weeks)", body: "85 mg/m² IV over 2 hours day 1; with leucovorin + 5-FU; total course typically 12 cycles (6 months) for adjuvant per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "CAPOX (every 3 weeks)", body: "130 mg/m² IV over 2 hours day 1; with capecitabine 1000 mg/m² PO BID days 1-14; total course 8 cycles for adjuvant.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "FOLFIRINOX (every 2 weeks — pancreatic)", body: "85 mg/m² IV with irinotecan + leucovorin + 5-FU (bolus + 46-hour infusion); high toxicity; selected patients.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Dose modifications", body: "Reduce 25% for neuropathy Grade 2 persistent; discontinue for Grade 3-4 neuropathy + functional impact; hold for cytopenias + hepatic toxicity per CTCAE.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Renal adjustment", body: "CrCl ≥30 — no significant adjustment; severe renal — caution.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Diluent — D5W ONLY", body: "Oxaliplatin must be DILUTED IN D5W (5% dextrose); incompatible with normal saline + chloride-containing solutions (precipitation); critical pharmacy + administration error.", citationIDs: ["specialty_round33"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to oxaliplatin or other platinums; severe renal impairment (uncommon); pregnancy; breastfeeding; thrombocytopenia + significant cytopenias.",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("ACUTE peripheral neuropathy — ~95% of patients; cold-triggered dysesthesias of hands/feet/throat/larynx/jaw — sometimes severe acute dysphagia (\"cold-induced dysesthesias\"); resolves within hours-days; counsel COLD AVOIDANCE (no cold drinks, food, exposure during + 1-2 days post-infusion).", citationIDs: ["openfda_round33"]),
            AttributedBullet("CHRONIC CUMULATIVE NEUROPATHY — dose-limiting; persists + can worsen after treatment; sensory > motor; stocking-glove distribution; ~50% develop Grade 2+; permanent sensory deficits in many; functional impact (dropping items, gait, vibration).", citationIDs: ["openfda_round33"]),
            AttributedBullet("HYPERSENSITIVITY REACTIONS — anaphylaxis-like; usually during infusion + subsequent cycles; pre-medications + observation; some require discontinuation.", citationIDs: ["openfda_round33"]),
            AttributedBullet("MYELOSUPPRESSION — neutropenia (~60%), thrombocytopenia, anemia; CBC monitoring + dose adjustment.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HEPATIC SINUSOIDAL OBSTRUCTION SYNDROME (SOS) — formerly veno-occlusive disease; from oxaliplatin in colorectal liver metastases context; affects subsequent surgical planning (liver resection harder); coordinate with surgery.", citationIDs: ["specialty_round33"]),
            AttributedBullet("DIARRHEA + nausea/vomiting — common; antiemetics + supportive; CINV management.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PULMONARY TOXICITY — rare; interstitial lung disease.", citationIDs: ["openfda_round33"]),
            AttributedBullet("RHABDOMYOLYSIS — rare.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PREGNANCY — Category D; teratogen; reliable contraception during + 4 months after (women), 4 months (men).", citationIDs: ["openfda_round33"]),
            AttributedBullet("DILUENT — D5W ONLY; NS incompatibility critical to avoid; pharmacy + administration verification.", citationIDs: ["specialty_round33"])
        ],
        adverseReactions: AttributedProse(
            "Acute + chronic peripheral neuropathy, neutropenia, anemia, thrombocytopenia, nausea/vomiting, diarrhea, fatigue, mucositis, alopecia (mild), hand-foot syndrome (with capecitabine), hepatic enzyme elevation, hypersensitivity, pulmonary toxicity (rare).",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("NS / chloride-containing solutions — INCOMPATIBLE — only D5W; critical.", citationIDs: ["openfda_round33"]),
            AttributedBullet("OTHER NEUROTOXIC drugs (vinca alkaloids, paclitaxel, cisplatin) — additive neuropathy.", citationIDs: ["openfda_round33"]),
            AttributedBullet("LEUCOVORIN + 5-FU — synergistic; standard FOLFOX combination.", citationIDs: ["openfda_round33"]),
            AttributedBullet("WARFARIN — INR variability; monitor.", citationIDs: ["openfda_round33"]),
            AttributedBullet("RADIATION — concurrent increases toxicity; coordination.", citationIDs: ["openfda_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive cancer assessment, CBC, CMP (Cr, LFTs), neuropathy baseline assessment, BSA calculation, central venous access (preferred), pregnancy test.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Pre-medication — antiemetics (NK-1 inhibitor + 5HT3 + dexamethasone); calcium + magnesium IV before + after infusion (controversial — may reduce acute neuropathy).", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cold avoidance counseling — NO cold drinks (warm beverages), no ice, no cold food, gloves for cold air, avoid air conditioning if cool; particularly during + 1-2 days post-infusion; recognize acute dysesthesias.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("Chronic neuropathy assessment — at every cycle; standardized assessments (CTCAE, EORTC); functional impact on ADLs; dose modification + holding + discontinuation for severe.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Monitoring — CBC at each cycle + nadir (2-week interval), CMP, Cr; toxicity assessment.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Dose adjustment — for Grade 2+ neuropathy (reduce 25%) + Grade 3-4 (consider discontinuation); cytopenias + hepatic toxicity adjustments.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Hypersensitivity reactions — observe during + after infusion; rapid response if anaphylaxis; pre-medications for subsequent cycles in mild reactors.", citationIDs: ["openfda_round33"]),
            AttributedBullet("D5W diluent verification — critical pharmacy + administration check; never NS.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Long-term neuropathy management — duloxetine for painful neuropathy (Cochrane evidence); gabapentinoids (gabapentin, pregabalin) lower evidence; tricyclic antidepressants; non-pharmacologic — PT/OT for fine motor + balance training; functional adaptation.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Multidisciplinary — oncology + neurology + pharmacy + nutrition + PT/OT for neuropathy.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This IV chemotherapy treats colorectal + other cancers. We give it through an IV every 2-3 weeks. CRITICAL — AVOID COLD for 1-2 days after: no cold drinks (use warm), no ice, no cold food, wear gloves for cold; cold triggers severe tingling + cramping in hands, feet, throat, face. Tell us about numbness/tingling that doesn't go away — we may need to reduce or stop the medication. Use birth control × 4 months after stopping.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CetuximabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cetuximab",
        title: "Cetuximab (Erbitux)",
        subtitle: "Anti-EGFR mAb · K-RAS wild-type metastatic colorectal + squamous H&N cancer · ACNEIFORM RASH (efficacy marker) + hypomagnesemia + infusion reactions · radiation sensitizer",
        category: "Anti-EGFR monoclonal antibody — K-RAS wild-type CRC + H&N cancer",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Chimeric anti-EGFR (epidermal growth factor receptor) monoclonal antibody"),
            KeyValueRow(key: "Use", value: "K-RAS WILD-TYPE metastatic colorectal cancer (combination or monotherapy); locally advanced + recurrent/metastatic head + neck squamous cell carcinoma (combination with radiation OR chemotherapy)"),
            KeyValueRow(key: "Dose", value: "Initial 400 mg/m² IV over 2 hours + maintenance 250 mg/m² IV weekly OR biweekly 500 mg/m²; infusion reaction premedication"),
            KeyValueRow(key: "Monitor", value: "Magnesium + calcium + potassium (hypomagnesemia common), infusion reactions, skin assessment (acneiform rash), tumor response"),
            KeyValueRow(key: "Watch", value: "ACNEIFORM RASH (~90% — correlates with response); INFUSION REACTIONS (~5% — Southeast US higher rates from alpha-gal sensitivity from tick bites); HYPOMAGNESEMIA + electrolyte wasting (renal Mg loss); K-RAS testing REQUIRED before treatment (mutated tumors don't respond + may worsen)")
        ],
        indications: AttributedProse(
            "K-RAS WILD-TYPE METASTATIC COLORECTAL CANCER — combination with chemotherapy (FOLFIRI, FOLFOX, irinotecan) OR monotherapy after chemo progression; KRAS-mutated tumors do NOT respond + may worsen outcomes; locally advanced HEAD + NECK SCC with concurrent radiation; recurrent/metastatic HNSCC with chemotherapy or as monotherapy per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Chimeric (mouse-human) anti-EGFR IgG1 monoclonal antibody — binds extracellular domain of EGFR → blocks ligand binding (EGF, TGF-α) + receptor dimerization + downstream signaling (RAS, RAF, MAPK pathway). Most active in EGFR-overexpressing tumors with WILD-TYPE downstream signaling (K-RAS + BRAF + NRAS wild-type). MUTATED downstream factors (K-RAS mutations) allow autonomous signaling independent of EGFR → cetuximab ineffective + sometimes worsens outcomes. Also ADCC + apoptosis induction.",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "Initial loading dose", body: "400 mg/m² IV over 120 minutes per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Maintenance weekly", body: "250 mg/m² IV over 60 minutes weekly per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Maintenance biweekly (off-label, commonly used)", body: "500 mg/m² IV every 2 weeks; same total exposure with less frequent visits; widely adopted for convenience.", citationIDs: ["specialty_round33"]),
            DosingBlock(label: "H&N radiation concurrent", body: "Initial 400 mg/m² 7 days before radiation start, then 250 mg/m² weekly during radiation; concurrent chemotherapy frequent.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific adjustment.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Pediatric", body: "Limited; specialty consultation.", citationIDs: ["openfda_round33"])
        ],
        contraindications: AttributedProse(
            "K-RAS, NRAS, OR BRAF mutated metastatic colorectal cancer (no benefit + potential worsening); severe hypersensitivity to cetuximab (especially alpha-gal IgE — relative); pregnancy; severe infusion reactions on prior dose.",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("INFUSION REACTIONS — typically with first dose; ~5% Grade 3-4 (especially Southeast US — alpha-gal IgE from tick bite history); PREMEDICATION with H1 antagonist (diphenhydramine 50 mg IV) + close monitoring during + 1 hour after; slow infusion; ALPHA-GAL TESTING in high-prevalence areas pre-treatment.", citationIDs: ["openfda_round33"]),
            AttributedBullet("ACNEIFORM RASH (papulopustular eruption) — ~90% on face + scalp + upper trunk; CORRELATES WITH RESPONSE (severity tracks with benefit); topical doxycycline + clindamycin + steroids + sun protection + emollients; counsel + reassure as efficacy marker.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HYPOMAGNESEMIA — common (~50%+) due to renal Mg wasting (EGFR involved in renal tubular Mg reabsorption); aggressive Mg replacement; sometimes weekly IV Mg.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PARONYCHIA + NAIL changes — common; topical antibiotic + steroid; supportive.", citationIDs: ["openfda_round33"]),
            AttributedBullet("PULMONARY TOXICITY — interstitial lung disease + pneumonitis rare; emergent eval + discontinuation.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CARDIOPULMONARY ARREST during HEAD + NECK CANCER + RADIATION — rare but reported in radiation-combined trials; baseline cardiac assessment + electrolyte optimization.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HYPERSENSITIVITY — severe + life-threatening; alpha-gal IgE testing recommended in high-prevalence areas (Southeast US).", citationIDs: ["openfda_round33"]),
            AttributedBullet("KRAS/NRAS/BRAF TESTING REQUIRED before treatment in mCRC — wild-type only benefit; mutated worsens outcomes; standard pre-treatment workup.", citationIDs: ["specialty_round33"]),
            AttributedBullet("PREGNANCY — Category C; avoid; contraception during + 6 months after.", citationIDs: ["openfda_round33"])
        ],
        adverseReactions: AttributedProse(
            "Acneiform rash, hypomagnesemia, paronychia, fatigue, asthenia, weight loss, nausea, vomiting, diarrhea, hypersensitivity reactions, infusion reactions, pulmonary toxicity (rare), cardiopulmonary events (rare).",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("CHEMOTHERAPY (FOLFIRI, FOLFOX, irinotecan, cisplatin, 5-FU) — common combinations in CRC + HNSCC.", citationIDs: ["specialty_round33"]),
            AttributedBullet("RADIATION — synergistic in HNSCC; specific protocols; increased mucositis + dermatitis.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Other EGFR-targeted therapies (panitumumab, gefitinib, erlotinib) — not concurrent.", citationIDs: ["specialty_round33"]),
            AttributedBullet("ANTIPLATELET + ANTICOAGULANT — bleeding risk + infusion reactions; supportive.", citationIDs: ["openfda_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive cancer workup, KRAS + NRAS + BRAF mutation testing (mCRC), CBC, CMP (Mg + Ca + K critical), LFTs, alpha-gal IgE if high-prevalence area + previous reactions, comprehensive medications.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Pre-medication — H1 antagonist (diphenhydramine 50 mg IV) before first dose + as needed for subsequent; epinephrine + emergency equipment available; observe ≥1 hour post-infusion.", citationIDs: ["openfda_round33"]),
            AttributedBullet("INFUSION REACTIONS — first dose most concerning; slow infusion; emergent epinephrine + steroids + supportive if anaphylaxis; permanent discontinuation if severe.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Skin care education — counsel ACNEIFORM RASH expected + correlates with response; sun protection (SPF 30+, hats, clothing), topical antibiotics (clindamycin + doxycycline), topical steroids for inflammation, gentle skin care, oral doxycycline preventive (some protocols 100 mg PO BID × 6 weeks).", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("Hypomagnesemia management — Mg replacement (oral magnesium oxide, IV magnesium sulfate 4-8 g weekly), monitor + correct K + Ca; tetany + arrhythmia signs.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Paronychia + nail changes — topical/oral antibiotics, vinegar soaks, avoid trauma; sometimes severe enough to discontinue.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Monitoring — Mg + electrolytes weekly initially; CBC, LFTs cycle; tumor response.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Combination with radiation (HNSCC) — manage radiation dermatitis + mucositis; nutritional support (sometimes G-tube); pain management.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Counsel — adherence to skin regimen + infusion attendance; emergency contacts for rash worsening + signs of allergic reaction.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("Alternative — PANITUMUMAB (Vectibix) — fully human anti-EGFR mAb; lower infusion reaction rate (no chimeric component); biweekly dosing 6 mg/kg q2 weeks; same indications.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This IV antibody treats your cancer (colorectal or head/neck). We tested your tumor's genes (KRAS/NRAS/BRAF) to make sure it will work. You'll likely get a rash that looks like acne — this is normal AND means the medicine is working. We'll give you skin care + sun protection. Your magnesium may drop — you'll need supplements + sometimes IV. Tell us about severe allergic reaction during/after infusion.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TrastuzumabDeruxtecanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "trastuzumab-deruxtecan",
        title: "Trastuzumab deruxtecan (Enhertu) + HER2 antibody-drug conjugates",
        subtitle: "HER2-targeted ADC · HER2+ breast + HER2-LOW breast + gastric · INTERSTITIAL LUNG DISEASE boxed · LV dysfunction · IV q3 weeks · DESTINY trials",
        category: "HER2-targeted antibody-drug conjugate — HER2+ + HER2-low cancers",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Antibody-drug conjugate (ADC) — humanized anti-HER2 antibody linked to topoisomerase I inhibitor (deruxtecan); cleavable linker + bystander effect"),
            KeyValueRow(key: "Use", value: "HER2+ metastatic breast cancer (after 1-2 prior lines); HER2-LOW metastatic breast cancer (DESTINY-Breast04 expansion 2022); HER2+ metastatic gastric/gastroesophageal cancer; HER2-mutated NSCLC"),
            KeyValueRow(key: "Dose", value: "5.4 mg/kg IV every 3 weeks for breast cancer; 6.4 mg/kg every 3 weeks for gastric"),
            KeyValueRow(key: "Monitor", value: "ECG + ECHO (LV function) baseline + q3 months; chest CT every cycle for ILD surveillance; CBC; emetogenic"),
            KeyValueRow(key: "Watch", value: "BOXED — INTERSTITIAL LUNG DISEASE / PNEUMONITIS (10-15% — can be fatal); LEFT VENTRICULAR DYSFUNCTION (less than older HER2 ADCs); NAUSEA + VOMITING (highly emetogenic); CYTOPENIAS; HIGH-ALERT")
        ],
        indications: AttributedProse(
            "HER2-POSITIVE metastatic breast cancer (after 1-2 prior HER2-targeted therapies) — DESTINY-Breast01/02 trials; HER2-LOW metastatic breast cancer (IHC 1+ or IHC 2+/ISH-) — DESTINY-Breast04 trial expanded approval 2022 — transformative for previously untreatable subset; HER2+ metastatic gastric/gastroesophageal cancer; HER2-mutated NSCLC. ADC class superior to older HER2 agents per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Antibody-drug conjugate (ADC) — humanized anti-HER2 antibody (trastuzumab-like) linked via CLEAVABLE LINKER to TOPOISOMERASE I INHIBITOR payload (DXd — exatecan derivative). High drug-antibody ratio (~8:1 vs 3-4 in older ADCs). Bind HER2 on tumor → internalize → lysosomal degradation → release of toxin → tumor cell death + BYSTANDER EFFECT (toxin diffuses to nearby tumor cells regardless of HER2 expression). Enables HER2-LOW tumor activity (older ADCs limited to HER2+ only).",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "Breast cancer", body: "5.4 mg/kg IV every 3 weeks; infusion over 90 minutes first dose, 30 minutes subsequent if tolerated per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Gastric / NSCLC", body: "6.4 mg/kg IV every 3 weeks; higher dose due to different tumor biology + dose-finding studies.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Dose adjustments", body: "Reduce dose for Grade 2+ pneumonitis (resume after recovery at lower dose), neutropenia + thrombocytopenia per CTCAE; permanent discontinuation for Grade 3-4 ILD.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Renal / hepatic", body: "Mild-moderate — no adjustment; severe — limited data, caution.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Pediatric", body: "Limited; not routine.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Pre-medication", body: "Aggressive antiemetic regimen — NK-1 inhibitor + 5HT3 + dexamethasone (highly emetogenic class).", citationIDs: ["specialty_round33"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to trastuzumab deruxtecan or components; pregnancy (teratogen); severe ILD/pneumonitis history.",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("BOXED — INTERSTITIAL LUNG DISEASE / PNEUMONITIS — 10-15%; can be FATAL (~1-3% Grade 5); EMERGENT respiratory symptoms (cough, dyspnea, hypoxia) → discontinue + corticosteroids + supportive; CT chest every cycle for early detection.", citationIDs: ["openfda_round33"]),
            AttributedBullet("LEFT VENTRICULAR DYSFUNCTION — less than older HER2 agents (trastuzumab, T-DM1) but possible; ECHO baseline + q3 months; discontinue + cardiology if EF declines.", citationIDs: ["openfda_round33"]),
            AttributedBullet("NAUSEA + VOMITING — highly emetogenic class; aggressive antiemetic premedication essential.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CYTOPENIAS — neutropenia + thrombocytopenia common; CBC monitoring + dose adjustments.", citationIDs: ["openfda_round33"]),
            AttributedBullet("EMBRYO-FETAL TOXICITY — teratogen; contraception during + 7 months after (women) + 4 months (men).", citationIDs: ["openfda_round33"]),
            AttributedBullet("ALOPECIA — common.", citationIDs: ["openfda_round33"]),
            AttributedBullet("INFUSION REACTIONS — uncommon (~3%); pre-medication helpful if reactions.", citationIDs: ["openfda_round33"]),
            AttributedBullet("DIARRHEA — common but typically manageable.", citationIDs: ["openfda_round33"]),
            AttributedBullet("MOUTH SORES + STOMATITIS — common; supportive care.", citationIDs: ["openfda_round33"]),
            AttributedBullet("FATIGUE — common; reassure + supportive.", citationIDs: ["openfda_round33"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, fatigue, alopecia, vomiting, neutropenia, anemia, thrombocytopenia, decreased appetite, diarrhea, constipation, headache, decreased ejection fraction, interstitial lung disease/pneumonitis.",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("Pharmacokinetic — relatively few CYP-mediated interactions (ADC + payload metabolism); coordinate with pharmacy.", citationIDs: ["openfda_round33"]),
            AttributedBullet("OTHER HER2-targeted agents — sequential not concurrent typically; protocol-specific.", citationIDs: ["specialty_round33"]),
            AttributedBullet("RADIATION — coordinate; concurrent risk of pneumonitis.", citationIDs: ["specialty_round33"]),
            AttributedBullet("STRONG CYP3A4 INHIBITORS — limited data; caution.", citationIDs: ["openfda_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive cancer workup, HER2 testing (IHC + FISH/CISH; HER2-low for IHC 1+/2+ ISH-), CBC, CMP, ECG, ECHO (LVEF), pulmonary function + chest CT (baseline + surveillance), pregnancy test.", citationIDs: ["specialty_round33"]),
            AttributedBullet("HER2 testing critical — both HER2+ AND HER2-LOW eligible; previously HER2-low had no targeted therapy; transformative.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Aggressive antiemetic pre-medication — NK-1 inhibitor (aprepitant 125 mg PO OR fosaprepitant 150 mg IV) + 5HT3 (ondansetron, palonosetron) + dexamethasone; olanzapine added for breakthrough.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Monitoring — CBC each cycle, ECHO q3 months, chest CT q3 months OR with any respiratory symptoms (CRITICAL for early ILD detection).", citationIDs: ["specialty_round33"]),
            AttributedBullet("Patient + family education — ILD recognition + emergency reporting (cough, dyspnea, low-grade fever, fatigue — any new respiratory symptoms — emergent); pulse oximetry home monitoring sometimes.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("ILD MANAGEMENT — Grade 1 (asymptomatic) — hold + monitor + repeat imaging; Grade 2 (symptomatic) — discontinue + steroids; Grade 3-4 — permanent discontinuation + steroids + supportive + pulmonary specialist; mortality risk.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cardiac surveillance — ECHO + assessment; dose modification + interruption for EF decline.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Pregnancy + lactation — strict avoidance; contraception during + 7 months after (women) + 4 months (men).", citationIDs: ["specialty_round33"]),
            AttributedBullet("Multidisciplinary — oncology + pulmonology + cardiology + supportive care.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cost + insurance — very expensive specialty drug; manufacturer + foundation assistance.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This IV chemotherapy + targeted therapy treats HER2-positive AND HER2-low breast cancer + other cancers. CRITICAL — tell us IMMEDIATELY about any new cough, breathing trouble, low-grade fever (could be lung inflammation that can be fatal). Get chest CT every 3 months. Tell us about chest pain or palpitations (heart effects). Use strong birth control. Aggressive antiemetics needed.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TucatinibSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tucatinib",
        title: "Tucatinib (Tukysa)",
        subtitle: "Selective HER2 TKI · HER2+ metastatic breast cancer with BRAIN METS · combination with trastuzumab + capecitabine · HER2CLIMB trial · hepatotoxicity + diarrhea",
        category: "HER2 tyrosine kinase inhibitor — brain mets metastatic breast cancer",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective oral HER2 tyrosine kinase inhibitor (TKI)"),
            KeyValueRow(key: "Use", value: "HER2-POSITIVE metastatic breast cancer (after 1+ prior HER2-targeted therapy), particularly with BRAIN METASTASES — combination with trastuzumab + capecitabine; HER2CLIMB trial transformative for brain mets subset"),
            KeyValueRow(key: "Dose", value: "300 mg PO BID with capecitabine 1000 mg/m² PO BID × 14 days every 21 days + trastuzumab 6 mg/kg IV every 3 weeks (8 mg/kg loading); with or without food"),
            KeyValueRow(key: "Monitor", value: "LFTs (especially first 3 months), CBC, diarrhea assessment, tumor response especially brain"),
            KeyValueRow(key: "Watch", value: "HEPATOTOXICITY — LFT elevations + Hy's law cases reported; LFTs q3 weeks × first 6 months; DIARRHEA can be severe; HAND-FOOT SYNDROME from capecitabine component; CARDIOTOXICITY minimal (vs trastuzumab); BRAIN MET activity")
        ],
        indications: AttributedProse(
            "HER2-POSITIVE metastatic breast cancer in patients with progression on 1+ prior anti-HER2 therapies — particular benefit in CNS/BRAIN METASTASES (HER2+ breast cancer commonly metastasizes to brain). Combination with trastuzumab + capecitabine. HER2CLIMB trial showed survival benefit + improved CNS disease control vs control arm per primary source.",
            citationIDs: ["specialty_round33", "openfda_round33"]
        ),
        mechanism: AttributedProse(
            "Highly selective oral inhibitor of HER2 tyrosine kinase domain — minimal off-target activity on related receptors (EGFR, HER3, HER4 minimal); penetrates blood-brain barrier (key advantage over other HER2 agents). Blocks HER2 dimerization + downstream PI3K/AKT/mTOR + MAPK signaling → tumor growth inhibition.",
            citationIDs: ["openfda_round33"]
        ),
        dosing: [
            DosingBlock(label: "Adult HER2+ mBC", body: "300 mg PO BID continuously; with CAPECITABINE 1000 mg/m² PO BID days 1-14 of 21-day cycle + TRASTUZUMAB 6 mg/kg IV every 3 weeks (after 8 mg/kg loading dose) per primary source.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Dose adjustments", body: "Reduce to 250 mg → 200 mg → 150 mg BID for toxicity (hepatotoxicity, diarrhea, hand-foot); discontinue for severe.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Hepatic", body: "Severe hepatic impairment (Child-Pugh C) — reduce dose; moderate — caution.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Renal", body: "Severe — limited data; capecitabine renal adjustment per its labeling.", citationIDs: ["openfda_round33"]),
            DosingBlock(label: "Administration", body: "With or without food; same time daily; combination protocol coordination.", citationIDs: ["openfda_round33"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to tucatinib or components; pregnancy.",
            citationIDs: ["openfda_round33"]
        ),
        warnings: [
            AttributedBullet("HEPATOTOXICITY — ALT/AST elevations; Hy's law cases (severe hepatic injury) reported; LFTs every 3 weeks × first 6 months → less frequent; dose reductions OR discontinuation for severe.", citationIDs: ["openfda_round33"]),
            AttributedBullet("DIARRHEA — common; can be severe; loperamide + hydration + dose reduction; rule out C. diff if persistent.", citationIDs: ["openfda_round33"]),
            AttributedBullet("HAND-FOOT SYNDROME (palmar-plantar erythrodysesthesia) — from capecitabine component; counsel + emollients + dose modification.", citationIDs: ["openfda_round33"]),
            AttributedBullet("EMBRYO-FETAL TOXICITY — Category D; pregnancy + contraception during + 7 days after (with capecitabine longer).", citationIDs: ["openfda_round33"]),
            AttributedBullet("DRUG INTERACTIONS — CYP3A4 substrate; strong inducers (rifampin, anticonvulsants) significantly reduce tucatinib; strong inhibitors increase + caution; tucatinib also inhibits OATP1B1/1B3 transporters affecting statins, methotrexate, others.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CARDIAC TOXICITY — minimal direct (trastuzumab carries cardiac risk in combination; ECHO baseline + monitoring per trastuzumab protocols).", citationIDs: ["specialty_round33"]),
            AttributedBullet("FATIGUE + NAUSEA — common but manageable.", citationIDs: ["openfda_round33"]),
            AttributedBullet("ABDOMINAL PAIN — common.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CNS PENETRATION — distinguishing feature; brain metastasis activity superior to other HER2 agents.", citationIDs: ["specialty_round33"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, hand-foot syndrome (from capecitabine), nausea, fatigue, hepatic enzyme elevation, vomiting, headache, stomatitis, decreased appetite, abdominal pain, rash, decreased weight, hepatotoxicity.",
            citationIDs: ["openfda_round33"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 STRONG INDUCERS (rifampin, carbamazepine, phenytoin, phenobarbital, St. John's wort) — significantly reduce tucatinib; AVOID.", citationIDs: ["openfda_round33"]),
            AttributedBullet("CYP3A4 STRONG INHIBITORS (ketoconazole, itraconazole, clarithromycin, ritonavir, grapefruit) — increase tucatinib; reduce dose to 250 mg BID (50%).", citationIDs: ["openfda_round33"]),
            AttributedBullet("OATP1B1/1B3 SUBSTRATES — tucatinib inhibits; affects statins (especially simvastatin, atorvastatin), methotrexate, repaglinide; reduce statin doses; monitor.", citationIDs: ["openfda_round33"]),
            AttributedBullet("WARFARIN — INR variability; close monitoring during + after dose changes.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Other CYP enzymes — modest interactions; review medications.", citationIDs: ["openfda_round33"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive cancer workup, HER2 testing confirmed, CBC + CMP, LFTs, comprehensive medications + grapefruit counseling, pregnancy test, baseline ECHO (for trastuzumab component), brain imaging.", citationIDs: ["specialty_round33"]),
            AttributedBullet("LFTs every 3 weeks × first 6 months → q3 months; hold + adjust dose for Grade 3-4 elevations; Hy's law concerns + discontinuation.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Counsel — diarrhea management (loperamide PRN, hydration, when to call), hand-foot syndrome care (emollients, no heat/friction), fatigue + nausea + supportive, drug interactions + grapefruit avoidance, pregnancy avoidance.", citationIDs: ["openrn_pharm_round33"]),
            AttributedBullet("Combination protocol — capecitabine 14 days on + 7 days off cycles; trastuzumab IV q3 weeks; tucatinib continuous; coordinate adherence.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Brain metastases — MRI brain surveillance for treatment response; corticosteroids for symptoms; radiation therapy if needed.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cardiac monitoring — ECHO q3 months per trastuzumab; LVEF decline → hold + cardiology.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Hand-foot syndrome from capecitabine — counsel + emollients + dose adjustment.", citationIDs: ["openfda_round33"]),
            AttributedBullet("Multidisciplinary — oncology + neuro-oncology (brain mets) + radiation oncology + pharmacy + supportive care.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Pregnancy + lactation — counsel; contraception strict.", citationIDs: ["specialty_round33"]),
            AttributedBullet("Cost + insurance — specialty oncology; financial assistance.", citationIDs: ["specialty_round33"])
        ],
        patientTeaching: AttributedProse(
            "This pill treats HER2-positive breast cancer + works especially well for brain metastases. Take with trastuzumab IV + capecitabine pills (14 days on, 7 days off). Tell us about yellow eyes/skin, severe diarrhea, hand-foot redness/pain. Get bloodwork every 3 weeks at first. Avoid grapefruit. Tell us about ALL medications + supplements. Use birth control.",
            citationIDs: ["openrn_pharm_round33"]
        ),
        citations: [openfdaR33, openrnPharmR33, specialtyR33, ismpR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}
