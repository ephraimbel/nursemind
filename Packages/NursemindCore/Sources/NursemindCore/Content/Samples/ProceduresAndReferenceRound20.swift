import Foundation

// Curator-model procedures + reference (round 20 — venipuncture / catheter / dressing + immunization + STI + MAT).

private let openrnPRR20 = CitationSource(
    id: "openrn_pr_round20",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-12"
)
private let cdcPRR20 = CitationSource(
    id: "cdc_pr_round20",
    shortName: "CDC Immunization Schedules + STI Treatment Guidelines + Infection Control",
    publisher: "CDC",
    license: .publicDomain,
    url: "https://www.cdc.gov/vaccines/schedules/",
    lastRetrieved: "2026-05-12"
)
private let specialtyPRR20 = CitationSource(
    id: "specialty_pr_round20",
    shortName: "INS / ACIP / SAMHSA / ASAM concept citations",
    publisher: "INS · ACIP · SAMHSA · ASAM",
    license: .factCitationOnly,
    url: "https://www.ins1.org/publications/infusion-therapy-standards-of-practice/",
    lastRetrieved: "2026-05-12"
)

private let procTagsR20 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR20 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum VenipunctureSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "venipuncture",
        title: "Peripheral venipuncture (blood draw)",
        subtitle: "Sterile technique · order of draw · troubleshoot collapsed vein / hematoma · INS standards",
        nclexTags: procTagsR20,
        indications: AttributedProse(
            "Routine + diagnostic blood draws. Vein assessment + selection guided by INS Infusion Therapy Standards of Practice + facility protocol per primary source.",
            citationIDs: ["specialty_pr_round20"]
        ),
        contraindications: AttributedProse(
            "Avoid arm with AV fistula / graft, lymphedema, mastectomy on side, paralysis, IV infusion above draw site, hematoma / phlebitis / cellulitis. Coagulopathy is relative — prolonged pressure required, not an absolute contraindication.",
            citationIDs: ["specialty_pr_round20"]
        ),
        equipment: [
            AttributedBullet("Tourniquet (single-patient-use), alcohol or chlorhexidine prep pads, gauze, tape.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Vacutainer holder + safety-engineered needle (typically 21–22 g for adults) OR butterfly (23 g for small/difficult veins).", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Collection tubes in proper order of draw (see below).", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Labels, lab requisition, sharps container, gloves.", citationIDs: ["openrn_pr_round20"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders, patient identity (TWO identifiers), allergies (latex / adhesive / chlorhexidine).", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Hand hygiene; don gloves.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Position patient comfortably; arm supported; explain procedure.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Assess fasting status, time-of-day-sensitive labs (cortisol, drug levels).", citationIDs: ["openrn_pr_round20"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Select vein", body: "Apply tourniquet 3–4 inches above intended site (no longer than 1 min). Inspect / palpate for straight, soft, well-fixed vein. Median cubital → cephalic → basilic preferred. AVOID basilic over brachial artery / median nerve where possible.", citationIDs: ["specialty_pr_round20"]),
            ProcedureStep(number: 2, title: "Cleanse site", body: "Cleanse with alcohol (or chlorhexidine if blood culture) in concentric outward motion; allow to dry completely (30 sec) for antisepsis + minimizes sting.", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 3, title: "Anchor + insert", body: "Anchor vein with thumb 1–2 inches below site. Insert bevel-up at 15–30° angle; advance until flashback. DO NOT probe.", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 4, title: "Order of draw", body: "Blood cultures → light blue (citrate, coag) → red (serum) → gold/SST → green (heparin) → lavender (EDTA) → gray (oxalate / fluoride). Order prevents additive contamination per primary source.", citationIDs: ["specialty_pr_round20"]),
            ProcedureStep(number: 5, title: "Mix tubes + release tourniquet", body: "Gentle 8–10 inversions immediately after each tube (no shaking — hemolysis). Release tourniquet BEFORE removing needle (ideally within 1 min total).", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 6, title: "Remove + hold pressure", body: "Withdraw needle, engage safety device, apply gauze with firm pressure × 3–5 min (longer if anticoagulated). Do NOT bend elbow — causes hematoma.", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 7, title: "Label + dispose", body: "LABEL TUBES at the bedside in front of patient — date, time, initials. Dispose sharps in container immediately.", citationIDs: ["openrn_pr_round20"])
        ],
        postProcedure: [
            AttributedBullet("Reinspect site; apply bandage; instruct to keep arm straight 5 min.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Document — site, attempts, tubes drawn, complications, patient tolerance.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Transport specimens per stability requirements (some chilled, some at room temp, light-sensitive).", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Hand hygiene + dispose PPE.", citationIDs: ["openrn_pr_round20"])
        ],
        documentation: [
            AttributedBullet("Time, site, vein, number of attempts (≤2 per nurse per INS standards), tube(s), complications, patient response.", citationIDs: ["specialty_pr_round20"]),
            AttributedBullet("Lab labels — required identifiers per facility (typically full name, DOB, MRN, date/time, collector initials).", citationIDs: ["openrn_pr_round20"])
        ],
        watchFor: [
            AttributedBullet("HEMATOMA — release tourniquet first, prolonged pressure, ice; large = ortho if compartment concern.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("NERVE INJURY — sudden shooting pain → STOP, withdraw immediately, document, notify provider.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("VASOVAGAL — patient pale / lightheaded → supine + legs elevated + monitor.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("INADVERTENT ARTERIAL puncture — bright pulsatile flow; remove immediately + prolonged pressure 5+ min; notify provider.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("≤2 attempts per nurse per INS standards — escalate; ultrasound-guided or central access consideration.", citationIDs: ["specialty_pr_round20"]),
            AttributedBullet("HEMOLYSIS sources — small needle, vigorous mixing, prolonged tourniquet, IV line draw.", citationIDs: ["openrn_pr_round20"])
        ],
        citations: [openrnPRR20, cdcPRR20, specialtyPRR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum FemaleFoleyCatheterSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "female-foley-catheter",
        title: "Indwelling urinary catheter insertion (female)",
        subtitle: "Sterile technique · CAUTI prevention · indication-driven · daily review for removal",
        nclexTags: procTagsR20,
        indications: AttributedProse(
            "Acute urinary retention, accurate I&O in critical illness, perioperative for selected procedures, end-of-life comfort, urinary obstruction, neurogenic bladder, pressure injury / wound healing in incontinent patients. NOT for incontinence management alone per CDC HICPAC per primary source.",
            citationIDs: ["cdc_pr_round20"]
        ),
        contraindications: AttributedProse(
            "Severe urethral trauma (use suprapubic); active UTI is NOT a contraindication but treat concurrently. Relative — recent urethral surgery, strictures.",
            citationIDs: ["cdc_pr_round20"]
        ),
        equipment: [
            AttributedBullet("Foley catheter kit (typically 14–16 Fr in adults; 12 Fr in pediatric) + sterile gloves + lubricant + iodine / chlorhexidine prep solution + drape + specimen container if needed.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("10 mL syringe with sterile water for balloon.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Drainage bag + securement device (StatLock or equivalent).", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Good light source; trash bag.", citationIDs: ["openrn_pr_round20"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders, indication (must align with CDC HICPAC list), patient identity, allergies (latex, iodine).", citationIDs: ["cdc_pr_round20"]),
            AttributedBullet("Hand hygiene + don clean gloves; perineal hygiene; remove clean gloves; hand hygiene.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Position supine with knees bent + apart (dorsal recumbent).", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Explain procedure + obtain consent.", citationIDs: ["openrn_pr_round20"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Set up sterile field", body: "Open catheter kit on bedside table. Don sterile gloves. Drape patient with sterile drape (fenestrated drape over perineum). Maintain sterile field.", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 2, title: "Test balloon + prep equipment", body: "Test balloon if facility policy + new catheters (some skip per manufacturer); attach drainage bag; lubricate catheter tip (5–7 cm).", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 3, title: "Expose meatus + cleanse", body: "Spread labia minora with non-dominant hand (this hand is now contaminated — keep there until insertion). With dominant hand, cleanse with antiseptic cotton balls — front to back, one each for right labium, left labium, midline (3 strokes).", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 4, title: "Insert catheter", body: "Insert lubricated catheter into meatus 5–7.5 cm (2–3 inches) until urine flows; advance 1–2 inches further. If no urine returns, check anatomy — possibly in vagina; leave in place + use second sterile catheter to attempt urethra.", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 5, title: "Inflate balloon", body: "Once urine returns, inflate balloon with sterile water (10 mL or per package) — gently. If patient reports pain, STOP, withdraw water, advance further before re-inflating.", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 6, title: "Pull back + secure", body: "Gently pull catheter back until resistance felt — balloon at bladder neck. Secure to inner thigh with StatLock or tape (allows leg movement without traction on urethra).", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 7, title: "Secure drainage system", body: "Drainage bag BELOW bladder level + off floor; closed sterile system; check tubing for kinks. Loop tubing to prevent dependent loops.", citationIDs: ["cdc_pr_round20"])
        ],
        postProcedure: [
            AttributedBullet("Remove gloves + drape; hand hygiene; reposition patient.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Document — date / time, indication, size, balloon volume, residual / initial output, tolerance, complications.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Daily CAUTI bundle — review indication, perineal care, secure tubing, closed drainage, remove ASAP.", citationIDs: ["cdc_pr_round20"]),
            AttributedBullet("Empty drainage bag every 8 hours / 2/3 full + before transfer; use clean container.", citationIDs: ["openrn_pr_round20"])
        ],
        documentation: [
            AttributedBullet("Date / time, indication, catheter size, balloon volume, initial urine amount + characteristics, sterile technique, patient tolerance.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Daily I&O; daily CAUTI bundle review.", citationIDs: ["cdc_pr_round20"]),
            AttributedBullet("Removal date / time when no longer indicated.", citationIDs: ["cdc_pr_round20"])
        ],
        watchFor: [
            AttributedBullet("CAUTI prevention — remove catheter ASAP, closed system, no routine irrigation, hand hygiene before / after handling per primary source.", citationIDs: ["cdc_pr_round20"]),
            AttributedBullet("CATHETER IN VAGINA — leave + use new sterile catheter; identifies anatomy.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("NO URINE RETURN — possibly empty bladder, kinked tubing, or catheter not in bladder; flush / reposition / reassess.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("URETHRAL TRAUMA — if resistance / blood, stop + escalate; consider urology for difficult insertion.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("RAPID DECOMPRESSION RISK — large retention (>800 mL); clamp briefly if concern for hematuria / hypotension (controversial).", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("LATEX / IODINE ALLERGY — silicone catheter + chlorhexidine alternative.", citationIDs: ["openrn_pr_round20"])
        ],
        citations: [openrnPRR20, cdcPRR20, specialtyPRR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum SterileDressingChangeSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "sterile-dressing-change",
        title: "Sterile dressing change",
        subtitle: "Wound assessment · sterile technique · documentation · CDC infection control",
        nclexTags: procTagsR20,
        indications: AttributedProse(
            "Surgical incisions, central line / PICC sites, sterile / clean-contaminated wounds, immunocompromised patient wounds. Frequency per provider order + dressing type + drainage per primary source.",
            citationIDs: ["specialty_pr_round20"]
        ),
        contraindications: AttributedProse(
            "Provider order specifies type (e.g., DSD, hydrocolloid, foam, alginate, antimicrobial). Patient refusal honored — document + escalate.",
            citationIDs: ["openrn_pr_round20"]
        ),
        equipment: [
            AttributedBullet("Sterile dressing supplies per order (gauze, foam, hydrocolloid, alginate, transparent film, antimicrobial).", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Sterile saline / cleansing solution + sterile gloves + sterile field + clean gloves.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Sterile gauze + tape / securement; trash bag; biohazard bag if grossly soiled.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("PPE — gown if splash risk, mask, eye protection per facility.", citationIDs: ["openrn_pr_round20"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders, patient identity, allergies (tape, iodine, latex).", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Pre-medicate for pain 30 min prior if anticipated; assess + manage pain.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Privacy + position patient for access; explain procedure.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Hand hygiene + clean gloves to remove old dressing.", citationIDs: ["openrn_pr_round20"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Remove old dressing", body: "Wearing clean gloves, gently remove old dressing — note drainage / odor / amount. If adherent, moisten with sterile saline. Discard old dressing in trash / biohazard bag. Remove clean gloves + hand hygiene.", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 2, title: "Set up sterile field", body: "Open sterile dressing supplies onto sterile field; pour sterile saline into sterile basin (1 inch above field rim); don sterile gloves. Maintain sterile field — 1 inch border non-sterile.", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 3, title: "Assess wound", body: "Inspect — size (length × width × depth), color, drainage (serous / sanguinous / serosanguinous / purulent), odor, tissue type (granulation, slough, eschar, epithelialization), surrounding skin (erythema, induration, warmth, maceration).", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 4, title: "Cleanse wound", body: "Cleanse with sterile saline-soaked gauze — from least contaminated to most contaminated (clean center → outward in concentric circles, OR top → bottom). Use new gauze each stroke. Pat dry with sterile gauze.", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 5, title: "Apply primary dressing", body: "Apply per order — sterile gauze for absorption + protection, hydrocolloid for moisture-retentive healing, alginate for drainage, transparent film for visualization, antimicrobial for infection control. Maintain sterility.", citationIDs: ["specialty_pr_round20"]),
            ProcedureStep(number: 6, title: "Apply secondary + secure", body: "Cover with appropriate-size dressing; secure with tape, transparent film, or roll gauze. Avoid restrictive wrapping that impairs circulation.", citationIDs: ["openrn_pr_round20"]),
            ProcedureStep(number: 7, title: "Label", body: "Date, time, initials on outer dressing.", citationIDs: ["openrn_pr_round20"])
        ],
        postProcedure: [
            AttributedBullet("Reposition patient; reassess pain.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Dispose supplies + PPE; hand hygiene.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Document — wound assessment, intervention, patient tolerance.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Educate patient + family — keep clean + dry, signs of infection, when to call.", citationIDs: ["openrn_pr_round20"])
        ],
        documentation: [
            AttributedBullet("Date / time, wound dimensions, tissue characteristics, drainage, peri-wound, dressing applied, patient tolerance, pain pre / post.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("Pictures per facility wound-tracking protocol.", citationIDs: ["specialty_pr_round20"]),
            AttributedBullet("Order / consult for nutrition (protein / calorie) + wound care if non-healing >2 weeks.", citationIDs: ["specialty_pr_round20"])
        ],
        watchFor: [
            AttributedBullet("WOUND INFECTION — erythema, warmth, swelling, purulent drainage, fever, increased pain; culture + antibiotics.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("DEHISCENCE / EVISCERATION — surgical wound separation / abdominal organ exposure; cover with saline-soaked sterile gauze + emergent surgical evaluation.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("BREAK IN STERILE TECHNIQUE — discard contaminated supplies + start over.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("DELAYED HEALING — diabetes, malnutrition, vascular insufficiency, steroids, smoking; address modifiable factors.", citationIDs: ["specialty_pr_round20"]),
            AttributedBullet("MACERATION — surrounding skin breakdown from excessive moisture; better absorptive dressing + skin protectant.", citationIDs: ["openrn_pr_round20"]),
            AttributedBullet("PAIN — pre-medicate; topical lidocaine for chronic wounds per provider.", citationIDs: ["openrn_pr_round20"])
        ],
        citations: [openrnPRR20, cdcPRR20, specialtyPRR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PediatricImmunizationScheduleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pediatric-immunization-schedule",
        title: "Pediatric immunization schedule (CDC ACIP 2026)",
        subtitle: "Birth – 18 yrs · routine + catch-up · combination products · parental hesitancy approach",
        eyebrow: "REFERENCE · PEDIATRICS",
        nclexTags: refTagsR20,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "ACIP recommended schedule for ages 0–18; mostly age-based with catch-up tables for delayed vaccination. Combined products reduce injection burden. Required for school entry (state-specific exemptions) per primary source.",
                citationIDs: ["cdc_pr_round20"]
            )),
            .keyValueTable(title: "Birth – 6 months", [
                KeyValueRow(key: "Birth", value: "HepB #1 within 24 hours of birth"),
                KeyValueRow(key: "1-2 months", value: "HepB #2 (1-2 months)"),
                KeyValueRow(key: "2 months", value: "DTaP #1, IPV #1, Hib #1, PCV15/20 #1, Rotavirus #1"),
                KeyValueRow(key: "4 months", value: "DTaP #2, IPV #2, Hib #2, PCV #2, Rotavirus #2"),
                KeyValueRow(key: "6 months", value: "DTaP #3, IPV #3 (some products), Hib #3 (some products), PCV #3, Rotavirus #3 (if Rotateq), HepB #3 (6-18 months)"),
                KeyValueRow(key: "Influenza", value: "Annual starting at 6 months; 2 doses 4 wks apart first season")
            ]),
            .keyValueTable(title: "12 – 18 months", [
                KeyValueRow(key: "12-15 months", value: "MMR #1, Varicella #1, Hib booster, PCV booster, HepA #1"),
                KeyValueRow(key: "15-18 months", value: "DTaP #4, HepA #2 (6-18 months after #1)")
            ]),
            .keyValueTable(title: "4 – 18 years", [
                KeyValueRow(key: "4-6 yrs", value: "DTaP #5, IPV #4, MMR #2, Varicella #2"),
                KeyValueRow(key: "11-12 yrs", value: "Tdap, HPV #1+ #2 (start as early as 9), MenACWY #1"),
                KeyValueRow(key: "16 yrs", value: "MenACWY #2; MenB shared decision-making 16-23"),
                KeyValueRow(key: "COVID-19", value: "Updated formulation annually per ACIP")
            ]),
            .bullets(title: "Catch-up + delayed schedule", [
                AttributedBullet("Catch-up schedule tables in ACIP — never restart series; continue from where stopped.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Minimum intervals + minimum ages per vaccine type — follow CDC catch-up tables.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Premature infants — vaccinate per chronologic age (not corrected).", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Live vaccines — wait 28 days between two live parenteral.", citationIDs: ["cdc_pr_round20"])
            ]),
            .bullets(title: "Contraindications + special situations", [
                AttributedBullet("Severe allergic reaction to component / prior dose — contraindicated.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Live vaccines — pregnancy, significant immunocompromise (HSCT, chemo, high-dose steroids, HIV with low CD4).", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Rotavirus — history of intussusception or severe combined immunodeficiency (SCID).", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("DTaP / Tdap — encephalopathy within 7 days of prior dose (rare contraindication).", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Mild illness, antibiotic use, breastfeeding, prematurity — NOT contraindications.", citationIDs: ["cdc_pr_round20"])
            ]),
            .bullets(title: "Approach to vaccine hesitancy", [
                AttributedBullet("Presumptive recommendation — \"Your child needs these shots today\" — more effective than open question.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Motivational interviewing — explore concerns, share evidence, respect autonomy.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Address specific concerns — autism (refuted by extensive evidence), components, schedule, ingredients.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Document refusal + risks; offer to revisit; do NOT dismiss patient over hesitancy (AAP guidance).", citationIDs: ["cdc_pr_round20"])
            ]),
            .bullets(title: "Administration essentials", [
                AttributedBullet("IM injection — anterolateral thigh <2 yrs, deltoid ≥2 yrs (developing muscle).", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Pain reduction — distraction, swaddling, breastfeeding, sucrose for infants; topical anesthetic for children.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("VIS provided to parent / guardian before each dose; document.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Observe 15 min post for syncope (especially HPV in adolescents) + anaphylaxis.", citationIDs: ["cdc_pr_round20"])
            ])
        ],
        citations: [openrnPRR20, cdcPRR20, specialtyPRR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum STITreatmentBundleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "sti-treatment-bundle",
        title: "STI screening + treatment bundle (CDC 2021)",
        subtitle: "Universal + risk-based screening · expedited partner therapy · re-test 3 months · counsel safer-sex",
        eyebrow: "REFERENCE · INFECTIOUS DISEASE",
        nclexTags: refTagsR20,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "CDC STI Treatment Guidelines 2021 — screening + first-line treatment + partner management + follow-up for common STIs. Universal HIV screen 13-64 yrs; STIs screened per risk + age + pregnancy per primary source.",
                citationIDs: ["cdc_pr_round20"]
            )),
            .keyValueTable(title: "Screening recommendations", [
                KeyValueRow(key: "Chlamydia / Gonorrhea", value: "All sexually active women <25 annually; older with risk factors; MSM annually; rectal / oral sites for receptive practices"),
                KeyValueRow(key: "Syphilis", value: "MSM, HIV+, pregnant (early + 28 wks + delivery), risk factors"),
                KeyValueRow(key: "HIV", value: "Universal 13-64 once; annual for high-risk; all pregnancies each time"),
                KeyValueRow(key: "Hepatitis B + C", value: "All adults at least once; HepC repeated if ongoing risk"),
                KeyValueRow(key: "Trichomoniasis", value: "Sexually active women; consider in symptomatic men"),
                KeyValueRow(key: "HPV / cervical cancer", value: "Pap ± HPV starting 21 yrs per ASCCP guidelines")
            ]),
            .keyValueTable(title: "First-line treatments (CDC 2021)", [
                KeyValueRow(key: "Chlamydia", value: "Doxycycline 100 mg PO BID × 7 days (preferred); azithromycin 1 g × 1 alternative"),
                KeyValueRow(key: "Gonorrhea", value: "Ceftriaxone 500 mg IM × 1 (1 g if ≥150 kg) + treat for chlamydia if not ruled out"),
                KeyValueRow(key: "Syphilis (primary / secondary / early latent)", value: "Benzathine PCN G 2.4 million units IM × 1; doxy 100 mg BID × 14 days if PCN allergic + not pregnant"),
                KeyValueRow(key: "Syphilis (late latent / unknown)", value: "Benzathine PCN G 2.4 million units IM × 3 weekly"),
                KeyValueRow(key: "Trichomoniasis (women)", value: "Metronidazole 500 mg PO BID × 7 days"),
                KeyValueRow(key: "Trichomoniasis (men)", value: "Metronidazole 2 g PO × 1 OR tinidazole 2 g × 1"),
                KeyValueRow(key: "Genital warts", value: "Imiquimod 5% cream OR podofilox OR cryotherapy OR TCA"),
                KeyValueRow(key: "Genital herpes (initial)", value: "Acyclovir 400 mg TID × 7-10 days OR valacyclovir 1 g BID × 7-10 days"),
                KeyValueRow(key: "Genital herpes (recurrent / suppressive)", value: "Valacyclovir 500 mg-1 g daily for suppression; 1 g × 1 dose for episodic")
            ]),
            .bullets(title: "Partner management", [
                AttributedBullet("Treat partners (within 60 days prior) for chlamydia, gonorrhea, trichomoniasis.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("EXPEDITED PARTNER THERAPY (EPT) — prescription / medication to patient to deliver to partner without partner exam; legal in most US states.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Counsel partner on safer sex, encourage exam.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("HIV partner notification — confidential vs anonymous reporting per state.", citationIDs: ["cdc_pr_round20"])
            ]),
            .bullets(title: "Follow-up + re-testing", [
                AttributedBullet("ALL patients — re-test for chlamydia + gonorrhea + trichomoniasis at 3 months (high reinfection rate).", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Syphilis — RPR / VDRL titers at 6 + 12 months; 4-fold decline = adequate response.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("HIV — confirm + link to care + ART within 7 days; partner testing.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("HPV / cervical screening — per ASCCP age- + risk-based.", citationIDs: ["cdc_pr_round20"])
            ]),
            .bullets(title: "Prevention + counseling", [
                AttributedBullet("Condom use — male + female; barrier method demonstration.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Vaccination — HPV (through age 26, shared decision 27-45), HepB, mpox (risk-based).", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("HIV PrEP — daily tenofovir / emtricitabine for high-risk patients.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("HIV PEP — non-occupational within 72 hours; occupational asap (<2 hours ideal).", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Reduce number of partners + mutual monogamy + abstinence (range of options).", citationIDs: ["cdc_pr_round20"])
            ]),
            .bullets(title: "Special populations", [
                AttributedBullet("Pregnancy — universal HIV / syphilis / HBV / chlamydia / gonorrhea screening; HCV; trich + BV symptomatic; varicella / rubella history.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Adolescents — confidential STI / contraceptive care + minor consent laws per state.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("MSM — annual GC / CT / syphilis + HIV; rectal / oral sites; HPV; HepA/B/C.", citationIDs: ["cdc_pr_round20"]),
                AttributedBullet("Sexual assault — prophylactic ceftriaxone + doxy + metronidazole + emergency contraception + HepB vaccine + HIV PEP consideration.", citationIDs: ["cdc_pr_round20"])
            ])
        ],
        citations: [openrnPRR20, cdcPRR20, specialtyPRR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum MATOverviewSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "mat-overview",
        title: "Medication-assisted treatment (MAT) overview",
        subtitle: "OUD + AUD evidence-based · methadone / buprenorphine / naltrexone + counseling · 2023 X-waiver eliminated",
        eyebrow: "REFERENCE · ADDICTION MEDICINE",
        nclexTags: refTagsR20,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Medication-assisted treatment (MAT) = FDA-approved medication + behavioral therapy for substance use disorder. Evidence-based first-line for OUD + AUD. SAMHSA / ASAM emphasize MAT access; 2023 MAT Act eliminated DEA X-waiver requirement — any DEA-registered prescriber can now prescribe buprenorphine for OUD per primary source.",
                citationIDs: ["specialty_pr_round20"]
            )),
            .keyValueTable(title: "OUD medications", [
                KeyValueRow(key: "Methadone", value: "Full opioid agonist; reduces craving + withdrawal; OTP-only (federal regulation); long QT monitor; 30-120 mg/day typical"),
                KeyValueRow(key: "Buprenorphine ± naloxone", value: "Partial agonist; office-based; ceiling effect reduces overdose; sublingual or extended-release injectable Sublocade"),
                KeyValueRow(key: "Naltrexone (Vivitrol IM)", value: "Mu-receptor antagonist; monthly IM; requires 7-10 days opioid-free; precipitates withdrawal in active users; useful post-detox / post-incarceration")
            ]),
            .keyValueTable(title: "AUD medications", [
                KeyValueRow(key: "Naltrexone", value: "First-line; PO 50 mg daily OR Vivitrol IM 380 mg monthly; reduces cravings + heavy drinking days"),
                KeyValueRow(key: "Acamprosate", value: "Alternative; 666 mg PO TID; supports abstinence; renal adjust"),
                KeyValueRow(key: "Disulfiram", value: "Aversive; for motivated abstinent patients; severe reaction with alcohol; informed consent essential"),
                KeyValueRow(key: "Off-label / emerging", value: "Topiramate, gabapentin (mild–moderate withdrawal); baclofen; varenicline")
            ]),
            .bullets(title: "Buprenorphine initiation (most common OUD start)", [
                AttributedBullet("Confirm opioid withdrawal (COWS ≥12) before first dose — precipitated withdrawal otherwise.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Induction — 2-4 mg SL initial dose; titrate to 8-16 mg over 1-2 days; maximum 24 mg/day typical.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Maintenance — most patients 8-24 mg/day; long-term continuation preferred over tapering early.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Sublocade — extended-release 300 mg SQ monthly × 2, then 100 mg monthly; replaces daily SL.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Co-prescribe naloxone for overdose prevention.", citationIDs: ["specialty_pr_round20"])
            ]),
            .bullets(title: "Behavioral + psychosocial support", [
                AttributedBullet("Cognitive behavioral therapy (CBT), motivational interviewing.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("12-step (AA / NA), SMART Recovery, peer support.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Contingency management — incentives for negative drug screens; strong evidence.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Address co-occurring mental health, housing, employment, legal issues.", citationIDs: ["specialty_pr_round20"])
            ]),
            .bullets(title: "Harm reduction + overdose prevention", [
                AttributedBullet("NALOXONE distribution — universal; train patient + family; intranasal 4 mg per dose.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Fentanyl test strips — encourage in those continuing use; safer use education.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Syringe service programs — reduce HIV / HCV transmission; reduce risky use without increasing use.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Safe-use education for continued users — never alone, lower doses after abstinence, no mixing depressants.", citationIDs: ["specialty_pr_round20"])
            ]),
            .bullets(title: "Special populations", [
                AttributedBullet("PREGNANCY — methadone OR buprenorphine standard; naltrexone reserved; avoid detox in pregnancy.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("INCARCERATION re-entry — high overdose risk in 2 weeks post-release; arrange MAT continuity + naloxone.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("CHRONIC PAIN + OUD — combine SUD treatment with multimodal pain management; consider buprenorphine for both.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("ADOLESCENTS — MAT under-utilized; buprenorphine FDA-approved ≥16; parental + multidisciplinary support.", citationIDs: ["specialty_pr_round20"])
            ]),
            .bullets(title: "Common myths to address", [
                AttributedBullet("MAT is NOT \"trading one addiction for another\" — addiction = compulsive use despite harm; MAT stabilizes brain chemistry.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Long-term MAT is preferred — premature tapering associated with relapse + overdose.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("MAT reduces overdose death by 50%+ vs no treatment.", citationIDs: ["specialty_pr_round20"]),
                AttributedBullet("Abstinence-only is not the only goal — harm reduction + functional recovery acceptable.", citationIDs: ["specialty_pr_round20"])
            ])
        ],
        citations: [openrnPRR20, cdcPRR20, specialtyPRR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}
