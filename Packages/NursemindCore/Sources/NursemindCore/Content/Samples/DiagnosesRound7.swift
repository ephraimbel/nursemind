import Foundation

// Curator-model diagnosis entries (round 7 expansion — burns + dermatology + ophthalmology + ENT + geriatric + transplant).
// Sources: Open RN Health Alterations + Med-Surg (CC BY 4.0), OpenStax Nursing
// (CC BY 4.0 with AI restriction), CDC (public domain), AAO / AAD / ABA / AST / IDSA concept citations.

private let openrnMSr7 = CitationSource(
    id: "openrn_ms_round7",
    shortName: "Open RN Health Alterations / Medical-Surgical Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=burn+dermatology+ophthalmology+geriatric",
    lastRetrieved: "2026-05-04"
)
private let openstaxR7 = CitationSource(
    id: "openstax_round7",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let cdcDxR7 = CitationSource(
    id: "cdc_dx_round7",
    shortName: "CDC clinical / infection guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR7 = CitationSource(
    id: "specialty_dx_round7",
    shortName: "ABA / AAO / AAD / AST / IDSA guidelines (concept citation)",
    publisher: "American Burn Association · American Academy of Ophthalmology · American Academy of Dermatology · American Society of Transplantation",
    license: .factCitationOnly,
    url: "https://ameriburn.org/resources/practice-guidelines/",
    lastRetrieved: "2026-05-04"
)

private let burnsR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let skinR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let eyeR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .sensoryPerception)
private let entR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .sensoryPerception)
private let geriR7 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .safety)
private let transplantR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)

// MARK: - Thermal Burn Injury

public enum ThermalBurnSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "thermal-burn",
        title: "Thermal burn injury",
        subtitle: "Depth + TBSA · Parkland resuscitation · burn-center referral criteria",
        nclexTags: burnsR7,
        definition: AttributedProse(
            "Tissue injury from heat (flame, scald, contact). Severity is determined by burn DEPTH (superficial → full-thickness), TOTAL BODY SURFACE AREA (TBSA) burned, anatomic LOCATION, AGE, and comorbidities per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Heat denatures cellular proteins → coagulation necrosis. Three zones: coagulation (irreversible center), stasis (reversible — preserve with resuscitation), hyperemia (peripheral). Major burns trigger systemic capillary leak, third spacing, and a shock state requiring large-volume resuscitation.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("Superficial (1st-degree) — erythema, painful, dry; sunburn type.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Superficial partial-thickness (2nd-degree, superficial) — blisters, painful, moist, blanches.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Deep partial-thickness — wet or waxy, decreased pain (deeper nerve damage), sluggish capillary refill.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Full-thickness (3rd-degree) — leathery, dry, non-blanching, white/charred/black, INSENSATE (nerve destruction).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("4th-degree — extends through fat, muscle, bone.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Inhalation injury — facial burns, singed nasal hairs, carbonaceous sputum, hoarseness, stridor, soot in airway.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — depth and TBSA estimated by Rule of Nines (adult), Lund-Browder chart (peds + accuracy), or palmar method (1% TBSA = patient's palm).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("ABGs with co-oximetry (carbon monoxide, methemoglobin) for inhalation injury.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("CK, urine myoglobin if electrical burn (rhabdomyolysis).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("CXR; bronchoscopy if inhalation suspected.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("AIRWAY — assess for inhalation injury and impending obstruction; intubate EARLY before edema forecloses access.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Circulatory — large-bore IV × 2 (in unburned skin if possible); BP, HR, urine output.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("TBSA + depth + location; circumferential burns of chest / extremities → escharotomy may be needed.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Pain assessment; co-existing injuries (especially escape from fire, jump from height).", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("Airway management — intubate EARLY for facial / inhalation burns per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Fluid resuscitation — Parkland formula 4 mL × kg × %TBSA Lactated Ringer's over 24 hr; HALF in first 8 hours from time of burn (not from arrival) per primary source. Titrate to UOP 0.5 mL/kg/hr (adults), 1 mL/kg/hr (peds).", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Wound care — cool with room-temperature sterile water if recent (NEVER ice — worsens injury); cover with clean dry sheet for transport; do NOT apply topical agents pre-burn-center transfer.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Tetanus update; analgesia (IV opioid); NG tube (gastric stasis common); foley.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Burn-center referral per ABA criteria — partial-thickness >10% TBSA, full-thickness any age, burns of face/hands/feet/genitalia/major joints, electrical/chemical/inhalation, comorbidity per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("CO poisoning suspected — 100% FiO2 immediately; consider hyperbaric for severe / pregnant / persistent neurologic symptoms per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Wound debridement, topical silver sulfadiazine (avoid in face / sulfa allergy / pregnancy near term) or mafenide acetate, daily dressing changes, eventually grafting per burn team.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("AIRWAY EMERGENCY — rapid edema; do not wait for stridor.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Compartment syndrome — circumferential burns; serial neurovascular checks; escharotomy/fasciotomy.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Fluid creep / over-resuscitation → abdominal compartment syndrome; trend bladder pressures in massive burns.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Sepsis from burn wound — late but leading cause of mortality; surveillance.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Hypothermia (very common in burn patients — limit exposure; warm fluids).", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, openstaxR7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Inhalation Injury

public enum InhalationInjurySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "inhalation-injury",
        title: "Inhalation injury",
        subtitle: "Smoke / heat / CO / cyanide · airway emergency · early intubation",
        nclexTags: burnsR7,
        definition: AttributedProse(
            "Acute injury from inhaling hot gases, particulates, smoke, and toxic combustion products. Three components: thermal injury to the upper airway, chemical injury to the lower airway, and systemic toxicity (carbon monoxide, hydrogen cyanide) per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Heat → upper-airway edema. Chemical irritants → lower-airway inflammation, mucosal sloughing, mucus plugging, and ARDS. Carbon monoxide binds hemoglobin (240× greater affinity than O2) → tissue hypoxia despite normal PaO2. Cyanide blocks oxidative phosphorylation → severe lactic acidosis.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("History — closed-space fire, prolonged exposure, loss of consciousness at scene.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Facial burns, singed nasal hair / eyebrows, carbonaceous sputum, hoarse voice, stridor, soot in oropharynx.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Cough, wheezing, hypoxemia.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("AMS, headache, cherry-red skin (CO — late and unreliable), seizure (CO / cyanide).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Severe lactic acidosis disproportionate to clinical state — suspect cyanide.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Bronchoscopy — gold standard for confirming inhalation injury and grading severity.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("ABG with CO-OXIMETRY — measures carboxyhemoglobin (COHb) and methemoglobin per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Standard pulse oximetry is FALSELY NORMAL in CO poisoning.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("CXR initially often normal; ARDS pattern develops over 24–72 hours.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway — visualize oropharynx; assess voice; LOW threshold for early intubation.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Mental status; glucose; lactate.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Carboxyhemoglobin level — pulse ox is NOT reliable.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("100% FiO2 by non-rebreather IMMEDIATELY for any suspected CO poisoning — half-life of COHb falls from ~5 hr (room air) to ~80 min (100% O2) per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Early intubation for facial burns, stridor, hoarseness, AMS, carbonaceous sputum — DO NOT WAIT for failure.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Hyperbaric oxygen — consider for severe CO poisoning (COHb >25%, neurologic symptoms, AMS, pregnancy with COHb >15%, persistent symptoms after 4 hr 100% O2) per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Hydroxocobalamin (Cyanokit) for suspected cyanide — empiric for fire victim with severe lactic acidosis, AMS, hypotension per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Bronchodilators, suctioning, lung-protective ventilation per ARDS protocol.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Avoid overaggressive fluid resuscitation — pulmonary edema worsens lung injury.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("AIRWAY OBSTRUCTION — edema progresses over hours; once stridor present, intubation is urgent and difficult.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Delayed ARDS at 24–72 hr — lung-protective ventilation, prone positioning if severe.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Pneumonia — high risk in injured airways; surveillance and stewardship-guided antibiotics.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Long-term — restrictive lung disease, bronchiectasis, asthma.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Melanoma

public enum MelanomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "melanoma",
        title: "Melanoma",
        subtitle: "Skin cancer · ABCDE · biopsy → staging → wide local excision",
        nclexTags: skinR7,
        definition: AttributedProse(
            "Malignancy of melanocytes — most aggressive of the common skin cancers. Risk factors: UV exposure, fair skin, family history, atypical / numerous nevi, immunosuppression. Early detection is the strongest determinant of survival per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Melanocyte transformation; subtypes — superficial spreading (most common), nodular (most aggressive), lentigo maligna (sun-damaged elderly skin), acral lentiginous (palms / soles / nail beds; most common in darker skin types). Vertical growth → metastasis to lymph nodes, lung, brain, liver.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("ABCDE — Asymmetry, irregular Border, multiple Colors, Diameter >6 mm, Evolution over time.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Ugly-duckling sign — lesion that looks DIFFERENT from the patient's other moles.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Pruritus, bleeding, ulceration, satellite lesions, lymphadenopathy.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Subungual or acral pigmented streak — suspect acral lentiginous melanoma in any skin type.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Full-thickness EXCISIONAL biopsy (preferred) — shave biopsy may underestimate depth; never just observe a suspicious lesion.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Histology — Breslow depth (mm) is the strongest prognostic factor; ulceration, mitotic rate, Clark level.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Sentinel lymph node biopsy for tumors ≥0.8 mm or with high-risk features per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Staging — TNM; imaging (CT, PET, MRI brain) for stage III/IV.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Skin exam — total-body, including scalp, perineum, soles, nail beds, palms.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Lymph node exam, neuro exam (brain mets), abdominal exam (liver mets).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Family history, prior skin cancers, immunosuppression.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("Wide local excision with margin determined by Breslow depth (typically 0.5–2 cm) per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Sentinel lymph-node biopsy; complete lymph-node dissection rarely now.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Systemic therapy for advanced — checkpoint inhibitors (nivolumab, pembrolizumab, ipilimumab) and targeted therapy (BRAF/MEK inhibitors for BRAF-mutated tumors) per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Sun protection — daily broad-spectrum SPF ≥30, protective clothing, avoid tanning beds; counsel family for genetic risk and skin self-exam.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("Brain metastases — headache, seizure, focal deficit; MRI for screening per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Immune-related adverse events with checkpoint inhibitors — colitis, hepatitis, pneumonitis, endocrinopathy; see ESMO IRAE management.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Recurrence — typically within 5 years; lifelong skin surveillance.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Squamous Cell Carcinoma

public enum SCCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "squamous-cell-carcinoma",
        title: "Squamous cell carcinoma (SCC, cutaneous)",
        subtitle: "Sun-exposed skin · risk in transplant patients · usually curable if early",
        nclexTags: skinR7,
        definition: AttributedProse(
            "Malignancy of epidermal keratinocytes; second most common skin cancer. Risk factors: chronic UV exposure, fair skin, prior radiation, chronic non-healing wounds (Marjolin's ulcer), HPV (genital, anal, head/neck), chronic immunosuppression (transplant, HIV) per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Keratinocyte transformation; precursors — actinic keratosis, Bowen disease (SCC in situ). Locally invasive; metastasis less common than melanoma but more common in high-risk subsets (lip, ear, transplant patients, immunocompromised, large/deep lesions).",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("Scaly, hyperkeratotic, ulcerated, or nodular plaque on sun-exposed skin (face, ears, hands, scalp).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Bleeding, tenderness, persistent non-healing.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Lip / ear / scalp lesions — higher metastatic risk per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Multiple lesions in transplant patients; counsel and screen yearly.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Punch / shave / excisional biopsy — depth and differentiation determine treatment.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Imaging for high-risk lesions (palpable LNs, deep invasion, perineural).", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Skin exam — total-body including scalp, ears, lip, hands, mucosal sites.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Lymph nodes (parotid for facial / ear lesions).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Immunosuppression status — transplant, HIV, chronic steroid; counsel on heightened risk.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("Surgical excision with appropriate margins (typically 4–6 mm low-risk; Mohs for high-risk / facial / recurrent) per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Topical 5-fluorouracil, imiquimod, cryotherapy for superficial / Bowen disease / actinic keratoses.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Radiation for non-surgical candidates; cemiplimab (PD-1 inhibitor) for advanced / metastatic per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Strict sun protection; treat actinic keratoses to prevent progression.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("Transplant patients — multiple, aggressive SCCs; chemoprevention (oral nicotinamide, retinoids) and frequent screening per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Marjolin's ulcer — SCC arising in chronic wounds; biopsy any non-healing wound.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Perineural invasion — paresthesia, facial pain; specialty referral.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Basal Cell Carcinoma

public enum BCCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "basal-cell-carcinoma",
        title: "Basal cell carcinoma (BCC)",
        subtitle: "Most common skin cancer · slow-growing · rarely metastasizes",
        nclexTags: skinR7,
        definition: AttributedProse(
            "Most common cancer in humans; arises from basal-layer keratinocytes. Locally invasive but metastasizes very rarely. Strong risk relationship with cumulative UV exposure and fair skin per primary source.",
            citationIDs: ["openrn_ms_round7"]
        ),
        pathophysiology: AttributedProse(
            "Cumulative UV damage → mutations in PTCH1 (hedgehog pathway) → unregulated keratinocyte proliferation. Subtypes — nodular (most common), superficial, morpheaform/sclerosing (more aggressive, ill-defined borders), pigmented.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("\"Pearly\" papule with telangiectasia, often on face, especially nose, eyelids, ears.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Rolled border with central ulceration (\"rodent ulcer\").", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Slow growth over months / years; bleeding, scab that won't heal.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Superficial subtype — pink scaly patch on trunk; can mimic eczema.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Shave or punch biopsy.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Total-body skin exam; history of multiple skin cancers; family history.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Cosmetic concern — facial sites; refer for Mohs.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("Surgical excision with appropriate margin (typically 4 mm low-risk); Mohs for facial / high-risk / recurrent / aggressive subtypes per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Topical (5-FU, imiquimod), curettage + electrodessication, cryotherapy for superficial / low-risk.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Hedgehog pathway inhibitors (vismodegib, sonidegib) for advanced / metastatic per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Daily broad-spectrum sunscreen; protective clothing.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("Recurrent / morpheaform — wider margins or Mohs; depth difficult to estimate clinically.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Multiple BCCs at young age — Gorlin syndrome (basal-cell nevus syndrome); refer for genetics.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Retinal Detachment

public enum RetinalDetachmentSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "retinal-detachment",
        title: "Retinal detachment",
        subtitle: "Ocular emergency · floaters / flashes / curtain · time-critical",
        nclexTags: eyeR7,
        definition: AttributedProse(
            "Separation of the neurosensory retina from the underlying retinal pigment epithelium. Three types: rhegmatogenous (most common; tear-related), tractional (e.g., diabetic retinopathy), exudative (inflammatory or vascular). Permanent vision loss without prompt repair per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Vitreous traction or fluid accumulation lifts the retina off the underlying RPE → photoreceptors lose blood / nutrient supply → progressive ischemic damage. Macula-on detachment carries better visual prognosis than macula-off.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("Sudden FLOATERS (\"cobwebs,\" \"black dots\").", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("FLASHES of light (photopsia).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Painless visual field loss — \"curtain\" or \"shadow\" coming across the visual field.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Decreased acuity if macula involved.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Risk factors — myopia, prior eye surgery, ocular trauma, prior detachment in fellow eye, diabetes (tractional).", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Dilated fundus exam by ophthalmology — gold standard.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Bedside ocular ultrasound (POCUS) — mobile retinal flap.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Visual acuity (each eye, with correction); confrontation fields.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Ophthalmology consult — EMERGENT for macula-threatening; urgent for macula-off.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("EMERGENT ophthalmology — surgical repair (pneumatic retinopexy, scleral buckle, vitrectomy) per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("POSITIONING per ophthalmologist — typically face-down / specific position to keep gas bubble against tear; strict adherence; sleeping position counseling.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Avoid air travel and high altitude with intraocular gas (gas EXPANSION → catastrophic IOP rise) per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Stop or hold anticoagulation per ophthalmology consult perioperatively.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("Macula-off detachment — visual prognosis worsens with each hour; do not delay specialty referral.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Recurrence; fellow-eye detachment within 1 year; counsel on warning signs.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Endophthalmitis after surgery — pain, redness, decreased vision; emergent return.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Central Retinal Artery Occlusion

public enum CRAOSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "crao",
        title: "Central retinal artery occlusion (CRAO)",
        subtitle: "\"Stroke of the eye\" · sudden painless monocular vision loss",
        nclexTags: eyeR7,
        definition: AttributedProse(
            "Acute occlusion of the central retinal artery causing sudden, painless, monocular vision loss. Considered an OPHTHALMIC EMERGENCY analogous to a stroke; some centers offer fibrinolytics within a tight window per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Embolic occlusion (carotid plaque, cardioembolic — AFib, valvular) is most common. Retinal ischemia causes inner-retinal infarction within minutes; visual recovery is rare without rapid reperfusion.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("Sudden, painless, severe monocular vision loss — often counting fingers or worse.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Cherry-red spot on fundoscopy (preserved choroidal supply at fovea against pale retina).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Afferent pupillary defect (relative APD / Marcus-Gunn pupil).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("History of vascular risk factors (HTN, DM, AFib, CAD, smoking).", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Bedside fundoscopy + emergent ophthalmology consult.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Stroke workup — CT angio of carotids, ECG, telemetry, echo, lipid panel, glucose, ESR/CRP (rule out giant-cell arteritis especially in elderly).", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Visual acuity each eye; APD; ophthalmoscopy.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("ECG, telemetry; carotid bruit; cardiac murmur.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("ESR/CRP and temporal artery exam — GCA workup if >50 yr per primary source.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("CALL OPHTHALMOLOGY + ACTIVATE STROKE PROTOCOL — some centers give IV tPA for CRAO within 4.5 hours of onset per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Conservative measures (limited evidence) while awaiting specialty: ocular massage, paracentesis, hyperventilation into a paper bag (CO2 vasodilation), high-flow O2, IV acetazolamide per provider.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Stroke workup and secondary prevention — antiplatelet, statin, BP/DM control, AFib anticoagulation, carotid evaluation.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Empirical high-dose steroids if GCA suspected pending biopsy per primary source.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("Bilateral / sequential CRAO — strongly suggests GCA in elderly; emergent steroids.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Concurrent stroke — CRAO and ipsilateral cerebral stroke share mechanism; full neuro workup.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Most patients have permanent severe vision loss — counseling and rehabilitation referral.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acute Otitis Media

public enum AOMSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-otitis-media",
        title: "Acute otitis media (AOM)",
        subtitle: "Most common peds infection · bulging TM · watch-and-wait or amoxicillin",
        nclexTags: entR7,
        definition: AttributedProse(
            "Acute bacterial or viral infection of the middle ear, most common in children 6–24 months. Rapid onset of middle-ear effusion + signs of inflammation. Most common bacterial pathogens: Streptococcus pneumoniae, non-typeable Haemophilus influenzae, Moraxella catarrhalis per primary source.",
            citationIDs: ["openrn_ms_round7", "cdc_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Eustachian-tube dysfunction (often viral URI) → fluid trapping → bacterial proliferation → middle-ear inflammation, effusion, pressure on tympanic membrane.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("Ear pain (otalgia), pulling at the ear in pre-verbal children.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Fever, irritability, sleep disturbance, decreased appetite.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Otoscopy — BULGING tympanic membrane (most specific finding); decreased mobility on pneumatic otoscopy; opaque, hyperemic, or purulent TM.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Otorrhea (drainage) if perforated.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — moderate-to-severe TM bulging OR new-onset otorrhea (not from external otitis) per AAP per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Otitis media with effusion (OME) — fluid WITHOUT acute inflammation; not treated with antibiotics.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Otoscopy with pneumatic insufflation; tympanometry if available.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Fever, hydration, irritability; rule out mastoiditis (tender postauricular swelling, ear pushed forward).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Hearing assessment if recurrent / chronic effusion.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("Pain control — acetaminophen or ibuprofen; avoid topical anesthetic drops if perforation possible.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("WATCH-AND-WAIT (observation 48–72 hr) is option for non-severe disease in children ≥6 months without otorrhea per AAP per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("First-line antibiotic — amoxicillin 80–90 mg/kg/day divided BID × 5–10 days (longer in <2 yr) per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("If failed amoxicillin, recent amoxicillin in past 30 days, or co-existing conjunctivitis (suggests H. flu) — amoxicillin-clavulanate.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("PCN allergy — cefdinir, cefuroxime, ceftriaxone IM (single dose).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Chronic / recurrent (≥3 in 6 mo or ≥4 in 1 yr) — ENT referral, possible tympanostomy tubes per primary source.", citationIDs: ["specialty_dx_round7"])
        ],
        watchFor: [
            AttributedBullet("MASTOIDITIS — postauricular tenderness, swelling, fever; emergency requiring IV antibiotics ± surgical drainage.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("PERFORATION — sudden pain relief with otorrhea; usually heals; topical drops appropriate.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Hearing loss / speech delay with recurrent / chronic effusion — audiology referral.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Vaccinate — pneumococcal conjugate vaccine reduces incidence per primary source.", citationIDs: ["cdc_dx_round7"])
        ],
        citations: [openrnMSr7, cdcDxR7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Otitis Externa

public enum OtitisExternaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "otitis-externa",
        title: "Otitis externa (\"swimmer's ear\")",
        subtitle: "External auditory canal infection · topical drops · pain with tragus pull",
        nclexTags: entR7,
        definition: AttributedProse(
            "Inflammation of the external auditory canal — typically acute bacterial (Pseudomonas aeruginosa, Staph aureus). Risk factors: water exposure, trauma (cotton swabs), eczema, narrow / cerumen-impacted canal per primary source.",
            citationIDs: ["openrn_ms_round7", "cdc_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Disruption of cerumen barrier → water retention or trauma → bacterial overgrowth in moist canal.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("Ear pain — WORSE with traction on the AURICLE / TRAGUS (key distinguishing finding from AOM).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Pruritus, fullness, decreased hearing.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Discharge — purulent or clear; canal erythema, edema, debris.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Tympanic membrane intact (visualize when canal allows).", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — pain with auricular traction, otoscopy showing canal inflammation; TM intact.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Differentiate from AOM (TM bulging) and from MALIGNANT otitis externa (diabetic / immunocompromised — granulation tissue, severe pain, cranial-nerve involvement; emergency).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Diabetes / immunosuppression status.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("Topical antibiotic + steroid drops (ciprofloxacin/dexamethasone, ofloxacin) for 7–10 days per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Acetic-acid drops can be used for prevention or mild cases.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("AVOID aminoglycoside drops if TM perforation suspected (ototoxicity).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Pain control; warm compresses; KEEP EAR DRY (no swimming) until healed.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Wick placement if canal too edematous to instill drops.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("MALIGNANT (NECROTIZING) OTITIS EXTERNA — diabetic / immunocompromised; severe pain, granulation tissue at bony cartilaginous junction, cranial-nerve palsies; ED / IV antibiotics per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Recurrence — counsel against cotton swabs, dry ears after swimming.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, cdcDxR7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sudden Sensorineural Hearing Loss

public enum SSNHLSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ssnhl",
        title: "Sudden sensorineural hearing loss (SSNHL)",
        subtitle: "Otologic emergency · steroids within 14 days · MRI for vestibular schwannoma",
        nclexTags: entR7,
        definition: AttributedProse(
            "Sudden hearing loss of ≥30 dB across at least 3 contiguous frequencies developing within 72 hours, of cochlear or retrocochlear origin. Idiopathic in most cases; high-priority workup includes excluding vestibular schwannoma per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Most cases idiopathic; proposed mechanisms include viral cochleitis, vascular ischemia, autoimmune. Identifiable causes (~10%): vestibular schwannoma, autoimmune inner-ear disease, Meniere's, ototoxic drugs, infection.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("SUDDEN unilateral hearing loss — patient may notice on awakening or while talking on phone.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Tinnitus (very common), ear fullness, vertigo (~40%).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Often misattributed by patients to wax or sinus — DELAY IS COMMON and reduces recovery chance.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Audiometry — confirms ≥30 dB loss across 3 contiguous frequencies.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Distinguish from CONDUCTIVE loss — Weber lateralizes to the BETTER ear in SSNHL; Rinne is positive (AC > BC) bilaterally.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("MRI of internal auditory canals to rule out vestibular schwannoma per primary source.", citationIDs: ["specialty_dx_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Tuning-fork tests (Weber + Rinne) at bedside; otoscopy to exclude wax / TM cause.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Neurologic exam, especially cranial nerves V, VII; cerebellar signs.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Onset, time course, ototoxic drug exposure, recent illness.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("EMERGENT ENT referral — workup and treatment within days of onset; recovery rate falls steeply after 14 days per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("High-dose oral corticosteroids (e.g., prednisone 60 mg PO daily × 7–14 days then taper) — first-line per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Intratympanic dexamethasone — alternative or salvage; given by ENT.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Hyperbaric oxygen — adjunctive for severe / persistent loss within 3 months per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Hearing aids / cochlear implant for residual loss; auditory rehabilitation.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("Vestibular schwannoma — gradual hearing loss, tinnitus, balance issues; MRI confirms; ENT / neurosurgery referral.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Bilateral SSNHL — strongly suggests autoimmune or systemic cause; rheumatology workup per primary source.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Up to 1/3 of patients fully recover; another 1/3 partially; 1/3 do not — early treatment is the modifiable factor.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Frailty Syndrome

public enum FrailtySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "frailty-syndrome",
        title: "Frailty syndrome",
        subtitle: "Geriatric vulnerability state · Fried phenotype + clinical frailty scale",
        nclexTags: geriR7,
        definition: AttributedProse(
            "A clinical state of increased vulnerability to stressors due to decline across multiple physiologic systems (musculoskeletal, immune, neuro, endocrine). Strongly predicts post-operative complications, hospitalization, falls, and mortality. Frailty is reversible / modifiable, especially in early stages per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Inflammaging, sarcopenia, neuroendocrine dysregulation → reduced reserve. Patients meet ≥3 of 5 Fried criteria: weight loss, exhaustion, low activity, slowness, weakness.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("Unintentional weight loss ≥10 lbs in past year.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Self-reported exhaustion (\"everything is an effort\").", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Weakness — low grip strength.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Slow walking speed (<0.8 m/s on 4-meter test).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Low physical activity.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Pre-frail = 1–2 criteria; Frail = 3+ criteria per primary source.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Fried phenotype (≥3 of 5 criteria) — most validated research tool.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Clinical Frailty Scale (CFS, Rockwood) 1–9 — bedside-friendly; useful in acute care decisions per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("FRAIL questionnaire (Fatigue, Resistance, Ambulation, Illness, Loss of weight) — quick screen.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Functional assessment — ADLs, IADLs, gait speed, grip strength, falls history.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Cognition — Mini-Cog, MoCA; depression — PHQ-2/9.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Nutritional status — weight loss, dentition, intake, albumin / prealbumin.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Polypharmacy review (Beers criteria).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Social — isolation, caregiver, home safety.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("Resistance and aerobic exercise — single most effective intervention; physical therapy referral.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Nutrition — adequate protein (1.0–1.2 g/kg/day; 1.2–1.5 in catabolic illness), vitamin D, supplementation per RD.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Deprescribe — reduce anticholinergics, sedatives, NSAIDs; align with goals of care.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Treat underlying conditions — anemia, depression, hypothyroidism, B12 deficiency, sleep apnea.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Comprehensive geriatric assessment in pre-op or hospitalized frail elderly improves outcomes per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Goals-of-care discussion in advanced frailty — high-stakes interventions may not align with patient priorities.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("Hospitalization-induced functional decline — \"hospital-acquired disability\" is common; mobilize early; minimize tethers.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Delirium superimposed on dementia — prevent with reorientation, sleep, hydration, mobility, sensory aids.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Frailty progresses with each acute illness; aggressive rehab post-hospital is critical.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acute Transplant Rejection

public enum TransplantRejectionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-transplant-rejection",
        title: "Acute transplant rejection",
        subtitle: "Cellular vs antibody-mediated · biopsy diagnosis · steroids ± ATG ± plasmapheresis",
        nclexTags: transplantR7,
        definition: AttributedProse(
            "Immunologic destruction of a transplanted organ within weeks to months of transplant. Two major types: T-cell-mediated (cellular) rejection and antibody-mediated rejection (AMR). Diagnosis is biopsy-based per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "T-cell-mediated — recipient T-cells recognize donor MHC → infiltrate and damage graft. Antibody-mediated — donor-specific antibodies bind allograft endothelium → complement activation, microvascular injury. Hyperacute (minutes) is rare with current crossmatching; acute (days-weeks-months); chronic (years).",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("Kidney — rising creatinine, decreased UOP, HTN, allograft tenderness, fever.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Liver — rising LFTs, jaundice, RUQ pain.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Heart — heart failure signs, dysrhythmia, fatigue, hypotension.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Lung — fever, dyspnea, declining FEV1, infiltrates.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("OFTEN ASYMPTOMATIC — surveillance labs and biopsy detect early.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BIOPSY is the gold standard — Banff criteria for kidney; ISHLT for heart; lung / liver protocols.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Donor-specific antibody (DSA) testing for AMR.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Trough levels of immunosuppressants — rule out subtherapy as precipitant.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Rule out infection (CMV, BK virus) — can mimic rejection.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs, allograft function (creatinine, LFTs, troponin, ABG, FEV1).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Adherence — verify medications taken and timing.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("New medication review — strong CYP3A4 inducers can drop CNI levels and trigger rejection.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("T-cell-mediated rejection — IV pulse methylprednisolone (typically 500–1000 mg × 3 days) per primary source; ATG for steroid-resistant.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Antibody-mediated rejection — plasmapheresis + IVIG ± rituximab ± bortezomib per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Optimize maintenance immunosuppression; address adherence barriers.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("PJP and CMV prophylaxis intensification with treatment of rejection.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("Infection during rejection treatment — markedly increased risk; surveillance.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Cytopenia from treatment; transfusion needs.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Hyperglycemia from steroids; insulin titration.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Long-term graft loss — chronic rejection, recurrent disease, drug toxicity.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CMV Reactivation / Disease

public enum CMVDiseaseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cmv-disease",
        title: "CMV reactivation / disease",
        subtitle: "Common post-transplant + HIV opportunistic infection · valganciclovir / ganciclovir",
        nclexTags: transplantR7,
        definition: AttributedProse(
            "Cytomegalovirus reactivation or primary infection causing tissue-invasive disease. Most common opportunistic infection after solid-organ transplant and a leading cause of morbidity. Risk highest with CMV-seronegative recipient + seropositive donor (D+/R−), heavy immunosuppression, ATG / OKT3 induction per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Latent CMV in lymphocytes reactivates under immunosuppression; or primary infection acquired from donor organ. Tissue invasion → end-organ disease (pneumonitis, colitis, hepatitis, retinitis, encephalitis). Indirect effects: increased rejection, opportunistic co-infection, PTLD.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("CMV syndrome — fever, malaise, leukopenia, thrombocytopenia, transaminitis.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("End-organ disease: pneumonitis (cough, hypoxia, infiltrates); colitis (diarrhea, GI bleeding); hepatitis (rising LFTs); retinitis (visual changes); encephalitis (AMS).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("HIV — typically with CD4 <50; retinitis is classic.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CMV PCR (quantitative) — viral load monitoring; identifies reactivation early per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Tissue biopsy with CMV inclusions / immunostain — confirms invasive disease.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Imaging guided by suspected end-organ involvement.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Immune status — transplant type / time post-tx, induction agent, CMV serostatus pre-tx.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Trend CBC, LFTs, creatinine, CMV PCR.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Specific organ assessment based on symptoms (CXR, endoscopy, ophtho exam, MRI brain).", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("Valganciclovir PO 900 mg BID × 21+ days OR IV ganciclovir 5 mg/kg q12h for severe / GI / CNS disease per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Foscarnet or cidofovir for ganciclovir-resistant or refractory disease (nephrotoxic / electrolyte issues).", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Prophylaxis vs preemptive strategies post-transplant per program — high-risk patients (D+/R−) typically receive prolonged valganciclovir prophylaxis.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("REDUCE immunosuppression in concert with transplant team (balance against rejection risk).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("CMV-negative blood products in CMV-seronegative transplant recipients.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("Bone-marrow suppression from valganciclovir / ganciclovir — neutropenia common; G-CSF support.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Concurrent rejection — careful immunosuppression dance; transplant team-driven.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Resistance — typically after prolonged ganciclovir; switch to foscarnet, cidofovir, or maribavir.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - GVHD

public enum GVHDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "gvhd",
        title: "Graft-vs-host disease (GVHD)",
        subtitle: "Allogeneic stem-cell complication · skin / GI / liver triad · acute vs chronic",
        nclexTags: transplantR7,
        definition: AttributedProse(
            "Donor T-cells recognize recipient tissues as foreign and attack them — primarily skin, GI tract, and liver. Acute GVHD typically occurs within 100 days post-allogeneic stem-cell transplant; chronic GVHD develops later and resembles autoimmune disease per primary source.",
            citationIDs: ["openrn_ms_round7", "specialty_dx_round7"]
        ),
        pathophysiology: AttributedProse(
            "Conditioning regimen damages recipient tissues → release of cytokines + antigens → activation of donor T-cells in the graft → tissue infiltration and damage. Risk factors: HLA mismatch, older donor / recipient, peripheral-blood vs marrow stem-cell source, prior GVHD.",
            citationIDs: ["openrn_ms_round7"]
        ),
        presentation: [
            AttributedBullet("ACUTE: skin — maculopapular rash often starting on palms / soles / face / ears, can progress to TEN-like.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("ACUTE: GI — secretory diarrhea (large volume), abdominal pain, ileus, GI bleeding.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("ACUTE: liver — cholestasis, jaundice, rising bilirubin and alkaline phosphatase.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("CHRONIC: lichen-planus or sclerodermatous skin, dry eyes / mouth, oral lichen planus, esophageal strictures, BO syndrome (lung), joint contractures, fasciitis.", citationIDs: ["openrn_ms_round7"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical + biopsy — skin, GI, liver biopsy confirms diagnosis and grades severity.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Acute GVHD severity grading — based on extent of skin, GI, and liver involvement (overall grade I-IV).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Rule out infection (CMV colitis, drug rash) — confounders.", citationIDs: ["openrn_ms_round7"])
        ],
        priorityAssessments: [
            AttributedBullet("Skin exam — total-body, document distribution and extent (rule of nines).", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Stool volume, blood, abdominal exam; trend bilirubin.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Hydration, electrolytes — large-volume losses; albumin loss.", citationIDs: ["openrn_ms_round7"])
        ],
        commonInterventions: [
            AttributedBullet("First-line acute GVHD — high-dose IV methylprednisolone (1–2 mg/kg/day) per primary source; plus continued calcineurin inhibitor.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Steroid-refractory acute GVHD — ruxolitinib (FDA-approved); other options include ATG, ECP, mTOR inhibitors per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Chronic GVHD — steroids + calcineurin inhibitor; ruxolitinib, ibrutinib, belumosudil, ECP, rituximab per primary source.", citationIDs: ["specialty_dx_round7"]),
            AttributedBullet("Supportive — wound care for skin, hyperalimentation for severe gut GVHD, bile-acid resins for cholestatic itch.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Infection prophylaxis — PJP, CMV, fungal — prolonged in steroid-treated patients per primary source.", citationIDs: ["openrn_ms_round7"])
        ],
        watchFor: [
            AttributedBullet("Severe acute GVHD — mortality 30–50% at higher grades; ICU-level supportive care.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Opportunistic infection — leading cause of mortality; surveillance and prophylaxis are essential.", citationIDs: ["openrn_ms_round7"]),
            AttributedBullet("Chronic GVHD — leading cause of late morbidity / mortality; multidisciplinary care.", citationIDs: ["openrn_ms_round7"])
        ],
        citations: [openrnMSr7, specialtyDxR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}
