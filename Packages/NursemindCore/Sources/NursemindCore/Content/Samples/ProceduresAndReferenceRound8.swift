import Foundation

// Curator-model procedure + reference entries (round 8 expansion).
// Sources: Open RN Skills + Health Alterations (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), CDC + ACOG + USPSTF + ACR concept citations.

private let openrnSkR8p = CitationSource(
    id: "openrn_skills_round8",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=cast+traction+arthrocentesis",
    lastRetrieved: "2026-05-04"
)
private let openrnHar8 = CitationSource(
    id: "openrn_ha_round8_proc",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cast+gout+contraception",
    lastRetrieved: "2026-05-04"
)
private let openstaxSkR8p = CitationSource(
    id: "openstax_skills_round8",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let cdcRefR8 = CitationSource(
    id: "cdc_ref_round8",
    shortName: "CDC US Medical Eligibility Criteria for Contraception (USMEC)",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/contraception/hcp/usmec/",
    lastRetrieved: "2026-05-04"
)
private let acsUSPSTFConceptR8 = CitationSource(
    id: "acs_uspstf_round8",
    shortName: "ACS / USPSTF cancer-screening recommendations (concept citation)",
    publisher: "American Cancer Society · US Preventive Services Task Force",
    license: .factCitationOnly,
    url: "https://www.cancer.org/health-care-professionals/cancer-screening-guidelines.html",
    lastRetrieved: "2026-05-04"
)
private let acrGoutConceptR8 = CitationSource(
    id: "acr_gout_round8",
    shortName: "ACR Gout management guidelines (concept citation)",
    publisher: "American College of Rheumatology",
    license: .factCitationOnly,
    url: "https://rheumatology.org/clinical-practice-guidelines",
    lastRetrieved: "2026-05-04"
)

private let safetyR8 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let mobilityR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility)
private let gynRefR8 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .safety)
private let cancerScreenR8 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .cellularRegulation)
private let goutRefR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility)

// MARK: - Cast Care

public enum CastCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "cast-care",
        title: "Cast care + neurovascular checks",
        subtitle: "Plaster vs fiberglass · 6 P's · drying / handling · skin care",
        nclexTags: mobilityR8,
        indications: AttributedProse(
            "Immobilization after fracture, soft-tissue injury, or post-operative orthopedic procedure. Nursing care focuses on monitoring for complications (compartment syndrome, neurovascular compromise, pressure injury, infection), proper handling during drying, and patient education per primary source.",
            citationIDs: ["openrn_skills_round8", "openstax_skills_round8"]
        ),
        contraindications: AttributedProse(
            "Active infection at the casting site (use external fixation or splinting); severe edema (use splint until edema resolves); known plaster / fiberglass allergy.",
            citationIDs: ["openrn_skills_round8"]
        ),
        equipment: [
            AttributedBullet("Plaster or fiberglass cast materials (applied by provider / cast technician).", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Cotton padding (Webril); stockinette; gloves.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Cast saw and spreader for removal (NEVER attempt cast removal at home).", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Pillows for elevation; sling for upper extremity.", citationIDs: ["openrn_skills_round8"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order; assess pre-cast neurovascular status (baseline).", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Skin assessment — wounds, abrasions, edema; clean site.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Pain assessment + medication.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Educate patient + family on what to expect and home care.", citationIDs: ["openrn_skills_round8"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Assist with cast application", body: "Position extremity per provider; support during application; assess comfort.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 2, title: "Drying — plaster", body: "Plaster takes 24–48 hours to dry fully. Handle ONLY with PALMS (not fingertips — indents); leave UNCOVERED in well-ventilated room; use fan if needed; do NOT use heat (uneven drying). Position on PILLOWS to prevent flat spots.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 3, title: "Drying — fiberglass", body: "Fiberglass dries within ~30 minutes; weight-bearing per provider in 30 min; lighter and more durable than plaster.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 4, title: "Neurovascular checks (\"6 P's\")", body: "Pain (out of proportion = compartment syndrome), Pallor / color, Pulse (distal), Paresthesia, Paralysis (motor), Pressure / temperature. Check q1h for first 24 hr, then per protocol per primary source.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 5, title: "Elevation + ice", body: "Elevate above the level of the heart for first 24–48 hr to reduce edema. Ice packs to cast surface (not directly on skin under cast) for 15–20 min q1–2h while awake first 24–48 hr per primary source.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 6, title: "Skin care + petaling", body: "PETAL the cast edges with tape to prevent skin irritation. Inspect skin around edges daily for redness or breakdown. Do NOT scratch under the cast with sharp objects.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 7, title: "Patient + family education", body: "Keep cast dry (waterproof cover for showering, or sponge bath); never insert objects to scratch; report drainage, foul odor, fever, increased pain, numbness, or color change immediately. No driving with arm cast on dominant side.", citationIDs: ["openrn_skills_round8"])
        ],
        postProcedure: [
            AttributedBullet("Document baseline + ongoing neurovascular checks; pain assessment and intervention.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Schedule follow-up for cast wedging, replacement, or removal.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Provide written discharge instructions including warning signs.", citationIDs: ["openrn_skills_round8"])
        ],
        documentation: [
            AttributedBullet("Type of cast, location, date applied, baseline + serial neurovascular checks, edema, pain, education provided, follow-up plan.", citationIDs: ["openrn_skills_round8"])
        ],
        watchFor: [
            AttributedBullet("COMPARTMENT SYNDROME — pain OUT OF PROPORTION to injury, paresthesia, pain on passive stretch, pallor, pulselessness (LATE), paralysis (LATE); EMERGENCY — bivalve cast or fasciotomy. Do NOT delay for imaging if clinical findings present.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Cast pressure injury — burning, increased pain over a focal point; if present, bivalve and inspect.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Cast infection — drainage, foul odor, fever; window cast or remove for inspection.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("DVT in immobilized lower-extremity cast — pain, warmth, swelling above cast.", citationIDs: ["openrn_skills_round8"])
        ],
        citations: [openrnSkR8p, openstaxSkR8p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Traction Setup

public enum TractionSetupSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "traction-setup",
        title: "Traction setup (skin / skeletal)",
        subtitle: "Continuous pull · alignment · pin care · neurovascular checks",
        nclexTags: mobilityR8,
        indications: AttributedProse(
            "Maintain alignment and reduce muscle spasm for fractures, dislocations, and post-operative immobilization. Bryant traction (peds <2 yr or <30 lb), Buck (skin, hip), Russell (knee/femur), skeletal traction (pin through bone, heavier weights, longer duration) per primary source.",
            citationIDs: ["openrn_skills_round8", "openstax_skills_round8"]
        ),
        contraindications: AttributedProse(
            "Active skin infection at planned skin-traction site; tape allergy; uncooperative patient (relative); skeletal traction requires sterile pin insertion by provider.",
            citationIDs: ["openrn_skills_round8"]
        ),
        equipment: [
            AttributedBullet("Traction frame, ropes, pulleys, weights — verify free hanging.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Skin traction — boot or wrap (Buck) per kit; foam padding; tape.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Skeletal traction — sterile pin insertion supplies (provider); pin-care supplies post-insertion.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Trapeze bar over bed for upper-body strength assist.", citationIDs: ["openrn_skills_round8"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order — type of traction, weight, duration.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Baseline neurovascular check; skin assessment; pain assessment.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Patient + family education on how the system works and what NOT to touch.", citationIDs: ["openrn_skills_round8"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Apply skin traction", body: "Wrap or boot per system; ensure foam padding over bony prominences; secure rope to weight without slack.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 2, title: "Skeletal pin insertion (provider)", body: "Sterile field; local anesthesia; pin through bone at appropriate site; secure to traction frame.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 3, title: "Hang weights freely", body: "Weights MUST hang FREELY off the bed, not resting on the floor or against the bed frame. Verify ropes are in pulleys without binding. Knots in ropes should be intact.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 4, title: "Maintain CONTINUOUS pull", body: "Do NOT lift, remove, or alter weights without provider order. If patient slides down in bed, reposition with help — keep counter-traction (body weight against pull).", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 5, title: "Assess + reposition", body: "Neurovascular checks q1–2h initially; reposition every 2 hr (turning side-to-side per traction tolerance). Heel and sacral pressure-injury prevention is critical.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 6, title: "Pin care (skeletal)", body: "Pin-site care per facility protocol — typically saline cleansing daily; assess for redness, drainage, loosening, foul odor; report any change.", citationIDs: ["openrn_skills_round8"])
        ],
        postProcedure: [
            AttributedBullet("Trapeze use, deep breathing, isotonic exercises, range of motion to unaffected joints.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("DVT prophylaxis — mechanical + pharmacologic per provider; foot pumps.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Bowel + bladder care — high fiber, hydration, scheduled toileting; Valsalva precautions for some surgical patients.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Psychosocial support — long immobilization is taxing; visitors, mental engagement.", citationIDs: ["openrn_skills_round8"])
        ],
        documentation: [
            AttributedBullet("Type of traction, weight, neurovascular checks, pin-site appearance, skin integrity, pain, mobility, patient response.", citationIDs: ["openrn_skills_round8"])
        ],
        watchFor: [
            AttributedBullet("PIN-SITE INFECTION → osteomyelitis; redness, drainage, fever; cultures + antibiotics per primary source.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("PRESSURE INJURY — heels, sacrum, occiput; preventive measures essential.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("DVT / fat embolism / pulmonary embolism — long-bone fracture risk; respiratory symptoms warrant urgent workup.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("NEUROVASCULAR COMPROMISE — same 6 P's; report immediately and consider weight reduction per provider.", citationIDs: ["openrn_skills_round8"])
        ],
        citations: [openrnSkR8p, openstaxSkR8p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Joint Aspiration Assist

public enum ArthrocentesisAssistSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "arthrocentesis-assist",
        title: "Joint aspiration assist (arthrocentesis)",
        subtitle: "Diagnostic synovial fluid · therapeutic decompression / steroid injection",
        nclexTags: safetyR8,
        indications: AttributedProse(
            "Diagnostic — suspected septic arthritis, crystal arthropathy (gout, pseudogout), unexplained monoarticular effusion, hemarthrosis. Therapeutic — decompression of large effusion, intra-articular corticosteroid or hyaluronic acid injection per primary source.",
            citationIDs: ["openrn_skills_round8", "openstax_skills_round8"]
        ),
        contraindications: AttributedProse(
            "Cellulitis or skin infection over the planned puncture site (can introduce bacteria into joint); known prosthetic joint (orthopedics performs); coagulopathy (relative — correct first per provider); patient refusal.",
            citationIDs: ["openrn_skills_round8"]
        ),
        equipment: [
            AttributedBullet("Sterile gloves, drape, mask; chlorhexidine prep; lidocaine 1% with syringe and 25-G needle; sterile towel.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("18- or 20-G needle (joint-dependent); 10-mL syringes (often 2–3 for large effusion); larger 20–60-mL syringe for bulk drainage.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Specimen tubes — sterile container for cell count + Gram stain + culture; tube for crystal analysis (lavender or sterile); blood-culture bottles for low-yield cases per facility.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Bandage; ice pack post-procedure.", citationIDs: ["openrn_skills_round8"])
        ],
        preProcedure: [
            AttributedBullet("Verify order; informed consent; review coagulation labs / anticoagulants.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Position joint per access (e.g., knee with slight flexion, supine).", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Mark planned puncture site with provider; bedside ultrasound when available improves accuracy.", citationIDs: ["openrn_skills_round8"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + sterile setup", body: "Hand hygiene; sterile gloves; chlorhexidine prep; allow to air-dry; sterile drape.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 2, title: "Local anesthesia", body: "Lidocaine to skin and subcutaneous tissue along planned tract.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 3, title: "Joint puncture", body: "Provider inserts needle perpendicular to joint capsule; aspirates fluid into syringe. Note color and viscosity (clear straw = noninflammatory; cloudy = inflammatory; opaque purulent = septic; bloody = hemarthrosis or traumatic tap).", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 4, title: "Sample distribution", body: "Distribute fluid per ordered tests — cell count + differential, Gram stain + culture (sterile container or blood-culture bottle for higher yield), crystal analysis (polarized microscopy), glucose / protein per primary source.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 5, title: "Therapeutic injection (optional)", body: "After diagnostic aspiration, provider may inject corticosteroid or hyaluronic acid through the same needle.", citationIDs: ["openrn_skills_round8"]),
            ProcedureStep(number: 6, title: "Withdraw + bandage", body: "Apply pressure; bandage; ice pack 15–20 min.", citationIDs: ["openrn_skills_round8"])
        ],
        postProcedure: [
            AttributedBullet("Vital signs once; assess pain, range of motion.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Counsel rest of joint 24–48 hr; activity per provider.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Watch for warning signs of post-procedure infection — fever, increasing pain, redness, warmth, swelling.", citationIDs: ["openrn_skills_round8"])
        ],
        documentation: [
            AttributedBullet("Joint, fluid color / volume / clarity, samples sent, therapeutic agent injected if any, patient tolerance.", citationIDs: ["openrn_skills_round8"])
        ],
        watchFor: [
            AttributedBullet("SEPTIC ARTHRITIS — fever + acute monoarthritis = septic until proven otherwise; cell count >50,000 with PMN predominance and positive Gram stain confirm; emergent IV antibiotics + orthopedic washout.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Iatrogenic infection (rare with sterile technique) — same warning signs as septic arthritis.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Post-injection flare (\"steroid flare\") — pain 24–72 hr post-injection from crystal-induced synovitis; resolves spontaneously.", citationIDs: ["openrn_skills_round8"]),
            AttributedBullet("Bleeding — typically minor; apply pressure; consider holding anticoagulant per provider risk-benefit pre-procedure.", citationIDs: ["openrn_skills_round8"])
        ],
        citations: [openrnSkR8p, openstaxSkR8p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Contraception Methods Reference

public enum ContraceptionMethodsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "contraception-methods",
        title: "Contraception methods reference",
        subtitle: "Tier-by-tier · efficacy · counseling considerations",
        eyebrow: "REFERENCE · WOMEN'S HEALTH",
        nclexTags: gynRefR8,
        sections: [
            .prose(title: "Source + framework", AttributedProse(
                "CDC's US Medical Eligibility Criteria for Contraceptive Use (USMEC) categorizes safety of methods by individual condition (Category 1 — no restriction, Category 4 — unacceptable risk). Method effectiveness is best understood by tier — most-effective tier (LARC + sterilization), middle tier (hormonal injectables / pills / patch / ring), least-effective tier (barriers + behavioral) per primary source.",
                citationIDs: ["cdc_ref_round8"]
            )),
            .keyValueTable(title: "Tier 1 — Most effective (<1% per year)", [
                KeyValueRow(key: "Implant (etonogestrel — Nexplanon)", value: "0.05% / yr typical use; 3-year duration; bleeding pattern can be irregular"),
                KeyValueRow(key: "Levonorgestrel IUD (Mirena, Liletta, Kyleena, Skyla)", value: "<0.5% / yr; 3–8 yr duration depending on product; menses often light or absent over time"),
                KeyValueRow(key: "Copper IUD (Paragard)", value: "0.8% / yr; 10-yr duration; non-hormonal; HEAVIER and CRAMPIER menses (vs LNG IUD); also emergency contraception within 5 days"),
                KeyValueRow(key: "Female sterilization (tubal ligation / salpingectomy)", value: "Permanent"),
                KeyValueRow(key: "Vasectomy", value: "Permanent")
            ]),
            .keyValueTable(title: "Tier 2 — Middle effectiveness (~6–9% per year typical use)", [
                KeyValueRow(key: "Combined oral contraceptive", value: "~7% typical / ~0.3% perfect; daily dosing; CV / VTE risk profile"),
                KeyValueRow(key: "Progestin-only pill (mini-pill)", value: "Strict 3-hour window; suitable for breastfeeding"),
                KeyValueRow(key: "Patch (Ortho Evra / Xulane)", value: "Weekly application; same risk profile as COC"),
                KeyValueRow(key: "Ring (NuvaRing / Annovera)", value: "Monthly; same class as COC"),
                KeyValueRow(key: "Depot medroxyprogesterone (Depo-Provera)", value: "IM / SQ every 12–13 weeks; bone-density loss")
            ]),
            .keyValueTable(title: "Tier 3 — Least effective (~12–28% per year typical use)", [
                KeyValueRow(key: "External condom", value: "13% / yr typical; STI protection — only method providing"),
                KeyValueRow(key: "Internal condom", value: "21% / yr typical; STI protection"),
                KeyValueRow(key: "Diaphragm + spermicide", value: "17% / yr"),
                KeyValueRow(key: "Cervical cap", value: "16–32% / yr (depends on parity)"),
                KeyValueRow(key: "Spermicide alone", value: "21% / yr"),
                KeyValueRow(key: "Withdrawal", value: "20% / yr"),
                KeyValueRow(key: "Fertility-awareness methods", value: "2–23% per method and use")
            ]),
            .keyValueTable(title: "Emergency contraception", [
                KeyValueRow(key: "Levonorgestrel 1.5 mg PO (Plan B)", value: "OTC; less effective above BMI 26; up to 72 hr"),
                KeyValueRow(key: "Ulipristal acetate 30 mg PO (ella)", value: "Prescription; effective up to 120 hr; better at higher BMI"),
                KeyValueRow(key: "Copper IUD insertion within 5 days", value: "Most effective EC; provides ongoing contraception per primary source"),
                KeyValueRow(key: "Yuzpe regimen (high-dose COC)", value: "Less effective; more nausea; backup option")
            ]),
            .bullets(title: "Counseling considerations", [
                AttributedBullet("Use SHARED decision-making — efficacy + lifestyle + comorbidities + STI risk + future pregnancy plans.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("USMEC Category 3/4 conditions for COC — VTE history, smoking + age ≥35, severe HTN, migraine with aura, current breast cancer, severe liver disease.", citationIDs: ["cdc_ref_round8"]),
                AttributedBullet("Lactating — progestin-only methods preferred; avoid COC in first 21 days postpartum (VTE risk).", citationIDs: ["cdc_ref_round8"]),
                AttributedBullet("STI protection — condoms remain the only method; counsel dual protection for at-risk patients.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Discontinuation — fertility returns immediately for most methods; depot may take 6–12 months.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("CYP3A4 inducers + COC — backup method or alternative; lamotrigine + COC requires special consideration.", citationIDs: ["openrn_ha_round8_proc"])
            ])
        ],
        citations: [cdcRefR8, openrnHar8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cervical Cancer Screening

public enum CervicalScreeningSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cervical-cancer-screening",
        title: "Cervical cancer screening",
        subtitle: "Pap + HPV co-testing · USPSTF / ACS framework · concept reference",
        eyebrow: "REFERENCE · WOMEN'S HEALTH",
        nclexTags: cancerScreenR8,
        sections: [
            .prose(title: "Source + scope", AttributedProse(
                "Cervical cancer screening recommendations are issued by USPSTF, ACS, and ACOG. THIS IS A CONCEPT REFERENCE — verify the current published recommendation when applying clinically. Screening relies on cytology (Pap), high-risk HPV (hrHPV) testing, or both per primary source.",
                citationIDs: ["acs_uspstf_round8"]
            )),
            .keyValueTable(title: "USPSTF 2018 recommendations (under continued review)", [
                KeyValueRow(key: "Age 21–29", value: "Cytology alone every 3 years"),
                KeyValueRow(key: "Age 30–65", value: "ANY of: cytology alone every 3 yr, hrHPV alone every 5 yr, OR co-testing every 5 yr"),
                KeyValueRow(key: "Age <21", value: "Do NOT screen"),
                KeyValueRow(key: "Age >65 with adequate prior negative screening + no high-risk history", value: "Discontinue"),
                KeyValueRow(key: "Hysterectomy with cervix removed for benign reasons + no high-risk history", value: "Discontinue")
            ]),
            .keyValueTable(title: "ACS 2020 — primary HPV preferred", [
                KeyValueRow(key: "Age 25–65", value: "Primary hrHPV testing every 5 years (preferred)"),
                KeyValueRow(key: "Acceptable alternative", value: "Co-testing every 5 yr OR cytology alone every 3 yr"),
                KeyValueRow(key: "Age <25", value: "ACS recommends starting at 25 (vs USPSTF 21)")
            ]),
            .keyValueTable(title: "Higher-risk populations (more frequent or earlier screening)", [
                KeyValueRow(key: "HIV", value: "Begin at sexual debut or by age 21; cytology annually for 3 years then per CD4 / risk per primary source"),
                KeyValueRow(key: "DES exposure in utero", value: "More intensive surveillance"),
                KeyValueRow(key: "Immunocompromised (transplant, autoimmune on immunosuppression)", value: "More intensive"),
                KeyValueRow(key: "Prior CIN 2/3 / AIS / cervical cancer", value: "Surveillance per oncology / GYN")
            ]),
            .keyValueTable(title: "HPV vaccination", [
                KeyValueRow(key: "Routine age", value: "11–12 (can start at 9)"),
                KeyValueRow(key: "Catch-up", value: "Through age 26; shared decision-making 27–45"),
                KeyValueRow(key: "Doses", value: "<15 yr at first dose: 2-dose series. ≥15 yr: 3-dose series"),
                KeyValueRow(key: "Effect on screening", value: "Vaccination DOES NOT change screening recommendations")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Verify last screening; ensure proper test ordered for age.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Counsel on HPV vaccination — even after exposure (still benefits against other strains).", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Reassure about minor discomfort during Pap; provide privacy and patient-controlled positioning.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Educate that abnormal results are common and usually do not represent cancer; follow-up is essential.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Coordinate timely follow-up for ASC-US, LSIL, HSIL, AGC results per ASCCP guidelines.", citationIDs: ["acs_uspstf_round8"])
            ])
        ],
        citations: [acsUSPSTFConceptR8, openrnHar8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Breast Cancer Screening

public enum BreastScreeningSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "breast-cancer-screening",
        title: "Breast cancer screening",
        subtitle: "Mammography · USPSTF / ACS / NCCN · concept reference",
        eyebrow: "REFERENCE · WOMEN'S HEALTH",
        nclexTags: cancerScreenR8,
        sections: [
            .prose(title: "Source + scope", AttributedProse(
                "Breast cancer screening recommendations differ across major U.S. organizations (USPSTF, ACS, NCCN, ACR). THIS IS A CONCEPT REFERENCE — verify the current published recommendations per organization when applying clinically.",
                citationIDs: ["acs_uspstf_round8"]
            )),
            .keyValueTable(title: "USPSTF 2024 recommendations", [
                KeyValueRow(key: "Average risk, age 40–74", value: "Biennial mammography (lowered START age from 50 to 40 in 2024 update)"),
                KeyValueRow(key: "Age ≥75", value: "Insufficient evidence; individualize"),
                KeyValueRow(key: "Supplemental screening (US, MRI) for dense breasts", value: "Insufficient evidence per USPSTF")
            ]),
            .keyValueTable(title: "ACS recommendations", [
                KeyValueRow(key: "Age 40–44", value: "Option to start annual mammography"),
                KeyValueRow(key: "Age 45–54", value: "Annual mammography"),
                KeyValueRow(key: "Age ≥55", value: "Biennial OR continued annual; continue while in good health and life expectancy ≥10 yr")
            ]),
            .keyValueTable(title: "High-risk populations (NCCN-aligned framework)", [
                KeyValueRow(key: "BRCA1/2 carriers", value: "Annual mammography + MRI starting age 25–30 per primary source"),
                KeyValueRow(key: "≥20% lifetime risk by family history (Tyrer-Cuzick / Gail >20%)", value: "Add annual MRI to mammography"),
                KeyValueRow(key: "Prior chest radiation 10–30 yr (e.g., Hodgkin)", value: "Annual mammography + MRI starting 8–10 yr after treatment"),
                KeyValueRow(key: "Personal history of breast cancer", value: "Annual mammography ± MRI per oncology")
            ]),
            .bullets(title: "Risk reduction in high-risk women", [
                AttributedBullet("Tamoxifen, raloxifene, aromatase inhibitors per primary source for risk reduction in selected high-risk women.", citationIDs: ["acs_uspstf_round8"]),
                AttributedBullet("Risk-reducing bilateral salpingo-oophorectomy and / or mastectomy in BRCA1/2 carriers per primary source.", citationIDs: ["acs_uspstf_round8"]),
                AttributedBullet("Lifestyle — alcohol moderation, weight management, exercise.", citationIDs: ["openrn_ha_round8_proc"])
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Identify patients with strong family history early; refer for genetic counseling per primary source.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Counsel on shared decision-making; discuss benefits and limitations (false positives, overdiagnosis).", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Educate on clinical breast self-awareness — report new lumps, skin changes, nipple changes.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Coordinate timely follow-up for BI-RADS 0 / 4 / 5 results.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Address barriers — language, transportation, cost; many community programs offer free / low-cost mammography.", citationIDs: ["openrn_ha_round8_proc"])
            ])
        ],
        citations: [acsUSPSTFConceptR8, openrnHar8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Gout Management

public enum GoutManagementSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "gout-management",
        title: "Gout — flare and chronic management",
        subtitle: "ACR framework · acute flare → urate-lowering · prophylaxis bridge",
        eyebrow: "REFERENCE · RHEUMATOLOGY",
        nclexTags: goutRefR8,
        sections: [
            .prose(title: "Source + framework", AttributedProse(
                "American College of Rheumatology framework distinguishes acute flare management from chronic urate-lowering. Goal of long-term management is sustained serum urate <6 mg/dL (or <5 with tophi). THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["acr_gout_round8"]
            )),
            .keyValueTable(title: "Acute flare — first-line agents (any one)", [
                KeyValueRow(key: "NSAID", value: "Naproxen 500 mg PO BID; ibuprofen 600–800 mg PO TID; indomethacin 50 mg TID — until 1–2 days after symptom resolution"),
                KeyValueRow(key: "Colchicine", value: "1.2 mg PO at first sign, then 0.6 mg PO 1 hour later (max 1.8 mg in first hour); then 0.6 mg BID until flare resolves per primary source"),
                KeyValueRow(key: "Glucocorticoid", value: "Prednisone 30–40 mg PO daily × 5 days OR intra-articular for monoarthritis OR IM for polyarthritis or NPO patients"),
                KeyValueRow(key: "IL-1 inhibitor (anakinra, canakinumab)", value: "Refractory or contraindications to above per primary source")
            ]),
            .keyValueTable(title: "When to initiate urate-lowering therapy (ULT)", [
                KeyValueRow(key: "≥2 flares per year", value: "Strong recommendation"),
                KeyValueRow(key: "Tophi", value: "Strong recommendation"),
                KeyValueRow(key: "CKD ≥ stage 3", value: "Strong recommendation"),
                KeyValueRow(key: "Past urolithiasis", value: "Strong recommendation"),
                KeyValueRow(key: "After first flare with conditional indications", value: "Conditional recommendation per ACR")
            ]),
            .keyValueTable(title: "Urate-lowering therapy — first-line", [
                KeyValueRow(key: "Allopurinol", value: "First-line for ALL patients per ACR; start LOW (100 mg PO daily; 50 mg if CKD); titrate by 100 mg every 2–5 weeks to target serum urate <6 mg/dL; max 800 mg/day per primary source"),
                KeyValueRow(key: "HLA-B*5801 testing", value: "Before allopurinol in high-risk ethnic groups (Asian, Korean, Han Chinese, African) — SJS/TEN risk")
            ]),
            .keyValueTable(title: "Second-line / alternative ULT", [
                KeyValueRow(key: "Febuxostat", value: "Alternative xanthine oxidase inhibitor; FDA boxed warning regarding CV mortality vs allopurinol per primary source"),
                KeyValueRow(key: "Probenecid", value: "Uricosuric; useful if allopurinol intolerant and good renal function (CrCl >50)"),
                KeyValueRow(key: "Pegloticase", value: "Recombinant uricase IV every 2 weeks — refractory tophaceous gout"),
                KeyValueRow(key: "Lesinurad", value: "Combined with allopurinol or febuxostat for refractory cases")
            ]),
            .keyValueTable(title: "Anti-flare prophylaxis during ULT initiation", [
                KeyValueRow(key: "Duration", value: "First 3–6 months of ULT initiation per primary source"),
                KeyValueRow(key: "Options", value: "Low-dose colchicine 0.6 mg PO daily–BID; OR low-dose NSAID; OR low-dose prednisone"),
                KeyValueRow(key: "Reason", value: "ULT initiation can paradoxically PRECIPITATE flares as urate is mobilized")
            ]),
            .bullets(title: "Lifestyle + comorbidity management", [
                AttributedBullet("Reduce alcohol (especially BEER), red meat, organ meat, sweetbreads, sugary beverages (HFCS).", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Encourage low-fat dairy, cherries, coffee — modest evidence for flare reduction per primary source.", citationIDs: ["acr_gout_round8"]),
                AttributedBullet("Weight loss reduces hyperuricemia and flare risk.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Review meds — replace thiazides with alternative antihypertensive when feasible; aspirin 81 mg generally continued for cardiovascular indication.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Co-manage cardiovascular disease, diabetes, CKD — gout patients have markedly elevated CV mortality.", citationIDs: ["openrn_ha_round8_proc"])
            ]),
            .bullets(title: "Patient teaching", [
                AttributedBullet("ULT is LIFELONG once started — discontinuing causes flare recurrence.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Continue ULT through flares — do NOT stop allopurinol during a flare per primary source.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Treat early in flare — symptoms within 24 hours; have rescue medication on hand.", citationIDs: ["openrn_ha_round8_proc"]),
                AttributedBullet("Hydration; avoid dehydration triggers (alcohol, hot weather without fluids).", citationIDs: ["openrn_ha_round8_proc"])
            ])
        ],
        citations: [acrGoutConceptR8, openrnHar8],
        lastSourceFidelityReview: "2026-05-04"
    )
}
