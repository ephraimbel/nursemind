import Foundation

// Curator-model lab entries (round 23 — OB diagnostics).

private let openrnLabsR23 = CitationSource(
    id: "openrn_labs_round23",
    shortName: "Open RN Maternity + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/maternal/",
    lastRetrieved: "2026-05-12"
)
private let specialtyLabsR23 = CitationSource(
    id: "specialty_labs_round23",
    shortName: "ACOG + ASRM + ASH + ISTH concept citations",
    publisher: "ACOG · ASRM · ASH · ISTH",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-12"
)

private let labsTagsR23 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .clottingHemostasis
)

public enum APLAntibodiesSample {
    public static let entry: LabEntry = LabEntry(
        id: "antiphospholipid-antibodies",
        title: "Antiphospholipid antibody panel (APL / APS workup)",
        subtitle: "Lupus anticoagulant + anti-cardiolipin + anti-β2-glycoprotein-I · 2 tests ≥12 weeks apart · APS = autoimmune thrombosis + pregnancy loss",
        specimen: "Plasma (citrated tube for lupus anticoagulant) + serum (anti-cardiolipin + anti-β2-GPI); test on 2 occasions ≥12 weeks apart for confirmation",
        nclexTags: labsTagsR23,
        referenceRanges: [
            ReferenceRangeRow(value: "Lupus anticoagulant — negative", label: "No coagulation inhibitor detected", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "Lupus anticoagulant — positive", label: "Inhibitor present (paradoxical name — anticoagulant in vitro, prothrombotic in vivo)", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "Anti-cardiolipin IgG/IgM <40 GPL/MPL", label: "Negative / low; not diagnostic", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "Anti-cardiolipin IgG/IgM ≥40 GPL/MPL", label: "Moderate-high titer = clinically significant if confirmed", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "Anti-β2-glycoprotein-I IgG/IgM <40 SGU/SMU", label: "Negative / low", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "Anti-β2-glycoprotein-I IgG/IgM ≥40 SGU/SMU", label: "Moderate-high titer = clinically significant if confirmed", citationIDs: ["specialty_labs_round23"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative APL panel",
                summary: "Antiphospholipid syndrome (APS) unlikely. Other causes of recurrent pregnancy loss / thrombosis warrant workup. Consider repeating if clinical history strongly suggests APS — false-negative possible per primary source.",
                nursingActions: [
                    "Continue workup for other causes — chromosomal, anatomic, endocrine, thrombophilia.",
                    "Reassure patient APS not present; address other concerns.",
                    "If high clinical suspicion despite negative — repeat in 12 weeks + consider extended thrombophilia workup."
                ],
                citationIDs: ["specialty_labs_round23"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Positive APL — possible APS",
                summary: "Antiphospholipid syndrome diagnosis requires CLINICAL CRITERIA (vascular thrombosis OR pregnancy morbidity) PLUS LABORATORY CRITERIA (≥1 antibody positive on 2 occasions ≥12 weeks apart) per Sapporo / Sydney criteria per primary source.",
                nursingActions: [
                    "Confirm with REPEAT testing ≥12 weeks apart — single positive insufficient.",
                    "Workup clinical features — DVT/PE/stroke, recurrent pregnancy loss (≥3 unexplained <10 weeks OR ≥1 fetal loss ≥10 weeks OR ≥1 preterm <34 weeks for severe preeclampsia/IUGR).",
                    "REFERRAL — rheumatology + maternal-fetal medicine; multidisciplinary management.",
                    "PREGNANCY MANAGEMENT — aspirin 81 mg + LMWH (prophylactic vs therapeutic depends on prior thrombosis) throughout pregnancy + 6 weeks postpartum.",
                    "NON-PREGNANT — long-term anticoagulation if confirmed APS + thrombosis (warfarin or DOACs in selected per primary source).",
                    "Avoid estrogen-containing contraceptives (oral, ring, patch) — increase thrombosis risk; non-hormonal / progestin-only / IUD preferred.",
                    "Counsel — APS is lifelong autoimmune disease."
                ],
                citationIDs: ["specialty_labs_round23"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Indications for testing",
                causes: ["Recurrent pregnancy loss (≥2-3 consecutive)", "Unprovoked thrombosis (DVT, PE, stroke, MI in young patient)", "Pregnancy complication suggestive (severe preeclampsia <34 weeks, IUGR, placental insufficiency, abruption)", "SLE / autoimmune disease (secondary APS workup)", "Catastrophic APS (rare; multi-organ thrombosis)"],
                citationIDs: ["specialty_labs_round23"]
            ),
            CauseGroup(
                title: "False-positive / transient",
                causes: ["Acute infection (parvovirus, syphilis, HIV, COVID-19)", "Some medications (chlorpromazine, phenytoin, hydralazine, procainamide)", "Pregnancy itself (transient)", "Other autoimmune diseases (SLE without APS)"],
                citationIDs: ["specialty_labs_round23"]
            )
        ],
        nursingActions: [
            AttributedBullet("Test on TWO OCCASIONS ≥12 weeks apart — confirms persistent APL (transient positives common with infection).", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Triple positive (LA + anti-CL + anti-β2-GPI) — highest thrombosis risk.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Lupus anticoagulant — paradoxical name; in vitro coagulation inhibitor, but in vivo prothrombotic; ELONGATED aPTT; mixing study fails to correct.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("APS PREGNANCY MANAGEMENT — aspirin 81 mg from positive test through delivery + LMWH (prophylactic vs therapeutic per prior thrombosis) + 6 weeks postpartum + close fetal surveillance per primary source.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Coordinate with rheumatology / hematology / MFM.", citationIDs: ["specialty_labs_round23"])
        ],
        watchFor: [
            AttributedBullet("CATASTROPHIC APS — rare; multi-organ thrombosis simultaneously; high mortality; requires plasmapheresis + IVIG + anticoagulation + steroids.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("DOACs in APS — generally NOT first-line; warfarin preferred for triple-positive APS per primary source.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("ESTROGEN-CONTAINING CONTRACEPTIVES — contraindicated in APS; counsel.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("INR INTERFERENCE — lupus anticoagulant can falsely elevate INR; alternative monitoring (chromogenic factor X) for patients on warfarin.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("PREGNANCY MORBIDITY — even with treatment, ~30-40% loss / preterm; counsel realistic expectations.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("PEDIATRIC APS — rare; specialty management.", citationIDs: ["specialty_labs_round23"])
        ],
        citations: [openrnLabsR23, specialtyLabsR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum BileAcidsSample {
    public static let entry: LabEntry = LabEntry(
        id: "bile-acids",
        title: "Serum bile acids (TBA)",
        subtitle: "Diagnostic for ICP · severity stratifies stillbirth risk · ≥40 µmol/L moderate-severe · drives delivery timing",
        specimen: "Serum; fasting NOT required but can be variable; check at end of day if non-fasting (postprandial peaks)",
        nclexTags: labsTagsR23,
        referenceRanges: [
            ReferenceRangeRow(value: "TBA <10 µmol/L", label: "Normal — non-pregnant + most pregnant", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "TBA 10-39 µmol/L", label: "MILD ICP — manage UDCA + 38-week delivery", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "TBA 40-99 µmol/L", label: "MODERATE ICP — UDCA + 36-37-week delivery + close surveillance", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "TBA ≥100 µmol/L", label: "SEVERE ICP — UDCA + 34-36-week delivery + steroids + intensive monitoring", citationIDs: ["specialty_labs_round23"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal bile acids",
                summary: "ICP unlikely if pruritus alone with normal TBA. Consider other causes of pregnancy pruritus (PUPPP, atopic eruption, polymorphic eruption, allergic) per primary source. Recheck in 1-2 weeks if symptoms persist.",
                nursingActions: [
                    "Counsel — pruritus may have other dermatologic causes; refer dermatology if persistent + atypical.",
                    "Recheck TBA at 1-2 week intervals if pruritus persists or worsens (TBA can rise progressively).",
                    "Symptomatic management — antihistamines, lubricants, calamine lotion."
                ],
                citationIDs: ["specialty_labs_round23"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated TBA — ICP confirmed",
                summary: "ICP confirmed; severity stratification by TBA level guides management + delivery timing. Stillbirth risk significantly increased ≥40 µmol/L; markedly elevated ≥100 µmol/L per primary source.",
                nursingActions: [
                    "URSODEOXYCHOLIC ACID (UDCA) 10-15 mg/kg/day PO divided BID — first-line.",
                    "ANTIHISTAMINES for pruritus (hydroxyzine, diphenhydramine — sedating helps sleep).",
                    "ANTENATAL FETAL SURVEILLANCE — twice-weekly NST + AFI; some institutions BPP.",
                    "DELIVERY TIMING by severity — see ranges above; betamethasone if <34 weeks anticipated.",
                    "MFM REFERRAL for moderate-severe.",
                    "VITAMIN K supplementation if PT prolonged.",
                    "Recheck bile acids weekly to monitor severity progression.",
                    "Counsel — usually resolves postpartum; ~50% recurrence in subsequent pregnancy."
                ],
                citationIDs: ["specialty_labs_round23"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Elevated bile acids in pregnancy",
                causes: ["Intrahepatic cholestasis of pregnancy (most common)", "Hepatitis (viral, autoimmune)", "Primary biliary cholangitis", "Gallstones / cholestasis", "Acute fatty liver of pregnancy", "HELLP syndrome (mild elevation)", "Drug-induced cholestasis"],
                citationIDs: ["specialty_labs_round23"]
            ),
            CauseGroup(
                title: "Risk factors for ICP",
                causes: ["South American (Chile, Bolivia) / Scandinavian", "Multiparity", "Multifetal pregnancy", "Prior ICP (50% recurrence)", "IVF", "Family history", "ABCB4 / ABCB11 mutations", "Hepatitis C carrier"],
                citationIDs: ["specialty_labs_round23"]
            )
        ],
        nursingActions: [
            AttributedBullet("Order TBA for any pregnant patient with PERSISTENT PRURITUS — especially palms / soles / worse at night per primary source.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Pair with LFTs — elevated AST/ALT + GGT often normal supports ICP.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Severity-stratified management — drives delivery timing decisions.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Recheck weekly — severity often progresses through gestation.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("MFM REFERRAL for moderate-severe; coordinate antenatal surveillance + delivery timing.", citationIDs: ["specialty_labs_round23"])
        ],
        watchFor: [
            AttributedBullet("STILLBIRTH RISK — significantly increased ≥40 µmol/L; markedly elevated ≥100 µmol/L; counsel + plan early delivery.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("ANTENATAL SURVEILLANCE LIMITATIONS — NST/BPP do NOT reliably predict ICP-related stillbirth; delivery timing is more important per primary source.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("MECONIUM PASSAGE / fetal distress in labor common; pediatric team available.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("POSTPARTUM HEMORRHAGE risk — vitamin K malabsorption; supplement if PT prolonged.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("RECURRENCE in subsequent pregnancy ~50%; counsel + early surveillance + early UDCA.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Future ESTROGEN-CONTAINING CONTRACEPTIVES — may trigger recurrence; consider progestin-only / non-hormonal.", citationIDs: ["specialty_labs_round23"])
        ],
        citations: [openrnLabsR23, specialtyLabsR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum GBSScreeningSample {
    public static let entry: LabEntry = LabEntry(
        id: "gbs-screening",
        title: "Group B streptococcus (GBS) screening",
        subtitle: "Vaginal-rectal culture 36-37+6 weeks · positive → IAP penicillin in labor · prevents neonatal early-onset GBS sepsis",
        specimen: "Vaginal-rectal swab (lower vagina + rectum); both sites essential for sensitivity",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        referenceRanges: [
            ReferenceRangeRow(value: "Negative culture / NAAT", label: "GBS not detected — IAP not indicated unless other risk factors", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "Positive culture / NAAT", label: "GBS colonized — IAP penicillin in labor recommended", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "Unknown status at delivery", label: "Risk-based IAP if any: gestation <37 weeks, ROM ≥18 hrs, intrapartum fever ≥38°C, prior infant with GBS", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "GBS bacteriuria any trimester", label: "Counts as positive — IAP indicated regardless of culture; treat UTI per standard if symptomatic", citationIDs: ["specialty_labs_round23"]),
            ReferenceRangeRow(value: "Prior infant with GBS disease", label: "IAP indicated regardless of culture in current pregnancy", citationIDs: ["specialty_labs_round23"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative GBS",
                summary: "GBS not colonized at screening. IAP not routinely indicated unless intrapartum risk factors (preterm, prolonged ROM, intrapartum fever) develop or prior infant with GBS disease per primary source.",
                nursingActions: [
                    "Document negative status; IAP not indicated unless risk factors.",
                    "If preterm labor / ROM / intrapartum fever — give IAP regardless.",
                    "Counsel — GBS status can change; result valid for ~5 weeks."
                ],
                citationIDs: ["specialty_labs_round23"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Positive GBS — IAP indicated",
                summary: "Patient is GBS-colonized. Intrapartum antibiotic prophylaxis (IAP) prevents early-onset neonatal GBS sepsis (occurs in first 7 days; up to 25% mortality without prevention) per primary source.",
                nursingActions: [
                    "INTRAPARTUM ABX — penicillin G 5 million units IV loading, then 2.5-3 million units IV q4h until delivery (cefazolin if non-anaphylactic PCN allergy; clindamycin or vancomycin if anaphylactic + susceptibility known).",
                    "Start IAP at admission in labor or with rupture of membranes; goal ≥4 hours before delivery for full prevention.",
                    "If GBS positive + cesarean WITHOUT labor + intact membranes — IAP NOT needed (just routine cefazolin SSI prophylaxis).",
                    "Document — start time, doses given, time of delivery; communicate to neonatal team.",
                    "Newborn surveillance — observation × 36-48 hrs; risk-based assessment for asymptomatic infants."
                ],
                citationIDs: ["specialty_labs_round23"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Indications for IAP",
                causes: ["GBS-positive screening culture / NAAT", "GBS bacteriuria during current pregnancy (any trimester)", "Prior infant with invasive GBS disease", "Unknown GBS status + risk factor (preterm <37 weeks, ROM ≥18 hrs, intrapartum fever ≥38°C)"],
                citationIDs: ["specialty_labs_round23"]
            ),
            CauseGroup(
                title: "IAP NOT needed",
                causes: ["GBS-negative screening (regardless of indications)", "Cesarean delivery without labor + intact membranes (regardless of GBS status — but routine SSI prophylaxis still given)"],
                citationIDs: ["specialty_labs_round23"]
            )
        ],
        nursingActions: [
            AttributedBullet("Universal screening at 36-37+6 WEEKS gestation — culture or NAAT per primary source.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Collection — lower vagina + rectum (single swab, both sites); avoid speculum / cervix; result valid 5 weeks.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("ALERT obstetric team + L&D if positive; communicate at admission for labor.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Penicillin allergy — assess severity; cefazolin if non-anaphylactic; clindamycin / vancomycin (per susceptibility) if anaphylactic.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Allergy testing pre-pregnancy — for documented PCN allergy patients to allow alternatives.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("Communicate to NEONATAL TEAM — GBS status + IAP duration + risk factors.", citationIDs: ["specialty_labs_round23"])
        ],
        watchFor: [
            AttributedBullet("LATE-ONSET GBS DISEASE — 7 days to 3 months; meningitis common; IAP does NOT prevent (mother-infant transmission post-delivery); pediatric vigilance.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("BREAKTHROUGH NEONATAL SEPSIS — small share even with IAP; pediatric monitoring × 36-48 hrs + sepsis evaluation if symptomatic.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("CHORIOAMNIONITIS in labor with positive GBS — broader-spectrum abx + close monitoring; not pure IAP.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("IAP <4 HOURS pre-delivery — partial protection; pediatric team aware; observation longer.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("MATERNAL ALLERGIC REACTION — anaphylaxis can occur with IAP; epinephrine + crash cart available.", citationIDs: ["specialty_labs_round23"]),
            AttributedBullet("FUTURE PREGNANCY — re-screen each pregnancy (status changes); not all GBS-positive patients remain colonized.", citationIDs: ["specialty_labs_round23"])
        ],
        citations: [openrnLabsR23, specialtyLabsR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}
