import Foundation

// Curator-model lab entries (round 20 — GI infection + celiac + HIV screening).

private let openrnLabsR20 = CitationSource(
    id: "openrn_labs_round20",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-12"
)
private let cdcLabsR20 = CitationSource(
    id: "cdc_labs_round20",
    shortName: "CDC HIV + STI testing guidance",
    publisher: "CDC",
    license: .publicDomain,
    url: "https://www.cdc.gov/hiv/testing/laboratorytests.html",
    lastRetrieved: "2026-05-12"
)
private let specialtyLabsR20 = CitationSource(
    id: "specialty_labs_round20",
    shortName: "ACG / AGA / USPSTF concept citations",
    publisher: "ACG · AGA · USPSTF",
    license: .factCitationOnly,
    url: "https://gi.org/guidelines/",
    lastRetrieved: "2026-05-12"
)

private let labsTagsR20 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .infection
)

public enum HPyloriStoolAntigenSample {
    public static let entry: LabEntry = LabEntry(
        id: "h-pylori-stool-antigen",
        title: "Helicobacter pylori stool antigen",
        subtitle: "Active-infection marker · PUD / chronic gastritis workup · confirms eradication after Rx",
        specimen: "Stool sample (fresh or frozen; collected in clean container)",
        nclexTags: labsTagsR20,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative", label: "No H. pylori infection (or successful eradication ≥4 weeks post-Rx)", citationIDs: ["specialty_labs_round20"]),
            ReferenceRangeRow(value: "Positive", label: "Active H. pylori infection — treat with eradication therapy", citationIDs: ["specialty_labs_round20"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative — no active infection",
                summary: "Rules out active H. pylori. After completed eradication therapy (≥4 weeks post-treatment, ≥2 weeks off PPI), confirms successful eradication per primary source.",
                nursingActions: [
                    "If pre-treatment negative + persistent symptoms — consider alternate cause (PUD from NSAIDs, GERD, functional dyspepsia, Zollinger-Ellison).",
                    "If post-treatment confirming eradication — counsel relapse uncommon; long-term PPI may still be needed for ongoing symptoms / risk factors.",
                    "Reinforce — minimize NSAIDs, alcohol moderation, smoking cessation."
                ],
                citationIDs: ["specialty_labs_round20"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Positive — active H. pylori infection",
                summary: "Active infection requiring eradication therapy. Quadruple regimen (bismuth + tetracycline + metronidazole + PPI × 14 days) or PCAB-based regimens preferred over clarithromycin triple (resistance rising) per primary source.",
                nursingActions: [
                    "Initiate eradication therapy — quadruple bismuth-based × 14 days OR vonoprazan / PCAB-based regimens (locally guided by resistance patterns).",
                    "Counsel compliance — incomplete courses drive resistance + treatment failure.",
                    "Counsel medication side effects — metronidazole + alcohol (disulfiram-like), tetracycline + photosensitivity, bismuth + black stools.",
                    "Schedule follow-up testing ≥4 weeks post-treatment, ≥2 weeks off PPI, to confirm eradication.",
                    "Address PUD if present — separate evaluation."
                ],
                citationIDs: ["specialty_labs_round20"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Reasons to test",
                causes: ["Active or prior PUD", "Dyspepsia", "MALT lymphoma", "First-degree relative with gastric cancer", "Long-term aspirin / NSAID use (high-risk)", "Iron-deficiency anemia of unclear cause", "ITP (selected)"],
                citationIDs: ["specialty_labs_round20"]
            ),
            CauseGroup(
                title: "False negative",
                causes: ["Recent PPI use (within 2 weeks)", "Recent antibiotic use (within 4 weeks)", "Recent bismuth use", "Active UGI bleeding"],
                citationIDs: ["specialty_labs_round20"]
            )
        ],
        nursingActions: [
            AttributedBullet("Stool antigen — non-invasive, accurate, less expensive than EGD per primary source.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("Hold PPI for 2 weeks BEFORE testing; antibiotics for 4 weeks; bismuth for 4 weeks (false negatives).", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("Urea breath test alternative — equally accurate; not as widely available.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("Serology — antibody persists after eradication; cannot distinguish current vs prior infection — generally NOT preferred.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("Endoscopic biopsy testing — gold standard but invasive; reserved for EGD-required cases.", citationIDs: ["specialty_labs_round20"])
        ],
        watchFor: [
            AttributedBullet("FALSE NEGATIVE from PPI / antibiotics / bismuth — verify medication history before testing.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("UGI BLEED can suppress detection — delay testing to outpatient if recent bleed.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("REINFECTION rare in adults — persistent positivity post-Rx suggests treatment failure / resistance.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("Counsel — H. pylori causally linked to gastric cancer + MALT lymphoma; eradication reduces long-term cancer risk.", citationIDs: ["specialty_labs_round20"])
        ],
        citations: [openrnLabsR20, cdcLabsR20, specialtyLabsR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum TTGIgASample {
    public static let entry: LabEntry = LabEntry(
        id: "ttg-iga",
        title: "Tissue transglutaminase IgA (tTG-IgA) + total IgA",
        subtitle: "First-line celiac screening · must be ON gluten · check total IgA for false-negative",
        specimen: "Serum — must be on gluten-containing diet for ≥6 weeks before testing for valid result",
        nclexTags: labsTagsR20,
        referenceRanges: [
            ReferenceRangeRow(value: "tTG-IgA <4 U/mL (negative)", label: "Celiac disease unlikely (if on gluten)", citationIDs: ["specialty_labs_round20"]),
            ReferenceRangeRow(value: "tTG-IgA 4–10 U/mL (equivocal)", label: "Equivocal — repeat or confirm with biopsy", citationIDs: ["specialty_labs_round20"]),
            ReferenceRangeRow(value: "tTG-IgA >10 U/mL (positive)", label: "Suggests celiac — proceed to biopsy", citationIDs: ["specialty_labs_round20"]),
            ReferenceRangeRow(value: "tTG-IgA >10× ULN", label: "Very high — pediatric diagnosis may not require biopsy per ESPGHAN", citationIDs: ["specialty_labs_round20"]),
            ReferenceRangeRow(value: "Total IgA <7 mg/dL", label: "IgA deficiency — false negative possible; use tTG-IgG or DGP-IgG", citationIDs: ["specialty_labs_round20"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative (on gluten ≥6 weeks)",
                summary: "Rules out celiac disease in most cases. If high clinical suspicion persists, consider biopsy, HLA-DQ2 / DQ8 genetic testing, or evaluation for IgA deficiency per primary source.",
                nursingActions: [
                    "Counsel that on a gluten-free diet, the test may be falsely negative — must be on gluten.",
                    "If symptoms persist + suspicion remains, refer to GI for biopsy OR genetic testing (high NPV).",
                    "Consider non-celiac gluten sensitivity (no serology / biopsy diagnostic; clinical only)."
                ],
                citationIDs: ["specialty_labs_round20"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Positive — suggests celiac",
                summary: "Strongly suggests celiac. EGD with duodenal biopsy is required for adult diagnosis (≥4 distal duodenum + 2 bulb samples for Marsh classification). Children with tTG-IgA >10× ULN + symptoms may avoid biopsy per ESPGHAN per primary source.",
                nursingActions: [
                    "Refer to GI for EGD with duodenal biopsies.",
                    "DO NOT START gluten-free diet before biopsy — false-negative biopsy.",
                    "Check total IgA + nutritional deficiencies (iron, B12, folate, vitamin D, calcium).",
                    "DEXA scan at diagnosis; screen first-degree relatives.",
                    "Counsel autoimmune disease screening (thyroid, T1DM, dermatitis herpetiformis)."
                ],
                citationIDs: ["specialty_labs_round20"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Positive tTG-IgA",
                causes: ["Celiac disease (high specificity if >10 U/mL)", "False positive (rare) — autoimmune liver disease, T1DM, IgA nephropathy"],
                citationIDs: ["specialty_labs_round20"]
            ),
            CauseGroup(
                title: "False negative",
                causes: ["IgA deficiency (~3% of celiac patients) — use tTG-IgG or DGP-IgG", "Gluten-free / gluten-reduced diet", "Children <2 years (use DGP-IgG)", "Immunosuppression"],
                citationIDs: ["specialty_labs_round20"]
            )
        ],
        nursingActions: [
            AttributedBullet("Confirm patient on gluten-containing diet ≥6 weeks before testing — false-negative otherwise per primary source.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("Order tTG-IgA + total IgA together — to identify IgA deficiency.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("If IgA deficient — substitute tTG-IgG or deamidated gliadin peptide (DGP)-IgG.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("Positive serology → REFERRAL FOR BIOPSY before gluten-free diet.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("Screen at-risk groups — T1DM, autoimmune thyroid, Down / Turner syndrome, IgA deficiency, first-degree relatives, unexplained iron deficiency.", citationIDs: ["specialty_labs_round20"])
        ],
        watchFor: [
            AttributedBullet("GLUTEN-FREE BEFORE TESTING — most common reason for false negative; have patient eat 2+ slices bread or equivalent daily × 6+ weeks before retest.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("IgA DEFICIENCY — check total IgA every time; use IgG-based test if deficient.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("PERSISTENT POSITIVE post-diet — likely gluten ingestion (intentional or hidden); dietitian re-education.", citationIDs: ["specialty_labs_round20"]),
            AttributedBullet("REFRACTORY CELIAC — persistently symptomatic on strict GF; specialty referral; risk of EATL lymphoma.", citationIDs: ["specialty_labs_round20"])
        ],
        citations: [openrnLabsR20, cdcLabsR20, specialtyLabsR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum HIV4thGenSample {
    public static let entry: LabEntry = LabEntry(
        id: "hiv-4th-gen-screen",
        title: "HIV 4th-generation Ag/Ab combo screen",
        subtitle: "Detects p24 antigen + Ab · shorter window period · CDC algorithm · universal screening 13-64 yrs",
        specimen: "Serum or plasma; rapid 4th-gen also available on whole blood / fingerstick",
        nclexTags: labsTagsR20,
        referenceRanges: [
            ReferenceRangeRow(value: "Non-reactive", label: "HIV-1/2 Ag/Ab not detected — negative", citationIDs: ["cdc_labs_round20"]),
            ReferenceRangeRow(value: "Reactive", label: "Initial reactive — requires confirmatory differentiation assay", citationIDs: ["cdc_labs_round20"]),
            ReferenceRangeRow(value: "Reactive + confirmed Ab", label: "HIV-1 or HIV-2 infection confirmed", citationIDs: ["cdc_labs_round20"]),
            ReferenceRangeRow(value: "Reactive screen + negative Ab + positive RNA", label: "ACUTE HIV — primary infection (p24 detected before Ab seroconversion)", citationIDs: ["cdc_labs_round20"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Non-reactive (negative)",
                summary: "HIV not detected. Window period for 4th-gen — ~14–28 days after exposure. If recent high-risk exposure within window, repeat in 4 weeks or add HIV RNA per primary source.",
                nursingActions: [
                    "Discuss negative result + window-period considerations if recent exposure (<4 weeks).",
                    "Repeat testing in 4 weeks if within window or ongoing exposure.",
                    "PrEP counseling for high-risk patients (MSM, multiple partners, IV drug use, HIV-positive partner) — daily tenofovir / emtricitabine.",
                    "STI testing per CDC universal panel — GC / CT, syphilis, trichomoniasis, hepatitis B/C."
                ],
                citationIDs: ["cdc_labs_round20"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Reactive — confirm + link to care",
                summary: "Reactive screen → CDC algorithm — differentiation assay (HIV-1/2 Ab differentiation immunoassay). If positive → HIV-1 or HIV-2 confirmed. If negative differentiation but reactive screen → HIV-1 RNA quantitative — positive = acute HIV per primary source.",
                nursingActions: [
                    "DO NOT communicate \"HIV positive\" until confirmed by differentiation + viral load.",
                    "Linkage to care within 7 days — ART initiation regardless of CD4 / viral load (TLD = tenofovir / lamivudine / dolutegravir typical first-line).",
                    "Partner notification + testing; counsel safer-sex.",
                    "Concurrent STI / hepatitis B/C / TB / latent TB screening.",
                    "Pregnant patient — emergency ART to prevent perinatal transmission.",
                    "Mental health support; HIV is now chronic manageable disease."
                ],
                citationIDs: ["cdc_labs_round20"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Indications to test",
                causes: ["Universal screening 13–64 yrs at least once", "All pregnant patients each pregnancy", "Annually for high-risk (MSM, multiple partners, IV drug use, sex workers, prior STI)", "Post-exposure prophylaxis baseline", "Symptoms consistent with acute HIV — fever, lymphadenopathy, rash, pharyngitis (mono-like)"],
                citationIDs: ["cdc_labs_round20"]
            ),
            CauseGroup(
                title: "False-positive (rare)",
                causes: ["Autoimmune disease", "Multiparity", "Recent vaccination", "HIV vaccine recipients (test will detect vaccine-induced Ab)"],
                citationIDs: ["cdc_labs_round20"]
            )
        ],
        nursingActions: [
            AttributedBullet("CDC universal screen 13–64 yrs at least once + per-exposure / per-pregnancy.", citationIDs: ["cdc_labs_round20"]),
            AttributedBullet("4th-gen detects p24 antigen — shorter window (~14–28 days) vs older Ab-only (~3 months).", citationIDs: ["cdc_labs_round20"]),
            AttributedBullet("CDC ALGORITHM — reactive screen → HIV-1/2 differentiation IA → if discordant or negative diff with reactive screen → HIV-1 RNA quantitative.", citationIDs: ["cdc_labs_round20"]),
            AttributedBullet("Counsel + obtain informed consent prior; results disclosed in person if positive.", citationIDs: ["cdc_labs_round20"]),
            AttributedBullet("Same-day or next-day ART initiation per IAS-USA / CDC.", citationIDs: ["cdc_labs_round20"])
        ],
        watchFor: [
            AttributedBullet("ACUTE HIV — reactive screen + negative Ab differentiation + positive RNA; HIGHLY contagious; urgent linkage + ART.", citationIDs: ["cdc_labs_round20"]),
            AttributedBullet("WINDOW PERIOD — 14–28 days for 4th-gen; if recent exposure < window, repeat at 4 weeks ± add HIV RNA.", citationIDs: ["cdc_labs_round20"]),
            AttributedBullet("nPEP — non-occupational post-exposure prophylaxis if exposure <72 hrs; 28-day tenofovir / emtricitabine / dolutegravir.", citationIDs: ["cdc_labs_round20"]),
            AttributedBullet("PEP for occupational exposure (HCW needlestick) — start immediately, ideally within 2 hours.", citationIDs: ["cdc_labs_round20"]),
            AttributedBullet("PERINATAL TRANSMISSION — ART throughout pregnancy + intrapartum + neonatal prophylaxis reduces risk to <1%.", citationIDs: ["cdc_labs_round20"])
        ],
        citations: [openrnLabsR20, cdcLabsR20, specialtyLabsR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}
