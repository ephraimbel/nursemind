import Foundation

// Curator-model procedures + reference (round 22 — ENT / ophth / derm procedures + decision rules).

private let openrnPRR22 = CitationSource(
    id: "openrn_pr_round22",
    shortName: "Open RN Health Alterations + Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-12"
)
private let cdcPRR22 = CitationSource(
    id: "cdc_pr_round22",
    shortName: "CDC + AAP + AAFP / IDSA guidance",
    publisher: "CDC · AAP · AAFP · IDSA",
    license: .publicDomain,
    url: "https://www.cdc.gov/antibiotic-use/community/for-hcp/index.html",
    lastRetrieved: "2026-05-12"
)
private let specialtyPRR22 = CitationSource(
    id: "specialty_pr_round22",
    shortName: "AAO + AAO-HNS + AAD + AAAAI concept citations",
    publisher: "AAO · AAO-HNS · AAD · AAAAI",
    license: .factCitationOnly,
    url: "https://www.aaaai.org/practice-resources/practice-tools",
    lastRetrieved: "2026-05-12"
)

private let procTagsR22 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR22 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum CerumenRemovalSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "cerumen-removal",
        title: "Cerumen removal (irrigation, curette, cerumenolytic)",
        subtitle: "AAO-HNS guidelines · TM intact before irrigation · cerumenolytic 5-15 min soften · diabetes / mastoid surgery = contraindicated irrigation",
        nclexTags: procTagsR22,
        indications: AttributedProse(
            "Symptomatic cerumen impaction (hearing loss, fullness, otalgia, dizziness) OR cerumen obstructing otoscopic / audiologic examination per AAO-HNS guidelines per primary source.",
            citationIDs: ["specialty_pr_round22"]
        ),
        contraindications: AttributedProse(
            "IRRIGATION CONTRAINDICATED — tympanic membrane perforation (current or prior), recent mastoid surgery, tympanostomy tubes, prior trauma, diabetes (malignant otitis externa risk), only-hearing ear. Curette / cerumenolytic acceptable in most cases.",
            citationIDs: ["specialty_pr_round22"]
        ),
        equipment: [
            AttributedBullet("Otoscope with speculum for visualization.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Cerumen curette (loop / scoop) OR alligator forceps.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Irrigation kit — body-temperature water (37°C), 30-60 mL syringe with curved tip OR Welch Allyn ear washer.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Cerumenolytic — carbamide peroxide drops (Debrox), mineral oil, saline drops, hydrogen peroxide.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Towels, basin, gloves, light source.", citationIDs: ["openrn_pr_round22"])
        ],
        preProcedure: [
            AttributedBullet("Otoscopic exam — confirm cerumen impaction; assess TM integrity (avoid irrigation if perforated / history of perforation).", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Verify history — diabetes (irrigation higher risk), tubes, prior ear surgery, anticoagulation, prior trauma.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Document hearing baseline; pre-procedure pain.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Position — sitting with head tilted; cooperative; cape patient with towel.", citationIDs: ["openrn_pr_round22"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Cerumenolytic preparation", body: "Instill 5-10 drops cerumenolytic into ear canal; have patient sit with head tilted × 5-15 min OR continuously massage tragus to facilitate. Use carbamide peroxide (Debrox) OR mineral oil OR saline.", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 2, title: "Choose method", body: "IRRIGATION (if TM intact + no contraindications) OR CURETTE (direct visualization, less risk in select cases) OR REFERRAL (refractory, contraindicated, complicated).", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 3, title: "Irrigation (preferred when safe)", body: "Use BODY-TEMPERATURE water (37°C; cold = vertigo; hot = burns); curved tip; aim AT CANAL WALL not at TM; gentle gradual pressure; collect drainage in basin; check periodically.", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 4, title: "Curette (direct removal)", body: "Pull pinna up + back (adult) OR down + back (child <3); visualize cerumen; gently scoop with loop / cup curette; avoid canal wall trauma + TM.", citationIDs: ["openrn_pr_round22"]),
            ProcedureStep(number: 5, title: "Re-evaluate", body: "After removal — verify TM visualization, no canal injury, no blood; assess hearing improvement.", citationIDs: ["openrn_pr_round22"]),
            ProcedureStep(number: 6, title: "Dry canal", body: "Dry with cotton swab on hairpin angle OR several drops alcohol after irrigation OR allow natural drying.", citationIDs: ["openrn_pr_round22"]),
            ProcedureStep(number: 7, title: "Counsel prevention", body: "Avoid cotton swabs; soften wax periodically with mineral oil drops; clean external ear only with washcloth; lukewarm water in ear during showering.", citationIDs: ["specialty_pr_round22"])
        ],
        postProcedure: [
            AttributedBullet("Document procedure, method, response, complications, TM appearance.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Re-evaluate hearing — should improve immediately if hearing loss was from cerumen.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Counsel patient — avoid cotton swabs; periodic mineral oil drops for prevention.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Return precautions — pain, hearing loss, discharge, vertigo.", citationIDs: ["openrn_pr_round22"])
        ],
        documentation: [
            AttributedBullet("Pre-procedure TM appearance + symptoms + method; estimated cerumen amount; outcome + complications + post-procedure assessment.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Patient teaching for prevention.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Referral if refractory or complicated.", citationIDs: ["specialty_pr_round22"])
        ],
        watchFor: [
            AttributedBullet("TM PERFORATION from irrigation pressure OR curette trauma — pain, bleeding, sudden hearing change; stop procedure + ENT referral.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("VERTIGO from cold water (caloric stimulation) — use body-temperature water.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("MALIGNANT OTITIS EXTERNA — diabetic / immunocompromised; severe ear pain post-irrigation; emergent IV abx + admission.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("CANAL ABRASION + secondary OTITIS EXTERNA — bacterial / fungal; topical abx + steroid drops.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("VASOVAGAL — pull pinna firmly while irrigating; sit patient up post-procedure; alert to dizziness.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("PAIN POST-PROCEDURE — may be TM trauma; ENT referral.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("EXOSTOSES / OSTEOMA — narrowed canals; difficult removal; refer ENT.", citationIDs: ["specialty_pr_round22"])
        ],
        citations: [openrnPRR22, cdcPRR22, specialtyPRR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AnteriorNasalPackingSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "anterior-nasal-packing",
        title: "Anterior nasal packing for epistaxis",
        subtitle: "Topical vasoconstrictor first · Merocel / Rapid Rhino · 24-48h removal · abx prophylaxis for TSS",
        nclexTags: procTagsR22,
        indications: AttributedProse(
            "Persistent anterior epistaxis despite pressure (10-15 min continuous pinching) + topical vasoconstrictor; visible bleeding source unsuitable for cautery or failed cautery; bilateral anterior bleeding per primary source.",
            citationIDs: ["specialty_pr_round22"]
        ),
        contraindications: AttributedProse(
            "Suspected basilar skull fracture (avoid nasal procedures); severe coagulopathy without correction. Caution — anticoagulated patients (prolonged pressure first).",
            citationIDs: ["specialty_pr_round22"]
        ),
        equipment: [
            AttributedBullet("Merocel sponge (expandable nasal tampon) OR Rapid Rhino balloon (inflatable) OR petrolatum gauze.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Topical vasoconstrictor — oxymetazoline spray; topical anesthetic — lidocaine 4% spray.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Nasal speculum, headlamp, alligator forceps, suction.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Personal protective equipment — gloves, mask, eye protection.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Antibiotic for prophylaxis — cephalexin 500 mg PO QID × duration of packing.", citationIDs: ["specialty_pr_round22"])
        ],
        preProcedure: [
            AttributedBullet("ABC assessment + vital signs + estimate blood loss; IV access if significant bleeding / unstable.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Position — upright, head slightly forward; protect clothing; have suction ready.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Trial direct pressure (pinch lower nose × 10-15 min) + topical vasoconstrictor first — many resolve.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Identify source if possible — anterior septum / Kiesselbach's plexus most common.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Explain procedure + obtain consent.", citationIDs: ["openrn_pr_round22"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Anesthesia + vasoconstriction", body: "2-3 sprays oxymetazoline (Afrin) in affected nostril; supplement with 1-2 sprays lidocaine 4%; wait 3-5 minutes.", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 2, title: "Inspect", body: "Use nasal speculum + headlamp; identify bleeding source; if anterior + visible, consider silver nitrate cautery FIRST (less morbidity than packing).", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 3, title: "Place packing — Merocel sponge", body: "Coat sponge with antibiotic ointment; introduce posteriorly along floor of nasal cavity (not upward toward cribriform); push all the way back until flush with nasal opening; instill 5-10 mL saline to EXPAND.", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 4, title: "Alternative — Rapid Rhino", body: "Soak balloon in sterile water 30 sec; insert until balloon visible at nasal opening; inflate with air via 30-60 mL syringe slowly until bleeding stops (typically 6-15 mL).", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 5, title: "Verify hemostasis", body: "Observe 15-30 min for bleeding control; check posterior pharynx for ongoing bleeding (suggesting failure / posterior source).", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 6, title: "Bilateral packing", body: "If bilateral bleeding or septal hematoma — pack both sides; double risk of complications.", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 7, title: "Antibiotic prophylaxis", body: "Cephalexin 500 mg PO QID × duration of packing — PREVENT toxic shock syndrome (rare but reported); alternative clindamycin per primary source.", citationIDs: ["specialty_pr_round22"])
        ],
        postProcedure: [
            AttributedBullet("Discharge with packing in × 24-48 hrs — ENT or PCP follow-up for removal.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Symptomatic — humidified air, saline mist gentle, avoid blowing nose, no aspirin / NSAIDs.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Return precautions — recurrent bleeding, severe pain, fever, headache, swelling, vision change.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Anticoagulation review — coordinate with prescriber for hold / dose adjustment.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Counsel BP control + humidification + nasal saline prevention.", citationIDs: ["specialty_pr_round22"])
        ],
        documentation: [
            AttributedBullet("Pre-packing measures (pressure, vasoconstrictor, cautery if used), packing type + side, hemostasis achieved, complications, abx prophylaxis prescribed.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Vital signs pre + post; estimated blood loss.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Removal plan + follow-up.", citationIDs: ["specialty_pr_round22"])
        ],
        watchFor: [
            AttributedBullet("POSTERIOR BLEED — failure to control with anterior packing; blood in posterior pharynx; admit + posterior packing + ENT.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("TOXIC SHOCK SYNDROME — S. aureus toxin; high fever, hypotension, rash, AMS; abx prophylaxis essential; remove packing immediately if signs.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("SEPTAL HEMATOMA / abscess — septal swelling; emergent drainage to prevent cartilage necrosis + saddle nose deformity.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("SINUSITIS from prolonged packing — remove ≤48 hrs.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("PRESSURE NECROSIS on alar / septum — proper placement; not too tight.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("HEMORRHAGIC SHOCK from severe / prolonged epistaxis — type + cross, transfusion as needed.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("HOSPITAL ADMISSION criteria — posterior bleed, hemodynamic instability, anticoagulation needing reversal, severe comorbidities.", citationIDs: ["specialty_pr_round22"])
        ],
        citations: [openrnPRR22, cdcPRR22, specialtyPRR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum SkinBiopsySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "skin-biopsy",
        title: "Skin biopsy (punch / shave / excisional)",
        subtitle: "Three techniques · proper technique by lesion type · suture if needed · formalin specimen · pathology essential",
        nclexTags: procTagsR22,
        indications: AttributedProse(
            "Diagnosis of skin lesions — suspected malignancy (basal cell, squamous cell, melanoma, lymphoma); inflammatory dermatoses (psoriasis, lichen planus, autoimmune blistering); deep / refractory infections; pigmented lesion evaluation per primary source.",
            citationIDs: ["specialty_pr_round22"]
        ),
        contraindications: AttributedProse(
            "Anticoagulation (proceed with caution; bleeding risk); infection at site without indication; pregnancy generally OK with appropriate technique; bleeding diatheses without correction.",
            citationIDs: ["specialty_pr_round22"]
        ),
        equipment: [
            AttributedBullet("Punch biopsy — 3-8 mm punch instrument; suture material (4-0 nylon for face, 4-0 vicryl for trunk).", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Shave biopsy — #15 scalpel OR DermaBlade.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Excisional — #15 scalpel + suture; surgical setup for larger.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Local anesthetic — lidocaine 1-2% with epinephrine (NOT epinephrine for digits / nose / ears in some); 5 mL syringe; 27-30 g needle.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Sterile gloves, drape, chlorhexidine / alcohol prep, formalin specimen container, gauze, pressure dressing.", citationIDs: ["openrn_pr_round22"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders, consent, allergies (lidocaine, latex, adhesive).", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Anticoagulation review — bleeding risk; usually continue most agents for routine biopsy.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Photograph lesion baseline.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Select biopsy technique by lesion characteristics (see Steps).", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Position + drape; chlorhexidine prep.", citationIDs: ["openrn_pr_round22"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Select technique", body: "PUNCH — pigmented lesions, full-thickness for inflammatory dermatoses, suspected melanoma small. SHAVE — papular / pedunculated benign, basal cell, squamous cell when not deep. EXCISIONAL — definitive removal of melanoma + larger BCC / SCC with margins.", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 2, title: "Local anesthesia", body: "Inject 1-3 mL lidocaine 1% with epinephrine intradermally; wait 5 min for effect; create wheal around lesion.", citationIDs: ["openrn_pr_round22"]),
            ProcedureStep(number: 3, title: "Punch biopsy", body: "Stretch skin perpendicular to skin tension lines (Langer's); rotate punch with downward pressure to full depth (subcutaneous fat); remove core with forceps + scissors; place in formalin; close with 1-2 sutures or none for small punches.", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 4, title: "Shave biopsy", body: "Hold blade parallel to skin; gentle sawing motion to remove specimen at upper-mid dermis; achieve hemostasis with aluminum chloride / electrocautery / silver nitrate; usually no sutures.", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 5, title: "Excisional", body: "Elliptical incision (3:1 length-to-width ratio) around lesion with margins (per suspected diagnosis); to subcutaneous fat; suture closure in layers; appropriate for definitive removal of melanoma + larger lesions.", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 6, title: "Specimen handling", body: "Place specimen in formalin (10% buffered); label with patient identifiers + site + clinical impression; complete pathology requisition per primary source.", citationIDs: ["specialty_pr_round22"]),
            ProcedureStep(number: 7, title: "Closure + dressing", body: "Hemostasis verified; clean with saline; apply petrolatum + bandage; pressure dressing PRN.", citationIDs: ["openrn_pr_round22"])
        ],
        postProcedure: [
            AttributedBullet("Document — technique, site, sutures (type + number), hemostasis, specimen to pathology.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Wound care instructions — keep dry × 24-48 hrs, clean daily with mild soap + water + petrolatum, no soaking, no swimming until healed.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Suture removal — face 5-7 days; trunk/extremities 10-14 days.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Schedule pathology results call — typically 3-7 business days; positive findings communicated promptly.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Return precautions — bleeding, infection signs (redness, warmth, discharge, fever), wound dehiscence.", citationIDs: ["specialty_pr_round22"])
        ],
        documentation: [
            AttributedBullet("Pre-biopsy lesion description + photograph + presumptive diagnosis.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Technique, site, lesion size, anesthetic, hemostasis method, sutures.", citationIDs: ["openrn_pr_round22"]),
            AttributedBullet("Specimen to pathology — site + presumptive diagnosis listed.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("Patient education + follow-up.", citationIDs: ["specialty_pr_round22"])
        ],
        watchFor: [
            AttributedBullet("INADEQUATE SPECIMEN — too superficial for inflammatory dermatosis (use punch) or pigmented lesion (use punch / excisional); pathologist feedback.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("BLEEDING — pressure + suture + electrocautery; anticoagulation continuance.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("INFECTION — cellulitis at site; cephalexin / clindamycin.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("HYPERTROPHIC / KELOID SCAR — predisposed individuals; counsel; scar prevention.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("MELANOMA management — narrow margin biopsy first to confirm; wide local excision second based on Breslow depth.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("INCIDENTALLY DIAGNOSED malignancy — wide local excision + sentinel lymph node biopsy as indicated.", citationIDs: ["specialty_pr_round22"]),
            AttributedBullet("DERMATOLOGY referral for complex / atypical lesions, larger excisions, cosmetically sensitive areas (face).", citationIDs: ["specialty_pr_round22"])
        ],
        citations: [openrnPRR22, cdcPRR22, specialtyPRR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CentorMcIsaacSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "centor-mcisaac",
        title: "Centor + McIsaac criteria for GAS pharyngitis",
        subtitle: "Predict GAS likelihood · score 0-1 no test/abx · score 2-3 test · score 4+ test ± empiric · avoid unnecessary abx",
        eyebrow: "REFERENCE · ENT",
        nclexTags: refTagsR22,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Clinical decision rules for predicting group A streptococcal (GAS) pharyngitis probability. Centor score (original) + McIsaac (modified for age) reduce unnecessary testing + antibiotics while ensuring detection of true GAS pharyngitis per IDSA per primary source.",
                citationIDs: ["specialty_pr_round22"]
            )),
            .keyValueTable(title: "Centor criteria (1 point each)", [
                KeyValueRow(key: "Fever >38°C (100.4°F)", value: "+1"),
                KeyValueRow(key: "Tonsillar exudate / swelling", value: "+1"),
                KeyValueRow(key: "Tender anterior cervical lymphadenopathy", value: "+1"),
                KeyValueRow(key: "Absent cough", value: "+1")
            ]),
            .keyValueTable(title: "McIsaac modification (age)", [
                KeyValueRow(key: "Age <15 years", value: "+1"),
                KeyValueRow(key: "Age 15-44 years", value: "0"),
                KeyValueRow(key: "Age ≥45 years", value: "−1")
            ]),
            .keyValueTable(title: "Score → action", [
                KeyValueRow(key: "Score ≤0", value: "GAS unlikely (~1-2%); NO test, NO antibiotics; symptomatic care; counsel viral course"),
                KeyValueRow(key: "Score 1", value: "GAS unlikely (~5-10%); NO test, NO antibiotics; symptomatic care"),
                KeyValueRow(key: "Score 2", value: "Possible GAS (~10-17%); RAPID STREP test; treat if positive"),
                KeyValueRow(key: "Score 3", value: "Likely GAS (~28-35%); RAPID STREP test; treat if positive (consider empiric if test unavailable)"),
                KeyValueRow(key: "Score ≥4", value: "Very likely GAS (~50%+); RAPID STREP test; treat if positive (some empiric treatment defensible)")
            ]),
            .bullets(title: "Best practice — IDSA + CDC guidance", [
                AttributedBullet("Centor / McIsaac score 0-1 — NO testing, NO antibiotics; counsel viral course per primary source.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Score 2-3 — selective rapid strep testing.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Score ≥4 — rapid strep testing; some allow empiric treatment in adults if unavailable.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Pediatric — confirm RADT-negative with throat culture (false-negative rate higher); IDSA + AAP guidance.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Adult — RADT-negative usually doesn't require culture; clinical correlation.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Children <3 — routine testing NOT recommended (GAS rare, rheumatic fever rare).", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Treatment if confirmed", [
                AttributedBullet("Penicillin V 500 mg PO BID-TID × 10 days OR amoxicillin 500 mg PO BID × 10 days (children 50 mg/kg/day divided).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Penicillin-allergic non-anaphylactic — cephalexin 500 mg BID × 10 days.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Anaphylactic PCN allergy — azithromycin 12 mg/kg/day × 5 days OR clindamycin 7 mg/kg TID × 10 days (resistance check first if region high).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Single-dose benzathine PCN G IM × 1 — option for poor adherence (painful).", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Why this matters", [
                AttributedBullet("Most pharyngitis is VIRAL — over-prescription drives antimicrobial resistance + side effects + medicalization without benefit.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Antibiotics prevent acute rheumatic fever (especially in epidemic areas / age 5-15) but reduce duration only marginally.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Treatment NOT shown to prevent post-streptococcal glomerulonephritis.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Carrier state — ~10% of children are chronic GAS carriers; positive RADT in carrier with viral concurrent illness leads to over-treatment.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Centor 4+ alone defensible for adult empiric treatment if testing unavailable; not for children (carrier prevalence + delayed recovery rare).", citationIDs: ["specialty_pr_round22"])
            ])
        ],
        citations: [openrnPRR22, cdcPRR22, specialtyPRR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum RedEyeDifferentialSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "red-eye-differential",
        title: "Red eye differential + when to refer ophthalmology",
        subtitle: "Most are conjunctivitis · vision-threatening = urgent referral · pain + photophobia + vision change = red flags",
        eyebrow: "REFERENCE · OPHTHALMOLOGY",
        nclexTags: refTagsR22,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Red eye is a common primary care + ED presentation. Distinguish benign causes (viral conjunctivitis) from vision-threatening (keratitis, uveitis, acute angle-closure glaucoma, scleritis, orbital cellulitis). Asking 5 key questions + 4 basic exam findings sorts most cases per primary source.",
                citationIDs: ["specialty_pr_round22"]
            )),
            .bullets(title: "5 key history questions", [
                AttributedBullet("PAIN — mild itch (allergic), discomfort (conjunctivitis), deep ache (uveitis, scleritis), severe + photophobia (keratitis, AACG).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("VISION CHANGES — none (conjunctivitis) vs decreased (keratitis, uveitis, AACG); concerning.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("DISCHARGE — purulent (bacterial), watery (viral), itchy (allergic), none / minimal (uveitis, AACG).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("PHOTOPHOBIA — present (corneal, uveitis); absent (conjunctivitis).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("CONTACT LENS WEAR — keratitis risk; emergent referral if pain / vision change.", citationIDs: ["specialty_pr_round22"])
            ]),
            .keyValueTable(title: "Differential by features", [
                KeyValueRow(key: "Viral conjunctivitis", value: "Bilateral (start unilateral), watery discharge, gritty, contagious URI, preauricular LAD; NO pain / vision change / photophobia"),
                KeyValueRow(key: "Bacterial conjunctivitis", value: "Unilateral / bilateral, purulent crusted, less LAD; NO severe pain / vision change"),
                KeyValueRow(key: "Allergic conjunctivitis", value: "Bilateral, itchy, watery, allergic rhinitis, cobblestone papillae upper lid; NO pain / vision change"),
                KeyValueRow(key: "Corneal abrasion", value: "Trauma history, severe pain, photophobia, tearing, foreign body sensation; fluorescein staining diagnostic"),
                KeyValueRow(key: "Keratitis (bacterial / HSV / fungal)", value: "Contact lens / trauma, severe pain, photophobia, vision blur, hypopyon; EMERGENT"),
                KeyValueRow(key: "Uveitis", value: "Deep ache, photophobia, vision blur, miotic + irregular pupil, ciliary flush; ophthalmology referral"),
                KeyValueRow(key: "Acute angle-closure glaucoma", value: "Severe deep pain, vision loss, halos around lights, nausea, fixed mid-dilated pupil, hard globe; EMERGENT"),
                KeyValueRow(key: "Scleritis", value: "Severe boring pain, vision change, deep red sclera, associated with autoimmune disease; urgent referral"),
                KeyValueRow(key: "Episcleritis", value: "Mild discomfort, sectoral redness, no vision change; benign; usually self-limited"),
                KeyValueRow(key: "Orbital cellulitis", value: "Periorbital swelling, fever, proptosis, painful EOM, vision change; EMERGENT IV abx + admit"),
                KeyValueRow(key: "Subconjunctival hemorrhage", value: "Painless red flat patch from coughing / valsalva / trauma / anticoagulation; benign; resolves 1-2 weeks")
            ]),
            .bullets(title: "RED FLAGS — emergent ophthalmology", [
                AttributedBullet("SEVERE PAIN.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("VISION LOSS / SIGNIFICANT BLURRING.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("PHOTOPHOBIA (significant).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("CONTACT LENS WEAR + symptoms.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("HALOS / RAINBOWS around lights (corneal edema, AACG).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("PROPTOSIS, restricted EOM, vision change → orbital cellulitis.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("FIXED / IRREGULAR pupil.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("CILIARY FLUSH (deep circumcorneal injection) → uveitis / keratitis / AACG.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("HYPOPYON (layered pus in anterior chamber) → severe keratitis / uveitis.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("PENETRATING INJURY / Seidel sign positive.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Basic exam in the clinic", [
                AttributedBullet("VISUAL ACUITY — always document baseline; affected eye + unaffected eye + both together.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("PUPIL EXAM — size, shape, reactivity to light; fixed mid-dilated → AACG; miotic + irregular → uveitis.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("FLUORESCEIN STAINING — corneal abrasion (linear / geographic uptake); HSV (branching dendrites).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("EOM testing — restricted = orbital cellulitis / muscle entrapment.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("TONOMETRY (if available) — IOP >30 mmHg → AACG urgent.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Initial management", [
                AttributedBullet("Viral conjunctivitis — supportive: lubricant, cool compresses, hand hygiene, isolation.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Bacterial conjunctivitis — erythromycin OR moxifloxacin TID-QID × 5-7 days.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Allergic — olopatadine + oral antihistamine; cool compresses.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Contact lens-related red eye — emergent ophthalmology; STOP contacts.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Suspected AACG — emergent — pilocarpine + timolol + acetazolamide + ophthalmology; IOP-lowering.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Suspected keratitis — emergent ophthalmology; fortified topical abx (ophthalmology compounded); no topical steroids until confirmed not HSV.", citationIDs: ["specialty_pr_round22"])
            ])
        ],
        citations: [openrnPRR22, cdcPRR22, specialtyPRR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum SinusitisCriteriaSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "sinusitis-criteria",
        title: "Sinusitis viral vs bacterial criteria + management",
        subtitle: "Most are viral · IDSA + AAP criteria · watchful waiting OK · amoxicillin-clavulanate first-line · red flags",
        eyebrow: "REFERENCE · ENT",
        nclexTags: refTagsR22,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "98% of acute sinusitis is VIRAL (rhinosinusitis); 2% bacterial. Over-prescription of antibiotics for sinusitis drives resistance + adverse effects. IDSA + AAP + AAFP criteria distinguish bacterial from viral to guide treatment per primary source.",
                citationIDs: ["specialty_pr_round22"]
            )),
            .keyValueTable(title: "IDSA criteria — bacterial sinusitis (any one)", [
                KeyValueRow(key: "DURATION", value: "Symptoms ≥10 days WITHOUT improvement"),
                KeyValueRow(key: "WORSENING", value: "Symptoms initially improve then worsen (\"double sickening\")"),
                KeyValueRow(key: "SEVERE", value: "≥39°C + purulent nasal discharge + facial pain × 3+ consecutive days at onset")
            ]),
            .bullets(title: "Viral rhinosinusitis (most cases)", [
                AttributedBullet("Symptoms <10 days + improving without antibiotics.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Peak symptoms typically days 3-5; resolution by day 7-10.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Yellow / green nasal discharge does NOT indicate bacterial; reflects WBCs from any inflammation.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Treatment — supportive: hydration, saline rinse, decongestants (limited duration), analgesics, intranasal steroids.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Bacterial sinusitis (if meeting criteria)", [
                AttributedBullet("Causative organisms — Strep pneumoniae, H. influenzae, Moraxella catarrhalis, S. aureus.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("WATCHFUL WAITING acceptable × 7 days even when meeting bacterial criteria — many resolve spontaneously per primary source.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("AMOXICILLIN-CLAVULANATE 875/125 mg PO BID × 5-10 days — first-line per primary source.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("HIGH-DOSE amoxicillin-clavulanate (2 g BID) — for severe / high-risk (recent abx, age >65, immunocompromised).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("PCN ALLERGY — doxycycline OR levofloxacin (cardiac caution).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("NOT macrolides — high pneumococcal resistance.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Symptomatic adjuncts — intranasal corticosteroid, saline rinse, analgesics, decongestants short-term.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Symptomatic management (all)", [
                AttributedBullet("NASAL SALINE IRRIGATION — Neti pot / squeeze bottle; reduces symptoms.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("INTRANASAL CORTICOSTEROID — fluticasone, mometasone; reduces inflammation; daily × 2 weeks.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("ANALGESICS — acetaminophen, ibuprofen.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("DECONGESTANTS — oxymetazoline / phenylephrine spray ≤3 days only (rebound rhinitis medicamentosa); pseudoephedrine systemic.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("HUMIDIFICATION + HYDRATION.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("ANTIHISTAMINES — only if allergic component; not routine for sinusitis.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "RED FLAGS — emergent / urgent referral", [
                AttributedBullet("PERIORBITAL / ORBITAL SWELLING — orbital cellulitis; emergent CT + IV abx + ENT.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("VISION CHANGES — orbital complication.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("SEVERE HEADACHE + neuro deficits — intracranial complication (brain abscess, cavernous sinus thrombosis); emergent.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("ALTERED MENTAL STATUS / fever / meningismus — emergent.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("POTTS PUFFY TUMOR — frontal sinus abscess (frontal forehead tenderness + swelling); surgical.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("MUCORMYCOSIS in diabetic DKA / immunocompromised — black necrotic eschar in nose; emergent surgical + amphotericin.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Chronic / recurrent sinusitis", [
                AttributedBullet("CHRONIC — symptoms ≥12 weeks; ENT referral; CT sinuses + nasal endoscopy.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("RECURRENT — ≥4 episodes per year; workup for allergic rhinitis, anatomic abnormalities, immune deficiency.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("NASAL POLYPS — workup; consider biologics (dupilumab, mepolizumab, omalizumab) per primary source.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("FUNCTIONAL ENDOSCOPIC SINUS SURGERY (FESS) — for refractory / anatomic / nasal polyps.", citationIDs: ["specialty_pr_round22"])
            ])
        ],
        citations: [openrnPRR22, cdcPRR22, specialtyPRR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AllergicRhinitisManagementSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "allergic-rhinitis-management",
        title: "Allergic rhinitis stepwise management",
        subtitle: "Intranasal steroid + 2nd-gen antihistamine + saline · allergist for refractory · immunotherapy curative",
        eyebrow: "REFERENCE · ALLERGY",
        nclexTags: refTagsR22,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Allergic rhinitis affects 10-30% of adults + 40% of children — common, undertreated. Stepwise management per AAAAI / ARIA guidelines emphasizes avoidance + pharmacotherapy + immunotherapy for severe / refractory per primary source.",
                citationIDs: ["specialty_pr_round22"]
            )),
            .keyValueTable(title: "Severity classification (ARIA)", [
                KeyValueRow(key: "Mild intermittent", value: "Symptoms <4 days/week OR <4 consecutive weeks; no impairment"),
                KeyValueRow(key: "Mild persistent", value: "Symptoms ≥4 days/week AND ≥4 consecutive weeks; no impairment"),
                KeyValueRow(key: "Moderate-severe intermittent", value: "Symptoms <4 days/week OR <4 weeks; with impairment (sleep, activity, work)"),
                KeyValueRow(key: "Moderate-severe persistent", value: "Symptoms ≥4 days/week AND ≥4 consecutive weeks; with impairment")
            ]),
            .bullets(title: "Step 1 — Allergen avoidance + saline", [
                AttributedBullet("Identify triggers — pollen seasons, dust mites, pet dander, mold, occupational allergens.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Pollen — keep windows closed during peak, HVAC + HEPA filters, shower after outdoor activity.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Dust mites — mite-proof mattress + pillow covers, hot water wash bedding, reduce carpet / soft furnishings, dehumidify.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Pet dander — limit bedroom access, HEPA filters, frequent bathing of pet; reduce exposure not always possible.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("NASAL SALINE rinse — Neti pot, squeeze bottle, sinus rinse; physical removal of allergens; gentle.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Step 2 — First-line pharmacotherapy", [
                AttributedBullet("INTRANASAL CORTICOSTEROID — fluticasone, mometasone, budesonide; FIRST-LINE per primary source; most effective single therapy.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Daily use during allergy season; takes 1-2 weeks for full effect.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("SECOND-GENERATION ORAL ANTIHISTAMINE — cetirizine 10 mg, fexofenadine 60-180 mg, loratadine 10 mg, levocetirizine 5 mg; daily; non-sedating.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Avoid first-generation oral (diphenhydramine, chlorpheniramine) — sedation, anticholinergic effects.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Step 3 — Combination + intranasal antihistamine", [
                AttributedBullet("Combination — intranasal corticosteroid + oral 2nd-gen antihistamine; superior to either alone.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("INTRANASAL ANTIHISTAMINE — azelastine; faster onset (15 min) than steroid; can add to steroid.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("COMBINATION DEVICE — Dymista (azelastine + fluticasone) — single spray combined; most effective per primary source for moderate-severe.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("LEUKOTRIENE RECEPTOR ANTAGONIST — montelukast; useful with concurrent asthma; FDA boxed warning for neuropsychiatric effects.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("OCULAR symptoms — olopatadine eye drops; concurrent allergic conjunctivitis.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Step 4 — Adjunctive therapy", [
                AttributedBullet("INTRANASAL IPRATROPIUM — for runny nose; cholinergic blocker; useful for vasomotor + allergic.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("CROMOLYN SODIUM — mast cell stabilizer; useful for prevention before exposure; less effective than other agents.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("DECONGESTANT — short-term (≤3 days); rhinitis medicamentosa risk; not for chronic management.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("ORAL CORTICOSTEROID — short course for severe acute exacerbation only; NOT chronic management.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Step 5 — Allergist referral", [
                AttributedBullet("Indications — moderate-severe persistent symptoms despite optimized pharmacotherapy; significant QOL impairment; comorbid asthma uncontrolled; identify specific allergens for immunotherapy.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Specific IgE / skin prick testing — identify allergens for avoidance + immunotherapy.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("SUBCUTANEOUS IMMUNOTHERAPY (SCIT) — weekly injections × 6 months → monthly × 3-5 years; CURATIVE; risk of systemic reactions.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("SUBLINGUAL IMMUNOTHERAPY (SLIT) — daily tablets at home (grass, ragweed, dust mite); fewer systemic reactions but less effective than SCIT for some.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("BIOLOGICS — anti-IgE (omalizumab) for severe allergic asthma + concurrent rhinitis.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Pediatric considerations", [
                AttributedBullet("Intranasal steroids — minimal growth effects at standard doses; monitor at well visits.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Cetirizine + loratadine FDA-approved ≥6 months; fexofenadine ≥2 years; safe profile.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Comorbid conditions — atopic march (eczema, allergic rhinitis, asthma); treat all components.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("School impact — sleep disturbance, learning, hearing; aggressive control.", citationIDs: ["specialty_pr_round22"])
            ]),
            .bullets(title: "Pregnancy / lactation", [
                AttributedBullet("Intranasal steroids generally safe (fluticasone, budesonide preferred).", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Loratadine + cetirizine preferred 2nd-gen oral antihistamines.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Avoid pseudoephedrine in 1st trimester; saline rinses preferred.", citationIDs: ["specialty_pr_round22"]),
                AttributedBullet("Immunotherapy — continue if established; do NOT initiate in pregnancy.", citationIDs: ["specialty_pr_round22"])
            ])
        ],
        citations: [openrnPRR22, cdcPRR22, specialtyPRR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}
