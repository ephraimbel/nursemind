import Foundation

// Curator-model procedures + reference (round 27 — rheumatology procedures + biologic safety + vasculitis + DMARDs).

private let openrnPRR27 = CitationSource(
    id: "openrn_pr_round27",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcPRR27 = CitationSource(
    id: "cdc_pr_round27",
    shortName: "CDC + ACR + EULAR + IDSA guidance",
    publisher: "CDC · ACR · EULAR · IDSA",
    license: .publicDomain,
    url: "https://www.cdc.gov/vaccines/hcp/imz-pocketguide/index.html",
    lastRetrieved: "2026-05-13"
)
private let specialtyPRR27 = CitationSource(
    id: "specialty_pr_round27",
    shortName: "ACR + EULAR + AAOS + Vasculitis Foundation concept citations",
    publisher: "ACR · EULAR · AAOS · Vasculitis Foundation",
    license: .factCitationOnly,
    url: "https://www.rheumatology.org/Practice-Quality/Clinical-Support/Clinical-Practice-Guidelines",
    lastRetrieved: "2026-05-13"
)

private let procTagsR27 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR27 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum TemporalArteryBiopsySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "temporal-artery-biopsy",
        title: "Temporal artery biopsy (TAB)",
        subtitle: "Diagnostic for giant cell arteritis · skip lesions = 1.5-2 cm specimen + bilateral · DO NOT delay steroids waiting for biopsy · false-neg in some",
        nclexTags: procTagsR27,
        indications: AttributedProse(
            "Definitive diagnostic procedure for giant cell arteritis (GCA / temporal arteritis) — characterized by inflammation of medium-large arteries especially extracranial branches of carotid artery. Indicated for clinical suspicion of GCA + need for histopathologic confirmation per primary source.",
            citationIDs: ["specialty_pr_round27"]
        ),
        contraindications: AttributedProse(
            "No absolute contraindications. Caution — coagulopathy / anticoagulation (manage perioperatively), severe systemic illness, local infection at biopsy site.",
            citationIDs: ["specialty_pr_round27"]
        ),
        equipment: [
            AttributedBullet("Local anesthetic — lidocaine 1-2% with epinephrine for hemostasis.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Surgical scalpel, forceps, hemostats, suture material (4-0 or 5-0 nylon for skin).", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Specimen container with formalin; pathology requisition specifying suspected diagnosis + clinical features.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Vascular surgery / interventional radiology / dermatologic surgery / ophthalmology can perform; OR procedure.", citationIDs: ["openrn_pr_round27"])
        ],
        preProcedure: [
            AttributedBullet("DO NOT DELAY high-dose corticosteroids waiting for biopsy — start immediately for suspected GCA (vision loss can occur within hours-days); biopsy specimens remain histologically diagnostic up to 7-14 days after steroid initiation per primary source.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Verify orders + consent; assess coagulation status.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Pre-biopsy ULTRASOUND — emerging adjunct; \"halo sign\" supportive of GCA; non-invasive screening.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Identify temporal artery by palpation; mark site with patient sitting up.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Position — supine; head turned to expose temporal area.", citationIDs: ["openrn_pr_round27"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Site identification + marking", body: "Palpate temporal artery superior + posterior to ear; mark course of artery with skin marker; identify tortuous segment + tender areas.", citationIDs: ["openrn_pr_round27"]),
            ProcedureStep(number: 2, title: "Sterile prep + local anesthesia", body: "Chlorhexidine prep; sterile drape; lidocaine 1-2% with epinephrine — superficial wheal + deeper infiltration around artery; observe vasoconstriction.", citationIDs: ["openrn_pr_round27"]),
            ProcedureStep(number: 3, title: "Skin incision", body: "Linear incision over course of artery; 3-4 cm length; through skin + subcutaneous tissue.", citationIDs: ["openrn_pr_round27"]),
            ProcedureStep(number: 4, title: "Artery dissection", body: "Identify temporal artery; dissect free from surrounding tissue; ligate proximal + distal segments with sutures; cauterize collateral branches.", citationIDs: ["specialty_pr_round27"]),
            ProcedureStep(number: 5, title: "Specimen excision", body: "Excise segment between ligatures; SPECIMEN SHOULD BE 1.5-2 CM (avoids skip lesion false-negatives); place in formalin for fixation; serial sections per primary source.", citationIDs: ["specialty_pr_round27"]),
            ProcedureStep(number: 6, title: "Hemostasis + closure", body: "Achieve hemostasis with electrocautery + sutures; close skin with 4-0 / 5-0 nylon sutures or staples; sterile dressing.", citationIDs: ["openrn_pr_round27"]),
            ProcedureStep(number: 7, title: "Consider bilateral", body: "If unilateral biopsy negative + high clinical suspicion → bilateral biopsy improves sensitivity (skip lesions); some centers do bilateral routinely.", citationIDs: ["specialty_pr_round27"])
        ],
        postProcedure: [
            AttributedBullet("Pressure dressing × 24 hours.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Avoid manipulation + heavy activity for 1-2 weeks.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Sutures removed 7-10 days.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Document time + size of specimen + pathology to lab.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Counsel patient on minor scar; explain results in 7-14 days; continue steroids while awaiting per primary source.", citationIDs: ["specialty_pr_round27"])
        ],
        documentation: [
            AttributedBullet("Indication, specimen size, complications, hemostasis, sutures, pathology submitted.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Pre + post procedure clinical assessment.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Plan for results + ongoing management.", citationIDs: ["specialty_pr_round27"])
        ],
        watchFor: [
            AttributedBullet("FALSE NEGATIVE — \"skip lesions\" common in GCA; 1.5-2 cm minimum specimen; consider bilateral if first negative + high clinical suspicion per primary source.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("STEROIDS NOT delaying biopsy — start immediately; histology remains diagnostic for ~7-14 days; visual loss prevention paramount.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("BLEEDING — local; pressure + electrocautery.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("WOUND INFECTION — uncommon; cleanse + antibiotics if signs.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("FACIAL NERVE INJURY — frontal branch of facial nerve runs near; deep dissection can cause temporary or rare permanent palsy.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("ALTERNATIVE DIAGNOSIS — vasculitis on biopsy may suggest different entity (e.g., ANCA-associated, PAN).", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("ULTRASOUND — non-invasive alternative; \"halo sign\" supportive but biopsy remains gold standard.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("LARGE-VESSEL GCA — may involve aorta + branches; imaging (CT angiography, PET-CT) for systemic involvement.", citationIDs: ["specialty_pr_round27"])
        ],
        citations: [openrnPRR27, cdcPRR27, specialtyPRR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum JointInjectionAspirationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "joint-injection-aspiration",
        title: "Joint aspiration + injection (arthrocentesis)",
        subtitle: "Diagnostic + therapeutic · synovial fluid analysis for crystal / infection · steroid for OA + RA flares · NEVER inject infected joint",
        nclexTags: procTagsR27,
        indications: AttributedProse(
            "Diagnostic — synovial fluid analysis for suspected septic arthritis, crystal arthritis (gout vs pseudogout), hemarthrosis. Therapeutic — corticosteroid injection for OA, RA, bursitis, tendinitis; viscosupplementation (hyaluronic acid) for OA per primary source.",
            citationIDs: ["specialty_pr_round27"]
        ),
        contraindications: AttributedProse(
            "ABSOLUTE — septic arthritis (NEVER inject corticosteroid into infected joint); cellulitis at injection site; severe coagulopathy uncorrected. Relative — diabetes (transient glucose elevation), prosthetic joint (consultation with orthopedics), known hypersensitivity.",
            citationIDs: ["specialty_pr_round27"]
        ),
        equipment: [
            AttributedBullet("Sterile gloves, drape, chlorhexidine prep, lidocaine 1-2% local.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Needle 18-22 g (varies by joint size); syringe 10-30 mL.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Specimen tubes — sterile container, EDTA for cell count + crystals.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Corticosteroid (if injecting) — triamcinolone, methylprednisolone, dexamethasone; some institutions add lidocaine.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Ultrasound guidance for difficult joints (hip, ankle, deep joints).", citationIDs: ["specialty_pr_round27"])
        ],
        preProcedure: [
            AttributedBullet("Verify indication + ABSENCE of infection (don't inject steroid into infected joint).", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Anticoagulation status — coagulopathy concern; usually doesn't preclude joint aspiration.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Consent + risks (bleeding, infection rare, skin atrophy at injection site, hyperglycemia in diabetes).", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Mark injection site; identify joint landmarks; consider ultrasound guidance for difficult.", citationIDs: ["specialty_pr_round27"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Site identification", body: "Identify joint landmarks; mark site of needle insertion; common approach — knee lateral or medial, shoulder lateral subacromial, hip greater trochanter.", citationIDs: ["specialty_pr_round27"]),
            ProcedureStep(number: 2, title: "Sterile prep + anesthesia", body: "Chlorhexidine; sterile drape; local lidocaine wheal + deeper infiltration along anticipated needle path; avoid joint capsule infiltration (lidocaine masks aspirate analysis).", citationIDs: ["openrn_pr_round27"]),
            ProcedureStep(number: 3, title: "Needle insertion", body: "Insert needle into joint space; advance until decreased resistance + return of fluid; ultrasound guidance helpful for difficult joints.", citationIDs: ["specialty_pr_round27"]),
            ProcedureStep(number: 4, title: "Aspiration", body: "Aspirate synovial fluid; assess gross appearance (clear, cloudy, hemorrhagic, purulent); send for — cell count + differential, gram stain + culture, crystals (polarized microscopy), glucose (if septic suspected), total protein.", citationIDs: ["specialty_pr_round27"]),
            ProcedureStep(number: 5, title: "Injection (if therapeutic)", body: "After aspiration, inject corticosteroid (triamcinolone 20-40 mg into knee; smaller joints less); confirm with no immediate pain / pressure; remove needle.", citationIDs: ["specialty_pr_round27"]),
            ProcedureStep(number: 6, title: "Hemostasis", body: "Pressure × 30 seconds; sterile bandage; usually no significant bleeding.", citationIDs: ["openrn_pr_round27"]),
            ProcedureStep(number: 7, title: "Post-procedure", body: "Patient ambulate gently; avoid heavy use × 24-48 hours; ice for comfort; oral analgesic as needed.", citationIDs: ["openrn_pr_round27"])
        ],
        postProcedure: [
            AttributedBullet("Document indication, joint, gross fluid appearance + volume, specimens sent, injection medication + amount, complications.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Counsel — gentle activity × 24-48 hours; ice + acetaminophen / NSAIDs PRN; return for fever, severe pain, redness.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Steroid post-injection FLARE — possible; mild self-limited pain in 24-48 hours; ice + acetaminophen.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Diabetic patients — counsel transient glucose elevation; monitor more closely × 24-72 hours.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Schedule follow-up based on indication + response.", citationIDs: ["specialty_pr_round27"])
        ],
        documentation: [
            AttributedBullet("Indication, joint, fluid characteristics + volume, specimens, injection details, complications, response.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Synovial fluid analysis — appearance, WBC + differential, glucose, crystals, gram + culture results.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Plan for follow-up + ongoing management.", citationIDs: ["specialty_pr_round27"])
        ],
        watchFor: [
            AttributedBullet("SEPTIC ARTHRITIS — NEVER inject steroid into infected joint; signs — high fever, severe pain, swelling, warmth, purulent fluid (WBC >50K with >75% neutrophils); urgent IV antibiotics + surgical drainage.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("CRYSTAL ARTHRITIS — GOUT (negatively birefringent monosodium urate needles) + PSEUDOGOUT (positively birefringent rhomboid calcium pyrophosphate crystals); polarized microscopy.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("HEMARTHROSIS — trauma + bleeding diatheses (hemophilia, anticoagulation); evaluate cause.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("DIABETIC patients — transient glucose elevation up to 5-7 days; counsel + monitor.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("INFECTION RISK from injection — extremely low (~1 per 10,000); chlorhexidine prep + sterile technique.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("SKIN ATROPHY OR DEPIGMENTATION at injection site — local steroid effect; cosmetic.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("RECURRENT injections — limited to ~3-4 per joint per year due to cartilage damage concern.", citationIDs: ["specialty_pr_round27"])
        ],
        citations: [openrnPRR27, cdcPRR27, specialtyPRR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NerveBiopsySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "nerve-biopsy",
        title: "Sural nerve biopsy",
        subtitle: "Diagnostic for vasculitic + autoimmune + amyloid neuropathy · permanent sensory loss in distribution · histopath + EM · refractory neuropathy workup",
        nclexTags: procTagsR27,
        indications: AttributedProse(
            "Workup of peripheral neuropathy when etiology unclear despite extensive workup — vasculitic neuropathy (PAN, EGPA, GPA), amyloid neuropathy, sarcoid, infiltrative + paraneoplastic, hereditary neuropathies, CIDP variants per primary source.",
            citationIDs: ["specialty_pr_round27"]
        ),
        contraindications: AttributedProse(
            "Severe coagulopathy uncorrected. Caution — significant comorbidities, prior nerve injury at site, lymphedema.",
            citationIDs: ["specialty_pr_round27"]
        ),
        equipment: [
            AttributedBullet("Sterile surgical setup; OR procedure typically.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Surgical scalpel, fine forceps, suture material.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Specimen containers — formalin for routine, glutaraldehyde for electron microscopy, frozen section in some cases.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Neurology / neurosurgery / vascular surgery to perform.", citationIDs: ["openrn_pr_round27"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders + indication; specialty consultation.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("PRE-PROCEDURE neurologic exam — document baseline sensation in sural nerve distribution (lateral foot + 5th toe).", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Coagulation + bleeding history.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Counsel patient about PERMANENT SENSORY LOSS in sural nerve distribution (lateral foot + 5th toe area) — expected outcome per primary source.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Position — supine OR prone; expose lateral ankle / posterior calf.", citationIDs: ["openrn_pr_round27"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Site identification", body: "Sural nerve located posterior to lateral malleolus + posterior calf; some prefer below lateral malleolus, others mid-calf; mark course.", citationIDs: ["specialty_pr_round27"]),
            ProcedureStep(number: 2, title: "Sterile prep + anesthesia", body: "Chlorhexidine; sterile drape; lidocaine 1-2% local + ankle / regional block as needed.", citationIDs: ["openrn_pr_round27"]),
            ProcedureStep(number: 3, title: "Incision + dissection", body: "Vertical incision 4-5 cm over nerve course; careful dissection to isolate sural nerve; identify by characteristic appearance + course.", citationIDs: ["specialty_pr_round27"]),
            ProcedureStep(number: 4, title: "Specimen excision", body: "3-5 cm segment of nerve; ligate vessels for vasculitis assessment; specimen length critical for histopathologic + electron microscopic evaluation per primary source.", citationIDs: ["specialty_pr_round27"]),
            ProcedureStep(number: 5, title: "Hemostasis + closure", body: "Achieve hemostasis; layered closure of subcutaneous + skin; sterile dressing.", citationIDs: ["openrn_pr_round27"]),
            ProcedureStep(number: 6, title: "Specimen handling", body: "Multiple sections — formalin for routine H&E + special stains; glutaraldehyde for electron microscopy; frozen section in some cases; pathology requisition specifying clinical suspicion.", citationIDs: ["specialty_pr_round27"])
        ],
        postProcedure: [
            AttributedBullet("Dressing change at 24-48 hours; keep dry initially.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Sutures removed at 10-14 days.", citationIDs: ["openrn_pr_round27"]),
            AttributedBullet("Activity restriction × 1-2 weeks — no heavy lifting, contact sports; gentle ambulation OK.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Counsel — expected sensory loss in sural nerve distribution (lateral foot + 5th toe area); usually permanent + tolerable.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Document pre + post procedure neurologic findings; pathology results in 7-14 days.", citationIDs: ["openrn_pr_round27"])
        ],
        documentation: [
            AttributedBullet("Pre + post neurologic exam, specimen length + handling, complications, pathology submitted.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Clinical question for pathology — specific vasculitis, amyloid, infiltrative considered.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("Counseling + follow-up plan.", citationIDs: ["specialty_pr_round27"])
        ],
        watchFor: [
            AttributedBullet("PERMANENT SENSORY LOSS in sural nerve distribution (lateral foot + 5th toe area) — EXPECTED + acceptable cost for definitive diagnosis per primary source.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("WOUND COMPLICATIONS — infection, dehiscence, hematoma; uncommon.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("PROLONGED PAIN at biopsy site — chronic dysesthesia possible; usually self-limited; pain management.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("DEEP VEIN THROMBOSIS — uncommon; counsel signs.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("INADEQUATE specimen — too small (<3 cm) limits diagnostic yield; experienced surgeon + adequate specimen length essential.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("MULTIPLE biopsies sometimes needed — alternative site if first non-diagnostic + high clinical suspicion.", citationIDs: ["specialty_pr_round27"]),
            AttributedBullet("DIAGNOSIS shifts management — vasculitic vs amyloid vs sarcoid vs paraneoplastic; targeted treatment.", citationIDs: ["specialty_pr_round27"])
        ],
        citations: [openrnPRR27, cdcPRR27, specialtyPRR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum VasculitisClassificationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "vasculitis-classification",
        title: "Vasculitis classification (Chapel Hill 2012 consensus)",
        subtitle: "Vessel size + ANCA + clinical phenotype · large / medium / small / variable / single-organ · pediatric / non-pediatric · informs treatment + prognosis",
        eyebrow: "REFERENCE · RHEUMATOLOGY",
        nclexTags: refTagsR27,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Chapel Hill Consensus Conference (CHCC) 2012 classification — categorizes vasculitides by predominant vessel size + ANCA status + clinical features + organ involvement + immunologic mechanism. Guides diagnosis, treatment, prognosis. Some patients overlap multiple categories per primary source.",
                citationIDs: ["specialty_pr_round27"]
            )),
            .keyValueTable(title: "Large-vessel vasculitis (aorta + major branches)", [
                KeyValueRow(key: "Giant cell arteritis (GCA)", value: "≥50 years; temporal arteries; HA, jaw claudication, vision loss; ESR + CRP markedly elevated; temporal artery biopsy; emergent steroids ± tocilizumab"),
                KeyValueRow(key: "Takayasu arteritis (TAK)", value: "<40 years; aorta + branches; pulseless disease, claudication, renovascular HTN; imaging MRA / CTA; steroids ± biologics"),
                KeyValueRow(key: "Polymyalgia rheumatica (PMR)", value: "Often associated with GCA; bilateral shoulder + hip girdle pain + morning stiffness; ESR elevated; low-dose prednisone responsive")
            ]),
            .keyValueTable(title: "Medium-vessel vasculitis", [
                KeyValueRow(key: "Polyarteritis nodosa (PAN)", value: "Medium arteries; NOT ANCA-associated; HBV-associated form; multi-organ except pulmonary; kidney + GI + neuropathy + cutaneous; angiography microaneurysms; steroids + cyclophosphamide + antivirals"),
                KeyValueRow(key: "Kawasaki disease", value: "<5 years pediatric; CRASH+BURN criteria; coronary aneurysms major risk; IVIG + aspirin")
            ]),
            .keyValueTable(title: "Small-vessel — ANCA-associated", [
                KeyValueRow(key: "Granulomatosis with polyangiitis (GPA / Wegener's)", value: "PR3-ANCA / c-ANCA; upper resp + lung + kidney (RPGN); rituximab or cyclophosphamide + steroids"),
                KeyValueRow(key: "Microscopic polyangiitis (MPA)", value: "MPO-ANCA / p-ANCA; pulmonary-renal (RPGN + alveolar hemorrhage); rituximab or cyclophosphamide + steroids"),
                KeyValueRow(key: "Eosinophilic granulomatosis with polyangiitis (EGPA / Churg-Strauss)", value: "MPO-ANCA + (40%); asthma + eosinophilia + vasculitis; mepolizumab FDA-approved; cardiac mortality risk")
            ]),
            .keyValueTable(title: "Small-vessel — immune complex", [
                KeyValueRow(key: "IgA vasculitis (Henoch-Schönlein purpura)", value: "Pediatric most often; purpura + abdominal pain + arthralgia + GN; usually self-limited"),
                KeyValueRow(key: "Cryoglobulinemic vasculitis", value: "Cryoglobulins (cold-precipitating Ig); HCV-associated common; purpura + arthralgia + neuropathy + GN; DAAs for HCV; rituximab for refractory"),
                KeyValueRow(key: "Anti-GBM disease (Goodpasture)", value: "Anti-glomerular basement membrane antibodies; pulmonary-renal; plasma exchange + cyclophosphamide + steroids"),
                KeyValueRow(key: "Hypocomplementemic urticarial vasculitis", value: "Urticaria-like with low complement; arthritis + GN + obstructive lung")
            ]),
            .keyValueTable(title: "Variable-vessel vasculitis", [
                KeyValueRow(key: "Behcet disease", value: "Triple recurrence — oral + genital ulcers + uveitis; Silk Road; HLA-B51; colchicine + immunosuppression + biologics"),
                KeyValueRow(key: "Cogan syndrome", value: "Interstitial keratitis + audiovestibular dysfunction + sometimes large-vessel vasculitis; steroids")
            ]),
            .keyValueTable(title: "Single-organ vasculitis", [
                KeyValueRow(key: "Cutaneous leukocytoclastic vasculitis", value: "Skin-limited small-vessel; drug / infection / autoimmune trigger; biopsy confirms; treat trigger + NSAIDs"),
                KeyValueRow(key: "Isolated CNS vasculitis", value: "Brain biopsy diagnostic; immunosuppression"),
                KeyValueRow(key: "Cutaneous nodular vasculitis", value: "Erythema induratum of Bazin — historically TB-associated; tender nodules on legs")
            ]),
            .keyValueTable(title: "Vasculitis associated with systemic disease", [
                KeyValueRow(key: "Lupus vasculitis", value: "Cutaneous + GI + CNS; treat SLE"),
                KeyValueRow(key: "Rheumatoid vasculitis", value: "Severe RA; small-medium vessel; steroids + rituximab + biologics"),
                KeyValueRow(key: "Sarcoid vasculitis", value: "Granulomatous; pulmonary + cutaneous + CNS"),
                KeyValueRow(key: "Drug-induced vasculitis", value: "Hydralazine, propylthiouracil, allopurinol, minocycline, levamisole-cocaine; withdraw drug")
            ]),
            .bullets(title: "Diagnostic approach", [
                AttributedBullet("CLINICAL pattern + history — vessel size + organ involvement + ANCA-screening + secondary cause screening.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("LABORATORY — ANCA + ELISA, complement, cryoglobulins, anti-GBM, immunoglobulins, ESR/CRP, urinalysis, BUN/Cr, hepatitis serologies.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("BIOPSY — gold standard for many vasculitides; tissue depends on involvement (kidney, lung, nerve, skin, temporal artery).", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("IMAGING — MRA / CTA for large-vessel; PET-CT for GCA + Takayasu; chest CT for ANCA-vasculitis; angiography for PAN.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("BVAS / Five-Factor Score — activity + prognosis stratification.", citationIDs: ["specialty_pr_round27"])
            ]),
            .bullets(title: "Treatment principles", [
                AttributedBullet("INDUCTION — high-dose corticosteroids + immunosuppression (cyclophosphamide / rituximab for ANCA-vasculitis; methotrexate / azathioprine for milder).", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("MAINTENANCE — taper steroids; rituximab / azathioprine / methotrexate / MMF.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Specific therapies — TOCILIZUMAB (GCA), MEPOLIZUMAB (EGPA), AVACOPAN (ANCA-vasculitis).", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Secondary causes — TREAT trigger (HCV antivirals for cryoglobulinemia, HBV antivirals for PAN, drug withdrawal for drug-induced).", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("PCP PROPHYLAXIS — during induction in most vasculitides.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Vaccinations + bone health + CV risk reduction in chronic.", citationIDs: ["specialty_pr_round27"])
            ])
        ],
        citations: [openrnPRR27, cdcPRR27, specialtyPRR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BiologicSafetyMonitoringSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "biologic-safety-monitoring",
        title: "Biologic + DMARD safety monitoring",
        subtitle: "Pre-treatment TB + HBV + HCV + HIV · vaccinations · periodic labs · infection monitoring · vaccinations + perioperative considerations · pregnancy",
        eyebrow: "REFERENCE · RHEUMATOLOGY",
        nclexTags: refTagsR27,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Biologics + targeted synthetic DMARDs + traditional immunosuppressants used in rheumatologic + dermatologic + GI + autoimmune diseases require careful pre-treatment screening + ongoing monitoring. Increase infection + opportunistic disease + reactivation + malignancy + complication risks. ACR / EULAR guidelines per primary source.",
                citationIDs: ["specialty_pr_round27"]
            )),
            .keyValueTable(title: "Pre-treatment screening", [
                KeyValueRow(key: "TUBERCULOSIS (TB)", value: "ALL biologics + JAK inhibitors — TST (PPD) OR IGRA (QuantiFERON-GOLD) before initiation; treat latent TB before / concurrent with isoniazid 9 months OR rifampin 4 months; repeat annually if ongoing high-risk exposure"),
                KeyValueRow(key: "HEPATITIS B", value: "HBsAg + HBcAb + HBsAb; treat or prophylactic antiviral (entecavir, tenofovir) for HBsAg+ OR HBcAb+ on rituximab / chemotherapy / B-cell-depleting; reactivation risk highest with B-cell depletion"),
                KeyValueRow(key: "HEPATITIS C", value: "HCV antibody; viral load if positive; HCV-DAA treatment if active; immunosuppression generally OK after"),
                KeyValueRow(key: "HIV", value: "HIV antibody; ART for HIV+ patients; biologics generally OK on suppressive ART"),
                KeyValueRow(key: "VARICELLA", value: "History or serology; vaccinate non-immune BEFORE biologic; live varicella vaccine"),
                KeyValueRow(key: "Vaccinations", value: "Pneumococcal (PCV15 / PCV20 + PPSV23), influenza annual, Shingrix (recombinant zoster — preferred over live Zostavax for biologics), Tdap, Hep B if at-risk; MMR if needed BEFORE biologic"),
                KeyValueRow(key: "CBC + CMP + LFTs", value: "Baseline; periodic monitoring"),
                KeyValueRow(key: "Pregnancy testing + counseling", value: "Reliable contraception for teratogenic agents (methotrexate, leflunomide, mycophenolate, JAK inhibitors)")
            ]),
            .keyValueTable(title: "Ongoing monitoring", [
                KeyValueRow(key: "CBC + LFTs + Cr", value: "Every 2-4 weeks initially; then q3-6 months for most"),
                KeyValueRow(key: "Methotrexate", value: "CBC + LFTs + Cr every 1-3 months; folic acid 1 mg daily; pulmonary symptoms — methotrexate pneumonitis"),
                KeyValueRow(key: "Leflunomide", value: "Same as methotrexate; cholestyramine washout for pregnancy planning"),
                KeyValueRow(key: "Azathioprine", value: "TPMT genotype before; CBC + LFTs"),
                KeyValueRow(key: "Hydroxychloroquine", value: "Ophthalmologic exam at baseline + annually after 5 years; retinal toxicity dose / duration-dependent"),
                KeyValueRow(key: "JAK inhibitors", value: "Lipid panel at 4-8 weeks; herpes zoster monitoring; CV / VTE risk in age ≥50 / smokers"),
                KeyValueRow(key: "Biologic-specific", value: "Anti-TNF — TB surveillance, hepatitis B reactivation; rituximab — HBV reactivation, PML rare; tocilizumab — lipid panel, LFTs, neutropenia")
            ]),
            .bullets(title: "Infection prevention + management", [
                AttributedBullet("Counsel — fever, productive cough, dysuria, skin lesions, severe headache → emergent eval.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Vaccinations UPDATED — flu, pneumococcal, Shingrix recombinant; live vaccines avoided.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("PCP PROPHYLAXIS — TMP-SMX for high-risk (high-dose steroids + cyclophosphamide / rituximab; HIV).", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("ENDEMIC mycoses (histoplasma, coccidioides, blastomyces) screening if travel / exposure.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("OPPORTUNISTIC PCP, fungal, viral, mycobacterial — vigilance.", citationIDs: ["specialty_pr_round27"])
            ]),
            .bullets(title: "Perioperative considerations", [
                AttributedBullet("HOLD biologics — ~3-7 days before elective surgery; resume after wound healing + no infection.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("METHOTREXATE — generally continue perioperatively (vs old practice of holding).", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("HIGH-DOSE STEROIDS — wean if possible; otherwise stress-dose during surgery; risk-benefit infection vs adrenal insufficiency.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("JAK inhibitors — hold 1 week before elective surgery; resume after wound healing.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Vaccinations — give 2+ weeks BEFORE planned biologic initiation.", citationIDs: ["specialty_pr_round27"])
            ]),
            .bullets(title: "Pregnancy + lactation", [
                AttributedBullet("Methotrexate, leflunomide, mycophenolate, cyclophosphamide — TERATOGENS; contraception × months after stopping.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("HCQ + azathioprine + cyclosporine + tacrolimus + sulfasalazine — relatively safe in pregnancy.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Anti-TNF (certolizumab, etanercept) — relatively safer profile; certolizumab placenta-impermeable.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Rituximab — placental transfer late; consider stop before 3rd trimester if possible.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("JAK inhibitors — Category D; reliable contraception × 4 weeks after.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Pregnancy registries — encourage participation.", citationIDs: ["specialty_pr_round27"])
            ]),
            .bullets(title: "Malignancy risk", [
                AttributedBullet("ANTI-TNFs — increased non-melanoma skin cancer; controversial lymphoma association; surveillance.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Methotrexate + azathioprine — lymphoma risk; counsel + surveillance.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("JAK inhibitors — malignancy boxed warning; especially in age ≥50 + CV risk + smokers.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Skin cancer surveillance — annual exam + sun protection counseling.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Standard cancer screening — pap, mammogram, colonoscopy per age-based guidelines.", citationIDs: ["specialty_pr_round27"])
            ])
        ],
        citations: [openrnPRR27, cdcPRR27, specialtyPRR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DMARDsTradStrategiesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "dmards-traditional-strategies",
        title: "Traditional DMARDs — RA + autoimmune therapy",
        subtitle: "Methotrexate anchor · hydroxychloroquine + sulfasalazine + leflunomide · combination therapy + triple-therapy · pre-biologic mainstays · low-cost",
        eyebrow: "REFERENCE · RHEUMATOLOGY",
        nclexTags: refTagsR27,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Conventional synthetic DMARDs (csDMARDs) — foundation of RA + autoimmune treatment. Methotrexate is anchor drug. Often used first-line + in combination before biologics. Lower cost + decades of experience but more side effects + slower onset vs biologics per primary source.",
                citationIDs: ["specialty_pr_round27"]
            )),
            .keyValueTable(title: "Methotrexate (RA anchor drug)", [
                KeyValueRow(key: "Dose", value: "Start 7.5-15 mg PO weekly; titrate to 15-25 mg weekly; SC alternative for inadequate oral response"),
                KeyValueRow(key: "Folic acid", value: "1 mg PO daily — reduces side effects + bone marrow toxicity; ESSENTIAL"),
                KeyValueRow(key: "Monitoring", value: "CBC + LFTs + Cr at 2-4 weeks initially → q3 months; baseline CXR; alcohol counseling"),
                KeyValueRow(key: "Adverse effects", value: "Nausea + stomatitis + alopecia + hepatotoxicity + cytopenia + interstitial pneumonitis (rare); folic acid mitigates"),
                KeyValueRow(key: "Pregnancy", value: "CATEGORY X — teratogen; reliable contraception × 3-6 months post-last dose; alternative drugs in pregnancy"),
                KeyValueRow(key: "Hold pre-procedure", value: "Generally CONTINUE perioperatively (vs old practice); short-term hold for major surgery"),
                KeyValueRow(key: "Onset", value: "6-12 weeks for full benefit; counsel patience")
            ]),
            .keyValueTable(title: "Hydroxychloroquine (HCQ)", [
                KeyValueRow(key: "Dose", value: "200-400 mg/day; max 5 mg/kg/day (newer recommendation for less retinal toxicity)"),
                KeyValueRow(key: "Use", value: "SLE (anchor), rheumatoid arthritis, antiphospholipid syndrome"),
                KeyValueRow(key: "Monitoring", value: "Ophthalmology baseline + annually after 5 years (retinal toxicity dose / duration-dependent); ECG if QT-prolonging combinations"),
                KeyValueRow(key: "Adverse effects", value: "Retinal toxicity (rare with proper dosing), GI upset, rash, hyperpigmentation"),
                KeyValueRow(key: "Pregnancy", value: "Safe in pregnancy; CONTINUE in pregnant SLE patients"),
                KeyValueRow(key: "Onset", value: "3-6 months for full benefit")
            ]),
            .keyValueTable(title: "Sulfasalazine (SSZ)", [
                KeyValueRow(key: "Dose", value: "Start 500 mg BID; titrate to 1 g BID; max 3 g/day"),
                KeyValueRow(key: "Use", value: "RA, juvenile idiopathic arthritis, psoriatic arthritis, IBD, ankylosing spondylitis"),
                KeyValueRow(key: "Monitoring", value: "CBC + LFTs + Cr at 2-4 weeks initially → q3 months"),
                KeyValueRow(key: "Adverse effects", value: "Nausea, headache, rash, leukopenia, hepatotoxicity, hemolysis (especially G6PD), Stevens-Johnson rare"),
                KeyValueRow(key: "Pregnancy", value: "Safe; consider folic acid supplementation"),
                KeyValueRow(key: "Note", value: "Less effective than methotrexate alone; used in TRIPLE therapy (MTX + HCQ + SSZ) — comparable to biologic + MTX")
            ]),
            .keyValueTable(title: "Leflunomide", [
                KeyValueRow(key: "Dose", value: "10-20 mg PO daily; loading dose 100 mg × 3 days controversial"),
                KeyValueRow(key: "Use", value: "RA, psoriatic arthritis; alternative to methotrexate"),
                KeyValueRow(key: "Monitoring", value: "CBC + LFTs + Cr + BP q2 weeks × 6 months → q2 months"),
                KeyValueRow(key: "Adverse effects", value: "Diarrhea, alopecia, HTN, hepatotoxicity, cytopenias"),
                KeyValueRow(key: "Pregnancy", value: "TERATOGEN; long T1/2 (~2 weeks); CHOLESTYRAMINE WASHOUT (8 g PO TID × 11 days) for pregnancy planning OR rapid clearance per primary source"),
                KeyValueRow(key: "Onset", value: "8-12 weeks")
            ]),
            .keyValueTable(title: "Azathioprine", [
                KeyValueRow(key: "Dose", value: "1-2.5 mg/kg/day PO; titrate to therapeutic"),
                KeyValueRow(key: "Use", value: "Lupus, vasculitis, AIH, IBD, RA, steroid-sparing"),
                KeyValueRow(key: "Monitoring", value: "TPMT genotype/activity BEFORE start (reduces risk of severe myelosuppression in TPMT-deficient); CBC + LFTs"),
                KeyValueRow(key: "Adverse effects", value: "Bone marrow suppression, GI upset, hepatotoxicity, increased lymphoma + skin cancer risk"),
                KeyValueRow(key: "Drug interactions", value: "Allopurinol (xanthine oxidase inhibitor) significantly increases azathioprine toxicity; dose reduction or avoidance")
            ]),
            .bullets(title: "Treatment strategies", [
                AttributedBullet("METHOTREXATE first-line for most RA patients per ACR + EULAR per primary source.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("COMBINATION therapy for inadequate response — MTX + sulfasalazine + HCQ (\"triple therapy\") is comparable to MTX + biologic per CMS RA Care guidelines.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("TREAT TO TARGET — aim for remission OR low disease activity; escalate / adjust therapy if not at target at 3-6 months.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("STEP-UP — methotrexate alone → MTX + HCQ + SSZ → MTX + biologic / JAK inhibitor.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("STEP-DOWN — taper as remission achieved; lowest effective dose; ongoing monitoring.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Pregnancy considerations — MTX + leflunomide + mycophenolate STOPPED; HCQ + sulfasalazine + azathioprine + cyclosporine + tacrolimus SAFER alternatives.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("CV risk reduction — autoimmune diseases increase CV risk; aggressive risk factor management.", citationIDs: ["specialty_pr_round27"])
            ]),
            .bullets(title: "Monitoring + safety pearls", [
                AttributedBullet("BASELINE — CBC + LFTs + Cr + CXR (some); update vaccinations.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Q2-4 WEEKS initially for first 3-6 months; Q3-6 months thereafter.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("METHOTREXATE FOLIC ACID — essential; reduces side effects.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("HCQ OPHTHALMOLOGY — annual after 5 years OR at any signs of toxicity.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("ALCOHOL counseling — minimize on hepatotoxic drugs.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("INFECTION signs counseling — emergent eval for fever / cough / dysuria.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("PREGNANCY counseling — teratogenic + non-teratogenic alternatives.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("VACCINATIONS — up-to-date; live vaccines BEFORE biologic initiation if possible.", citationIDs: ["specialty_pr_round27"])
            ])
        ],
        citations: [openrnPRR27, cdcPRR27, specialtyPRR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AutoimmuneDiseaseScreeningSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "autoimmune-disease-screening",
        title: "Autoimmune disease screening + workup approach",
        subtitle: "ANA screen + reflex panel · ANCA panel · complement · CRP/ESR · rheumatoid factor + anti-CCP · clinical pattern + serology + biopsy",
        eyebrow: "REFERENCE · RHEUMATOLOGY",
        nclexTags: refTagsR27,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Autoimmune diseases share inflammatory features but differ in pattern, organ involvement, autoantibodies, treatment. Diagnostic workup integrates clinical features, autoantibody screening, complement, biopsy. Empiric immunosuppression discouraged without diagnosis. Specialist consultation essential for definitive diagnosis + management per primary source.",
                citationIDs: ["specialty_pr_round27"]
            )),
            .keyValueTable(title: "Antinuclear antibody (ANA) screening", [
                KeyValueRow(key: "ANA", value: "Initial screen for SLE + autoimmune connective tissue disease; titers ≥1:160 considered positive; pattern + titer guide further workup"),
                KeyValueRow(key: "POSITIVE ANA", value: "REFLEX panel — anti-dsDNA + anti-Sm + anti-Ro (SS-A) + anti-La (SS-B) + anti-RNP + anti-Scl-70 + anti-centromere + anti-histone + anti-Jo-1 + anti-ribosomal P"),
                KeyValueRow(key: "FALSE POSITIVE", value: "~5-10% of healthy adults; >65 yrs higher; drug-induced (procainamide, hydralazine, isoniazid, minocycline); infections (HCV, HIV, EBV, parvovirus); cancer; family history"),
                KeyValueRow(key: "PATTERN", value: "Speckled (most common, non-specific), homogeneous (anti-dsDNA + anti-histone), nucleolar (anti-Scl-70 + anti-PM/Scl), centromeric (anti-centromere — limited cutaneous SSc), cytoplasmic (anti-Jo-1 + anti-mitochondrial)")
            ]),
            .keyValueTable(title: "Disease-specific autoantibodies", [
                KeyValueRow(key: "SLE", value: "Anti-dsDNA (high specificity, correlates with activity + lupus nephritis), anti-Sm (very specific, low sensitivity), anti-Ro/SSA, anti-La/SSB, anti-RNP, anti-ribosomal P (psychosis); LOW C3 + C4 active"),
                KeyValueRow(key: "Sjögren syndrome", value: "Anti-Ro/SSA + anti-La/SSB; high IgG; salivary gland biopsy"),
                KeyValueRow(key: "Systemic sclerosis", value: "Anti-Scl-70 (diffuse + ILD), anti-centromere (limited / CREST + pulmonary HTN), anti-RNA polymerase III (renal crisis)"),
                KeyValueRow(key: "Inflammatory myopathy", value: "Anti-Jo-1 (antisynthetase syndrome — ILD + arthritis + Raynaud); anti-Mi-2 (dermatomyositis); anti-MDA5 (dermatomyositis + ILD); creatine kinase elevated"),
                KeyValueRow(key: "Antiphospholipid syndrome", value: "Lupus anticoagulant + anti-cardiolipin + anti-β2-glycoprotein-I — on 2 occasions ≥12 weeks apart"),
                KeyValueRow(key: "MCTD", value: "Anti-RNP HIGH titer; mixed features of SLE, scleroderma, polymyositis"),
                KeyValueRow(key: "Drug-induced lupus", value: "Anti-histone antibodies; specific drugs (procainamide, hydralazine, minocycline, anti-TNFs)")
            ]),
            .keyValueTable(title: "Vasculitis screening", [
                KeyValueRow(key: "ANCA", value: "PR3-ANCA (c-ANCA) → GPA; MPO-ANCA (p-ANCA) → MPA + EGPA; atypical → drug-induced + IBD-associated"),
                KeyValueRow(key: "Cryoglobulins", value: "Mixed essential cryoglobulinemia (HCV-associated); collect WARM"),
                KeyValueRow(key: "Anti-GBM", value: "Goodpasture syndrome — pulmonary-renal"),
                KeyValueRow(key: "Anti-MPO + anti-PR3", value: "ELISA antigen-specific tests; pair with ANCA pattern"),
                KeyValueRow(key: "Complement", value: "LOW C3 + C4 in immune complex vasculitides (lupus, cryoglobulinemic); LOW C3 alone in alternative pathway (aHUS, MPGN)")
            ]),
            .keyValueTable(title: "Rheumatoid arthritis screening", [
                KeyValueRow(key: "Rheumatoid factor (RF)", value: "Sensitivity ~70-80%, specificity 70-80%; positive in other conditions (HCV, lymphoma, infection, healthy elderly)"),
                KeyValueRow(key: "Anti-CCP (citrullinated peptide)", value: "Specificity >95%; more specific than RF; positive years before clinical RA"),
                KeyValueRow(key: "ANTI-CCP + RF both positive", value: "Highly specific for RA + predicts erosive disease"),
                KeyValueRow(key: "Inflammatory markers", value: "ESR + CRP; not specific but useful for activity + treatment response")
            ]),
            .keyValueTable(title: "IgG4-related disease", [
                KeyValueRow(key: "Serum IgG4", value: "Elevated >135 mg/dL (or >200 supports diagnosis); IgG4/IgG ratio >0.05; biopsy gold standard"),
                KeyValueRow(key: "Tissue", value: "IgG4+ plasma cells + storiform fibrosis + obliterative phlebitis; histopathology criteria")
            ]),
            .bullets(title: "Diagnostic approach", [
                AttributedBullet("CLINICAL pattern first — symptoms, signs, organ involvement, family history.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("BASIC labs — CBC, ESR, CRP, CMP, urinalysis; complement; relevant autoantibodies.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("SPECIFIC autoantibodies based on clinical pattern.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Imaging — CT chest for ILD + vasculitis; MRI for CNS / spine.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("BIOPSY — for definitive diagnosis (kidney + lung + skin + temporal artery + nerve depending).", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("MULTIDISCIPLINARY — rheumatology + dermatology + pulmonology + nephrology depending on involvement.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Rule out MIMICS — infection, malignancy, drug-induced, hereditary.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("AVOID empiric immunosuppression without diagnosis — masks features + delays appropriate treatment.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Disease activity scoring — DAS28 (RA), BVAS (vasculitis), SLEDAI (SLE), modified Rodnan skin score (scleroderma).", citationIDs: ["specialty_pr_round27"])
            ]),
            .bullets(title: "Pediatric autoimmune", [
                AttributedBullet("Juvenile idiopathic arthritis subtypes — oligo / poly / systemic / psoriatic / enthesitis-related / undifferentiated.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Pediatric SLE — more severe; renal + CNS involvement common; rheumatology specialty.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Juvenile dermatomyositis — characteristic Gottron papules + heliotrope; CK elevation; muscle biopsy + EMG + autoantibodies.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Kawasaki disease — pediatric vasculitis; specific clinical criteria; IVIG + aspirin.", citationIDs: ["specialty_pr_round27"]),
                AttributedBullet("Hereditary periodic fever syndromes (FMF, TRAPS, CAPS, HIDS) — autoinflammatory; IL-1 inhibitors.", citationIDs: ["specialty_pr_round27"])
            ])
        ],
        citations: [openrnPRR27, cdcPRR27, specialtyPRR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}
