import Foundation

// Curator-model diagnosis entries (round 26 — hematologic + chronic liver).

private let openrnDxR26 = CitationSource(
    id: "openrn_dx_round26",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR26 = CitationSource(
    id: "cdc_dx_round26",
    shortName: "CDC + NHLBI + Genetic Conditions resources",
    publisher: "CDC · NHLBI",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health-topics",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR26 = CitationSource(
    id: "specialty_dx_round26",
    shortName: "ASH + AASLD + Cooley's Anemia Foundation + AAH concept citations",
    publisher: "ASH · AASLD · CAF · AAH",
    license: .factCitationOnly,
    url: "https://www.hematology.org/education/clinicians/guidelines-and-quality-care",
    lastRetrieved: "2026-05-13"
)

private let hemTagR26 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .clottingHemostasis)
private let hepatTagR26 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination)

public enum TTPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ttp",
        title: "Thrombotic thrombocytopenic purpura (TTP)",
        subtitle: "ADAMTS13 deficiency · MAHA + thrombocytopenia + neuro + renal + fever · plasma exchange + steroids + rituximab + caplacizumab · LIFE-THREATENING",
        nclexTags: hemTagR26,
        definition: AttributedProse(
            "Life-threatening thrombotic microangiopathy caused by ADAMTS13 deficiency — autoimmune (acquired TTP, ~95%) OR congenital (Upshaw-Schulman syndrome, rare). Untreated mortality >90%. Modern treatment (plasma exchange + steroids + rituximab + caplacizumab) reduces mortality to <20% with early recognition per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "ADAMTS13 (a disintegrin and metalloproteinase with a thrombospondin type 1 motif, member 13) deficiency → uncleaved ultra-large von Willebrand factor multimers (ULVWFM) → platelet-rich microthrombi in small vessels → tissue ischemia + microangiopathic hemolytic anemia (MAHA) + consumption of platelets + organ damage. Acquired form has autoantibodies against ADAMTS13.",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("CLASSIC PENTAD — MAHA + thrombocytopenia + neurologic abnormalities + renal dysfunction + fever (only ~5-15% have ALL five; PRESENT WITH 2-3 commonly).", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("MAHA — schistocytes on peripheral smear, decreased haptoglobin, elevated LDH, indirect hyperbilirubinemia, anemia.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("THROMBOCYTOPENIA — platelets <50K usually; purpura, petechiae, mucosal bleeding.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("NEUROLOGIC — confusion, headache, focal deficits, seizures, coma; can fluctuate.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("RENAL — proteinuria, hematuria, mild Cr elevation (severe AKI more common in aHUS).", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Risk factors — female, age 30-50 peak, prior TTP, pregnancy, infections, HIV, lupus, drugs (clopidogrel, ticlopidine, gemcitabine, mitomycin, calcineurin inhibitors).", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL HIGH SUSPICION based on MAHA + thrombocytopenia even before lab confirmation; START TREATMENT EMPIRICALLY due to high mortality per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ADAMTS13 ACTIVITY <10% (often <5%) — confirms TTP; check before plasma exchange (interferes); send-out lab.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ADAMTS13 INHIBITOR (autoantibody) — present in acquired TTP.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PLASMIC SCORE — clinical / lab tool to predict ADAMTS13 deficiency probability; useful for triage.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Workup — CBC, peripheral smear (schistocytes), LDH, haptoglobin, bilirubin, BUN/Cr, urinalysis, coag panel (PT/PTT normal in TTP — distinguishes from DIC), pregnancy test, HIV, ANA.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Rule out — DIC (abnormal PT/PTT), HUS (more renal predominant, often pediatric, Shiga toxin), aHUS (complement dysregulation), HIT (heparin exposure), HELLP (pregnancy), other thrombotic microangiopathies.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("EARLY RECOGNITION — MAHA + thrombocytopenia + ANY organ dysfunction; START PEX empirically.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Hemodynamic + neurologic status — frequent assessment.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ADAMTS13 send BEFORE plasma exchange initiates.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Hematology + critical care + apheresis specialty consultation.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("PLASMA EXCHANGE (PEX / TPE) — emergent initiation; replaces ADAMTS13 + removes inhibitor + ULVWFM; daily 1-1.5 plasma volumes; continue until platelet count >150K × 2 days per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CORTICOSTEROIDS — methylprednisolone 1 g IV × 3 days then prednisone 1 mg/kg PO daily, taper; suppresses autoantibody production.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CAPLACIZUMAB (Cablivi) — 11 mg IV before first PEX + 11 mg SC daily × duration of PEX + 30 days after; blocks vWF-platelet interaction immediately; reduces time to recovery + recurrence per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RITUXIMAB 375 mg/m² IV weekly × 4 weeks — depletes B cells producing ADAMTS13 autoantibodies; reduces relapse.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PLATELET TRANSFUSION CONTRAINDICATED unless life-threatening bleeding — fuels thrombosis; AVOID even with severe thrombocytopenia.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RBC transfusion as needed for symptomatic anemia.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Aspirin 81 mg + LMWH prophylaxis once platelets ≥50K (controversial — varies by protocol).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CONGENITAL TTP (Upshaw-Schulman) — chronic fresh frozen plasma every 2-3 weeks OR recombinant ADAMTS13 (TAK-755 emerging); genetic counseling.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RECURRENCE — long-term monitoring; preventive treatment for high-risk (low ADAMTS13 between episodes); rituximab maintenance considered.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY untreated — >90%; treated <20%; emergent treatment crucial.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CARDIAC + NEUROLOGIC complications — myocardial infarction, stroke, seizures; can persist after recovery.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RECURRENCE — ~40% in acquired TTP without rituximab; monitor ADAMTS13 + counsel.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PREGNANCY — high-risk for TTP exacerbation; preconception consultation + planning.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("APHERESIS COMPLICATIONS — citrate toxicity (hypocalcemia), allergic reactions, line complications.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LONG-TERM — cognitive impairment from neurologic events; CV risk; depression / PTSD post-acute illness.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AtypicalHUSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "atypical-hus",
        title: "Atypical hemolytic uremic syndrome (aHUS)",
        subtitle: "Complement-mediated TMA · MAHA + thrombocytopenia + AKI · ECULIZUMAB / RAVULIZUMAB · meningococcal vaccine required · LIFELONG therapy",
        nclexTags: hemTagR26,
        definition: AttributedProse(
            "Complement-mediated thrombotic microangiopathy — uncontrolled alternative complement pathway activation. Distinct from \"typical\" HUS (Shiga-toxin-mediated; ~90% pediatric STEC-HUS). aHUS — genetic mutations in complement regulators (factor H, factor I, MCP, C3, factor B, thrombomodulin), autoantibodies, OR triggered by infection / pregnancy / drugs. Eculizumab + ravulizumab transformed prognosis per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "Defective complement regulation → uncontrolled alternative pathway activation → C5b-9 (membrane attack complex) deposition on endothelium → endothelial damage + thrombotic microangiopathy → MAHA + thrombocytopenia + organ damage. ESRD common without treatment.",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("MAHA — schistocytes, low haptoglobin, elevated LDH, anemia.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("THROMBOCYTOPENIA — usually less severe than TTP.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("ACUTE KIDNEY INJURY — predominant organ involvement; oliguria, hypertension, edema, proteinuria, hematuria; ESRD progression common.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Less prominent neurologic features than TTP; can occur in severe cases.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Cardiovascular + GI + ocular + pulmonary involvement possible.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Triggers — infections (URI, GI, dental procedures), pregnancy / postpartum, drugs (calcineurin inhibitors, mTOR inhibitors, chemotherapy), transplant.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Often family history (~20%); de novo mutations common.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — MAHA + thrombocytopenia + AKI without alternative explanation; rule out TTP (ADAMTS13 normal), STEC-HUS (negative Shiga toxin), DIC (normal coag).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ADAMTS13 — usually normal or near-normal (>10%); distinguishes from TTP.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Shiga toxin / E. coli O157:H7 stool — negative.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Complement testing — low C3, normal C4 (alternative pathway activation); high C5b-9; complement factor levels.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("GENETIC TESTING — complement gene panel (CFH, CFI, MCP, C3, CFB, THBD, CFHR1/3 deletions, anti-factor H antibodies); informs prognosis + management decisions per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Renal biopsy — TMA findings; not always needed.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Differentiate TMA causes — TTP (ADAMTS13) vs STEC-HUS vs aHUS vs DIC.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Renal function + need for RRT; cardiovascular + ocular evaluation.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Family history + genetic counseling.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Pregnancy + reproductive planning.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("ECULIZUMAB (Soliris) — first-line; anti-C5 monoclonal; blocks C5b-9 formation; transforms aHUS prognosis; INDUCTION 900 mg IV weekly × 4 weeks, then 1200 mg q2 weeks per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RAVULIZUMAB (Ultomiris) — longer-acting C5 inhibitor; q8 weekly maintenance; preferred for chronic therapy.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MENINGOCOCCAL VACCINATION (MenACWY + MenB) REQUIRED ≥2 weeks before eculizumab/ravulizumab — increased N. meningitidis risk; risk × 1000+; counsel + REMS per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("EMERGENCY PENICILLIN prophylaxis if cannot delay treatment + insufficient vaccination time.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PLASMA EXCHANGE — historic first-line; LIMITED EFFICACY in aHUS (vs TTP); replaced by eculizumab; reserve for diagnostic uncertainty.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DIALYSIS for AKI / ESRD; KIDNEY TRANSPLANT — but recurrence risk in aHUS without eculizumab; eculizumab now allows successful transplantation.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("BP CONTROL + supportive care.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DURATION — lifelong eculizumab / ravulizumab typically; emerging data on discontinuation in selected per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("EXPENSIVE — ~$700,000/year eculizumab; insurance + manufacturer assistance essential.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("NEISSERIA MENINGITIDIS infection — 1000+ × increased risk on eculizumab; vaccination + monitoring + prophylactic abx in selected per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ESRD without treatment — most patients progress; eculizumab prevents.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PREGNANCY — high recurrence risk; preconception planning; eculizumab continued through pregnancy + monitoring.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RENAL TRANSPLANT — aHUS recurrence common in transplanted kidney without eculizumab; combined therapy now standard.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("GENETIC TESTING — guides prognosis + family screening; preimplantation diagnosis for high-risk mutations.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("EXTRARENAL involvement — cardiac, neurologic, ophthalmologic; aggressive complement blockade.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum VWDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "vwd",
        title: "Von Willebrand disease (vWD)",
        subtitle: "Most common inherited bleeding disorder · types 1 / 2 / 3 · MUCOCUTANEOUS bleeding · DDAVP for type 1 · vWF concentrate severe",
        nclexTags: hemTagR26,
        definition: AttributedProse(
            "Most common inherited bleeding disorder — affects ~1% of population. Quantitative (type 1, ~75%) or qualitative (type 2 — multiple subtypes) defect of von Willebrand factor (vWF) → platelet adhesion + Factor VIII stabilization impaired. Severity varies — mild mucocutaneous bleeding (type 1) to severe hemophilia-like (type 3) per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "vWF — large multimeric glycoprotein; mediates platelet adhesion to subendothelial collagen via GPIb-IX-V receptor + carries Factor VIII (stabilizes from degradation). Deficiency / dysfunction → impaired primary hemostasis + accelerated Factor VIII degradation (low VIII levels = secondary hemophilia-like bleeding).",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("MUCOCUTANEOUS BLEEDING — epistaxis, gingival bleeding, easy bruising, menorrhagia (often presenting in young women), prolonged bleeding from minor cuts / dental procedures, postpartum hemorrhage, post-surgical bleeding.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("TYPE 1 (75-80%) — autosomal dominant; mild-moderate vWF deficiency; partially responsive to DDAVP.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("TYPE 2 (15-20%) — multiple subtypes (2A, 2B, 2M, 2N); functional defects; variable response to DDAVP (some contraindicated — 2B).", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("TYPE 3 (1-3%) — autosomal recessive; severe (essentially absent vWF); hemophilia-like bleeding; severe joint / muscle bleeds; DOES NOT respond to DDAVP.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Pseudo-vWD — platelet-type vWD with increased GPIb affinity for vWF.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Acquired vWD — autoimmune, lymphoproliferative, aortic stenosis (Heyde syndrome — shear forces destroy ULVWFM).", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BLEEDING SCORE (ISTH-BAT) — quantifies bleeding history; >3 in men, >5 in women → workup for vWD per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("vWF ANTIGEN (vWF:Ag) — quantitative — low in type 1 + 3; can be normal in type 2.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("vWF ACTIVITY (ristocetin cofactor activity, vWF:RCo) — functional — low in all types.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FACTOR VIII activity — low in type 3 + some type 2; normal in mild type 1.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("vWF multimer analysis — distinguishes types (e.g., type 2A loses high-molecular-weight multimers).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RIPA (ristocetin-induced platelet aggregation) — abnormal in 2B (low ristocetin) + 2M (high ristocetin).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DDAVP CHALLENGE — assesses response (rise in vWF + VIII after DDAVP); informs treatment for type 1.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Blood type — type O has lower baseline vWF; consider in interpretation.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Detailed bleeding history + family history.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Type / subtype classification — guides treatment.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Female-specific — menstrual bleeding, postpartum risk, contraception planning.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Surgical / dental procedure planning.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("DDAVP (DESMOPRESSIN) — for type 1 + selected type 2; releases vWF from endothelial cells; IV 0.3 mcg/kg over 30 min OR IN 300 mcg single spray (each nostril for >50 kg); BEFORE dental procedures + minor surgery + menorrhagia per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("TACHYPHYLAXIS — DDAVP effect diminishes with repeated doses (1-2 days); space dosing OR switch to vWF concentrate.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VWF CONCENTRATE (Humate-P, Wilate, Voncento) — for severe disease (type 3), type 2B (DDAVP contraindicated), major surgery, life-threatening bleeding; ESSENTIAL FOR TYPE 3.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RECOMBINANT vWF (Vonvendi) — newer; less risk of viral transmission; specialty.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ANTIFIBRINOLYTIC (TRANEXAMIC ACID, AMINOCAPROIC ACID) — for menorrhagia, oral / dental bleeding; adjunctive; 1 g PO/IV q6-8h.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MENORRHAGIA — combined oral contraceptive, hormonal IUD, antifibrinolytics, vWF replacement for severe; consider iron supplementation.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AVOID NSAIDs + aspirin — additional platelet dysfunction; use acetaminophen.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DENTAL + SURGICAL — pre-treat with DDAVP or vWF concentrate; antifibrinolytic mouthwash for oral procedures.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HEMOPHILIA TREATMENT CENTER (HTC) — multidisciplinary specialty care; genetic counseling; family screening.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MEDICAL ALERT BRACELET; emergency contact information.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("POSTPARTUM HEMORRHAGE — significantly increased; pre-pregnancy planning; vWF replacement + prophylactic uterotonics + antifibrinolytics per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MENORRHAGIA-RELATED IRON DEFICIENCY ANEMIA — common in untreated; IV iron may be needed.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DENTAL / SURGICAL bleeding — pre-treat with appropriate agent; hemophilia center coordination.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("TYPE 2B — paradoxical thrombocytopenia from increased platelet binding; DDAVP CONTRAINDICATED.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HEYDE SYNDROME — acquired vWD from aortic stenosis; consider aortic valve replacement.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FAMILY screening + genetic counseling — affected relatives; reproductive planning.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIFELONG management — chronic bleeding disorder requiring planning for procedures + childbirth + emergencies.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HereditarySpherocytosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hereditary-spherocytosis",
        title: "Hereditary spherocytosis (HS)",
        subtitle: "Most common inherited hemolytic anemia in Northern Europeans · spherocytes on smear · splenectomy curative · folate supplementation",
        nclexTags: hemTagR26,
        definition: AttributedProse(
            "Inherited disorder of red cell membrane proteins (spectrin, ankyrin, band 3, protein 4.2) → spherical instead of biconcave erythrocytes → splenic destruction → chronic hemolytic anemia. Most common inherited hemolytic anemia in Northern European descent (~1 in 2,000). Autosomal dominant 75% (ankyrin / spectrin); recessive 25% per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "Defective vertical interactions between cell membrane proteins → loss of membrane surface area → spherical instead of biconcave shape → reduced membrane deformability → trapping + destruction in spleen → chronic hemolytic anemia + indirect hyperbilirubinemia + splenomegaly + reticulocytosis.",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("SPECTRUM mild-severe — neonatal jaundice, anemia, splenomegaly, indirect hyperbilirubinemia, gallstones (pigment stones in young adults).", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("CLASSIC TRIAD — anemia + jaundice + splenomegaly.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("APLASTIC CRISIS — parvovirus B19 infection → transient erythroid arrest; severe sudden anemia in any chronic hemolytic disease.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("HEMOLYTIC CRISIS — increased hemolysis with viral infections; worse jaundice + anemia.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("MEGALOBLASTIC CRISIS — folate deficiency from accelerated erythropoiesis; supplementation prevents.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("PIGMENT GALLSTONES — bilirubin overproduction; young-adult cholecystitis common.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Family history of anemia, jaundice, splenectomy, gallstones in young adults.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CBC — anemia (variable severity); MCV usually normal-high; MCHC HIGH (>35 g/dL) — classic finding; reticulocyte count elevated.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PERIPHERAL BLOOD SMEAR — spherocytes (dense, dark RBCs lacking central pallor) — classic per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("INDIRECT BILIRUBIN elevated; LDH elevated; haptoglobin low (chronic hemolysis).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("EOSIN-5-MALEIMIDE (EMA) BINDING TEST — flow cytometry; sensitive + specific; first-line diagnostic per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("OSMOTIC FRAGILITY TEST — historic gold standard; spherocytes lyse at higher saline concentrations than normal RBCs; replaced by EMA test.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MOLECULAR GENETIC testing — identifies specific membrane protein defect; informs family screening.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Differentiate — autoimmune hemolytic anemia (positive DAT), G6PD deficiency, sickle cell, pyruvate kinase deficiency, infectious hemolysis.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity classification — mild (Hgb 11-15), moderate (Hgb 8-11), severe (Hgb <8); influences management.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Splenomegaly + abdominal symptoms.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Folate status; vaccination status; family screening.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("FOLATE SUPPLEMENTATION 1-5 mg PO daily — prevents megaloblastic crisis from accelerated erythropoiesis per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("SPLENECTOMY — CURATIVE for chronic anemia; usually deferred until age 5+ (vaccinate pre-splenectomy) for moderate-severe; partial splenectomy emerging alternative; vaccinations + lifelong penicillin prophylaxis (in children) post-splenectomy per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PRE-SPLENECTOMY VACCINATIONS ≥2 weeks before — PNEUMOCOCCAL (PCV20 then PPSV23), MENINGOCOCCAL (MenACWY + MenB), Hib; influenza annually.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIFELONG VACCINATION + PROPHYLACTIC PENICILLIN — pediatric (penicillin V 250 mg PO BID until age 5); counseling on fever / infection signs requiring emergent evaluation.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CHOLECYSTECTOMY — for symptomatic gallstones; often combined with splenectomy if both planned.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("TRANSFUSION — for severe anemia / aplastic / hemolytic crisis; chronic transfusion programs for severe non-splenectomized.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HEMATOLOGY follow-up — periodic monitoring; manage complications.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FAMILY screening — autosomal dominant 75%; CBC + smear in first-degree relatives.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Pregnancy — increased anemia risk; folate doses higher; obstetric coordination.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("APLASTIC CRISIS — parvovirus B19 in any chronic hemolytic disorder; severe sudden anemia; transfusion + supportive; recover in 2-3 weeks.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PIGMENT GALLSTONES — early onset (often in young adults); ultrasound screening; cholecystectomy.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("OVERWHELMING POST-SPLENECTOMY INFECTION (OPSI) — encapsulated organisms (S. pneumoniae, H. influenzae, N. meningitidis); rapidly fatal; vaccinations + prophylactic abx + counsel emergent eval for fever per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VENOUS THROMBOEMBOLISM — increased post-splenectomy lifelong; consider prophylaxis perioperative; counsel signs.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("EXTRA-MEDULLARY HEMATOPOIESIS — chronic high reticulocyte demand; bone marrow expansion; leg ulcers in severe.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FOLATE DEFICIENCY → megaloblastic crisis — supplementation prevents.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BetaThalassemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "beta-thalassemia",
        title: "Beta-thalassemia (major + intermedia + minor)",
        subtitle: "Mediterranean + South Asian + Middle Eastern · MAJOR transfusion-dependent + iron overload · chelation + transfusion lifelong · HCT curative",
        nclexTags: hemTagR26,
        definition: AttributedProse(
            "Inherited disorder of beta-globin chain synthesis — quantitative defect → unbalanced alpha/beta chain ratio → precipitation of excess alpha chains → erythroid apoptosis (ineffective erythropoiesis) + extra-vascular hemolysis. Spectrum — MAJOR (transfusion-dependent), INTERMEDIA (occasional transfusion), MINOR (carrier; usually asymptomatic). Prevalent in Mediterranean, South + Southeast Asian, Middle Eastern, African ancestry per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "Mutations in HBB gene reduce / abolish beta-globin chain production → unbalanced alpha:beta ratio → α4 tetramers precipitate within erythroid precursors → apoptosis (ineffective erythropoiesis) + peripheral extravascular hemolysis of mature RBCs → chronic anemia + bone marrow expansion + extramedullary hematopoiesis + iron overload (transfusion + increased gut absorption).",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("MAJOR (transfusion-dependent) — onset 6 months (when HbF declines + HbA needed); severe anemia, hepatosplenomegaly, growth failure, frontal bossing, maxillary prominence, hair-on-end skull X-ray, pathologic fractures, delayed puberty.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("INTERMEDIA — occasional transfusion; later onset; less severe anemia; intermediate bone changes.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("MINOR (trait) — usually asymptomatic; mild microcytic anemia detected on routine CBC; counsel partner testing for genetic risk to offspring.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("IRON OVERLOAD — from transfusions + increased GI absorption; CARDIAC (cardiomyopathy, HF — most common cause of death), HEPATIC (cirrhosis, HCC), ENDOCRINE (DM, hypothyroidism, hypogonadism, growth failure, osteoporosis, hypoparathyroidism).", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Increased risk — VTE (especially post-splenectomy), gallstones, leg ulcers.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Risk factors — Mediterranean, South + Southeast Asian, Middle Eastern, African ancestry; family history.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HEMOGLOBIN ELECTROPHORESIS — elevated HbA2 (>3.5%); elevated HbF (variable); decreased HbA — diagnostic per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CBC + smear — microcytic hypochromic anemia (very low MCV often <70 fL despite normal iron); target cells, basophilic stippling, nucleated RBCs.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("IRON STUDIES — normal-to-high ferritin (iron overload from transfusions + GI); distinguish from iron-deficiency anemia (low ferritin + low MCV) by checking iron studies + electrophoresis.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("GENETIC testing — HBB gene mutations; informs prognosis + reproductive planning + targeted therapies.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Prenatal — CVS or amniocentesis for HBB mutations; couples both carriers — 25% homozygous risk; preimplantation diagnosis available.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Iron overload monitoring — ferritin, T2* MRI cardiac (cardiac iron) + hepatic, LIC (liver iron concentration), SF (transferrin saturation).", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Classification — major / intermedia / minor; informs management.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Iron overload assessment — quarterly ferritin; annual cardiac + hepatic T2* MRI; LIC.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Endocrine + cardiac + hepatic + bone — annual surveillance.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Family + reproductive screening + genetic counseling.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("TRANSFUSION — for major; chronic q2-4 weeks; goal pre-transfusion Hgb 9-10 g/dL; maintains growth + reduces complications per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("IRON CHELATION — essential for transfused patients to prevent iron overload toxicity per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DEFEROXAMINE (Desferal) — IV / SC infusion 8-12 hrs nightly; gold standard but inconvenient.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DEFERASIROX (Exjade, Jadenu) — oral once daily; well-tolerated; nephrotoxicity + hepatotoxicity + bone marrow risk.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DEFERIPRONE (Ferriprox) — oral; agranulocytosis risk; combination with deferoxamine in severe.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LUSPATERCEPT (Reblozyl) — newer; binds activin receptor IIB; reduces transfusion burden in adult beta-thal intermedia + major; SC q3 weeks per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HEMATOPOIETIC CELL TRANSPLANTATION — CURATIVE for major; pediatric ideally; matched sibling donor preferred; emerging haploidentical + matched unrelated.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("GENE THERAPY — ZYNTEGLO (betibeglogene autotemcel) FDA-approved 2022 for beta-thal major; CRISPR-based exa-cel; transforms treatment but very expensive ($2-3 million per primary source).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FOLATE supplementation 1-5 mg daily — accelerated erythropoiesis.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("SPLENECTOMY — for severe symptoms; postpones transfusion requirements; OPSI risk + vaccinations + prophylactic abx.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("BONE HEALTH — calcium + vitamin D; DEXA; bisphosphonates for osteoporosis.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ENDOCRINE — annual screening + replacement (thyroid, GH, sex hormones, insulin); fertility consultation.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CARDIAC — annual echo, cardiac MRI for iron; aggressive HF management if cardiomyopathy.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MULTIDISCIPLINARY THALASSEMIA CENTER — comprehensive care.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("CARDIAC IRON OVERLOAD + CARDIOMYOPATHY → HEART FAILURE — leading cause of death in beta-thal major; aggressive chelation reduces; cardiac MRI T2* monitoring per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ENDOCRINE — diabetes, hypothyroidism, hypogonadism, GH deficiency, hypoparathyroidism; annual screening + replacement.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HEPATIC — cirrhosis + hepatocellular carcinoma from iron overload + concurrent HBV/HCV from transfusions; HBV vaccine + HCV screening + treatment.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("OSTEOPOROSIS + FRACTURES — chronic anemia + bone marrow expansion + endocrine; bisphosphonates + calcium / D.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VTE — increased post-splenectomy; counsel signs + situational prophylaxis.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("REPRODUCTIVE — fertility consultation; preimplantation genetic diagnosis; future-pregnancy preconception consultation; family screening.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PSYCHOSOCIAL — chronic illness + frequent appointments + transfusion / chelation burden; mental health support.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum G6PDDeficiencySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "g6pd-deficiency",
        title: "G6PD deficiency",
        subtitle: "X-linked · Mediterranean + African + Middle Eastern + SE Asian · OXIDANT-INDUCED hemolysis · AVOID fava + sulfa + dapsone + rasburicase",
        nclexTags: hemTagR26,
        definition: AttributedProse(
            "X-linked enzyme deficiency — glucose-6-phosphate dehydrogenase (G6PD) catalyzes pentose phosphate pathway → produces NADPH → maintains glutathione → protects RBCs from oxidative stress. Deficiency → oxidant-induced hemolysis. Most common enzyme deficiency worldwide (~400 million affected); high prevalence in Mediterranean (10-30%), African (10-15%), Middle Eastern, Southeast Asian descent per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "G6PD enzyme deficiency → reduced NADPH → reduced glutathione → RBCs vulnerable to oxidant damage → Heinz body formation + hemoglobin denaturation + intravascular + extravascular hemolysis when exposed to oxidant stressor. Severity varies — Class I (severe chronic) to Class V (asymptomatic carrier).",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("NEONATAL JAUNDICE — present in 20-30% of affected infants; potential cause of kernicterus; persists beyond physiologic.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("ACUTE HEMOLYTIC ANEMIA — 1-3 days after oxidant exposure; pallor, jaundice, dark urine (hemoglobinuria), fatigue, back pain, splenomegaly; usually self-limited (3-7 days) after stressor removed.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("FAVISM — severe acute hemolysis after eating fava beans; particularly in Mediterranean populations.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("CHRONIC HEMOLYTIC ANEMIA — Class I severe variants; less common; chronic anemia + splenomegaly.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Triggers — FAVA BEANS, INFECTIONS, MEDICATIONS (sulfa, dapsone, primaquine, methylene blue, nitrofurantoin, phenazopyridine, rasburicase), CHEMICALS (naphthalene mothballs, henna).", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Risk factors — X-linked (males more affected); Mediterranean / African / Middle Eastern / Southeast Asian descent; family history.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("G6PD ACTIVITY ASSAY — quantitative; spectrophotometric; reduced enzyme activity per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FALSE-NEGATIVE during acute hemolysis — older affected RBCs have hemolyzed; younger reticulocytes have higher residual enzyme; wait 6-8 weeks after acute hemolysis for accurate testing.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PERIPHERAL SMEAR during acute hemolysis — HEINZ BODIES (precipitated denatured hemoglobin; supravital staining), BITE CELLS, blister cells, schistocytes.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HEMOLYSIS LABS — elevated indirect bilirubin, elevated LDH, decreased haptoglobin, hemoglobinuria (urine dipstick positive for blood, microscopy without RBCs), reticulocytosis.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("GENETIC TESTING — confirms specific variant; counsels family.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify + AVOID triggers — comprehensive medication review + dietary counseling.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Acute hemolysis severity — Hb, reticulocyte count, urine output (AKI risk).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Family / partner screening + genetic counseling.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Medical alert bracelet + medication list.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("AVOID OXIDANT TRIGGERS — comprehensive list provided; mediclassic medication review at every encounter per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("COMMON OFFENDERS — sulfa drugs (TMP-SMX, sulfadiazine, sulfasalazine), DAPSONE, PRIMAQUINE + TAFENOQUINE (malaria), METHYLENE BLUE, RASBURICASE, NITROFURANTOIN, PHENAZOPYRIDINE, NALIDIXIC ACID, naphthalene (mothballs), fava beans.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FAVA BEAN AVOIDANCE — counsel; also some fava-containing supplements.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ACUTE HEMOLYSIS — remove trigger; supportive care; hydration; transfusion for severe; monitor for AKI; usually self-limited.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("INFECTIONS — treat aggressively; may trigger hemolysis; antibiotics still indicated if needed despite hemolytic risk; choose non-oxidant abx when possible.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("NEONATAL — early identification + phototherapy + exchange transfusion as needed for severe jaundice; risk-zone evaluation.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("METHEMOGLOBINEMIA TREATMENT — ASCORBIC ACID alternative when G6PD deficient (methylene blue contraindicated → worsens hemolysis).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MEDICAL ALERT BRACELET — wear at all times.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FAMILY SCREENING — X-linked; counsel first-degree relatives, especially males.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PREGNANCY — affected fetus could have neonatal hemolysis; maternal G6PD-trigger avoidance.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("RASBURICASE for TLS — CONTRAINDICATED in G6PD; SCREEN before use per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DAPSONE — common cause; commonly used for PCP prophylaxis + leprosy; screen before; consider atovaquone for PCP alternative.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PRIMAQUINE / TAFENOQUINE — for malaria; CONTRAINDICATED in severe G6PD; partial deficiency may tolerate reduced dose.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FAVISM — most common in Mediterranean; severe hemolysis hours-days after fava consumption.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ACUTE KIDNEY INJURY — severe hemolysis can cause AKI from hemoglobinuria; hydration prevention.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("NEONATAL KERNICTERUS — preventable with phototherapy + exchange transfusion; high suspicion in at-risk populations.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("METHEMOGLOBINEMIA in G6PD — methylene blue treatment is CONTRAINDICATED; use ascorbic acid or exchange transfusion.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FanconiAnemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "fanconi-anemia",
        title: "Fanconi anemia (FA)",
        subtitle: "Inherited bone marrow failure + congenital anomalies + cancer predisposition (AML + SCC head/neck) · HCT curative · genetic disorder",
        nclexTags: hemTagR26,
        definition: AttributedProse(
            "Inherited DNA damage repair disorder — autosomal recessive (mostly) — bone marrow failure + congenital anomalies + cancer predisposition (AML, MDS, head + neck squamous cell carcinoma). Affects ~1 in 130,000; carrier frequency ~1 in 200. Multiple FA genes (FANCA most common); progressive bone marrow failure usually presents 5-15 years per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "Defective DNA repair pathway (FA / BRCA repair pathway) → hypersensitivity to DNA crosslinking agents (mitomycin C, diepoxybutane) → chromosomal instability → progressive cellular dysfunction → bone marrow failure + cancer predisposition.",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("CONGENITAL ANOMALIES (~75% present) — short stature, café-au-lait spots, abnormal thumbs / radius (radial ray defects), microcephaly, kidney malformations (horseshoe kidney), GU abnormalities, microphthalmia, cardiac defects.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("BONE MARROW FAILURE — typically presents 5-15 years; progressive pancytopenia.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("MDS / AML — 33-50% lifetime risk by age 40; aggressive when develops.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("SOLID TUMORS — head + neck squamous cell carcinoma (50-fold increased), esophageal SCC, hepatic adenomas / HCC, gynecologic, GI cancers.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("ENDOCRINE — short stature, hypothyroidism, growth hormone deficiency, hypogonadism, diabetes.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Risk factors — autosomal recessive (parental consanguinity); family history.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CHROMOSOMAL FRAGILITY TEST — DEB (diepoxybutane) or mitomycin C-induced chromosomal breakage in cultured lymphocytes; gold standard per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("GENETIC testing — identifies specific FANC gene mutation (FANCA most common, FANCB, FANCC, FANCD1/BRCA2, FANCD2, FANCE, FANCF, FANCG, FANCI, FANCJ/BRIP1, FANCL, FANCM, FANCN/PALB2, FANCO/RAD51C, FANCP/SLX4, FANCQ/ERCC4, FANCR/RAD51, FANCS/BRCA1, FANCT/UBE2T).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CBC + bone marrow biopsy — pancytopenia + hypocellular marrow; rule out AML / MDS evolution.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Imaging — skeletal survey, renal ultrasound, echo for congenital anomalies.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Recognize early — congenital anomalies + family history → chromosomal fragility test.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Multidisciplinary care — hematology, oncology, ENT (head + neck cancer surveillance), endocrinology, gynecology, transplant.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Annual cancer surveillance for adults — head + neck exam, esophagogastroduodenoscopy, gynecologic exam.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Family screening + genetic counseling — reproductive planning + carrier identification.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("HEMATOPOIETIC CELL TRANSPLANTATION (HCT) — CURATIVE for bone marrow failure component; matched sibling donor preferred; pediatric ideally before high-risk evolution; reduced-intensity conditioning per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ANDROGENS (oxymetholone, danazol) — for bone marrow failure when transplant not available; temporary marrow stimulation; hepatic + virilization side effects.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("G-CSF — supports neutrophil count.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RBC + PLATELET TRANSFUSIONS for symptomatic cytopenias; chronic transfusion → iron overload + chelation.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("EPOETIN, ROMIPLOSTIM, ELTROMBOPAG — supportive cytopenias.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CANCER SURVEILLANCE — H&N exam q3-6 months (laryngoscopy), esophagogastroduodenoscopy annually, pelvic exam annually, breast cancer screening per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AVOID OBSCENE — radiation (FA cells extremely radiosensitive), alkylating chemotherapy, tobacco / alcohol (concurrent cancer risks), HPV vaccination.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AML TREATMENT — reduced-intensity conditioning + HCT; full intensity tolerated POORLY due to DNA repair defect.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("GENE THERAPY — emerging; clinical trials.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ENDOCRINE replacement — GH, thyroid, sex hormones, insulin as needed.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Psychosocial + family support; FA Research Fund + Fanconi Anemia Foundation resources.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("AML / MDS — 33-50% by age 40; aggressive when develops; transplant essential.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HEAD + NECK SCC — 50× increased risk; surveillance q3-6 months in adults; AVOID alcohol + tobacco; consider HPV vaccination.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RADIATION EXTREMELY DAMAGING — limit imaging; avoid radiation therapy when possible.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ALKYLATING CHEMOTHERAPY — reduced doses; FA cells hypersensitive.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("INFERTILITY common — male + female; fertility consultation + preservation pre-transplant.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("EXTRAMEDULLARY DISEASE — hepatic adenomas + HCC; ultrasound surveillance.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("REPRODUCTIVE planning — preimplantation diagnosis, carrier screening, donor sibling pre-HCT consideration.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PSYCHOSOCIAL — chronic illness, repeated medical interventions, cancer worry, transplant impact.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HemochromatosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hereditary-hemochromatosis",
        title: "Hereditary hemochromatosis (HFE)",
        subtitle: "Iron overload · HFE C282Y homozygote (Northern European) · LIVER + CARDIO + ENDOCRINE · PHLEBOTOMY first-line · early detection prevents",
        nclexTags: hepatTagR26,
        definition: AttributedProse(
            "Inherited iron overload disorder — most commonly autosomal recessive HFE gene mutations (C282Y homozygote, ~80%; C282Y/H63D compound heterozygote, ~5%). High prevalence in Northern European ancestry (~1 in 200-300). Iron deposits in liver, heart, pancreas, joints, skin, endocrine glands → progressive organ damage. EARLY DETECTION + PHLEBOTOMY prevents complications per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "HFE gene mutations → defective hepcidin regulation → unrestrained intestinal iron absorption (5-10× normal) → progressive iron deposition in parenchyma → fibrosis + organ dysfunction. Manifests in 5th-6th decade in men; later in women (protected by menstrual blood loss until menopause).",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("Often ASYMPTOMATIC for decades; detected on routine labs OR family screening.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("CLASSIC LATE PRESENTATION — bronze skin, diabetes (\"bronze diabetes\"), cirrhosis, cardiomyopathy, hypogonadism.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("FATIGUE + WEAKNESS — common early.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("ARTHRALGIA — MCP joints (\"iron fist\") classic pseudo-arthritis.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("HEPATIC — cirrhosis, hepatocellular carcinoma (~200× increased), hepatomegaly.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("CARDIAC — cardiomyopathy (dilated + restrictive), arrhythmias, HF.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("ENDOCRINE — diabetes (pancreatic iron), hypothyroidism, hypogonadism (pituitary iron — secondary), adrenal insufficiency, osteoporosis.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Skin — bronze / slate-gray hyperpigmentation.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Risk factors — Northern European ancestry, family history, male, postmenopausal female.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("TRANSFERRIN SATURATION — >45% (men) OR >50% (women) — initial screening per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FERRITIN — >300 ng/mL (men) OR >200 ng/mL (women); confirms iron overload.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HFE GENETIC testing — C282Y + H63D mutation analysis; confirms hereditary cause.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER MRI T2* — quantifies liver iron concentration (LIC); non-invasive vs biopsy.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER BIOPSY — for fibrosis / cirrhosis staging; iron quantification; not routine.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CARDIAC MRI T2* — quantifies cardiac iron in suspected cardiac involvement.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Family screening — first-degree relatives; genetic + iron studies.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Differentiate — secondary iron overload (transfusion, ineffective erythropoiesis), aceruloplasminemia, non-HFE iron overload (TfR2, hepcidin, HJV mutations).", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Iron overload severity — ferritin, transferrin sat, LIC.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("End-organ damage — LFTs, BNP, glucose, TSH, testosterone (males), DEXA.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HCC surveillance — abdominal ultrasound + AFP every 6 months if cirrhotic.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Family screening + genetic counseling.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("THERAPEUTIC PHLEBOTOMY — first-line; weekly 500 mL (~250 mg iron) until ferritin <50; then maintenance q2-3 months indefinitely; CURES anemia / fatigue + prevents organ damage if started early per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("IRON CHELATION (deferasirox, deferoxamine, deferiprone) — for patients who cannot tolerate phlebotomy (anemia, cardiac, IV access issues); SECOND-LINE.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DIETARY — limit dietary iron + vitamin C (which increases absorption); AVOID raw seafood (Vibrio vulnificus risk in iron overload); modest red wine OK.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AVOID SUPPLEMENTS containing iron + vitamin C with iron-rich foods.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HEPATIC management — HBV vaccination, HCV screening, alcohol abstinence, HCC surveillance.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CARDIAC management — echo + cardiac MRI; aggressive HF treatment; arrhythmia management.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DIABETES management — insulin / oral meds as standard.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HORMONE replacement — testosterone for hypogonadal males; thyroid; bone health.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Family screening — first-degree relatives — transferrin sat + ferritin + genetic testing.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER TRANSPLANT — for end-stage cirrhosis / HCC; HFE pathology corrects post-transplant.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("HEPATOCELLULAR CARCINOMA — ~200× increased risk in cirrhotic hemochromatosis; surveillance ultrasound + AFP every 6 months per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VIBRIO VULNIFICUS — flesh-eating bacteria in raw oysters / seafood; iron-overloaded patients EXTREMELY susceptible; AVOID raw seafood per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ARTHRITIS — \"iron fist\" pseudo-arthritis; chronic; NSAIDs, intra-articular steroids.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CARDIOMYOPATHY — reversible with phlebotomy if caught early; irreversible advanced.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FAMILY SCREENING — autosomal recessive; first-degree relatives screened with transferrin sat + ferritin + genetic testing per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PHLEBOTOMY TOLERANCE — anemia + fatigue limitations; chelation alternative.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VARIANT GENETICS — non-HFE forms (TfR2, hepcidin, HJV, ferroportin) — earlier onset, more severe, less responsive to phlebotomy.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum WilsonDiseaseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "wilson-disease",
        title: "Wilson disease",
        subtitle: "Copper deposition · hepatic + neuro + psych · Kayser-Fleischer rings · LOW ceruloplasmin · HIGH urinary copper · PENICILLAMINE / trientine chelation",
        nclexTags: hepatTagR26,
        definition: AttributedProse(
            "Autosomal recessive disorder of copper metabolism — ATP7B gene mutation → defective biliary copper excretion + ceruloplasmin assembly → copper deposition in liver, brain, cornea (Kayser-Fleischer rings), kidneys. Affects ~1 in 30,000. Treatable + reversible with early chelation + lifelong therapy per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "ATP7B mutations → defective hepatic copper transporter → impaired biliary copper excretion + reduced ceruloplasmin assembly → free copper accumulation in liver, brain (basal ganglia), kidneys, cornea → tissue damage. Hemolytic anemia from oxidative damage to RBCs in severe cases.",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("HEPATIC — most common presentation in children + adolescents; acute hepatitis to cirrhosis to fulminant hepatic failure with hemolysis (\"Wilsonian\" crisis — very high mortality).", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("NEUROLOGIC — typically presents in young adults (20-30s); tremor (resting + intentional), dysarthria, dystonia, parkinsonism, choreoathetosis, ataxia, drooling, dysphagia.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("PSYCHIATRIC — personality changes, depression, anxiety, psychosis, cognitive decline; often precedes neurologic features.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("KAYSER-FLEISCHER RINGS — golden-brown copper deposits in Descemet's membrane of cornea; present in 95% with neurologic symptoms; require slit lamp.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Hemolytic anemia + Coombs-negative — from acute copper release during liver damage.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Skeletal — premature osteoarthritis, fractures.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Risk factors — autosomal recessive; family history; presentation usually age 5-40.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("LOW CERULOPLASMIN — <20 mg/dL; cornerstone diagnostic; some patients have normal ceruloplasmin.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("24-HOUR URINARY COPPER — >100 mcg/24 hr; >40 mcg suggestive; >800 mcg with penicillamine challenge confirms.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("SLIT LAMP EXAM — KAYSER-FLEISCHER RINGS; ALMOST ALL neurologic patients have KF rings; absence does not exclude hepatic-only.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("SERUM FREE COPPER — increased (>25 mcg/dL); useful adjunct.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER BIOPSY HEPATIC COPPER — >250 mcg/g dry weight gold standard for diagnosis.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ATP7B GENETIC TESTING — confirms diagnosis + facilitates family screening.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MRI BRAIN — \"face of giant panda\" sign in midbrain; basal ganglia signal abnormalities; supportive.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Hepatic + neurologic assessment severity.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Genetic counseling + family screening.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Multidisciplinary — hepatology + neurology + psychiatry + ophthalmology + genetics.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("CHELATION first-line — PENICILLAMINE 1-2 g/day PO in 4 divided doses; LIFELONG per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PENICILLAMINE side effects — hypersensitivity (delayed; rash, fever, lymphadenopathy), nephrotic syndrome, autoimmune (myasthenia gravis, SLE-like), bone marrow suppression, neurological worsening (paradoxical).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("TRIENTINE — alternative chelator; better tolerated than penicillamine; 750-2000 mg/day PO; preferred for penicillamine-intolerant + first-line in some centers.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ZINC ACETATE / sulfate — blocks copper absorption from GI; maintenance therapy after de-coppering OR initial treatment in asymptomatic / mild; cheaper + less toxic; 150 mg elemental zinc/day in 3 divided doses per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VITAMIN B6 (pyridoxine) — co-administered with penicillamine to prevent B6 deficiency.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DIET — avoid copper-rich foods (shellfish, liver, nuts, chocolate, mushrooms, dried fruits); avoid copper plumbing / cookware; vegetarian + soft well water.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER TRANSPLANT — for fulminant hepatic failure OR decompensated cirrhosis OR refractory neurologic disease (controversial); cures + reverses copper accumulation.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PARKINSONISM symptomatic treatment — levodopa cautiously (less effective than IPD); amantadine.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PSYCHIATRIC management — antipsychotics, antidepressants; integrated mental health care.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FAMILY screening — first-degree relatives — ceruloplasmin + 24-hour urinary copper + ATP7B genetic testing; pre-symptomatic treatment.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PREGNANCY — chelation continued (penicillamine teratogenic — switch to zinc or trientine); fetal monitoring.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("FULMINANT HEPATIC FAILURE + WILSONIAN CRISIS — acute hepatic decompensation + Coombs-negative hemolytic anemia + rising bilirubin; emergent liver transplant; high mortality without per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PARADOXICAL NEUROLOGIC WORSENING with PENICILLAMINE initiation — copper mobilized from liver → CNS deposition transiently; consider zinc or trientine alternative.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PENICILLAMINE TOXICITY — nephrotic syndrome, lupus-like, myasthenia gravis, agranulocytosis, marrow suppression; monitor + switch alternative.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ADHERENCE essential — lifelong therapy; non-adherence → liver failure + neurologic deterioration.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FAMILY screening — autosomal recessive; pre-symptomatic treatment prevents disease per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Reversible + treatable — early diagnosis + therapy normalizes life expectancy + prevents disability.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PSYCHIATRIC features can persist after de-coppering — integrated mental health care.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AutoimmuneHepatitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "autoimmune-hepatitis",
        title: "Autoimmune hepatitis (AIH)",
        subtitle: "AST + ALT high · ANA + SMA + LKM-1 antibodies · hypergammaglobulinemia · STEROIDS + azathioprine · liver transplant for refractory",
        nclexTags: hepatTagR26,
        definition: AttributedProse(
            "Chronic immune-mediated hepatocellular injury — autoantibodies, hypergammaglobulinemia, interface hepatitis. Female predominance (4:1); bimodal age (10-20 + 40-60 years). TYPE 1 (most common — ANA + smooth muscle antibody); TYPE 2 (anti-LKM1; younger; more severe). Untreated leads to cirrhosis; immunosuppression-responsive per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "Immune-mediated hepatocellular injury — autoantibodies + T-cell-mediated damage. Genetic predisposition (HLA-DR3 + HLA-DR4) + environmental triggers (medications, viral infections). Interface hepatitis on biopsy.",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("ACUTE — jaundice, fatigue, RUQ pain, nausea; sometimes confused with viral hepatitis.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("CHRONIC / insidious — fatigue, malaise, abnormal LFTs found on routine; jaundice when advanced.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("CIRRHOSIS at presentation in 30-50%.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Extrahepatic — arthralgia, rashes, hyperthyroidism, anemia, glomerulonephritis.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Associated autoimmune diseases — Hashimoto thyroiditis, T1DM, RA, IBD, celiac.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Risk factors — female, family history of autoimmune disease, HLA-DR3 / DR4.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("LFTs — AST + ALT elevated (often >5× ULN); alkaline phosphatase mild rise; bilirubin variable.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AUTOANTIBODIES — TYPE 1 — ANA + smooth muscle antibody (SMA); TYPE 2 — anti-liver-kidney-microsomal-1 (anti-LKM-1); per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ELEVATED IgG (hypergammaglobulinemia) — characteristic.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER BIOPSY — interface hepatitis (lymphoplasmacytic infiltrate at limiting plate), portal inflammation, rosette formation; confirms diagnosis + assesses fibrosis stage.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Rule out — viral hepatitis (B + C + E + EBV + CMV), drug-induced hepatitis, alcohol, NAFLD, hereditary (Wilson, hemochromatosis, alpha-1 antitrypsin), primary biliary cholangitis, primary sclerosing cholangitis.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Simplified Diagnostic Score (autoantibodies + IgG + histology + viral hepatitis exclusion) — clinical scoring.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity — fibrosis / cirrhosis stage, hepatic synthetic function (PT/INR, albumin), encephalopathy, ascites.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Comorbid autoimmune diseases — workup.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Vaccinations + screening (HBV vaccination if not immune; HAV; HCC surveillance if cirrhotic).", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("CORTICOSTEROIDS — PREDNISONE 30-60 mg/day initially, taper to 5-10 mg/day maintenance OR BUDESONIDE 9 mg/day (better side effect profile, no cirrhosis); achieve biochemical remission first per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AZATHIOPRINE 1-2 mg/kg/day PO — steroid-sparing; standard combination therapy; TPMT testing before to assess metabolic risk; CBC + LFTs monitoring.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MYCOPHENOLATE MOFETIL — alternative for azathioprine-intolerant; pregnancy contraindicated.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("BIOLOGICS — anti-TNF (infliximab — risk of hepatotoxicity controversial), rituximab, others — for refractory.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER TRANSPLANT — for end-stage cirrhosis OR refractory AIH OR fulminant hepatitis; AIH recurs in transplanted liver in 20%.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HCC SURVEILLANCE — abdominal ultrasound + AFP every 6 months if cirrhotic.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("BONE HEALTH — chronic steroid → osteoporosis; calcium + vitamin D + bisphosphonate.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CONTRACEPTION + PREGNANCY counseling — many treatments teratogenic; women of reproductive age.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Vaccinations — HAV + HBV + influenza + pneumococcal; live vaccines avoid on immunosuppression.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AVOID HEPATOTOXIC drugs + alcohol.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("CIRRHOSIS + HCC — surveillance ultrasound + AFP every 6 months; varices screening.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("STEROID SIDE EFFECTS — bone loss, diabetes, weight gain, mood, infection susceptibility; minimize maintenance dose; budesonide alternative.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AZATHIOPRINE TOXICITY — bone marrow suppression, hepatotoxicity, pancreatitis, lymphoma risk; CBC + LFTs monitoring.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RELAPSE — common after treatment discontinuation; up to 80% within 1 year; consider lifelong maintenance therapy per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("OVERLAP SYNDROMES — AIH + PBC (5-15%), AIH + PSC (rare); difficult to diagnose + treat.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DRUG-INDUCED AIH-LIKE — nitrofurantoin, minocycline, statins, methyldopa; consider drug history.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VACCINATIONS — before / between immunosuppression cycles; live vaccines avoided on chronic immunosuppression.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PBCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "primary-biliary-cholangitis",
        title: "Primary biliary cholangitis (PBC)",
        subtitle: "Autoimmune destruction of intrahepatic bile ducts · ANTI-MITOCHONDRIAL ANTIBODY · pruritus + fatigue · UDCA + obeticholic acid · female 9:1",
        nclexTags: hepatTagR26,
        definition: AttributedProse(
            "Chronic autoimmune cholestatic liver disease — progressive destruction of intrahepatic bile ducts. Female predominance (9:1); typical age 40-60. Anti-mitochondrial antibody (AMA) pathognomonic. Untreated progresses to cirrhosis + liver failure over decades; UDCA + obeticholic acid slow progression per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "Autoimmune destruction of intrahepatic small bile ducts → cholestasis → bile acid accumulation → hepatocellular damage → progressive fibrosis + cirrhosis. AMA targets E2 component of pyruvate dehydrogenase complex on inner mitochondrial membrane. Multifactorial genetic + environmental.",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("PRURITUS — most common + earliest; often severe, worse at night; cholestatic.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("FATIGUE — significant, impacts quality of life; not always correlated with disease severity.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("ABNORMAL LFTs — often detected on routine; cholestatic pattern (high alk phos, GGT); transaminases mildly elevated.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("JAUNDICE — late finding; predicts poor prognosis.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Associated — Sjögren syndrome (~70%), thyroid disease, scleroderma, Raynaud, CREST.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("OSTEOPOROSIS + osteomalacia — cholestasis impairs vitamin D + Ca absorption.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("HYPERCHOLESTEROLEMIA — common; xanthomata + xanthelasma.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Risk factors — female, age 40-60, family history of autoimmune disease.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ANTI-MITOCHONDRIAL ANTIBODY (AMA) — positive in 90-95%; M2 subtype pathognomonic per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ELEVATED ALKALINE PHOSPHATASE — characteristic cholestatic pattern; usually >1.5× ULN.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ELEVATED IgM — pattern; AIH has elevated IgG.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER BIOPSY — for AMA-negative cases OR atypical features OR staging; non-suppurative destructive cholangitis + bile duct loss + granulomas (Ludwig staging I-IV).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Imaging — ultrasound rules out extrahepatic obstruction; MRCP if PSC suspected.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Differential — primary sclerosing cholangitis (MRCP shows bead-like stricture), drug-induced cholestasis, AIH overlap, obstructive cholestasis.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Disease stage (Ludwig I-IV based on biopsy; non-invasive scoring with FIB-4, APRI, transient elastography).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Pruritus + fatigue impact + symptom management.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Bone density + vitamin D.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Associated autoimmune diseases — Sjögren, thyroid, scleroderma.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HCC surveillance if cirrhotic.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("URSODEOXYCHOLIC ACID (UDCA) 13-15 mg/kg/day — first-line; reduces cholestasis + slows disease progression + improves survival per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("OBETICHOLIC ACID (Ocaliva) — second-line; for UDCA inadequate responders or intolerant; FXR agonist; titrate 5-10 mg/day; pruritus worsening side effect; HEPATIC IMPAIRMENT contraindicated per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PRURITUS MANAGEMENT — cholestyramine 4 g PO BID-QID first-line; rifampin 150-300 mg PO BID second-line; naltrexone 25-50 mg PO daily third-line; emerging IBAT inhibitors (linerixibat); UVA therapy for refractory.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VITAMIN D + CALCIUM supplementation + DEXA — osteoporosis common; bisphosphonate for documented osteoporosis.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HYPERCHOLESTEROLEMIA — usually mild + low CV risk; statin generally safe + indicated for high-risk individuals.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HCC SURVEILLANCE — abdominal ultrasound + AFP every 6 months if cirrhotic.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER TRANSPLANT — for end-stage cirrhosis OR intractable pruritus; MELD score basis; recurrence in transplant ~20-30%.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VACCINATIONS — HAV + HBV + influenza + pneumococcal.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Multidisciplinary — hepatology + rheumatology (Sjögren) + endocrinology (thyroid + bone).", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("CIRRHOSIS + HCC — surveillance.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("OSTEOPOROSIS — common; aggressive prevention + treatment.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("INTRACTABLE PRURITUS — major QOL issue; aggressive multimodal approach; transplant for refractory.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("FAT-SOLUBLE VITAMIN deficiencies (A, D, E, K) — cholestasis impairs absorption; supplement.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DECOMPENSATION — ascites, varices, encephalopathy as cirrhosis progresses.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AMA-NEGATIVE PBC — 5-10%; same disease, antibody-negative; biopsy diagnosis.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AIH OVERLAP — 5-15%; presents with hepatitic features + responds to immunosuppression in addition to UDCA.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PSCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "primary-sclerosing-cholangitis",
        title: "Primary sclerosing cholangitis (PSC)",
        subtitle: "Inflammation + fibrosis intra- + extrahepatic bile ducts · IBD association (UC > Crohn) · MRCP bead-like strictures · CHOLANGIOCARCINOMA risk · transplant",
        nclexTags: hepatTagR26,
        definition: AttributedProse(
            "Chronic progressive cholestatic liver disease — inflammation + fibrosis of intra- + extrahepatic bile ducts → multifocal strictures (\"beaded\" appearance) → cholestasis + cirrhosis + cholangiocarcinoma. Strong association with INFLAMMATORY BOWEL DISEASE (especially ulcerative colitis — ~70% of PSC patients have IBD). Male predominance (2:1); typical age 30-50. NO PROVEN MEDICAL THERAPY slows progression; liver transplant only curative per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — genetic predisposition (HLA-B8, HLA-DR3) + environmental + dysbiosis (gut-liver axis); ulcerative colitis association. Lymphocytic infiltration + concentric periductal fibrosis (\"onion-skin\" pattern) → stricture + dilatation alternating along bile ducts.",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("ABNORMAL LFTs — usually detected on routine in IBD patients; cholestatic pattern.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("PRURITUS, FATIGUE, RUQ DISCOMFORT — common.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("JAUNDICE + cholangitis episodes — bacterial superinfection of obstructed bile ducts; fever, RUQ pain, jaundice (Charcot triad); ERCP + abx.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("CHOLANGIOCARCINOMA — 10-15% lifetime risk; aggressive; difficult to diagnose; CA 19-9 increase + new dominant stricture suspicious.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("IBD — usually colon-predominant ulcerative colitis; quiescent ulcerative colitis can occur with progressive PSC.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("CIRRHOSIS — late finding; decompensation features.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Risk factors — male, IBD (especially UC), Northern European descent, HLA association.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MRCP (Magnetic resonance cholangiopancreatography) — gold standard imaging; multifocal strictures + dilatations + \"beading\" of intrahepatic + extrahepatic bile ducts per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ERCP — diagnostic + therapeutic; reserve for intervention (stricture dilation, stenting) due to procedure risks.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER BIOPSY — supportive (onion-skin fibrosis around bile ducts); not necessary if classic MRCP + clinical features; ESSENTIAL for SMALL-DUCT PSC (normal MRCP, IBD + cholestatic LFTs).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LFTs — cholestatic (high alk phos, GGT); transaminases mildly elevated; bilirubin elevated late.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("AUTOANTIBODIES — pANCA positive in 60-80%; ANA + SMA variable; not diagnostic.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CA 19-9 — baseline + monitor; rise suggests cholangiocarcinoma; non-specific.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Colonoscopy + biopsies — UC association; consider in all PSC.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Disease stage + progression.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("IBD evaluation + colorectal cancer surveillance (PSC + UC = even higher CRC risk).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Cholangiocarcinoma surveillance — MRI/MRCP + CA 19-9 annually.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Bone density + fat-soluble vitamins.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("NO PROVEN MEDICAL THERAPY slows PSC progression — UDCA NOT effective in PSC (vs PBC); some clinicians still use 13-23 mg/kg/day per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PRURITUS — cholestyramine, rifampin, naltrexone, IBAT inhibitors (linerixibat — emerging).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("STRICTURE DILATATION + stenting via ERCP — for symptomatic dominant strictures (jaundice, cholangitis).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CHOLANGITIS treatment — broad-spectrum antibiotics (ciprofloxacin / piperacillin-tazobactam) + ERCP with biliary drainage; admit; high mortality untreated.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIVER TRANSPLANT — only curative therapy; for end-stage cirrhosis, intractable pruritus, recurrent cholangitis, hilar cholangiocarcinoma (limited criteria); PSC recurs in graft 10-20% per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("IBD management — concurrent + complicates; remission with mesalamine, azathioprine, biologics; colectomy may improve PSC course (controversial).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("COLORECTAL CANCER SURVEILLANCE — annual colonoscopy + biopsies in PSC+UC patients; higher risk than UC alone.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CHOLANGIOCARCINOMA SURVEILLANCE — annual MRI/MRCP + CA 19-9 in adults; ERCP + biopsy for suspicious lesions.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VITAMIN D + calcium + DEXA; bisphosphonate.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("VACCINATIONS — HAV + HBV + pneumococcal + influenza.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("CHOLANGIOCARCINOMA — 10-15% lifetime; surveillance MRI/MRCP + CA 19-9 annually; high mortality; difficult to diagnose; emerging cell-free DNA + brush cytology tests.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("COLORECTAL CANCER — PSC + UC combined risk significantly higher than UC alone; annual colonoscopy with biopsies; consider total proctocolectomy.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ASCENDING CHOLANGITIS — recurrent episodes; deteriorating disease course; consider transplant if frequent.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("DOMINANT STRICTURES — develop over time; dilatation / stenting via ERCP for symptomatic.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("GALLBLADDER POLYPS — high cancer risk in PSC; cholecystectomy for ANY gallbladder polyp.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HEPATOCELLULAR CARCINOMA — less common than cholangiocarcinoma; surveillance ultrasound + AFP every 6 months if cirrhotic.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("OSTEOPOROSIS — bone health monitoring.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MEDIAN TRANSPLANT-FREE SURVIVAL ~10-15 years from diagnosis without transplant.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CryoglobulinemicVasculitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cryoglobulinemic-vasculitis",
        title: "Cryoglobulinemic vasculitis",
        subtitle: "Cryoglobulins precipitate in cold · purpura + arthralgia + neuropathy + glomerulonephritis · HCV most common cause · DAA antivirals first",
        nclexTags: hemTagR26,
        definition: AttributedProse(
            "Systemic vasculitis caused by IMMUNE COMPLEX deposition involving CRYOGLOBULINS — immunoglobulins that precipitate at cold temperatures + dissolve when warmed. Types I (monoclonal — Waldenström / multiple myeloma); II (mixed monoclonal IgM + polyclonal IgG — most often HCV); III (mixed polyclonal — HCV, autoimmune, infections). HCV historically caused ~80% of mixed cryoglobulinemic vasculitis; direct-acting antivirals (DAA) have transformed treatment per primary source.",
            citationIDs: ["specialty_dx_round26", "openrn_dx_round26"]
        ),
        pathophysiology: AttributedProse(
            "Cryoglobulins (cold-precipitating immunoglobulins) deposit in small-medium vessels → activate complement → immune complex vasculitis → tissue ischemia + organ damage. Mixed cryoglobulinemia typically immune-complex from chronic antigenic stimulation (HCV, autoimmune disease, B-cell malignancy).",
            citationIDs: ["specialty_dx_round26"]
        ),
        presentation: [
            AttributedBullet("MEILTZER TRIAD — palpable purpura (lower extremities, COLD-precipitated) + arthralgia + weakness.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("CUTANEOUS — palpable purpura (most common), Raynaud, cold-induced ulcerations, livedo reticularis.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("PERIPHERAL NEUROPATHY — distal symmetric sensorimotor; sometimes mononeuritis multiplex.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("GLOMERULONEPHRITIS — membranoproliferative; hematuria, proteinuria, AKI; can progress to ESRD.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("ARTHRALGIA + arthritis (non-erosive) — knees + hands.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Hepatic — HCV-related; chronic hepatitis + cirrhosis.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("CNS — uncommon; encephalopathy, focal deficits.", citationIDs: ["openrn_dx_round26"]),
            AttributedBullet("Risk factors — HCV most common; HIV, HBV, lupus, Sjögren, lymphoproliferative disorders.", citationIDs: ["specialty_dx_round26"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CRYOGLOBULIN TESTING — serum cryoglobulins; sample COLLECTED + transported WARM (37°C); confirms diagnosis per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("COMPLEMENT — LOW C4 (consumption); C3 variable.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RHEUMATOID FACTOR — typically POSITIVE (IgM with anti-IgG activity).", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("HCV testing — antibody + viral load; PCR-quantitative; if positive guide HCV treatment.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("BIOPSY — skin biopsy of purpura (leukocytoclastic vasculitis), nerve, kidney; demonstrates immune complex deposition.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Workup secondary cause — HCV, HBV, HIV, ANA, ENA, anti-dsDNA, SS-A/B, immunoglobulins, M-spike (multiple myeloma, Waldenström), lymphoma.", citationIDs: ["specialty_dx_round26"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify underlying cause — HCV most common; treat root cause.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Organ involvement severity — renal, neurologic, cutaneous.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Cold exposure precautions + lifestyle.", citationIDs: ["specialty_dx_round26"])
        ],
        commonInterventions: [
            AttributedBullet("HCV TREATMENT WITH DIRECT-ACTING ANTIVIRALS (DAAs) — sofosbuvir + velpatasvir OR glecaprevir + pibrentasvir × 8-12 weeks; cures HCV + induces cryoglobulinemic vasculitis remission in most patients per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("RITUXIMAB — for severe or refractory cryoglobulinemic vasculitis; B-cell depletion → reduces cryoglobulin production; 375 mg/m² weekly × 4 doses.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CORTICOSTEROIDS — for acute organ-threatening disease; methylprednisolone pulses for severe.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("CYCLOPHOSPHAMIDE — for refractory severe organ-threatening disease.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PLASMAPHERESIS — emergent severe organ-threatening (rapidly progressive GN, CNS, severe neuropathy); removes circulating cryoglobulins; adjunctive.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("COLD AVOIDANCE — counsel; warm clothing + housing; avoid swimming in cold water.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ANTI-HCV treatment cures in 95-99% with DAAs; cryoglobulinemic vasculitis remits in most.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Type I cryoglobulinemia (monoclonal — myeloma / Waldenström) — treat underlying lymphoproliferative disease.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("Multidisciplinary — rheumatology + nephrology + hepatology + neurology + dermatology.", citationIDs: ["specialty_dx_round26"])
        ],
        watchFor: [
            AttributedBullet("HCV CURE → CRYOGLOBULINEMIC VASCULITIS REMISSION — transformed treatment; most patients respond per primary source.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("ESRD from progressive glomerulonephritis — early HCV treatment + aggressive immunosuppression prevents.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LYMPHOMA — long-term risk in HCV-associated mixed cryoglobulinemia (B-cell stimulation); marginal zone lymphoma, NHL.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("LIFE-THREATENING — alveolar hemorrhage, severe GI vasculitis, mononeuritis multiplex; emergent immunosuppression.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("COLD EXPOSURE precautions — counsel; affects daily life; warm housing + clothing.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("MONOCLONAL GAMMOPATHY workup — Type I + selected Type II patients; rule out underlying B-cell malignancy.", citationIDs: ["specialty_dx_round26"]),
            AttributedBullet("PSYCHIATRIC — fatigue + cold sensitivity + chronic illness; mental health support.", citationIDs: ["specialty_dx_round26"])
        ],
        citations: [openrnDxR26, cdcDxR26, specialtyDxR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}
