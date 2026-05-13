import Foundation

// Curator-model drug entries (round 26 — hematology + reversal + IV iron + onc-heme).

private let openfdaR26 = CitationSource(
    id: "openfda_round26",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-13"
)
private let openrnPharmR26 = CitationSource(
    id: "openrn_pharm_round26",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let specialtyR26 = CitationSource(
    id: "specialty_round26",
    shortName: "ASH + ASCO + AABB + AASLD concept citations",
    publisher: "ASH · ASCO · AABB · AASLD",
    license: .factCitationOnly,
    url: "https://www.hematology.org/education/clinicians/guidelines-and-quality-care",
    lastRetrieved: "2026-05-13"
)
private let ismpR26 = CitationSource(
    id: "ismp_round26",
    shortName: "ISMP High-Alert Medications 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-13"
)

public enum CaplacizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "caplacizumab",
        title: "Caplacizumab (Cablivi)",
        subtitle: "Anti-vWF nanobody · acquired TTP · WITH plasma exchange + immunosuppression · bleeding risk · ADAMTS13 monitoring",
        category: "Anti-von Willebrand factor humanized nanobody (TTP-specific)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Humanized bivalent nanobody — anti-von Willebrand factor A1 domain"),
            KeyValueRow(key: "Use", value: "Acquired thrombotic thrombocytopenic purpura (aTTP) — adjunct to plasma exchange + immunosuppression"),
            KeyValueRow(key: "Dose", value: "11 mg IV loading before plasma exchange + 11 mg SC after each plasma exchange × 30 days OR until ADAMTS13 normalizes"),
            KeyValueRow(key: "Watch", value: "BLEEDING risk; suspend pre-procedure; concurrent with plasma exchange + steroids + rituximab"),
            KeyValueRow(key: "Reduces", value: "Time to platelet normalization + refractory disease + recurrence vs PEX + immunosuppression alone")
        ],
        indications: AttributedProse(
            "Acquired thrombotic thrombocytopenic purpura (aTTP) in adults + adolescents ≥12 years; ADJUNCT to plasma exchange (PEX) + immunosuppression (corticosteroids + rituximab). Reduces time to platelet count response + risk of recurrence per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Humanized bivalent nanobody — binds A1 domain of von Willebrand factor (vWF) → blocks platelet glycoprotein Ib (GPIb)-vWF interaction → prevents platelet adhesion to ultra-large vWF multimers (ULVWFM accumulate in TTP due to ADAMTS13 deficiency). Acts immediately while PEX removes autoantibodies + rituximab depletes B cells producing antibodies.",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "Adult / adolescent (≥12 years, ≥40 kg)", body: "11 mg IV loading dose before first plasma exchange; then 11 mg SC daily × duration of PEX + 30 days after last PEX; continue if ADAMTS13 activity remains <10% per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Lower body weight (<40 kg)", body: "5.5 mg dose (half-strength); pediatric data limited.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "ADMINISTRATION timing", body: "IV loading immediately before first PEX; SC dose AFTER each PEX session OR continued daily during interim periods.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Suspend for procedures", body: "Hold ≥7 days before elective procedures; resume after hemostasis achieved.", citationIDs: ["specialty_round26"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — active major bleeding, recent intracranial bleed, severe coagulopathy, planned surgery; congenital TTP (different pathology — ADAMTS13 gene mutations; treatment is plasma infusion not PEX) per primary source.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("BLEEDING RISK — mucocutaneous bleeding common (gingival, epistaxis, GI, GU); monitor closely; suspend for active major bleeding per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PERIOPERATIVE — SUSPEND ≥7 days before planned surgery; assess bleeding risk + ADAMTS13 status; resume post-procedure once hemostasis achieved.", citationIDs: ["specialty_round26"]),
            AttributedBullet("ALONE INADEQUATE — must be COMBINED with PEX + corticosteroids ± rituximab; not monotherapy.", citationIDs: ["specialty_round26"]),
            AttributedBullet("ADAMTS13 MONITORING — continue caplacizumab until ADAMTS13 activity normalizes; recurrence risk if discontinued prematurely.", citationIDs: ["specialty_round26"]),
            AttributedBullet("INFUSION REACTION — possible during IV loading; monitor; usually mild.", citationIDs: ["openfda_round26"]),
            AttributedBullet("THROMBOTIC events — uncommon but possible; balance bleeding-thrombosis carefully.", citationIDs: ["openfda_round26"]),
            AttributedBullet("EXPENSIVE — ~$300,000+ per course; insurance authorization + manufacturer assistance.", citationIDs: ["specialty_round26"])
        ],
        adverseReactions: AttributedProse(
            "Mucocutaneous bleeding (gingival, epistaxis, GU, GI), fatigue, fever, headache, urticaria, injection site reactions, urticaria, paresthesia, dyspnea, arthralgia.",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("Other ANTICOAGULANTS / ANTIPLATELETS — additive bleeding risk; close monitoring + clinical judgment.", citationIDs: ["openfda_round26"]),
            AttributedBullet("Specific drug-drug interaction studies limited; clinical concomitant use with steroids + rituximab in TTP regimen.", citationIDs: ["openfda_round26"])
        ],
        nursingImplications: [
            AttributedBullet("ADMINISTER as part of MULTIDISCIPLINARY TTP protocol — PEX + steroids + rituximab; specialty hematology coordination.", citationIDs: ["specialty_round26"]),
            AttributedBullet("IV LOADING immediately before first PEX; SC daily thereafter; teach patient + family SC technique for home administration.", citationIDs: ["openrn_pharm_round26"]),
            AttributedBullet("MONITOR — bleeding signs, platelet count, ADAMTS13 activity, hemolysis labs (haptoglobin, LDH, bilirubin), schistocytes on peripheral smear.", citationIDs: ["specialty_round26"]),
            AttributedBullet("BLEEDING precautions — soft toothbrush, electric razor, avoid IM injections, fall prevention; counsel symptoms to report.", citationIDs: ["specialty_round26"]),
            AttributedBullet("DURATION — continue until ADAMTS13 activity normalizes (typically >20-30%); typically 30 days but may be longer.", citationIDs: ["specialty_round26"]),
            AttributedBullet("EMERGENCY PLAN — instruct patient on signs of TTP recurrence (purpura, AMS, fever, hemolysis); seek care immediately.", citationIDs: ["specialty_round26"])
        ],
        patientTeaching: AttributedProse(
            "This medicine works with plasma exchange + steroids to treat TTP. It prevents tiny blood clots that destroy platelets + red blood cells. You may have nosebleeds, bleeding gums, or easy bruising — tell us about heavy bleeding. Continue treatment as prescribed even when you feel better; stopping too early can cause a relapse.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AndexanetAlfaSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "andexanet-alfa",
        title: "Andexanet alfa (Andexxa)",
        subtitle: "Reverses apixaban + rivaroxaban · decoy Factor Xa · life-threatening bleed · BOXED thromboembolism · expensive · 4F-PCC alternative",
        category: "Recombinant modified Factor Xa decoy (Xa inhibitor reversal)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant modified Factor Xa — catalytically inactive decoy that binds + sequesters Xa inhibitors"),
            KeyValueRow(key: "Use", value: "Reversal of apixaban + rivaroxaban anticoagulation in life-threatening bleeding"),
            KeyValueRow(key: "Low dose", value: "400 mg IV bolus + 4 mg/min × 120 min (480 mg infusion) for last apixaban ≤5 mg / rivaroxaban ≤10 mg <8 hrs OR doses >8 hrs"),
            KeyValueRow(key: "High dose", value: "800 mg IV bolus + 8 mg/min × 120 min (960 mg infusion) for last apixaban >5 mg / rivaroxaban >10 mg <8 hrs"),
            KeyValueRow(key: "Boxed", value: "Thromboembolic events; resume anticoagulation when safe; specific to apixaban + rivaroxaban (not edoxaban, betrixaban)")
        ],
        indications: AttributedProse(
            "Reversal of anticoagulation from apixaban (Eliquis) + rivaroxaban (Xarelto) in patients with life-threatening or uncontrolled bleeding. FDA-approved 2018. NOT approved for edoxaban / betrixaban (limited data). Off-label for emergent procedures requiring rapid Xa inhibitor reversal per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Recombinant modified Factor Xa — catalytically INACTIVE (Ser-419 → Ala mutation) + lacks γ-carboxyglutamate (GLA) domain → cannot participate in coagulation but RETAINS HIGH AFFINITY for Xa inhibitors (apixaban + rivaroxaban). Acts as decoy → sequesters Xa inhibitors → frees endogenous Factor Xa → restores coagulation.",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "Low dose (apixaban ≤5 mg or riva ≤10 mg, last dose ≤8 hrs ago, or any dose >8 hrs ago)", body: "400 mg IV bolus (30 mg/min) followed by 4 mg/min infusion × 120 min (total 480 mg) per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "High dose (apixaban >5 mg or riva >10 mg, last dose ≤8 hrs ago)", body: "800 mg IV bolus (30 mg/min) followed by 8 mg/min infusion × 120 min (total 960 mg) per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Edoxaban (off-label)", body: "Limited evidence; use of low-dose regimen reported; specialty consultation.", citationIDs: ["specialty_round26"]),
            DosingBlock(label: "Pediatric", body: "Not established; off-label use only.", citationIDs: ["openfda_round26"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to andexanet or excipients. Use with extreme caution in patients with active thrombosis OR high thrombotic risk — pulmonary embolism, DVT, mechanical heart valves, recent thrombotic events, prothrombotic conditions.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("BOXED — THROMBOEMBOLIC EVENTS — ~10% of patients within 30 days; ischemic stroke, MI, DVT, PE; resume anticoagulation as soon as medically appropriate per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("INFUSION REACTIONS — flushing, hot flashes, cough; usually mild + transient.", citationIDs: ["openfda_round26"]),
            AttributedBullet("EXPENSIVE — ~$50,000-100,000+ per course; insurance prior authorization; rarely indicated; 4F-PCC may be preferred for some cases per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("LIMITED USE outside life-threatening bleeding — alternatives include 4F-PCC, supportive care, watchful waiting depending on bleed severity.", citationIDs: ["specialty_round26"]),
            AttributedBullet("REBOUND EFFECT — anticoagulation may return as andexanet clears; observe for 24 hrs.", citationIDs: ["specialty_round26"]),
            AttributedBullet("FACTOR Xa ASSAY altered DURING + AFTER andexanet — anti-Xa levels falsely low / unreliable.", citationIDs: ["specialty_round26"]),
            AttributedBullet("4F-PCC (Kcentra) — alternative for Xa inhibitor reversal; less expensive; off-label; specialty consultation.", citationIDs: ["specialty_round26"])
        ],
        adverseReactions: AttributedProse(
            "Thromboembolic events (boxed; ischemic stroke, MI, DVT, PE), infusion reactions (flushing, urticaria, hot flashes), antibody formation, gastrointestinal symptoms, dizziness.",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("Specific drug-drug interaction studies limited; risk of unmasked thrombotic conditions if other antithrombotics held.", citationIDs: ["openfda_round26"]),
            AttributedBullet("HEPARIN concurrent — case reports of bleeding paradox; specialty management.", citationIDs: ["specialty_round26"]),
            AttributedBullet("RESUMPTION of anticoagulation — typically apixaban / rivaroxaban + or after 24 hrs of bleed cessation; specialty individualized.", citationIDs: ["specialty_round26"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY indication — Xa inhibitor (apixaban / rivaroxaban) + life-threatening bleeding; consider 4F-PCC alternative + bleeding severity.", citationIDs: ["specialty_round26"]),
            AttributedBullet("BOLUS at 30 mg/min via pump; INFUSION via separate pump; total 120 min (low dose) or 120 min (high dose); use central line preferred for stability.", citationIDs: ["openfda_round26"]),
            AttributedBullet("MONITOR — bleeding cessation, vital signs, neurologic status, thromboembolic signs.", citationIDs: ["specialty_round26"]),
            AttributedBullet("ANTI-Xa LEVELS unreliable during + after — use clinical judgment + PT/PTT trend.", citationIDs: ["specialty_round26"]),
            AttributedBullet("THROMBOPROPHYLAXIS — resume anticoagulation as soon as bleeding controlled (often <24 hrs); balance bleeding-thrombosis.", citationIDs: ["specialty_round26"]),
            AttributedBullet("MULTIDISCIPLINARY — hematology + neurosurgery / GI / trauma + ICU coordination.", citationIDs: ["specialty_round26"]),
            AttributedBullet("Smart pump + second-nurse verification for high-alert.", citationIDs: ["ismp_round26"])
        ],
        patientTeaching: AttributedProse(
            "This medicine reverses your blood thinner so we can stop the bleeding. After reversal, you have a higher risk of blood clots — we'll restart your blood thinner as soon as it's safe. Tell us about chest pain, shortness of breath, leg swelling / pain, or facial weakness — these could be signs of a clot.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IdarucizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "idarucizumab",
        title: "Idarucizumab (Praxbind)",
        subtitle: "Dabigatran reversal · binds dabigatran 350× tighter than thrombin · 5 g IV × 1 · works in minutes · for life-threat bleed or emergent surgery",
        category: "Humanized monoclonal antibody fragment (dabigatran reversal agent)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Humanized monoclonal antibody Fab fragment specific for dabigatran"),
            KeyValueRow(key: "Use", value: "Reversal of dabigatran (Pradaxa) anticoagulation — life-threatening bleeding OR urgent surgery / procedure"),
            KeyValueRow(key: "Dose", value: "5 g IV × 1 (2 vials of 2.5 g each given consecutively)"),
            KeyValueRow(key: "Onset", value: "Within minutes; effect lasts ~12 hours"),
            KeyValueRow(key: "Watch", value: "Thromboembolism after reversal (resume anticoagulation when safe); rare hypersensitivity; specific to DABIGATRAN only (not for Xa inhibitors)")
        ],
        indications: AttributedProse(
            "Emergency reversal of dabigatran (Pradaxa) anticoagulation in patients with life-threatening or uncontrolled bleeding OR requiring urgent surgery / procedure. FDA-approved 2015 — first targeted DOAC reversal agent. NOT for Xa inhibitor reversal per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Humanized monoclonal antibody Fab fragment with >350× higher affinity for dabigatran than thrombin → rapid binding + neutralization → restores normal coagulation within minutes. NO procoagulant activity (vs PCCs); no anticoagulant rebound.",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "5 g IV — 2 consecutive infusions of 2.5 g (each over 5-10 min) via separate IV line OR pre-existing IV per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Repeat dose (uncommon)", body: "Additional 5 g if reappearance of clinically relevant bleeding + elevated coagulation testing OR re-emergency surgery requirement per primary source.", citationIDs: ["specialty_round26"]),
            DosingBlock(label: "Pediatric", body: "Limited data; off-label.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Renal impairment", body: "No dose adjustment per studies; dabigatran clearance impaired in CKD but idarucizumab reversal effective.", citationIDs: ["openfda_round26"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to idarucizumab or excipients (hereditary fructose intolerance — contains sorbitol). Otherwise no major contraindications when indicated; benefits outweigh risks in life-threatening bleeding.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("THROMBOEMBOLIC EVENTS after reversal — patient was on anticoagulation for a reason; resume dabigatran or alternative anticoagulation as soon as medically appropriate per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HEREDITARY FRUCTOSE INTOLERANCE — contains sorbitol (4 g per dose); contraindicated in fructose intolerance per primary source.", citationIDs: ["openfda_round26"]),
            AttributedBullet("HYPERSENSITIVITY — rare; monitor for anaphylaxis during infusion.", citationIDs: ["openfda_round26"]),
            AttributedBullet("REBOUND COAGULOPATHY — unlikely with idarucizumab (binds dabigatran irreversibly); minimal in clinical experience.", citationIDs: ["openfda_round26"]),
            AttributedBullet("RESUME DABIGATRAN — within 24 hours of bleeding cessation IF patient still needs anticoagulation; bridge with parenteral if needed.", citationIDs: ["specialty_round26"]),
            AttributedBullet("ANTI-IIa ACTIVITY testing post-reversal — to confirm complete reversal in selected.", citationIDs: ["specialty_round26"]),
            AttributedBullet("UNAVAILABLE for Xa inhibitor reversal — use andexanet alfa OR 4F-PCC.", citationIDs: ["specialty_round26"])
        ],
        adverseReactions: AttributedProse(
            "Hypokalemia, delirium, constipation, pyrexia, pneumonia, infusion reactions (rare); thromboembolic events post-reversal.",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("No drug-drug interaction studies; protein-based therapy with specific binding.", citationIDs: ["openfda_round26"]),
            AttributedBullet("DOES NOT affect coagulation testing of other anticoagulants — specific to dabigatran only.", citationIDs: ["openfda_round26"]),
            AttributedBullet("Concurrent anticoagulants — additive bleeding (vs reversal benefit assessment).", citationIDs: ["openfda_round26"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY indication — dabigatran-specific; not for warfarin, heparin, Xa inhibitors.", citationIDs: ["specialty_round26"]),
            AttributedBullet("RAPID administration possible — 2 consecutive 2.5 g infusions × 5-10 min each; via separate IV line OR pre-existing IV (NS, LR, dextrose compatible).", citationIDs: ["openfda_round26"]),
            AttributedBullet("MONITOR — bleeding cessation; vital signs; signs of thromboembolism; coagulation parameters (PT, aPTT, dabigatran-specific assays).", citationIDs: ["specialty_round26"]),
            AttributedBullet("RESUME anticoagulation — when bleeding controlled + thrombotic risk warrants; typically <24 hrs; specialty individualized.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PATIENT EDUCATION — emergency wallet card identifying dabigatran use + reversal availability; medical alert bracelet.", citationIDs: ["specialty_round26"]),
            AttributedBullet("DOCUMENT — time + reason for reversal, response, complications, resumption plan.", citationIDs: ["specialty_round26"]),
            AttributedBullet("AVAILABILITY in pharmacy — hospital stocking + protocol for emergent use.", citationIDs: ["specialty_round26"])
        ],
        patientTeaching: AttributedProse(
            "This medicine completely reverses your blood thinner (dabigatran) so we can stop the bleeding or do surgery safely. It works in minutes. Without your blood thinner, you have a higher risk of stroke / blood clots — we'll restart it as soon as it's safe.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FourFactorPCCSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "4-factor-pcc",
        title: "4-factor prothrombin complex concentrate (Kcentra)",
        subtitle: "Vitamin K-dependent factors II, VII, IX, X · WARFARIN reversal · DOAC reversal (off-label) · INR-based dosing · thromboembolism boxed",
        category: "Plasma-derived coagulation factor concentrate (warfarin reversal)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Plasma-derived 4-factor prothrombin complex concentrate — Factor II, VII, IX, X + proteins C/S + heparin"),
            KeyValueRow(key: "Use", value: "Urgent reversal of warfarin for major bleeding OR urgent surgery; off-label DOAC reversal (Xa inhibitors)"),
            KeyValueRow(key: "Dose", value: "INR-based: INR 2-4 = 25 units/kg; INR 4-6 = 35 units/kg; INR >6 = 50 units/kg; max 100 units/kg/day"),
            KeyValueRow(key: "Watch", value: "BOXED thromboembolic events; resume anticoagulation when safe; combine with vitamin K (since PCC factors deplete in 6-8 hours)"),
            KeyValueRow(key: "vs FFP", value: "Faster (small volume), more reliable INR reversal, faster reconstitution, no plasma exchange volume issues")
        ],
        indications: AttributedProse(
            "Urgent reversal of warfarin (vitamin K antagonist) anticoagulation for acute major bleeding OR urgent surgery / procedure. Off-label use for Xa inhibitor reversal (Kcentra vs andexanet — emerging comparative data); supplemental Factor IX in selected hemophilia B per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Contains all 4 vitamin K-dependent coagulation factors (II, VII, IX, X) + endogenous anticoagulants (proteins C + S) + heparin. Rapidly replaces depleted factors → restores hemostasis within 15-30 minutes. Effect lasts 6-8 hours (factors continuously consumed) → MUST combine with vitamin K (works in 12-24 hrs) for sustained reversal.",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "INR 2-4 (warfarin reversal)", body: "25 units/kg (round to nearest vial size); max 2500 units total per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "INR 4-6", body: "35 units/kg; max 3500 units total.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "INR >6", body: "50 units/kg; max 5000 units total.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Concurrent VITAMIN K", body: "5-10 mg IV slow infusion (over 30 min) for sustained reversal; vitamin K takes 12-24 hrs to act per primary source.", citationIDs: ["specialty_round26"]),
            DosingBlock(label: "Off-label DOAC reversal (Xa inhibitors)", body: "25-50 units/kg per primary source; emerging data; specialty.", citationIDs: ["specialty_round26"])
        ],
        contraindications: AttributedProse(
            "Disseminated intravascular coagulation (DIC); known anaphylaxis to PCC or heparin; HIT (heparin-induced thrombocytopenia type 2); ongoing thromboembolic events.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("BOXED — THROMBOEMBOLIC EVENTS — ~3-8% of patients within 7 days; arterial + venous; monitor; resume anticoagulation as soon as safe per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HEPARIN-INDUCED THROMBOCYTOPENIA (HIT) — contains heparin; contraindicated if prior HIT; use Profilnine (3-factor) or specific antibodies if HIT.", citationIDs: ["specialty_round26"]),
            AttributedBullet("COMBINE WITH VITAMIN K — PCC effect lasts 6-8 hrs only; vitamin K provides sustained reversal (12-24 hrs onset); BOTH essential for warfarin reversal per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("VOLUME — small infusion volume (~100 mL); faster + safer than FFP (large volume → CHF, TACO) per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("DIC contraindication — adds factors but ongoing consumption; specialty.", citationIDs: ["openfda_round26"]),
            AttributedBullet("VIRAL TRANSMISSION risk — pasteurized + viral-inactivated; rare residual risk.", citationIDs: ["openfda_round26"]),
            AttributedBullet("RECHECK INR at 30 min + 6 hrs after PCC; recheck again at 24 hrs as vitamin K takes effect.", citationIDs: ["specialty_round26"])
        ],
        adverseReactions: AttributedProse(
            "Thromboembolic events (boxed; DVT, PE, stroke, MI), headache, infusion reactions, hypersensitivity, HIT (if heparin in product), DIC exacerbation.",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("Vitamin K — synergistic; essential for sustained reversal of warfarin.", citationIDs: ["specialty_round26"]),
            AttributedBullet("Other coagulation products — additive thrombotic risk + redundant.", citationIDs: ["openfda_round26"]),
            AttributedBullet("HEPARIN — contained in PCC; potential antagonism with heparin reversal.", citationIDs: ["openfda_round26"]),
            AttributedBullet("ANTITHROMBIN — works with proteins in PCC for balanced effect.", citationIDs: ["openfda_round26"])
        ],
        nursingImplications: [
            AttributedBullet("RECONSTITUTE per package — 20 mL diluent per vial; admin via separate IV line OR pre-existing.", citationIDs: ["openrn_pharm_round26"]),
            AttributedBullet("INFUSION RATE 0.12 mL/kg/min (max 8 mL/min) — relatively slow; total infusion 20-30 min for most adult doses.", citationIDs: ["openfda_round26"]),
            AttributedBullet("COMBINE with VITAMIN K 5-10 mg IV at same time — essential for sustained reversal per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("MONITOR INR at 30 min + 6 hrs + 24 hrs — initial drop from PCC + sustained from vitamin K.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PRE-/POST monitoring — vital signs, neurologic exam, thromboembolic signs (calf pain, dyspnea, chest pain, AMS, focal weakness).", citationIDs: ["specialty_round26"]),
            AttributedBullet("RESUME WARFARIN — within 24-48 hrs of bleed cessation, bridge with parenteral anticoagulation per protocol.", citationIDs: ["specialty_round26"]),
            AttributedBullet("Document — indication, dose, response, complications, resumption plan.", citationIDs: ["specialty_round26"]),
            AttributedBullet("FFP COMPARISON — PCC is FASTER + smaller volume + more reliable INR reversal; FFP if PCC unavailable.", citationIDs: ["specialty_round26"]),
            AttributedBullet("Smart pump + second-nurse verification for high-alert.", citationIDs: ["ismp_round26"])
        ],
        patientTeaching: AttributedProse(
            "This medicine reverses your blood thinner (Coumadin / warfarin) so we can stop the bleeding or do surgery. We're also giving you vitamin K which will sustain the reversal. After reversal, you have a higher risk of clots — we'll restart blood thinning when it's safe.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IronSucroseSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "iron-sucrose",
        title: "Iron sucrose (Venofer)",
        subtitle: "IV iron · multiple smaller doses · CKD + chronic disease anemia · pre-medication for hypersensitivity · safer than iron dextran",
        category: "Intravenous iron (ferric sucrose)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Intravenous iron complex (ferric sucrose)"),
            KeyValueRow(key: "Use", value: "Iron deficiency anemia (CKD on dialysis, CKD non-dialysis, chronic GI loss, refractory oral iron) when oral inadequate"),
            KeyValueRow(key: "Dose", value: "100-300 mg per dose; typically 100-200 mg over 5-10 min OR diluted in 100 mL NS over 15-30 min"),
            KeyValueRow(key: "Course", value: "Total cumulative dose calculated (deficit + storage); typically 1000 mg total over multiple sessions"),
            KeyValueRow(key: "Watch", value: "Hypersensitivity / anaphylaxis; lower risk than iron dextran; no test dose required; observe + epinephrine ready")
        ],
        indications: AttributedProse(
            "Iron deficiency anemia when oral iron is inadequate or contraindicated — chronic kidney disease (CKD) on hemodialysis (most common), CKD not on dialysis, chronic GI blood loss / malabsorption, refractory oral iron intolerance, postpartum severe anemia, IBD per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Ferric sucrose complex — iron core surrounded by sucrose ligand. Macrophages in RES (reticuloendothelial system) take up + release iron for transferrin binding → erythropoiesis. Multiple smaller doses preferred over single high dose (vs ferric carboxymaltose). Lower hypersensitivity risk than iron dextran.",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "CKD on hemodialysis", body: "100 mg IV over 5-10 min OR 100 mg in 100 mL NS over 15 min; typically per dialysis session × 10 sessions per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "CKD not on dialysis", body: "200 mg IV over 5-10 min; 5 doses over 14 days (total 1000 mg) per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Other IDA", body: "100-300 mg per dose; total cumulative dose calculated per Ganzoni formula: deficit (mg) = weight × (target Hb - current Hb) × 2.4 + 500 mg storage.", citationIDs: ["specialty_round26"]),
            DosingBlock(label: "Pediatric", body: "Per weight; specialty supervision; less commonly used than adult.", citationIDs: ["openfda_round26"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to iron sucrose or any IV iron; anemia not from iron deficiency; iron overload (hemochromatosis, transfusion-dependent thalassemia without chelation); active infection (theoretical infection risk from iron) per primary source.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("HYPERSENSITIVITY REACTIONS — usually mild-moderate; iron sucrose has LOWER risk than iron dextran; severe anaphylaxis rare; observation × 30 min after each dose per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("NO TEST DOSE REQUIRED for iron sucrose (vs iron dextran); but observe + have epinephrine + steroids + airway equipment available.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HYPOTENSION — rapid administration; reduce rate; pre-medication with antihistamine + steroid may help.", citationIDs: ["openfda_round26"]),
            AttributedBullet("INFECTION risk — theoretical (iron is microbial nutrient); avoid in active sepsis; controversial.", citationIDs: ["specialty_round26"]),
            AttributedBullet("ANAPHYLAXIS — RARE; immediate epinephrine, steroids, airway, fluids.", citationIDs: ["openfda_round26"]),
            AttributedBullet("CARDIAC EVENTS — uncommon in stable patients.", citationIDs: ["openfda_round26"]),
            AttributedBullet("EXTRAVASATION — skin staining brown / black; cosmetic concern; some skin necrosis with large extravasation.", citationIDs: ["openfda_round26"]),
            AttributedBullet("PREGNANCY (Category B) — generally safe; oral preferred in 1st trimester.", citationIDs: ["specialty_round26"])
        ],
        adverseReactions: AttributedProse(
            "Hypersensitivity reactions (mild-severe), hypotension, headache, nausea, vomiting, metallic taste, muscle cramps, dyspnea, dizziness, infusion site reactions, extravasation skin staining.",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("ORAL iron — increased GI side effects; usually held during IV course.", citationIDs: ["openfda_round26"]),
            AttributedBullet("ACE inhibitors — increased hypersensitivity reactions; pre-medicate or alternative.", citationIDs: ["openfda_round26"]),
            AttributedBullet("Avoid concurrent — other parenteral iron products without specialty consultation.", citationIDs: ["openfda_round26"])
        ],
        nursingImplications: [
            AttributedBullet("IV access — peripheral OK for short administration; central line not required.", citationIDs: ["openrn_pharm_round26"]),
            AttributedBullet("INFUSION rate — 100 mg over 5-10 min OR 200-300 mg over 30 min; do NOT exceed manufacturer rate (anaphylaxis risk).", citationIDs: ["openfda_round26"]),
            AttributedBullet("OBSERVE × 30 min after infusion for hypersensitivity reactions; epinephrine + crash cart available.", citationIDs: ["specialty_round26"]),
            AttributedBullet("MONITOR — vital signs during + after infusion; hypersensitivity signs, hypotension.", citationIDs: ["specialty_round26"]),
            AttributedBullet("CALCULATE total dose — Ganzoni formula OR per institutional protocol; typically 1000 mg total in 5 doses over 2-4 weeks.", citationIDs: ["specialty_round26"]),
            AttributedBullet("RECHECK Hb + ferritin at 4 weeks after completion; expect Hb rise 1-2 g/dL.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PRE-MEDICATION not routine for iron sucrose; consider for patients with prior reactions.", citationIDs: ["specialty_round26"]),
            AttributedBullet("AVOID EXTRAVASATION — large vein; check IV patency; stop immediately if pain / swelling.", citationIDs: ["specialty_round26"]),
            AttributedBullet("ALTERNATIVE — ferric carboxymaltose (Injectafer) — single 750-1000 mg dose; faster but more expensive + slight hypophosphatemia risk; iron isomaltoside, ferumoxytol — alternative high-dose IV iron.", citationIDs: ["specialty_round26"])
        ],
        patientTeaching: AttributedProse(
            "This is intravenous iron — needed because pills don't work or your body can't absorb them. You'll receive several treatments over 2-4 weeks. Tell us right away about chest tightness, shortness of breath, rash, or feeling like you might pass out. After completion, we'll recheck your blood in 4 weeks. Your stools may turn dark.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FerricCarboxymaltoseSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ferric-carboxymaltose",
        title: "Ferric carboxymaltose (Injectafer)",
        subtitle: "High-dose IV iron · single dose 750-1000 mg · iron deficiency anemia · hypophosphatemia risk · 2nd-line oral iron failure",
        category: "Intravenous iron — high-dose / single-dose formulation",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Intravenous iron carbohydrate complex (single high-dose formulation)"),
            KeyValueRow(key: "Use", value: "Iron deficiency anemia with intolerance / inadequate response to oral iron OR CKD non-dialysis"),
            KeyValueRow(key: "Dose", value: "750 mg IV × 1 (single dose); may repeat at ≥7 days; max 1500 mg total per course"),
            KeyValueRow(key: "Watch", value: "HYPOPHOSPHATEMIA (common); persistent in some patients; hypersensitivity; faster repletion than iron sucrose"),
            KeyValueRow(key: "Note", value: "Convenient single-dose vs iron sucrose multiple sessions; more expensive")
        ],
        indications: AttributedProse(
            "Iron deficiency anemia in adults with — intolerance or inadequate response to oral iron OR chronic kidney disease not on hemodialysis. Convenient single-dose alternative to multiple iron sucrose sessions per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Iron carboxymaltose complex — iron core wrapped in carbohydrate ligand. Slow release of iron to transferrin → erythropoiesis. Carbohydrate ligand enables larger single doses with lower hypersensitivity than iron dextran or sucrose at same dose.",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "Body weight ≥50 kg", body: "750 mg IV × 1 (over 15 min OR diluted in 250 mL NS over 30 min); may repeat at ≥7 days; total max 1500 mg per course per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Body weight <50 kg", body: "15 mg/kg × 1; may repeat at ≥7 days; total max 1500 mg.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Total dose intervals", body: "Single dose effective in many; second dose for refractory or large iron deficit.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Pediatric", body: "Limited; specialty.", citationIDs: ["openfda_round26"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to ferric carboxymaltose or its components; anemia not from iron deficiency; severe hypersensitivity reactions to previous IV iron.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("HYPOPHOSPHATEMIA — common (~50%); usually transient + mild but can be SYMPTOMATIC + persistent; weakness, bone pain, fractures; check phosphorus at 2-4 weeks + replace if low per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HYPERSENSITIVITY REACTIONS — observe ≥30 min; epinephrine + steroids ready.", citationIDs: ["openfda_round26"]),
            AttributedBullet("HYPOTENSION — slow infusion if occurs; reduce rate.", citationIDs: ["openfda_round26"]),
            AttributedBullet("HYPERTENSION — possible; observed shortly after infusion in some; usually transient.", citationIDs: ["openfda_round26"]),
            AttributedBullet("EXTRAVASATION — skin staining; large vein preferred; brown / black persistent skin discoloration possible.", citationIDs: ["openfda_round26"]),
            AttributedBullet("PREGNANCY — Category C; limited human data; assess benefit-risk.", citationIDs: ["openfda_round26"]),
            AttributedBullet("MORE EXPENSIVE than iron sucrose; but reduces clinic visits (single dose vs multiple).", citationIDs: ["specialty_round26"])
        ],
        adverseReactions: AttributedProse(
            "Hypophosphatemia (common, can be symptomatic), hypersensitivity, hypotension, hypertension (transient), nausea, headache, dizziness, skin staining at extravasation site, peripheral edema.",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("Limited; protein-bound iron complex.", citationIDs: ["openfda_round26"]),
            AttributedBullet("Concurrent oral iron — increased GI side effects; hold during IV course.", citationIDs: ["openfda_round26"]),
            AttributedBullet("Vitamin C — enhances oral iron absorption but minimal effect on IV.", citationIDs: ["openfda_round26"])
        ],
        nursingImplications: [
            AttributedBullet("IV access — peripheral OK; large vein preferred to avoid extravasation staining.", citationIDs: ["openrn_pharm_round26"]),
            AttributedBullet("INFUSION rate — 750 mg over 15 min via push OR 250 mL NS over 30 min for slower; do NOT exceed.", citationIDs: ["openfda_round26"]),
            AttributedBullet("OBSERVE ≥30 min for hypersensitivity; epinephrine + crash cart available.", citationIDs: ["specialty_round26"]),
            AttributedBullet("CHECK PHOSPHORUS at 2 weeks + 4 weeks after — common HYPOPHOSPHATEMIA; replace if symptomatic OR <2 mg/dL.", citationIDs: ["specialty_round26"]),
            AttributedBullet("RECHECK Hb + ferritin at 4-8 weeks; expect Hb rise 1-2 g/dL.", citationIDs: ["specialty_round26"]),
            AttributedBullet("SINGLE-DOSE convenience — preferable for patients with transportation / scheduling barriers vs iron sucrose multiple sessions.", citationIDs: ["specialty_round26"]),
            AttributedBullet("Monitor BP — transient hypertension after.", citationIDs: ["openfda_round26"])
        ],
        patientTeaching: AttributedProse(
            "This is a single IV iron treatment — much faster than the multi-session option. You may feel flush or have brief blood pressure changes. Tell us about bone pain or weakness in the weeks after — this can be low phosphorus that needs treatment. We'll check your blood + phosphorus in 2-4 weeks.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CrizanlizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "crizanlizumab",
        title: "Crizanlizumab (Adakveo)",
        subtitle: "Anti-P-selectin monoclonal · sickle cell crisis prevention · reduces vaso-occlusive crisis frequency · monthly IV · approved age ≥16",
        category: "Anti-P-selectin humanized monoclonal antibody (sickle cell)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Humanized monoclonal antibody against P-selectin"),
            KeyValueRow(key: "Use", value: "Reduces frequency of vaso-occlusive crisis (VOC) in sickle cell disease — adults + adolescents ≥16 years"),
            KeyValueRow(key: "Dose", value: "5 mg/kg IV at 0 + 2 weeks, then every 4 weeks"),
            KeyValueRow(key: "Watch", value: "Infusion reactions; expensive; combine with hydroxyurea (NOT replacement); does NOT reverse acute crisis"),
            KeyValueRow(key: "Reduces", value: "~45% reduction in VOC frequency vs placebo; reduces hospitalization")
        ],
        indications: AttributedProse(
            "Reduces frequency of vaso-occlusive crises (VOC) in sickle cell disease patients ≥16 years of age. Used IN ADDITION to standard sickle cell management (hydroxyurea, hydration, pain management). Does NOT replace acute pain crisis treatment per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Humanized monoclonal antibody against P-selectin — cell adhesion molecule expressed on activated endothelial cells + platelets. Blocks P-selectin → reduces leukocyte + sickle erythrocyte adhesion → reduces vaso-occlusion + inflammation underlying sickle cell crisis.",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "Adult / adolescent ≥16 years", body: "5 mg/kg IV at week 0, week 2, then every 4 weeks; infused over 30 minutes per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Frequency", body: "Monthly maintenance dose; ongoing as long as clinical benefit + tolerability.", citationIDs: ["specialty_round26"]),
            DosingBlock(label: "Concurrent therapy", body: "Combine with hydroxyurea (most patients), L-glutamine (if used), supportive care.", citationIDs: ["specialty_round26"]),
            DosingBlock(label: "Pediatric <16 years", body: "Limited data; specialty / clinical trial.", citationIDs: ["openfda_round26"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to crizanlizumab. Caution — concurrent acute crisis (treat acute first; doesn't reverse acute), severe infection.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("INFUSION REACTIONS — uncommon; observe during + 30 min after; pre-medication NOT routine.", citationIDs: ["openfda_round26"]),
            AttributedBullet("DOES NOT TREAT ACUTE VOC — for prevention only; manage acute crisis with hydration + opioids + oxygen.", citationIDs: ["specialty_round26"]),
            AttributedBullet("COMBINE with hydroxyurea — does NOT replace; both work different mechanisms; synergistic.", citationIDs: ["specialty_round26"]),
            AttributedBullet("EXPENSIVE — ~$100,000+/year; insurance authorization + manufacturer assistance.", citationIDs: ["specialty_round26"]),
            AttributedBullet("L-GLUTAMINE (Endari) — alternative oral therapy for VOC reduction; may be combined.", citationIDs: ["specialty_round26"]),
            AttributedBullet("VOXELOTOR (Oxbryta) — was alternative HbS polymerization inhibitor; WITHDRAWN 2024 due to deaths; not currently available per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PREGNANCY — Category C; limited data; sickle cell specialty.", citationIDs: ["openfda_round26"])
        ],
        adverseReactions: AttributedProse(
            "Headache, back pain, nausea, fever, arthralgia, infusion reactions (mild), antibody formation, infection (rare).",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("Limited; protein-based therapy.", citationIDs: ["openfda_round26"]),
            AttributedBullet("Concurrent hydroxyurea — additive benefit; standard combination.", citationIDs: ["specialty_round26"]),
            AttributedBullet("Live vaccines — caution; immunocompromised state in sickle cell; specialty consultation.", citationIDs: ["specialty_round26"])
        ],
        nursingImplications: [
            AttributedBullet("ROUTINE MONTHLY infusion — 30-minute IV; outpatient infusion center.", citationIDs: ["openrn_pharm_round26"]),
            AttributedBullet("VERIFY this is for PREVENTION — does NOT treat acute crisis (different acute management).", citationIDs: ["specialty_round26"]),
            AttributedBullet("OBSERVE during + 30 min after; rare infusion reactions.", citationIDs: ["openfda_round26"]),
            AttributedBullet("CONTINUE HYDROXYUREA + standard sickle cell management — combination preferred.", citationIDs: ["specialty_round26"]),
            AttributedBullet("MONITOR — VOC frequency (decreased), hospitalization rate, quality of life, hydroxyurea response, baseline labs (CBC, retic, LDH).", citationIDs: ["specialty_round26"]),
            AttributedBullet("SICKLE CELL specialty — comprehensive care center; multidisciplinary; transition planning.", citationIDs: ["specialty_round26"]),
            AttributedBullet("VACCINATIONS — pneumococcal, meningococcal, influenza, hepatitis B; up-to-date per primary source.", citationIDs: ["specialty_round26"])
        ],
        patientTeaching: AttributedProse(
            "This monthly IV reduces how often you have sickle cell pain crises — about 45% fewer episodes. It does NOT stop an acute crisis once started — still come in for hydration + pain medicine. Continue your hydroxyurea + other treatments. Keep your immunizations + clinic visits up-to-date.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RasburicaseSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "rasburicase",
        title: "Rasburicase (Elitek)",
        subtitle: "Recombinant urate oxidase · severe TLS prevention + treatment · G6PD CONTRAINDICATED (hemolysis + methemoglobinemia) · single 0.2 mg/kg",
        category: "Recombinant urate oxidase (uricolytic — TLS)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant urate oxidase enzyme (Aspergillus flavus) — converts uric acid to allantoin"),
            KeyValueRow(key: "Use", value: "Prevention + treatment of tumor lysis syndrome (TLS); especially high-risk hematologic malignancies"),
            KeyValueRow(key: "Dose", value: "0.15-0.2 mg/kg IV × 1 dose; may repeat × 4-5 days if needed"),
            KeyValueRow(key: "Watch", value: "BOXED — HEMOLYSIS + METHEMOGLOBINEMIA in G6PD-DEFICIENT patients; ANAPHYLAXIS; screen G6PD before in at-risk populations"),
            KeyValueRow(key: "Onset", value: "Rapid — within 4 hours; faster than allopurinol")
        ],
        indications: AttributedProse(
            "Prevention + treatment of tumor lysis syndrome (TLS) in adults + pediatric patients with high-risk hematologic malignancies starting chemotherapy (acute leukemia, high-grade lymphomas — Burkitt lymphoma especially, advanced solid tumors). When allopurinol insufficient OR very high baseline uric acid (>7 mg/dL adult, >5.5 pediatric) per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Recombinant urate oxidase enzyme — converts UNINSOLUBLE uric acid to SOLUBLE allantoin (eliminated in urine). Rapidly reduces serum uric acid + prevents urate nephropathy in TLS. Faster + more profound effect than allopurinol (which blocks formation but does not eliminate existing uric acid).",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "Standard adult dose", body: "0.15-0.2 mg/kg IV (max 30 mg per dose); single dose typically; may repeat × 4-5 days if needed per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Single-dose alternative", body: "Single 3-6 mg flat dose (lower than weight-based) — effective + saves cost per emerging evidence per primary source.", citationIDs: ["specialty_round26"]),
            DosingBlock(label: "Pediatric", body: "0.2 mg/kg IV daily × up to 5 days; same indications as adult.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Infusion", body: "Over 30 minutes via IV bag (50 mL NS for adult); do not bolus.", citationIDs: ["openfda_round26"])
        ],
        contraindications: AttributedProse(
            "G6PD DEFICIENCY (boxed — hemolysis + methemoglobinemia); pregnancy / lactation (limited data); hypersensitivity. Screen G6PD before use in patients of Mediterranean / African / Middle Eastern / Southeast Asian descent per primary source.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("BOXED — G6PD DEFICIENCY → HEMOLYSIS + METHEMOGLOBINEMIA; SCREEN G6PD before in at-risk populations (Mediterranean, African, Middle Eastern, Southeast Asian descent); CONTRAINDICATED if positive per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("BOXED — ANAPHYLAXIS (rare but serious); pre-medication with steroid + antihistamine often used; observe + epinephrine ready.", citationIDs: ["openfda_round26"]),
            AttributedBullet("URIC ACID FALSELY LOW on lab — rasburicase continues degrading uric acid in lab tube; sample must be CHILLED + collected on ice + tested promptly to get accurate reading per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("CONTINUED RASBURICASE indication — only if very high uric acid; not all TLS prophylaxis requires rasburicase; allopurinol sufficient for many.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HYDRATION — concurrent aggressive IV hydration (3 L/m²/day) + alkalinization debated (some recommend NOT to alkalinize with rasburicase since soluble allantoin doesn't need alkaline urine).", citationIDs: ["specialty_round26"]),
            AttributedBullet("EXPENSIVE — ~$2,000-3,000+ per dose; cost-effectiveness vs allopurinol balanced.", citationIDs: ["specialty_round26"])
        ],
        adverseReactions: AttributedProse(
            "Anaphylaxis (rare), hemolysis (G6PD), methemoglobinemia (G6PD), nausea, vomiting, headache, fever, abdominal pain, rash, antibody formation (decreases efficacy on subsequent courses).",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("No major drug interactions known.", citationIDs: ["openfda_round26"]),
            AttributedBullet("Allopurinol — uncommonly used concurrently; rasburicase usually replaces for high-risk TLS.", citationIDs: ["specialty_round26"]),
            AttributedBullet("Methylene blue — TREATMENT of methemoglobinemia from rasburicase; AVOID in G6PD deficiency (worsens hemolysis); ascorbic acid alternative.", citationIDs: ["specialty_round26"])
        ],
        nursingImplications: [
            AttributedBullet("SCREEN G6PD before in at-risk patients — Mediterranean, African, Middle Eastern, Southeast Asian descent per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PREMEDICATE — steroid + antihistamine often given; consult institution protocol.", citationIDs: ["specialty_round26"]),
            AttributedBullet("INFUSE over 30 min via IV bag; observe during + 1 hour after for anaphylaxis.", citationIDs: ["openfda_round26"]),
            AttributedBullet("URIC ACID SAMPLE handling — CHILLED + on ICE + analyzed within 4 hours; otherwise falsely low reading.", citationIDs: ["specialty_round26"]),
            AttributedBullet("CONCURRENT TLS MANAGEMENT — IV hydration 3 L/m²/day, monitor K+, P, Ca, Cr, lactate; nephrology consult if AKI or refractory.", citationIDs: ["specialty_round26"]),
            AttributedBullet("MONITOR — uric acid q4h initially; K+ + P + Ca q6-8h; renal function daily; hemolysis labs (haptoglobin, retic, LDH) if any concern.", citationIDs: ["specialty_round26"]),
            AttributedBullet("ALLOPURINOL alternative for low-moderate TLS risk — much cheaper; 300 mg PO daily started 1-2 days before chemo.", citationIDs: ["specialty_round26"])
        ],
        patientTeaching: AttributedProse(
            "This medicine rapidly clears the uric acid that builds up when chemo destroys cancer cells. It prevents kidney damage. You'll have a blood test for a genetic condition (G6PD) first because this medicine can be harmful in people with G6PD. Tell us about pale skin, dark urine, jaundice, or shortness of breath.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IbrutinibSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ibrutinib",
        title: "Ibrutinib (Imbruvica)",
        subtitle: "BTK inhibitor · CLL + MCL + Waldenström · oral · BLEEDING + AFib + HTN · drug interactions CYP3A4 + transformed leukemia treatment",
        category: "Bruton tyrosine kinase (BTK) inhibitor (oral; targeted hematologic malignancy)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Bruton tyrosine kinase (BTK) inhibitor — small molecule oral"),
            KeyValueRow(key: "Use", value: "Chronic lymphocytic leukemia (CLL) / small lymphocytic lymphoma (SLL); mantle cell lymphoma (MCL); Waldenström macroglobulinemia; marginal zone lymphoma; cGVHD"),
            KeyValueRow(key: "Dose", value: "CLL/SLL/WM 420 mg PO daily; MCL/MZL 560 mg PO daily; with food or empty stomach"),
            KeyValueRow(key: "Watch", value: "BLEEDING (esp. concurrent antiplatelet / anticoagulant); atrial fibrillation; HYPERTENSION; infections; tumor lysis syndrome (initial); drug interactions (strong CYP3A4 inhibitors / inducers — dose adjust)")
        ],
        indications: AttributedProse(
            "Chronic lymphocytic leukemia (CLL) + small lymphocytic lymphoma (SLL) — first-line + relapsed; mantle cell lymphoma (MCL — relapsed); Waldenström macroglobulinemia; marginal zone lymphoma; chronic graft-versus-host disease (cGVHD). Has transformed treatment of CLL — chemotherapy-free oral regimen per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Irreversibly binds Bruton tyrosine kinase (BTK) at cysteine residue → inhibits B-cell receptor (BCR) signaling pathway essential for B-cell proliferation + survival. Has additional anti-fibrotic + anti-inflammatory effects (cGVHD indication).",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "CLL / SLL / WM", body: "420 mg PO once daily; continue until progression or unacceptable toxicity per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "MCL / MZL", body: "560 mg PO once daily; continue until progression or unacceptable toxicity per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "cGVHD", body: "420 mg PO once daily for adults; pediatric weight-based.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Pediatric ≥1 year (cGVHD)", body: "Weight-based; specialty.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Hepatic adjustment", body: "Reduce dose for mild-moderate; severe — generally avoid.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Strong CYP3A4 inhibitors", body: "Reduce dose to 140 mg PO daily or hold per institutional protocol.", citationIDs: ["openfda_round26"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — uncontrolled atrial fibrillation, severe HTN, active bleeding, severe infection, planned surgery (hold 3-7 days), CKD / hepatic impairment, pregnancy.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("BLEEDING — increased risk (decreased platelet function); concurrent antiplatelet / anticoagulant — additive risk; HOLD pre-procedure 3-7 days per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("ATRIAL FIBRILLATION + flutter — new-onset ~6-15%; monitor; consider rate / rhythm control; anticoagulation balance bleeding risk; usually do NOT discontinue ibrutinib.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HYPERTENSION — common; monitor + treat; standard antihypertensives.", citationIDs: ["openfda_round26"]),
            AttributedBullet("INFECTIONS — bacterial, viral (PCP prophylaxis selected), fungal, hepatitis B reactivation, opportunistic; monitor + treat aggressively; consider prophylaxis for PJP per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("TUMOR LYSIS SYNDROME — initial cycles; aggressive hydration + allopurinol or rasburicase; monitor K+, P, Ca, Cr.", citationIDs: ["specialty_round26"]),
            AttributedBullet("CARDIAC events — heart failure, ventricular arrhythmias (rare but serious); pre-existing cardiac disease workup.", citationIDs: ["openfda_round26"]),
            AttributedBullet("DRUG INTERACTIONS — strong CYP3A4 INHIBITORS (ketoconazole, clarithromycin, voriconazole, ritonavir) DOUBLE ibrutinib; STRONG INDUCERS (rifampin, phenytoin) DECREASE; counsel grapefruit avoidance.", citationIDs: ["openfda_round26"]),
            AttributedBullet("CYTOPENIAS — neutropenia, thrombocytopenia, anemia; monitor CBC.", citationIDs: ["openfda_round26"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (gingival, epistaxis, GI, intracranial rare), atrial fibrillation, hypertension, infections (URI, pneumonia, hepatitis B reactivation, PCP), cytopenias, diarrhea, nausea, fatigue, rash, arthralgia.",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INHIBITORS (ketoconazole, ritonavir, clarithromycin) — INCREASE ibrutinib levels significantly; reduce dose to 140 mg/day OR hold per protocol.", citationIDs: ["openfda_round26"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS (rifampin, St. John's wort, phenytoin, carbamazepine) — DECREASE ibrutinib; AVOID concurrent.", citationIDs: ["openfda_round26"]),
            AttributedBullet("ANTIPLATELETS + ANTICOAGULANTS — additive bleeding; balance carefully; hold pre-procedure 3-7 days.", citationIDs: ["specialty_round26"]),
            AttributedBullet("GRAPEFRUIT JUICE — moderate CYP3A4 inhibitor; counsel avoidance.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HEPATITIS B REACTIVATION — screen HBV + treat / prophylaxis (entecavir / tenofovir).", citationIDs: ["specialty_round26"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY indication + dosing for specific malignancy.", citationIDs: ["specialty_round26"]),
            AttributedBullet("BASELINE — ECG (rule out AFib), BP, CBC, hepatic function, HBV screening, ECG for QT prolongation.", citationIDs: ["specialty_round26"]),
            AttributedBullet("DRUG INTERACTION review — pharmacist consultation; counsel grapefruit avoidance; check all OTC + supplements.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HOLD PRE-PROCEDURE — 3-7 days before elective surgery; resume after hemostasis per surgeon.", citationIDs: ["specialty_round26"]),
            AttributedBullet("MONITOR — CBC + CMP + LFTs at 2 weeks + monthly; BP at every visit; ECG for new symptoms; signs of bleeding + infection.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HBV PROPHYLAXIS — entecavir / tenofovir for HBV+ patients during therapy + 12 months after.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PATIENT EDUCATION — bleeding signs, infection signs, ECG check for AFib symptoms (palpitations / SOB), avoid grapefruit + St. John's wort, take with or without food consistently.", citationIDs: ["specialty_round26"]),
            AttributedBullet("INFECTIONS — vigilant; consider PJP prophylaxis for selected.", citationIDs: ["specialty_round26"])
        ],
        patientTeaching: AttributedProse(
            "Take once daily. Tell us about easy bruising, bleeding, palpitations, swelling, chest pain, or signs of infection. AVOID grapefruit + St. John's wort + check any new medicine with us. Get blood tests as scheduled. If you need surgery / dental work — tell us so we can adjust the medicine.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum VenetoclaxSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "venetoclax",
        title: "Venetoclax (Venclexta)",
        subtitle: "BCL2 inhibitor · CLL + AML · TLS RISK CRITICAL (ramp-up dosing + prophylaxis) · cytopenias · neutropenic fever",
        category: "BCL-2 inhibitor (BH3 mimetic) — targeted hematologic malignancy",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "BCL-2 inhibitor (BH3 mimetic) — restores apoptosis in BCL-2-overexpressing malignancies"),
            KeyValueRow(key: "Use", value: "CLL / SLL (first-line + relapsed; often combined with rituximab or obinutuzumab); AML (75 years+ or unfit + combined with azacitidine / decitabine / low-dose ara-C)"),
            KeyValueRow(key: "Dose (CLL)", value: "Weekly RAMP-UP: 20 mg → 50 → 100 → 200 → 400 mg PO daily over 5 weeks"),
            KeyValueRow(key: "Watch", value: "BOXED — tumor lysis syndrome (high risk during ramp-up); cytopenias; infections; drug interactions CYP3A4")
        ],
        indications: AttributedProse(
            "Chronic lymphocytic leukemia (CLL) + small lymphocytic lymphoma (SLL) — combination with rituximab or obinutuzumab for relapsed / refractory + first-line; acute myeloid leukemia (AML) in age ≥75 OR unfit for intensive chemotherapy — combined with azacitidine OR decitabine OR low-dose ara-C per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "BH3 mimetic — binds BCL-2 + displaces BH3-only proteins → restores apoptosis in cancer cells that overexpress BCL-2 (CLL, AML). Highly selective vs prior pan-BCL inhibitors.",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "CLL ramp-up (5-week)", body: "Week 1: 20 mg PO daily; Week 2: 50 mg PO daily; Week 3: 100 mg PO daily; Week 4: 200 mg PO daily; Week 5+: 400 mg PO daily per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "AML (combination)", body: "Ramp-up over 3 days: 100 mg → 200 → 400 mg PO daily; combine with azacitidine / decitabine / LDC (low-dose ara-C); typically 400 mg daily long-term per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Hepatic adjustment", body: "Moderate impairment — 75% dose reduction; severe — generally avoid.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Strong CYP3A4 inhibitors", body: "Reduce dose 75% OR hold per institutional protocol.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Take with food", body: "Bioavailability significantly higher with food (~3-5×); take same way each day with morning meal.", citationIDs: ["openfda_round26"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Strong CYP3A4 inhibitors during ramp-up — initiation contraindicated due to TLS risk. Active untreated infection.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("BOXED — TUMOR LYSIS SYNDROME — particularly during ramp-up dose escalation; aggressive hydration + allopurinol or rasburicase + monitoring labs Q-2-4h x 24 hrs at each dose escalation per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("TLS PROPHYLAXIS — categorize risk (low / medium / high based on tumor burden); allopurinol or rasburicase + IV hydration; admit selected for monitoring; ramp-up dose escalation under specialist.", citationIDs: ["specialty_round26"]),
            AttributedBullet("CYTOPENIAS — neutropenia + thrombocytopenia + anemia; monitor CBC weekly; G-CSF for neutropenic fever; transfusion as needed.", citationIDs: ["specialty_round26"]),
            AttributedBullet("INFECTIONS — neutropenic fever; PCP / fungal prophylaxis selective; vigilant.", citationIDs: ["specialty_round26"]),
            AttributedBullet("DRUG INTERACTIONS — strong CYP3A4 inhibitors significantly increase venetoclax + TLS risk; strong inducers decrease.", citationIDs: ["openfda_round26"]),
            AttributedBullet("TAKE WITH FOOD — significantly improves bioavailability + reduces variability.", citationIDs: ["specialty_round26"]),
            AttributedBullet("EMBRYO-FETAL TOXICITY — Category D; reliable contraception × 6 months after.", citationIDs: ["openfda_round26"])
        ],
        adverseReactions: AttributedProse(
            "Neutropenia, anemia, thrombocytopenia, tumor lysis syndrome, diarrhea, nausea, vomiting, fatigue, headache, upper respiratory infection, cough, hyperphosphatemia, hypokalemia.",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INHIBITORS (ketoconazole, clarithromycin, ritonavir, indinavir) — significantly increase venetoclax; INITIATION CONTRAINDICATED during ramp-up.", citationIDs: ["openfda_round26"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS (rifampin, phenytoin) — decrease levels; AVOID.", citationIDs: ["openfda_round26"]),
            AttributedBullet("MODERATE inhibitors (fluconazole, erythromycin) — reduce venetoclax dose by 50% during ramp-up.", citationIDs: ["openfda_round26"]),
            AttributedBullet("GRAPEFRUIT JUICE — moderate inhibitor; counsel avoidance.", citationIDs: ["specialty_round26"]),
            AttributedBullet("P-GP / OATP inhibitors — increase venetoclax exposure; monitor.", citationIDs: ["openfda_round26"])
        ],
        nursingImplications: [
            AttributedBullet("CATEGORIZE TLS RISK — high tumor burden / lymphadenopathy / spleen size / Hgb / WBC level; admit high-risk for monitoring during ramp-up per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("TLS PROPHYLAXIS — allopurinol 300 mg/day OR rasburicase for high-risk; IV hydration 2-3 L/day; pre-medication with allopurinol 1-2 days before start.", citationIDs: ["specialty_round26"]),
            AttributedBullet("MONITOR labs intensively during ramp-up — K+ + P + Ca + Cr + uric acid AT BASELINE + 6-8 hours after dose 1 + 24 hours; same after each dose increase.", citationIDs: ["specialty_round26"]),
            AttributedBullet("WEEKLY CBC during ramp-up; periodic thereafter; G-CSF for neutropenia; transfusion for thrombocytopenia / anemia.", citationIDs: ["specialty_round26"]),
            AttributedBullet("DRUG INTERACTION review — strict avoidance of strong CYP3A4 inhibitors during ramp-up; pharmacist consultation.", citationIDs: ["specialty_round26"]),
            AttributedBullet("TAKE with FOOD — same time daily (morning meal preferred).", citationIDs: ["specialty_round26"]),
            AttributedBullet("MISSED DOSE — within 8 hours, take as soon as possible; >8 hours, skip; do NOT double per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("Counsel — infection signs, TLS symptoms (muscle cramps, tetany, AMS, palpitations), bleeding, contraception.", citationIDs: ["specialty_round26"])
        ],
        patientTeaching: AttributedProse(
            "Take this with your morning meal — same way each day. We start at a low dose + increase weekly to prevent tumor lysis (when cancer cells break down). Drink lots of water + take other medicines as prescribed. Tell us right away about muscle cramps, fast heartbeat, confusion, or fever. AVOID grapefruit. Tell us about other medicines before starting.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LenalidomideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lenalidomide",
        title: "Lenalidomide (Revlimid)",
        subtitle: "Immunomodulatory · multiple myeloma + MDS + lymphoma · TERATOGEN (REMS) · VTE prophylaxis · neutropenia + thrombocytopenia",
        category: "Immunomodulatory imide drug (IMiD) — oral",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Immunomodulatory imide drug (IMiD) — thalidomide analog"),
            KeyValueRow(key: "Use", value: "Multiple myeloma (newly diagnosed, relapsed, post-transplant maintenance); myelodysplastic syndrome (MDS) del(5q); follicular + mantle cell lymphoma; AL amyloidosis"),
            KeyValueRow(key: "Dose (MM)", value: "25 mg PO daily × 21 days q28 day cycle (combined with dex / bortezomib / daratumumab)"),
            KeyValueRow(key: "TERATOGEN — REMS", value: "REVLIMID REMS program required; pregnancy testing pre + during; reliable contraception; counsel + document"),
            KeyValueRow(key: "Watch", value: "Cytopenias, VTE (PE/DVT), neuropathy, fatigue, rash; mandatory VTE prophylaxis (aspirin minimum; LMWH high-risk)")
        ],
        indications: AttributedProse(
            "Multiple myeloma (newly diagnosed combined with dexamethasone + bortezomib; relapsed; maintenance post autologous stem cell transplant); myelodysplastic syndrome (MDS) with isolated del(5q) cytogenetic abnormality; mantle cell lymphoma + follicular lymphoma (relapsed); AL amyloidosis per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Immunomodulatory drug — multiple mechanisms: degrades transcription factors IKZF1 + IKZF3 (essential for myeloma + lymphoma cell survival); enhances T-cell + NK-cell activity; reduces angiogenesis; immune modulation. Distinct from thalidomide despite structural similarity.",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "Multiple myeloma (RVd induction)", body: "25 mg PO days 1-21 of 28-day cycle; combined with bortezomib + dexamethasone per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Multiple myeloma maintenance post-transplant", body: "10-15 mg PO daily; continuous therapy until progression / toxicity.", citationIDs: ["specialty_round26"]),
            DosingBlock(label: "MDS with del(5q)", body: "10 mg PO daily; cycle dependent; lower dose if cytopenias.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Lymphoma", body: "20-25 mg PO daily for 21 days of 28-day cycle.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Renal adjustment", body: "Reduce for CrCl <60 (10-15 mg) and <30 (5-10 mg every other day); dialysis — specialty dosing.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "VTE prophylaxis with treatment", body: "Aspirin 81 mg minimum for ALL patients on lenalidomide + dex; LMWH for high-risk per primary source.", citationIDs: ["specialty_round26"])
        ],
        contraindications: AttributedProse(
            "Pregnancy (Category X — severe teratogen; thalidomide analog → limb defects); women of reproductive age without reliable contraception; hypersensitivity. REVLIMID REMS program enrollment required for all patients + prescribers + pharmacies per primary source.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("BOXED — TERATOGENICITY — severe birth defects (limb abnormalities, organ anomalies); REVLIMID REMS — mandatory + multifactor program for prescribers + pharmacies + patients per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("WOMEN of reproductive age — TWO reliable contraception methods + monthly pregnancy testing during + 4 weeks after; counsel + document; iPLEDGE-like REMS.", citationIDs: ["specialty_round26"]),
            AttributedBullet("MEN — barrier contraception with female partners of reproductive age; sperm in semen.", citationIDs: ["specialty_round26"]),
            AttributedBullet("CYTOPENIAS — neutropenia + thrombocytopenia + anemia common; G-CSF for neutropenia; transfusion for severe.", citationIDs: ["specialty_round26"]),
            AttributedBullet("VENOUS THROMBOEMBOLISM — significantly increased; MANDATORY VTE prophylaxis with aspirin 81 mg minimum; LMWH for high-risk per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("SKIN REACTIONS — Stevens-Johnson, TEN, DRESS; rash early; discontinue if severe.", citationIDs: ["openfda_round26"]),
            AttributedBullet("PERIPHERAL NEUROPATHY (less than thalidomide); typically mild-moderate; reduce dose or discontinue if severe.", citationIDs: ["specialty_round26"]),
            AttributedBullet("TUMOR LYSIS SYNDROME — early cycles in high tumor burden; prophylaxis.", citationIDs: ["specialty_round26"]),
            AttributedBullet("SECONDARY MALIGNANCIES — slightly increased risk in MM maintenance; counsel.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HEPATOTOXICITY — rare; LFT monitoring.", citationIDs: ["openfda_round26"])
        ],
        adverseReactions: AttributedProse(
            "Cytopenias (neutropenia, thrombocytopenia, anemia), VTE (DVT, PE), peripheral neuropathy, rash, fatigue, diarrhea, constipation, muscle cramps, secondary malignancies (rare).",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("DIGOXIN — increased levels; monitor.", citationIDs: ["openfda_round26"]),
            AttributedBullet("WARFARIN — possible interaction; monitor INR.", citationIDs: ["openfda_round26"]),
            AttributedBullet("Concurrent VTE prophylaxis — required (ASA at minimum); LMWH if concurrent high-risk factors.", citationIDs: ["specialty_round26"]),
            AttributedBullet("Strong CYP3A4 + P-gp inhibitors — minor effect on lenalidomide.", citationIDs: ["openfda_round26"])
        ],
        nursingImplications: [
            AttributedBullet("REVLIMID REMS — enroll prescriber + pharmacy + patient; cannot dispense without enrollment per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PREGNANCY testing + COUNSELING — two methods reliable contraception; monthly pregnancy testing during + 4 weeks after; iPLEDGE-style documentation.", citationIDs: ["specialty_round26"]),
            AttributedBullet("VTE PROPHYLAXIS — aspirin 81 mg minimum for ALL patients; LMWH for high-risk (prior VTE, immobility, central line, age >75, obesity); mandatory per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("MONITOR — CBC weekly initially then per cycle; CMP + LFTs; signs of VTE + skin reactions + neuropathy.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PATIENT EDUCATION — birth defects, VTE signs, fever / infection, rash, neuropathy, bone health (myeloma).", citationIDs: ["specialty_round26"]),
            AttributedBullet("CYCLES — 21-day on / 7-day off (28-day cycle) typical for MM induction; maintenance continuous.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HEMATOLOGY-ONCOLOGY specialty — myeloma center; multidisciplinary.", citationIDs: ["specialty_round26"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed. If you can become pregnant, you MUST use two reliable forms of birth control + have monthly pregnancy tests. If you're male, use condoms with female partners. Take a baby aspirin daily to prevent blood clots. Tell us about leg pain / swelling, chest pain, shortness of breath, rash, severe diarrhea, or numbness / tingling. Get blood tests regularly.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BortezomibSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "bortezomib",
        title: "Bortezomib (Velcade)",
        subtitle: "Proteasome inhibitor · multiple myeloma + MCL · SC preferred over IV (less neuropathy) · weekly or twice-weekly · shingles prophylaxis",
        category: "Proteasome inhibitor (PI) — multiple myeloma",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "26S proteasome inhibitor (PI)"),
            KeyValueRow(key: "Use", value: "Multiple myeloma (newly diagnosed, relapsed, maintenance); mantle cell lymphoma"),
            KeyValueRow(key: "Dose", value: "1.3 mg/m² SC OR IV days 1, 4, 8, 11 of 21-day cycle (twice-weekly) OR days 1, 8, 15, 22 (weekly)"),
            KeyValueRow(key: "Route", value: "SUBCUTANEOUS PREFERRED — significantly less peripheral neuropathy than IV"),
            KeyValueRow(key: "Watch", value: "Peripheral neuropathy (very common; dose-limiting), cytopenias, GI side effects, hypotension, HERPES ZOSTER (acyclovir prophylaxis required)")
        ],
        indications: AttributedProse(
            "Multiple myeloma — newly diagnosed combined with lenalidomide + dexamethasone (RVd) OR cyclophosphamide-bortezomib-dexamethasone; relapsed / refractory; maintenance; mantle cell lymphoma (relapsed) per primary source.",
            citationIDs: ["specialty_round26", "openfda_round26"]
        ),
        mechanism: AttributedProse(
            "Reversible inhibitor of chymotrypsin-like activity of 26S proteasome → accumulates ubiquitinated proteins → disrupts protein homeostasis → apoptosis in cells dependent on proteasome (especially MM + MCL). Selective toxicity for malignant plasma cells.",
            citationIDs: ["openfda_round26"]
        ),
        dosing: [
            DosingBlock(label: "Twice-weekly (induction)", body: "1.3 mg/m² SC (preferred) OR IV days 1, 4, 8, 11 of 21-day cycle per primary source.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Once-weekly (maintenance + selected induction)", body: "1.3 mg/m² SC days 1, 8, 15, 22 of 35-day cycle per primary source.", citationIDs: ["specialty_round26"]),
            DosingBlock(label: "Mantle cell lymphoma", body: "1.3 mg/m² SC/IV days 1, 4, 8, 11 of 21-day cycle.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Renal adjustment", body: "No initial adjustment; monitor + reduce for severe.", citationIDs: ["openfda_round26"]),
            DosingBlock(label: "Hepatic adjustment", body: "Severe — 0.7 mg/m²; moderate — start 0.7 mg/m².", citationIDs: ["openfda_round26"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to bortezomib, boron, or mannitol. Caution — pre-existing neuropathy (grade 2+), severe cytopenias, severe heart failure, syncopal cardiac events.",
            citationIDs: ["openfda_round26"]
        ),
        warnings: [
            AttributedBullet("PERIPHERAL NEUROPATHY — VERY COMMON (35-50%); typically distal symmetric; sensorimotor; reduce dose or switch to weekly OR SC if grade 2+; reduce or discontinue for severe per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("SUBCUTANEOUS preferred OVER IV — significantly less neuropathy + similar efficacy per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("CYTOPENIAS — thrombocytopenia + neutropenia + anemia; thrombocytopenia is dose-limiting; monitor; transfusion + G-CSF as needed.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HERPES ZOSTER REACTIVATION — VARICELLA-ZOSTER risk; ACYCLOVIR 400 mg PO BID prophylaxis × duration of therapy + 1 month after per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("GASTROINTESTINAL — nausea, vomiting, diarrhea, constipation, anorexia; aggressive prophylaxis (ondansetron, IV fluids, dietitian).", citationIDs: ["openfda_round26"]),
            AttributedBullet("HYPOTENSION — orthostatic + postdose; pre-hydrate; counsel.", citationIDs: ["openfda_round26"]),
            AttributedBullet("CARDIAC events — heart failure, syncope; monitor; pre-existing cardiac disease workup.", citationIDs: ["openfda_round26"]),
            AttributedBullet("TUMOR LYSIS SYNDROME — early cycles in high tumor burden; allopurinol + hydration prophylaxis.", citationIDs: ["specialty_round26"]),
            AttributedBullet("REVERSIBLE POSTERIOR LEUKOENCEPHALOPATHY (PRES) — rare; vision change + AMS + headache.", citationIDs: ["openfda_round26"]),
            AttributedBullet("PREGNANCY — Category D; reliable contraception × 7 months post-treatment.", citationIDs: ["openfda_round26"])
        ],
        adverseReactions: AttributedProse(
            "Peripheral neuropathy (very common), thrombocytopenia, neutropenia, anemia, nausea, vomiting, diarrhea, constipation, fatigue, fever, dyspnea, rash, herpes zoster reactivation.",
            citationIDs: ["openfda_round26"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 + CYP2C19 inhibitors — increase bortezomib; monitor.", citationIDs: ["openfda_round26"]),
            AttributedBullet("Strong CYP3A4 inducers — decrease bortezomib; avoid concurrent.", citationIDs: ["openfda_round26"]),
            AttributedBullet("Concurrent ANTIVIRAL prophylaxis with acyclovir / valacyclovir — REQUIRED.", citationIDs: ["specialty_round26"]),
            AttributedBullet("ANTIPLATELETS / ANTICOAGULANTS — additive bleeding with severe thrombocytopenia; monitor + transfuse.", citationIDs: ["specialty_round26"])
        ],
        nursingImplications: [
            AttributedBullet("SUBCUTANEOUS PREFERRED — abdomen, thigh, upper arm; rotate sites; less peripheral neuropathy than IV per primary source.", citationIDs: ["specialty_round26"]),
            AttributedBullet("VARICELLA-ZOSTER prophylaxis — ACYCLOVIR 400 mg BID throughout therapy + 1 month after.", citationIDs: ["specialty_round26"]),
            AttributedBullet("MONITOR — CBC + CMP + neurologic exam at each visit; signs of neuropathy (paresthesias, weakness, falls); thrombocytopenia bleeding.", citationIDs: ["specialty_round26"]),
            AttributedBullet("HOLD or REDUCE for grade 2+ neuropathy OR severe cytopenias.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PATIENT EDUCATION — bone pain + neuropathy + shingles signs + bleeding + infection.", citationIDs: ["specialty_round26"]),
            AttributedBullet("PRE-MEDICATION — antiemetics (ondansetron + dexamethasone), antiviral, hydration.", citationIDs: ["specialty_round26"]),
            AttributedBullet("CYCLE schedule — adherence essential; reschedule if missed.", citationIDs: ["specialty_round26"])
        ],
        patientTeaching: AttributedProse(
            "This medicine is usually given as a small injection under your skin (not IV — less nerve side effects). You'll also take an antiviral (acyclovir) to prevent shingles. Tell us about tingling, numbness, weakness, severe nausea, diarrhea, bleeding / bruising, or fever. Stay hydrated. Get blood tests as scheduled.",
            citationIDs: ["openrn_pharm_round26"]
        ),
        citations: [openfdaR26, openrnPharmR26, specialtyR26, ismpR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}
