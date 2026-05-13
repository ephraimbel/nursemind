import Foundation

// Curator-model diagnosis entries (round 15 — endocrine + rheum + ENT/ophtho + psych).

private let openrnDxR15 = CitationSource(
    id: "openrn_dx_round15",
    shortName: "Open RN Health Alterations + Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR15 = CitationSource(
    id: "specialty_dx_round15",
    shortName: "ACR / Endocrine Society / AAO / AAO-HNS / APA guidelines (concept citation)",
    publisher: "ACR · Endocrine Society · AAO · AAO-HNS · APA",
    license: .factCitationOnly,
    url: "https://www.endocrine.org/clinical-practice-guidelines",
    lastRetrieved: "2026-05-04"
)

private let endoR15 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .glucoseRegulation)
private let rheumR15 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let sensoryR15 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .sensoryPerception)
private let psychR15 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood)
private let cogR15 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .cognition)

public enum PheochromocytomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pheochromocytoma",
        title: "Pheochromocytoma / paraganglioma",
        subtitle: "Catecholamine-secreting tumor · classic triad · α-blockade BEFORE β-blockade",
        nclexTags: endoR15,
        definition: AttributedProse(
            "Catecholamine-secreting neuroendocrine tumor — pheochromocytoma (adrenal medulla) or paraganglioma (extra-adrenal sympathetic chromaffin tissue). 30–40% inherited (MEN2, VHL, NF1, hereditary paraganglioma) per primary source.",
            citationIDs: ["openrn_dx_round15", "specialty_dx_round15"]
        ),
        pathophysiology: AttributedProse(
            "Excess epinephrine + norepinephrine + dopamine secretion → episodic vasoconstriction, tachycardia, glycogenolysis, lipolysis. Surgery without α-blockade can cause CV collapse from intraoperative catecholamine surge.",
            citationIDs: ["openrn_dx_round15"]
        ),
        presentation: [
            AttributedBullet("CLASSIC TRIAD — episodic HEADACHE + DIAPHORESIS + TACHYCARDIA in setting of HYPERTENSION (often severe / paroxysmal).", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Anxiety / sense of doom; tremor; pallor; orthostatic hypotension between paroxysms.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Triggers — anesthesia, surgery, exercise, urination (bladder paragangliomas), labor, certain foods (tyramine), drugs (β-blocker without α, MAOI, opioids, metoclopramide).", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Hyperglycemia, weight loss, constipation, cardiomyopathy.", citationIDs: ["openrn_dx_round15"])
        ],
        diagnosticCriteria: [
            AttributedBullet("PLASMA FREE METANEPHRINES OR 24-HOUR URINARY FRACTIONATED METANEPHRINES — first-line; high sensitivity per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("CT or MRI to localize after biochemical confirmation; MIBG / Ga-DOTATATE PET for extra-adrenal / metastatic.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Genetic testing — most patients (especially <50 years, bilateral, multifocal) per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("AVOID adrenal biopsy (catecholamine crisis risk).", citationIDs: ["openrn_dx_round15"])
        ],
        priorityAssessments: [
            AttributedBullet("BP / HR pattern (paroxysmal); medication review for triggers.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Family history (MEN2, VHL, NF1).", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Cardiac status — catecholamine cardiomyopathy possible.", citationIDs: ["openrn_dx_round15"])
        ],
        commonInterventions: [
            AttributedBullet("PREOPERATIVE α-BLOCKADE FIRST (phenoxybenzamine / doxazosin) for 7–14 days then β-blockade per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("HIGH-SODIUM DIET + LIBERAL FLUIDS during α-blockade — combat orthostasis.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("SURGICAL RESECTION — laparoscopic adrenalectomy curative for localized; experienced team per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Metastatic — MIBG therapy, chemotherapy (CVD), tyrosine kinase inhibitors.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Lifelong follow-up — metanephrines + imaging; family genetic counseling.", citationIDs: ["openrn_dx_round15"])
        ],
        watchFor: [
            AttributedBullet("HYPERTENSIVE CRISIS — phentolamine IV (α-blocker) emergent.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("INTRAOPERATIVE LABILE BP — coordinated team; nipride / phentolamine readily available.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("POSTOPERATIVE HYPOTENSION — large fluid + vasopressor support after tumor resection.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("AVOID — β-blocker before α-blocker, MAOI, sympathomimetics, glucagon, metoclopramide.", citationIDs: ["specialty_dx_round15"])
        ],
        citations: [openrnDxR15, specialtyDxR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AddisonsSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "addisons",
        title: "Primary adrenal insufficiency (Addison's)",
        subtitle: "Cortisol + aldosterone deficiency · hyperpigmentation + hyponatremia + hyperkalemia · stress dose",
        nclexTags: endoR15,
        definition: AttributedProse(
            "Failure of adrenal cortex → cortisol AND aldosterone deficiency. Most common cause autoimmune adrenalitis; TB / HIV / metastases / hemorrhage / drugs. Distinguished from secondary (pituitary ACTH deficiency — cortisol low, aldosterone normal) per primary source.",
            citationIDs: ["openrn_dx_round15", "specialty_dx_round15"]
        ),
        pathophysiology: AttributedProse(
            "Loss of cortisol → impaired stress response, hypoglycemia, hypotension. Loss of aldosterone → hyponatremia, hyperkalemia, volume depletion. ACTH high → POMC-derived MSH → hyperpigmentation (primary only).",
            citationIDs: ["openrn_dx_round15"]
        ),
        presentation: [
            AttributedBullet("Insidious — fatigue, weakness, weight loss, anorexia, GI symptoms.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("HYPERPIGMENTATION — sun-exposed areas, mucosa, gum line, scars, palmar creases — pathognomonic for primary.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("HYPOTENSION + orthostasis; SALT CRAVING.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Labs — HYPONATREMIA + HYPERKALEMIA + hypoglycemia + mild metabolic acidosis + eosinophilia.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("ADRENAL CRISIS — severe hypotension, shock, AMS, hyperkalemic arrhythmias; precipitated by stress.", citationIDs: ["openrn_dx_round15"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MORNING (8 AM) CORTISOL low + ACTH high (primary).", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("ACTH STIMULATION TEST — peak <18 µg/dL = adrenal insufficiency per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Anti-21-hydroxylase antibodies — autoimmune adrenalitis.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Imaging adrenals — TB / metastases / hemorrhage suspected.", citationIDs: ["openrn_dx_round15"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs (orthostasis, BP), volume status; electrolytes; glucose; mental status.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Identify stressor (infection, missed dose, surgery, trauma).", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Polyendocrine syndromes — APS-1 / APS-2.", citationIDs: ["specialty_dx_round15"])
        ],
        commonInterventions: [
            AttributedBullet("REPLACEMENT — hydrocortisone 15–25 mg/day divided OR prednisone 3–5 mg/day; PLUS fludrocortisone 0.05–0.2 mg/day (primary only) per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("STRESS DOSING — 2–3× usual dose for fever / illness; IV hydrocortisone 100 mg q8h for major surgery / severe illness per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("MEDICAL ALERT ID + emergency injection kit (100 mg hydrocortisone IM) + carry written instructions.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Salt liberalization; adequate hydration.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Address underlying cause; transition to maintenance.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Education — never miss doses; sick-day rules; rapid replacement during illness.", citationIDs: ["specialty_dx_round15"])
        ],
        watchFor: [
            AttributedBullet("ADRENAL CRISIS — hydrocortisone 100 mg IV bolus → 50 mg IV q6h + IV NS + dextrose; treat precipitant; ICU per primary source.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("HYPERKALEMIC ARRHYTHMIA — calcium gluconate + insulin / dextrose + bicarbonate.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("HYPOGLYCEMIA — IV dextrose 50.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Co-existing hypothyroidism — treat adrenal insufficiency FIRST per primary source.", citationIDs: ["openrn_dx_round15"])
        ],
        citations: [openrnDxR15, specialtyDxR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum SjogrensSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sjogrens",
        title: "Sjögren's syndrome",
        subtitle: "Autoimmune sicca · dry eyes + dry mouth · anti-Ro/La · lymphoma risk",
        nclexTags: rheumR15,
        definition: AttributedProse(
            "Chronic autoimmune disease of exocrine glands (lacrimal + salivary) → keratoconjunctivitis sicca + xerostomia. Primary or secondary (with RA, SLE, scleroderma). Increased lymphoma risk (~5%) per primary source.",
            citationIDs: ["openrn_dx_round15", "specialty_dx_round15"]
        ),
        pathophysiology: AttributedProse(
            "T-cell + B-cell-mediated destruction of exocrine epithelium with germinal center formation; B-cell hyperactivity → hypergammaglobulinemia + autoantibodies (anti-Ro/SSA, anti-La/SSB) + lymphomagenesis.",
            citationIDs: ["openrn_dx_round15"]
        ),
        presentation: [
            AttributedBullet("Dry eyes — gritty / sandy sensation, photophobia, foreign-body feeling, blurred vision.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Dry mouth — difficulty chewing / swallowing dry food, oral candidiasis, dental caries, recurrent parotid swelling.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Other dryness — vagina (dyspareunia), skin, nose, trachea (chronic cough).", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Extraglandular — fatigue, arthralgia, Raynaud's, peripheral neuropathy, ILD, cytopenias, RTA, GN.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("LYMPHOMA — MALT (parotid) > nodal NHL; persistent salivary gland enlargement is concerning per primary source.", citationIDs: ["specialty_dx_round15"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ACR/EULAR 2016 — labial salivary gland biopsy + anti-Ro/SSA + Schirmer / ocular staining / unstimulated salivary flow per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Schirmer test ≤5 mm in 5 minutes; ocular staining; unstimulated salivary flow <0.1 mL/min.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Labs — anti-Ro/SSA, anti-La/SSB, ANA, RF, hypergammaglobulinemia.", citationIDs: ["openrn_dx_round15"])
        ],
        priorityAssessments: [
            AttributedBullet("Symptom severity (sicca + extraglandular); QoL impact.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Lymphoma surveillance — persistent gland swelling, B symptoms, lymphadenopathy, cytopenias.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Dental + ophthalmologic — collaborative care.", citationIDs: ["openrn_dx_round15"])
        ],
        commonInterventions: [
            AttributedBullet("DRY EYES — preservative-free artificial tears; cyclosporine A drops; lifitegrast; punctal plugs; warm compresses; humidifiers.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("DRY MOUTH — pilocarpine OR cevimeline; sugar-free gum; saliva substitutes; aggressive dental hygiene + fluoride per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("EXTRAGLANDULAR — hydroxychloroquine for arthralgia / fatigue; corticosteroids for severe; rituximab / mycophenolate for refractory per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Avoid drugs that worsen dryness — anticholinergics, decongestants.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Routine dental care every 3–6 months; treat oral candidiasis.", citationIDs: ["openrn_dx_round15"])
        ],
        watchFor: [
            AttributedBullet("LYMPHOMA — persistent unilateral parotid swelling, lymphadenopathy, B symptoms, cryoglobulinemia, hypocomplementemia → biopsy + hematology per primary source.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("CORNEAL ULCERATION from severe dry eye — emergent ophthalmology.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("ASPIRATION risk from dry mouth in surgery / sedation.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("INTERSTITIAL LUNG DISEASE — declining DLCO; chest imaging.", citationIDs: ["openrn_dx_round15"])
        ],
        citations: [openrnDxR15, specialtyDxR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum InflammatoryMyopathiesSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "inflammatory-myopathies",
        title: "Polymyositis / dermatomyositis",
        subtitle: "Symmetric proximal weakness · CK elevated · cancer screening · steroids first-line",
        nclexTags: rheumR15,
        definition: AttributedProse(
            "Idiopathic inflammatory myopathies — polymyositis, dermatomyositis (skin findings), inclusion body myositis, immune-mediated necrotizing myopathy. DM associated with internal malignancy in adults per primary source.",
            citationIDs: ["openrn_dx_round15", "specialty_dx_round15"]
        ),
        pathophysiology: AttributedProse(
            "Autoimmune inflammation of skeletal muscle (and skin in DM). Anti-synthetase → ILD + arthritis + Raynaud's; anti-MDA5 → rapidly progressive ILD; anti-TIF1γ → cancer-associated DM.",
            citationIDs: ["openrn_dx_round15"]
        ),
        presentation: [
            AttributedBullet("SYMMETRIC PROXIMAL MUSCLE WEAKNESS — difficulty rising, climbing stairs, lifting arms; insidious over weeks-months.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("DM SKIN — heliotrope rash (eyelids), Gottron's papules (MCP/PIP/DIP), shawl sign, V-sign, mechanic's hands.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Dysphagia (pharyngeal weakness — aspiration risk); dysphonia.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Interstitial lung disease — dyspnea + dry cough + crackles.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Constitutional — fatigue, weight loss, fever; arthralgias; Raynaud's.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("CANCER (DM in adults) — ovarian, lung, breast, GI, NHL — screen aggressively at diagnosis + first 2–3 years per primary source.", citationIDs: ["specialty_dx_round15"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Elevated CK (often 5–50× normal), aldolase, AST / ALT (muscle source), LDH.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("EMG — myopathic + spontaneous activity.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Muscle MRI — edema in active inflammation.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Muscle biopsy — definitive (perifascicular atrophy in DM, lymphocytic infiltration in PM).", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Myositis-specific + myositis-associated antibodies — sub-classify.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Cancer workup — CT chest/abdomen/pelvis, mammogram, gyn exam, endoscopy as appropriate per primary source.", citationIDs: ["specialty_dx_round15"])
        ],
        priorityAssessments: [
            AttributedBullet("Strength testing (MRC); functional impact; aspiration risk.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("PFTs + HRCT chest at baseline + periodically (ILD).", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Skin exam (DM); cancer screening per age + risk factors.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Cardiac involvement — ECG, troponin, echo if suspected.", citationIDs: ["openrn_dx_round15"])
        ],
        commonInterventions: [
            AttributedBullet("CORTICOSTEROIDS first-line — prednisone 1 mg/kg/day or pulse methylprednisolone for severe; taper after 4–8 weeks per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("STEROID-SPARING — azathioprine, methotrexate, mycophenolate, IVIG, rituximab per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Severe / refractory — IVIG, rituximab; cyclophosphamide for severe ILD.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("DM SKIN — hydroxychloroquine; sun protection.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Aspiration precautions; PT / OT for strength + ROM; dietitian.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("PJP prophylaxis (TMP-SMX) when on combined immunosuppression per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Cancer treatment when identified — myositis often improves.", citationIDs: ["specialty_dx_round15"])
        ],
        watchFor: [
            AttributedBullet("ASPIRATION pneumonia — dysphagia; SLP eval + diet modification.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("ANTI-MDA5 ILD — rapidly progressive, often fatal; aggressive immunosuppression early per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Steroid-induced complications — hyperglycemia, osteoporosis, infection.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("OCCULT MALIGNANCY in DM — never delay age-appropriate cancer screening.", citationIDs: ["specialty_dx_round15"])
        ],
        citations: [openrnDxR15, specialtyDxR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PseudogoutSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pseudogout",
        title: "Pseudogout (CPPD)",
        subtitle: "CPP crystal arthritis · knee + wrist · positive birefringent · NSAIDs / colchicine / steroids",
        nclexTags: rheumR15,
        definition: AttributedProse(
            "Calcium pyrophosphate deposition disease — acute or chronic crystal arthritis from CPP crystals. Most common in elderly; associations with hyperparathyroidism, hemochromatosis, hypomagnesemia, hypophosphatasia per primary source.",
            citationIDs: ["openrn_dx_round15", "specialty_dx_round15"]
        ),
        pathophysiology: AttributedProse(
            "Calcium pyrophosphate dihydrate crystals deposit in fibro/articular cartilage → release into joint space → activates inflammasome → acute synovitis. Chronic deposition (chondrocalcinosis) on radiographs.",
            citationIDs: ["openrn_dx_round15"]
        ),
        presentation: [
            AttributedBullet("Acute monoarticular / oligoarticular arthritis — KNEE > wrist > shoulder > MCP > hip.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Pain, swelling, warmth, erythema; functional impairment.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Triggers — surgery, trauma, illness.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Chronic CPPD — pseudo-RA pattern, pseudo-OA pattern, pseudo-neuropathic.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Often elderly.", citationIDs: ["openrn_dx_round15"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ARTHROCENTESIS — synovial fluid analysis (positively birefringent rhomboid crystals on polarized microscopy) per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Radiographs — chondrocalcinosis (calcification of meniscus, triangular fibrocartilage of wrist).", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Workup secondary causes — calcium, magnesium, phosphate, iron studies, ferritin, PTH per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("MUST distinguish from septic arthritis with culture (can co-exist).", citationIDs: ["openrn_dx_round15"])
        ],
        priorityAssessments: [
            AttributedBullet("Differentiate from septic arthritis (joint culture + Gram stain) and from gout.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Identify metabolic / endocrine triggers; medication review.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Functional impact + comorbidities (renal, GI, anticoagulation).", citationIDs: ["openrn_dx_round15"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE FLARE — NSAIDs, colchicine, intraarticular OR systemic glucocorticoids per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("PROPHYLAXIS — low-dose colchicine OR low-dose NSAIDs.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Treat underlying — hemochromatosis, hyperparathyroidism, hypomagnesemia.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Joint aspiration — diagnostic + therapeutic.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Refractory / chronic — IL-1 inhibitors (anakinra, canakinumab) per primary source.", citationIDs: ["specialty_dx_round15"])
        ],
        watchFor: [
            AttributedBullet("SEPTIC ARTHRITIS overlap — can co-exist; never assume CPPD without culture in toxic-appearing patient.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("NSAIDs in elderly — GI / renal / CV; choose carefully.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Colchicine in CKD — reduce dose / avoid; toxicity manifests as GI / myelosuppression / neuromyopathy.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("CHRONIC progression — destructive arthropathy.", citationIDs: ["openrn_dx_round15"])
        ],
        citations: [openrnDxR15, specialtyDxR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum GlaucomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "glaucoma",
        title: "Glaucoma (open + acute angle-closure)",
        subtitle: "Optic neuropathy · IOP-driven · acute angle-closure is sight-emergency",
        nclexTags: sensoryR15,
        definition: AttributedProse(
            "Optic neuropathies with progressive retinal ganglion cell death + visual field loss; most associated with elevated IOP. Open-angle (most common, painless, slow) vs angle-closure (rapid, painful, sight-threatening) per primary source.",
            citationIDs: ["openrn_dx_round15", "specialty_dx_round15"]
        ),
        pathophysiology: AttributedProse(
            "Open-angle — trabecular meshwork outflow resistance increases → IOP rises gradually. Angle-closure — anatomically narrow angle blocked by iris → aqueous outflow obstructed → rapid IOP rise → ischemia.",
            citationIDs: ["openrn_dx_round15"]
        ),
        presentation: [
            AttributedBullet("OPEN-ANGLE — asymptomatic until significant peripheral visual field loss; \"silent thief of sight.\"", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("ACUTE ANGLE-CLOSURE — severe eye pain, nausea / vomiting, headache, blurred vision, halos around lights, red eye, fixed mid-dilated pupil, hard \"rock-like\" globe per primary source.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Risk factors — age, family history, ethnicity, refractive error, diabetes, steroid use, eye trauma.", citationIDs: ["openrn_dx_round15"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Tonometry — IOP measurement; normal 10–21 mmHg; angle-closure often >40 per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("GONIOSCOPY — visualizes anterior chamber angle.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Optic nerve exam — cup-to-disc ratio, hemorrhages.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Visual field testing — perimetry; arcuate / nasal step / peripheral defects.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("OCT optic nerve — RNFL thinning.", citationIDs: ["openrn_dx_round15"])
        ],
        priorityAssessments: [
            AttributedBullet("Acute symptoms — pain, vomiting, vision change → emergent ophthalmology.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Medication review — anticholinergics, decongestants, topiramate, sulfonamides can precipitate angle-closure.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Adherence to drops; tracking IOP + visual fields longitudinally.", citationIDs: ["openrn_dx_round15"])
        ],
        commonInterventions: [
            AttributedBullet("OPEN-ANGLE — topical drops first-line — prostaglandins (latanoprost), β-blockers (timolol), α-agonists (brimonidine), CAIs (dorzolamide), ROCK inhibitors per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Selective laser trabeculoplasty (SLT) — first-line option in some patients per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Surgical — trabeculectomy, MIGS, tube shunts for refractory.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("ACUTE ANGLE-CLOSURE — EMERGENCY — topical pilocarpine, β-blocker, α-agonist + IV / oral acetazolamide + IV mannitol → rapid IOP reduction → DEFINITIVE laser peripheral iridotomy per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Patient adherence — long-term consistent drop use.", citationIDs: ["openrn_dx_round15"])
        ],
        watchFor: [
            AttributedBullet("ACUTE ANGLE-CLOSURE — sight-threatening within hours; do NOT dilate eye if angles narrow.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Topical β-blocker systemic absorption — bradycardia / bronchospasm in COPD / asthma / heart block.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Steroid-induced IOP rise — chronic ocular / systemic steroids; monitor.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Adherence — drops bitter / sting; monitoring + simplification reduces dropout.", citationIDs: ["openrn_dx_round15"])
        ],
        citations: [openrnDxR15, specialtyDxR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum OtitisMediaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "otitis-media",
        title: "Acute otitis media (AOM)",
        subtitle: "Pediatric ear infection · high-dose amoxicillin · watchful waiting candidate",
        nclexTags: sensoryR15,
        definition: AttributedProse(
            "Acute infection of middle ear with fluid + signs of acute infection. Most common bacterial infection in children <2. Distinguish from OME (effusion without infection) per primary source.",
            citationIDs: ["openrn_dx_round15", "specialty_dx_round15"]
        ),
        pathophysiology: AttributedProse(
            "Eustachian tube dysfunction (often after URI) → middle-ear effusion → bacterial colonization (S. pneumoniae, H. influenzae non-typeable, M. catarrhalis) → infection.",
            citationIDs: ["openrn_dx_round15"]
        ),
        presentation: [
            AttributedBullet("Children — ear pain / pulling, fever, irritability, sleep disturbance, decreased feeding.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Hearing loss; vertigo; tinnitus.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Otorrhea — TM perforation; risk for chronic OM.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Adults — uncommon; consider underlying nasopharyngeal mass / immunodeficiency.", citationIDs: ["openrn_dx_round15"])
        ],
        diagnosticCriteria: [
            AttributedBullet("AAP — moderate-severe TM bulging OR new otorrhea OR mild bulging with recent ear pain or marked erythema per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Pneumatic otoscopy — reduced TM mobility.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Tympanometry — flat tracing.", citationIDs: ["openrn_dx_round15"])
        ],
        priorityAssessments: [
            AttributedBullet("Fever, pain, feeding, hydration, immunization status.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Recurrent (≥3 in 6 months / ≥4 in 12 months) — refer ENT.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Complications — mastoiditis, facial nerve palsy, hearing loss, chronic OM.", citationIDs: ["openrn_dx_round15"])
        ],
        commonInterventions: [
            AttributedBullet("WATCHFUL WAITING — non-severe AOM in children ≥6 months without otorrhea, with reliable follow-up; observe 48–72 hours per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("ANTIBIOTICS — first-line HIGH-DOSE AMOXICILLIN 80–90 mg/kg/day divided BID; second-line amoxicillin-clavulanate per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Treatment duration — <2 yr / severe — 10 days; 2–5 yr — 7 days; ≥6 yr — 5–7 days.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Penicillin allergy — cefdinir / cefpodoxime / cefuroxime; macrolides if severe per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Pain management — acetaminophen / ibuprofen; topical analgesic if TM intact.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Recurrent / chronic — ENT referral; tympanostomy tubes if persistent effusion >3 months bilateral with hearing loss.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Vaccinations — pneumococcal + influenza reduce AOM incidence.", citationIDs: ["specialty_dx_round15"])
        ],
        watchFor: [
            AttributedBullet("MASTOIDITIS — postauricular swelling, erythema, fever; emergent IV abx + ENT.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("INTRACRANIAL — meningitis, abscess; toxic appearance + AMS.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Hearing loss / speech delay — children with chronic effusion.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Antimicrobial stewardship — avoid abx for OME.", citationIDs: ["specialty_dx_round15"])
        ],
        citations: [openrnDxR15, specialtyDxR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum BPPVSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bppv",
        title: "Benign paroxysmal positional vertigo (BPPV)",
        subtitle: "Otolith displacement · Dix-Hallpike · Epley maneuver curative",
        nclexTags: sensoryR15,
        definition: AttributedProse(
            "Most common cause of vertigo. Otolith debris (canaliths) freely floating in semicircular canal (most often posterior) → triggered episodes of vertigo with head position changes per primary source.",
            citationIDs: ["openrn_dx_round15", "specialty_dx_round15"]
        ),
        pathophysiology: AttributedProse(
            "Calcium carbonate crystals (otoconia) dislodge from utricle → enter semicircular canal → with head movement, crystals shift → endolymph flow → false signal of motion → brief vertigo.",
            citationIDs: ["openrn_dx_round15"]
        ),
        presentation: [
            AttributedBullet("Brief (<60 seconds) episodes of vertigo triggered by head position change.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Latency 1–5 seconds; fatigues with repeated provocation.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("No persistent imbalance, hearing loss, or cranial neuropathy (red flags).", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Most common age 50–70; female predominance; idiopathic OR post-trauma / viral / prolonged supine position.", citationIDs: ["openrn_dx_round15"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DIX-HALLPIKE MANEUVER — provokes vertigo + UPBEAT-TORSIONAL nystagmus toward affected ear (posterior canal) per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Supine roll test — for horizontal canal BPPV.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("EXCLUSION of central causes — HINTS exam in acute prolonged vertigo per primary source.", citationIDs: ["specialty_dx_round15"])
        ],
        priorityAssessments: [
            AttributedBullet("Fall risk — significant; history of falls?", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("RED FLAGS — persistent vertigo, hearing loss, focal deficits, severe headache, dysarthria, ataxia → central vertigo workup.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Medications contributing — sedatives, ototoxics.", citationIDs: ["openrn_dx_round15"])
        ],
        commonInterventions: [
            AttributedBullet("EPLEY MANEUVER — first-line for posterior canal BPPV; ~80% resolve with 1–3 sessions per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("BBQ ROLL maneuver — horizontal canal BPPV.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Brandt-Daroff exercises — home; less effective but adjunctive.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("AVOID long-term meclizine / benzodiazepines — delay recovery + fall risk per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Refractory — vestibular rehabilitation; surgical posterior canal occlusion (rare).", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Recurrence common (~20% / year); patients can learn home Epley.", citationIDs: ["openrn_dx_round15"])
        ],
        watchFor: [
            AttributedBullet("CENTRAL CAUSE missed — stroke, MS, posterior fossa tumor; HINTS exam helps differentiate.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Falls from disorienting episodes — counsel sit / lie down promptly.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Anxiety / depression secondary to fear of episodes.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Multi-canal involvement — refractory; specialist referral.", citationIDs: ["openrn_dx_round15"])
        ],
        citations: [openrnDxR15, specialtyDxR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum MenieresSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "menieres",
        title: "Ménière's disease",
        subtitle: "Endolymphatic hydrops · classic tetrad · low-salt + diuretic · IT gentamicin refractory",
        nclexTags: sensoryR15,
        definition: AttributedProse(
            "Inner-ear disorder characterized by spells of vertigo + sensorineural hearing loss + tinnitus + aural fullness; pathology is endolymphatic hydrops per primary source.",
            citationIDs: ["openrn_dx_round15", "specialty_dx_round15"]
        ),
        pathophysiology: AttributedProse(
            "Excess endolymph accumulation → membrane rupture → endolymph mixing with perilymph → transient depolarization of vestibular + cochlear hair cells → spell. Repeated episodes → permanent low-frequency SNHL.",
            citationIDs: ["openrn_dx_round15"]
        ),
        presentation: [
            AttributedBullet("CLASSIC TETRAD — episodic vertigo (20 min – several hours) + low-frequency sensorineural HEARING LOSS (initially fluctuating) + TINNITUS + AURAL FULLNESS per primary source.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Spells weeks to months apart; remissions.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Late stage — burnout (less vertigo, persistent hearing loss / tinnitus / imbalance).", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Drop attacks (Tumarkin) — falls without warning; rare but dangerous.", citationIDs: ["openrn_dx_round15"])
        ],
        diagnosticCriteria: [
            AttributedBullet("AAO-HNS / Bárány — ≥2 spontaneous episodes of vertigo (20 min – 12 hr) + audiometric LOW-MID frequency SNHL on 1 occasion + fluctuating aural symptoms per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("MRI internal auditory canals — exclude vestibular schwannoma.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("ECoG — adjunctive (elevated SP/AP ratio).", citationIDs: ["specialty_dx_round15"])
        ],
        priorityAssessments: [
            AttributedBullet("Spell frequency + severity; functional impairment; hearing trends.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Fall risk — drop attacks.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Coexisting migraine — vestibular migraine often misdiagnosed as Ménière's.", citationIDs: ["openrn_dx_round15"])
        ],
        commonInterventions: [
            AttributedBullet("CONSERVATIVE — low-sodium diet (<1500 mg/day), limit caffeine + alcohol + tobacco, stress management per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("DIURETIC — hydrochlorothiazide / triamterene; reduce endolymph volume; modest evidence.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("ACUTE ATTACK — antihistamine (meclizine), antiemetic (ondansetron), benzodiazepine (lorazepam).", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("INTRATYMPANIC steroids — refractory; preserves hearing.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("INTRATYMPANIC GENTAMICIN — chemical labyrinthectomy; accepts hearing loss per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Surgical — endolymphatic sac decompression, vestibular nerve section, labyrinthectomy.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Hearing aids; cochlear implant if profound hearing loss.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Vestibular rehabilitation between spells.", citationIDs: ["openrn_dx_round15"])
        ],
        watchFor: [
            AttributedBullet("DROP ATTACKS — falls without warning; head trauma; lifestyle / activity counseling.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("PROGRESSIVE HEARING LOSS — irreversible; hearing preservation interventions.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Differentials — vestibular migraine, schwannoma, autoimmune inner ear disease.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Mental health — anxiety / depression; QoL impact.", citationIDs: ["openrn_dx_round15"])
        ],
        citations: [openrnDxR15, specialtyDxR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AutismSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "autism",
        title: "Autism spectrum disorder (ASD)",
        subtitle: "Persistent social/communication deficits + restricted/repetitive behaviors · early intervention",
        nclexTags: cogR15,
        definition: AttributedProse(
            "Neurodevelopmental disorder characterized by persistent deficits in social communication + interaction AND restricted, repetitive patterns of behavior, interests, or activities; symptoms present in early development; functional impairment varies by severity (Levels 1–3) per DSM-5 per primary source.",
            citationIDs: ["openrn_dx_round15", "specialty_dx_round15"]
        ),
        pathophysiology: AttributedProse(
            "Strongly heritable (~80% twin concordance); polygenic + de novo variants; differences in brain connectivity and synaptic function. NOT caused by parenting or vaccines per primary source.",
            citationIDs: ["openrn_dx_round15"]
        ),
        presentation: [
            AttributedBullet("Social — atypical eye contact, difficulty reading social cues, challenges with reciprocal conversation.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Communication — language delay, echolalia, atypical prosody; nonverbal in some.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Restricted / repetitive — stereotyped movements, insistence on sameness, restricted intense interests, sensory hyper- or hyposensitivity.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Common comorbidities — intellectual disability, ADHD, anxiety, depression, epilepsy, GI issues, sleep disturbance.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Adults often missed / late-diagnosed — particularly women; \"masking\" can hide presentation.", citationIDs: ["openrn_dx_round15"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5 — social-communication deficits + restricted-repetitive patterns + early developmental period + functional impairment per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Standardized tools — ADOS-2, ADI-R, M-CHAT-R/F (toddler screening 18 + 24 months) per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Multidisciplinary evaluation — developmental pediatrician, psychologist, SLP, OT.", citationIDs: ["openrn_dx_round15"])
        ],
        priorityAssessments: [
            AttributedBullet("Communication style + sensory preferences for clinical encounter.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Comorbidities (epilepsy, anxiety, depression, ADHD, GI, sleep).", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Caregiver / family support; school / IEP; community resources.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Self-injurious behavior risk; elopement / wandering risk.", citationIDs: ["openrn_dx_round15"])
        ],
        commonInterventions: [
            AttributedBullet("EARLY INTERVENTION — most evidence-based; ABA, NDBI, speech / OT, social skills training per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Educational supports — IEP, 504 plan, transition planning at age 14–16.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Pharmacotherapy — only for comorbid conditions (anxiety, ADHD, irritability — risperidone / aripiprazole FDA-approved for irritability) per primary source.", citationIDs: ["specialty_dx_round15"]),
            AttributedBullet("Family education + support; respite care; advocacy organizations.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Adult transition — independent living skills, vocational training, supported employment, healthcare navigation.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("Healthcare encounters — predictable routine, visual schedules, sensory accommodations, allow extra time, written summaries.", citationIDs: ["openrn_dx_round15"])
        ],
        watchFor: [
            AttributedBullet("CO-OCCURRING MEDICAL CONDITIONS often missed — pain expressed atypically.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("EPILEPSY peak adolescence — new-onset behavior change → consider seizure.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("MENTAL HEALTH — anxiety / depression / suicidality, especially adolescents + adults.", citationIDs: ["openrn_dx_round15"]),
            AttributedBullet("CAREGIVER BURDEN — connect to support; respite.", citationIDs: ["openrn_dx_round15"])
        ],
        citations: [openrnDxR15, specialtyDxR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}
