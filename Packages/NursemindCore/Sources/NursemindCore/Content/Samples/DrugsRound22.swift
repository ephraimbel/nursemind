import Foundation

// Curator-model drug entries (round 22 — ENT + ophthalmology + dermatology).

private let openfdaR22 = CitationSource(
    id: "openfda_round22",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-12"
)
private let openrnPharmR22 = CitationSource(
    id: "openrn_pharm_round22",
    shortName: "Open RN Pharmacology + Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-12"
)
private let cdcR22 = CitationSource(
    id: "cdc_round22",
    shortName: "CDC + AAD + AAO + AAFP concept citations",
    publisher: "CDC · AAD · AAO · AAFP",
    license: .factCitationOnly,
    url: "https://www.cdc.gov/parasites/scabies/health_professionals/index.html",
    lastRetrieved: "2026-05-12"
)
private let specialtyR22 = CitationSource(
    id: "specialty_round22",
    shortName: "AAD acne + AAO conjunctivitis + IDSA / AAO-HNS guidelines",
    publisher: "AAD · AAO · IDSA · AAO-HNS",
    license: .factCitationOnly,
    url: "https://www.aad.org/member/clinical-quality/guidelines",
    lastRetrieved: "2026-05-12"
)

public enum ErythromycinOphthalmicSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "erythromycin-ophthalmic",
        title: "Erythromycin ophthalmic ointment 0.5%",
        subtitle: "Newborn ocular prophylaxis · bacterial conjunctivitis · macrolide · NOT for chlamydia / gonococcal eye disease",
        category: "Macrolide ophthalmic antibiotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Macrolide ophthalmic antibiotic ointment"),
            KeyValueRow(key: "Use", value: "Universal newborn ocular prophylaxis (state-mandated); mild bacterial conjunctivitis"),
            KeyValueRow(key: "Dose", value: "0.5–1 cm ribbon to lower conjunctival sac"),
            KeyValueRow(key: "Newborn", value: "Within 1 hour of birth (state laws vary 1-2 hrs)"),
            KeyValueRow(key: "Watch", value: "Does NOT cover chlamydia / gonococcal infection adequately — separate systemic abx required")
        ],
        indications: AttributedProse(
            "Universal newborn ocular prophylaxis against ophthalmia neonatorum (state-mandated in nearly all US states); mild bacterial conjunctivitis; blepharitis. Replaced silver nitrate due to better tolerability per primary source.",
            citationIDs: ["cdc_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Macrolide — binds 50S ribosomal subunit → inhibits protein synthesis → bacteriostatic at typical doses, bactericidal at high concentrations. Active against gram-positive cocci (Staph, Strep) + some gram-negatives + atypicals.",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Newborn ocular prophylaxis", body: "0.5-1 cm ribbon erythromycin 0.5% ointment to each lower conjunctival sac within 1 hour of birth (state-specific window 1-2 hrs) per primary source.", citationIDs: ["cdc_round22"]),
            DosingBlock(label: "Bacterial conjunctivitis", body: "0.5-1 cm ribbon to affected eye(s) BID-QID × 5-7 days per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Blepharitis", body: "0.5 cm ribbon to lid margins QHS × 4-8 weeks; combined with warm compresses + lid hygiene.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Pediatric conjunctivitis", body: "Same dose as adult; safe in infants beyond newborn period.", citationIDs: ["openrn_pharm_round22"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to erythromycin / macrolides. Caution — viral conjunctivitis (won't help); fungal eye infections (worsens); chlamydial / gonococcal eye disease (inadequate coverage — needs systemic) per primary source.",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("INADEQUATE FOR CHLAMYDIA + GONOCOCCAL ophthalmia neonatorum — newborn prophylaxis is for general bacterial; mothers with positive STI need treated newborns + systemic abx for proven infection per primary source.", citationIDs: ["cdc_round22"]),
            AttributedBullet("DOES NOT prevent transmission to mother / others — consider hand hygiene + separate towels.", citationIDs: ["specialty_round22"]),
            AttributedBullet("MAY CAUSE BLURRED VISION temporarily after application — counsel.", citationIDs: ["openfda_round22"]),
            AttributedBullet("RISK of resistance with overuse — reserve for clear bacterial cases; viral conjunctivitis (most common!) does NOT need abx.", citationIDs: ["specialty_round22"]),
            AttributedBullet("MILD irritation, erythema, transient burning common.", citationIDs: ["openfda_round22"])
        ],
        adverseReactions: AttributedProse(
            "Transient burning / stinging, eyelid pruritus, mild erythema, blurred vision (temporary), hypersensitivity reactions (rare), bacterial superinfection, fungal overgrowth.",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("Other ophthalmic medications — separate by ≥10 minutes for absorption.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Soft contact lenses — remove before application; ointment can damage / discolor.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Limited systemic absorption — minimal drug interactions vs systemic erythromycin.", citationIDs: ["openfda_round22"])
        ],
        nursingImplications: [
            AttributedBullet("NEWBORN ROUTINE — within 1 hour of birth; cleanse eye area first; pull lower lid down; apply ribbon in conjunctival sac; close eye gently per primary source.", citationIDs: ["cdc_round22"]),
            AttributedBullet("Document time + bilateral application; mandatory state report.", citationIDs: ["cdc_round22"]),
            AttributedBullet("Remove contact lenses before application; defer reinsertion ~15 min after.", citationIDs: ["openrn_pharm_round22"]),
            AttributedBullet("Discontinue if signs of irritation / hypersensitivity.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Re-evaluate if no improvement in 5-7 days; consider viral / chlamydial / gonococcal etiology.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Counsel parents — neonatal conjunctivitis at any age >24 hrs needs evaluation (chlamydia, gonococcus, HSV).", citationIDs: ["cdc_round22"])
        ],
        patientTeaching: AttributedProse(
            "We're putting a small amount of antibiotic ointment in the lower part of your baby's eyes — it's required by state law to prevent eye infections. Some redness for a day is normal. If discharge worsens or doesn't clear in 5 days, tell us right away.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum MoxifloxacinOphthalmicSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "moxifloxacin-ophthalmic",
        title: "Moxifloxacin ophthalmic 0.5% (Vigamox)",
        subtitle: "Fluoroquinolone eye drops · adult bacterial conjunctivitis · contact lens wearers · NOT for HSV keratitis",
        category: "Fluoroquinolone ophthalmic antibiotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "4th-generation fluoroquinolone — ophthalmic"),
            KeyValueRow(key: "Use", value: "Adult bacterial conjunctivitis; contact lens-associated keratitis (Pseudomonas coverage); pre / post intraocular surgery"),
            KeyValueRow(key: "Dose", value: "1 drop TID × 7 days for conjunctivitis"),
            KeyValueRow(key: "Watch", value: "Tendon rupture risk only with systemic; ophthalmic minimal absorption; NOT for HSV / fungal keratitis")
        ],
        indications: AttributedProse(
            "Bacterial conjunctivitis caused by susceptible organisms in adults + children ≥1 year. Contact lens-associated bacterial keratitis (Pseudomonas coverage). Selected post-operative ophthalmic prophylaxis per primary source.",
            citationIDs: ["specialty_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Fluoroquinolone — inhibits DNA gyrase + topoisomerase IV → inhibits bacterial DNA replication → bactericidal. Broad-spectrum gram-positive (including some MRSA) + gram-negative (including Pseudomonas).",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Bacterial conjunctivitis", body: "1 drop TID × 7 days per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Bacterial keratitis (severe)", body: "1 drop q1-2h while awake × 1-2 days, then taper per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Pediatric (≥1 year)", body: "Same as adult dose per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Pre/post-op ophthalmic", body: "1 drop QID × 1-3 days pre-op + 1-2 weeks post-op per surgeon protocol.", citationIDs: ["openrn_pharm_round22"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to moxifloxacin / fluoroquinolones. Caution — viral conjunctivitis (most common cause), HSV keratitis (worsens), fungal keratitis, contact lens wear during treatment per primary source.",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("CONTACT LENSES — REMOVE before application + during treatment; resume ≥15 min after dose; many infections precipitated by contact lens overuse.", citationIDs: ["specialty_round22"]),
            AttributedBullet("HSV KERATITIS RISK — abx don't help; can mask diagnosis; if unilateral painful red eye + branching corneal staining → ophthalmology emergent referral.", citationIDs: ["specialty_round22"]),
            AttributedBullet("FUNGAL KERATITIS — agricultural / vegetable trauma; needs specialty referral; abx don't help.", citationIDs: ["specialty_round22"]),
            AttributedBullet("BACTERIAL RESISTANCE — emerging; reserve for clear bacterial cases.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Burning / stinging on instillation common; tearing, pruritus.", citationIDs: ["openfda_round22"]),
            AttributedBullet("RARE — corneal precipitation, conjunctival hemorrhage; discontinue if persistent / severe.", citationIDs: ["openfda_round22"])
        ],
        adverseReactions: AttributedProse(
            "Burning / stinging on instillation, conjunctival hemorrhage, eye pain / irritation, blurred vision, dry eye, foreign body sensation, tearing, headache, hypersensitivity (rare).",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("Other ophthalmic medications — separate by ≥10 min.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Contact lenses — remove before application.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Limited systemic absorption — minimal interactions vs systemic fluoroquinolones.", citationIDs: ["openfda_round22"])
        ],
        nursingImplications: [
            AttributedBullet("Hand hygiene before application; teach proper drop technique — pull lower lid + apply drop in conjunctival sac.", citationIDs: ["openrn_pharm_round22"]),
            AttributedBullet("REMOVE contact lenses; reinsert ≥15 min after; counsel break from contacts during entire treatment if keratitis.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Apply NASOLACRIMAL OCCLUSION (gentle finger pressure on inner corner) × 1-2 min — reduces systemic absorption + improves ocular efficacy.", citationIDs: ["openrn_pharm_round22"]),
            AttributedBullet("Counsel — viral conjunctivitis (more common — clear watery + serous) doesn't need antibiotics; bacterial typically purulent + sticky / matted lashes.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Re-evaluate if no improvement in 48-72 hrs — consider viral, fungal, HSV, allergic.", citationIDs: ["specialty_round22"])
        ],
        patientTeaching: AttributedProse(
            "Wash hands before each dose. Pull down your lower eyelid, look up, drop in the pocket without touching the eye. Press gently on the inside corner of your eye for 1 minute after — keeps the medicine in the eye. Don't wear contact lenses while using this. Tell us if your eye gets worse or doesn't improve in 2-3 days.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum OlopatadineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "olopatadine",
        title: "Olopatadine 0.2% (Pataday) ophthalmic",
        subtitle: "H1 + mast cell stabilizer · seasonal allergic conjunctivitis · 1 drop daily-BID · OTC",
        category: "Dual-action H1 antagonist + mast cell stabilizer ophthalmic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dual-action H1 receptor antagonist + mast cell stabilizer"),
            KeyValueRow(key: "Use", value: "Seasonal allergic conjunctivitis (itching, redness, tearing); contact lens-related allergy"),
            KeyValueRow(key: "Dose", value: "0.2% — 1 drop daily; 0.1% — 1 drop BID; 0.7% (Pataday Once Daily) — 1 drop daily"),
            KeyValueRow(key: "Status", value: "Available OTC since 2020; previously Rx"),
            KeyValueRow(key: "Watch", value: "Reduces effectiveness if used during contact lens wear; preservative concerns")
        ],
        indications: AttributedProse(
            "Allergic conjunctivitis — seasonal (pollen) + perennial (dust mites, animal dander); contact lens-associated allergic conjunctivitis. Available 0.1%, 0.2%, 0.7% — different dosing per concentration per primary source.",
            citationIDs: ["specialty_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Dual action — H1 histamine receptor antagonist (immediate relief of itching, redness, tearing) + mast cell stabilizer (prevents continued release of histamine + mediators with regular use). More effective than single-mechanism agents.",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Olopatadine 0.2% (Pataday)", body: "1 drop in each affected eye daily per primary source.", citationIDs: ["openfda_round22"]),
            DosingBlock(label: "Olopatadine 0.1% (Patanol)", body: "1 drop in each affected eye BID per primary source.", citationIDs: ["openfda_round22"]),
            DosingBlock(label: "Olopatadine 0.7% (Pataday Once Daily)", body: "1 drop in each eye daily — extended duration (24 hrs).", citationIDs: ["openfda_round22"]),
            DosingBlock(label: "Pediatric (≥3 years)", body: "Same dose as adult per primary source.", citationIDs: ["openfda_round22"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — angle-closure glaucoma (theoretical); contact lens wear (remove before, reinsert 10+ min after); pregnancy / lactation Category C / discuss benefit-risk per primary source.",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("CONTACT LENSES — remove before application + reinsert ≥10 min after; benzalkonium chloride preservative damages lenses.", citationIDs: ["openfda_round22"]),
            AttributedBullet("USES — most effective with REGULAR scheduled dosing during allergy season vs PRN; mast-cell stabilization needs continuous therapy.", citationIDs: ["specialty_round22"]),
            AttributedBullet("AVOID overuse — preservatives can cause / worsen ocular surface disease.", citationIDs: ["specialty_round22"]),
            AttributedBullet("BLURRED VISION transient on instillation; counsel.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Distinguish from viral / bacterial conjunctivitis — abx not helpful for allergic; allergic typically bilateral + itchy + clear discharge.", citationIDs: ["specialty_round22"])
        ],
        adverseReactions: AttributedProse(
            "Burning / stinging, headache, dry eye, blurred vision, eye pain, foreign body sensation, taste perversion (rare), eyelid edema.",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("Other ophthalmic medications — separate by ≥10 min.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Limited systemic absorption — minimal interactions.", citationIDs: ["openfda_round22"]),
            AttributedBullet("MAOIs (theoretical concern for systemic) — not clinically relevant.", citationIDs: ["openfda_round22"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel proper drop technique — wash hands, look up, pull lower lid, apply drop without contact, blink gently.", citationIDs: ["openrn_pharm_round22"]),
            AttributedBullet("REGULAR scheduled dosing during allergy season > PRN use.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Combination with oral antihistamines (cetirizine) + nasal sprays (fluticasone) effective in moderate-severe allergic disease.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Allergen avoidance — close windows during pollen season, air filters, shower after outdoor exposure.", citationIDs: ["openrn_pharm_round22"]),
            AttributedBullet("Allergist referral if symptoms uncontrolled — immunotherapy may be appropriate.", citationIDs: ["specialty_round22"])
        ],
        patientTeaching: AttributedProse(
            "These drops help itchy / red allergy eyes. Use them DAILY during your allergy season — not just when symptoms flare. Wash your hands before. Don't touch the dropper to your eye. Take your contacts out before, put them back in 10 minutes later.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PermethrinTopicalSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "permethrin-topical",
        title: "Permethrin 5% topical cream (Elimite)",
        subtitle: "First-line scabies + lice · single application from neck-down · repeat in 7 days · whole household",
        category: "Pyrethroid topical scabicide / pediculicide",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Pyrethroid neurotoxin to ectoparasites"),
            KeyValueRow(key: "Use", value: "Scabies (5% cream); head lice / pubic lice (1% cream rinse)"),
            KeyValueRow(key: "Application", value: "Neck-down, leave 8-14 hrs (overnight), repeat in 7 days"),
            KeyValueRow(key: "Watch", value: "Treat ALL household contacts simultaneously; itching may persist 2-4 weeks (post-scabietic)"),
            KeyValueRow(key: "Note", value: "Permethrin 1% rinse vs 5% cream — different uses")
        ],
        indications: AttributedProse(
            "Scabies (5% cream) — first-line per CDC guidelines. Head lice / pediculosis capitis (1% cream rinse). Pubic lice / pediculosis pubis. Available OTC for lice; prescription for scabies cream per primary source.",
            citationIDs: ["cdc_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Pyrethroid — disrupts sodium channel function in arthropod nerve cells → paralysis + death. Selective toxicity for ectoparasites; mammalian metabolism rapid + safe.",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Scabies (5% cream)", body: "Apply thin layer from NECK DOWN to all skin (including under nails, between fingers / toes, genital area). Leave 8-14 hours (usually overnight). Wash off in shower. REPEAT in 7 days per primary source.", citationIDs: ["cdc_round22"]),
            DosingBlock(label: "Head lice (1% cream rinse)", body: "Apply to clean damp hair after shampoo, leave 10 min, rinse. Comb out nits with fine-tooth comb. REPEAT in 7-9 days per primary source.", citationIDs: ["cdc_round22"]),
            DosingBlock(label: "Pubic lice", body: "Apply 1% cream / 1% shampoo to affected areas, leave 10 min, rinse. Repeat in 7 days.", citationIDs: ["cdc_round22"]),
            DosingBlock(label: "Pediatric (>2 months)", body: "Same as adult; FDA-approved >2 months for permethrin 5% scabies cream per primary source.", citationIDs: ["cdc_round22"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to permethrin / pyrethroids / chrysanthemums. Caution — open wounds, severe eczema, infants <2 months, pregnancy / lactation (Category B — generally safe but discuss). Pubic lice on eyelashes — different management per primary source.",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("TREAT ALL HOUSEHOLD CONTACTS SIMULTANEOUSLY for scabies — even asymptomatic; reinfestation common otherwise per primary source.", citationIDs: ["cdc_round22"]),
            AttributedBullet("ITCHING + RASH may persist 2-4 weeks after successful treatment (post-scabietic itch from dead mites + eggs); does NOT mean failure; treat with antihistamines + topical steroids.", citationIDs: ["cdc_round22"]),
            AttributedBullet("ENVIRONMENTAL — wash all clothing + bedding in HOT water; dry on HIGH heat; non-washable items sealed in plastic bag × 72 hours.", citationIDs: ["cdc_round22"]),
            AttributedBullet("RESISTANCE emerging — if recurrence after appropriate treatment, consider IVERMECTIN oral.", citationIDs: ["cdc_round22"]),
            AttributedBullet("APPLICATION SITE — burning, stinging, erythema, pruritus increase common; usually mild + transient.", citationIDs: ["openfda_round22"]),
            AttributedBullet("AVOID eye + mucous membrane contact; wash thoroughly if accidental.", citationIDs: ["openfda_round22"])
        ],
        adverseReactions: AttributedProse(
            "Application site burning / stinging / erythema / pruritus, paresthesias, edema; rare allergic reactions; very rare neurotoxicity at high systemic absorption.",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("Other topical agents — apply separately; potential interaction with topical steroids reduces efficacy.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Limited systemic absorption — minimal drug interactions.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Concurrent oral ivermectin — for refractory or severe scabies (combination effective).", citationIDs: ["cdc_round22"])
        ],
        nursingImplications: [
            AttributedBullet("APPLY thin layer NECK-DOWN over entire body — emphasize under nails (trim first), between fingers / toes, genital area, behind ears, navel; in infants include face + scalp.", citationIDs: ["cdc_round22"]),
            AttributedBullet("Leave on 8-14 hrs (overnight); shower off in morning.", citationIDs: ["cdc_round22"]),
            AttributedBullet("REPEAT in 7 days — second treatment kills newly hatched mites; emphasize importance.", citationIDs: ["cdc_round22"]),
            AttributedBullet("WASH all bedding + clothing + towels in HOT water; dry HIGH heat; non-washables sealed in plastic bag × 72 hrs.", citationIDs: ["cdc_round22"]),
            AttributedBullet("TREAT ALL household / sexual contacts simultaneously, even if asymptomatic.", citationIDs: ["cdc_round22"]),
            AttributedBullet("Counsel post-scabietic itch — may persist 2-4 weeks; antihistamines + topical steroids; DOES NOT mean treatment failure.", citationIDs: ["cdc_round22"]),
            AttributedBullet("PUBIC LICE on eyelashes — petrolatum 4×/day × 10 days OR ophthalmic-grade ointment; permethrin too irritating for eyes.", citationIDs: ["cdc_round22"])
        ],
        patientTeaching: AttributedProse(
            "Apply this cream from your neck down to your toes — every inch of skin, including between fingers and toes, around your nails, your genitals, and behind your ears. Leave it on overnight (at least 8 hours), then shower it off. Do this AGAIN in 7 days. Wash all bedding and clothes in hot water and dry on high heat. Everyone in your household should be treated even if they aren't itching. Itching can last for weeks even after the bugs are dead.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum TretinoinTopicalSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tretinoin-topical",
        title: "Tretinoin topical (Retin-A, Renova, Atralin)",
        subtitle: "Vitamin A derivative · acne + photoaging · pregnancy CATEGORY X · sun protection essential",
        category: "Topical retinoid",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Topical vitamin A derivative (retinoid)"),
            KeyValueRow(key: "Use", value: "Acne vulgaris; photoaging; melasma; off-label keratosis pilaris"),
            KeyValueRow(key: "Dose", value: "0.025-0.1% cream / gel applied QHS to clean dry skin"),
            KeyValueRow(key: "Pregnancy", value: "CATEGORY X — teratogenic; contraception essential; do not use in pregnancy"),
            KeyValueRow(key: "Watch", value: "Initial flare in first 2-4 weeks; photosensitivity; severe irritation can occur")
        ],
        indications: AttributedProse(
            "Acne vulgaris (comedonal + inflammatory) — first-line topical retinoid per AAD guidelines; photoaging (fine wrinkles, dyspigmentation, roughness — Renova labeled); melasma; off-label uses keratosis pilaris, perioral dermatitis, post-inflammatory hyperpigmentation per primary source.",
            citationIDs: ["specialty_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Binds nuclear retinoic acid receptors → modulates gene expression → normalizes keratinocyte differentiation, reduces follicular plugging, anti-inflammatory effects, increases collagen / elastin. Pleiotropic — improves acne lesions + texture + pigmentation.",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Acne (start)", body: "0.025% cream / gel — pea-sized amount applied to clean dry face QHS; start every-other-night × 1-2 weeks then nightly per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Acne (maintenance)", body: "Titrate to 0.05-0.1% as tolerated; once-nightly application; combine with benzoyl peroxide in morning for optimal effect.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Photoaging (Renova)", body: "0.02% emollient cream nightly per primary source; start every-other-night.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Pediatric (acne ≥10 years)", body: "Same as adult start; titrate cautiously per primary source.", citationIDs: ["specialty_round22"])
        ],
        contraindications: AttributedProse(
            "PREGNANCY — Category X (oral isotretinoin teratogenic; topical risk less defined but principle of caution); breastfeeding (topical generally safe but defer); hypersensitivity per primary source.",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("PREGNANCY — DO NOT use in pregnancy or attempting; reliable contraception during use; counsel + document.", citationIDs: ["specialty_round22"]),
            AttributedBullet("PHOTOSENSITIVITY — significantly increased; daily SPF 30+ broad-spectrum sunscreen + avoid prolonged sun exposure / tanning beds per primary source.", citationIDs: ["specialty_round22"]),
            AttributedBullet("INITIAL FLARE in first 2-4 weeks (\"retinoid uglies\") — counsel to expect; titrate slowly to minimize.", citationIDs: ["specialty_round22"]),
            AttributedBullet("IRRITATION — burning, redness, peeling common; severe in first few weeks; reduce frequency / strength if intolerable.", citationIDs: ["specialty_round22"]),
            AttributedBullet("AVOID concomitant — benzoyl peroxide (apply at separate times — BP morning + tretinoin evening; some formulations OK to combine), salicylic acid, glycolic acid, harsh exfoliants, waxing.", citationIDs: ["specialty_round22"]),
            AttributedBullet("BENZOYL PEROXIDE inactivates tretinoin at same application — separate by 2+ hours.", citationIDs: ["specialty_round22"])
        ],
        adverseReactions: AttributedProse(
            "Local irritation (burning, peeling, erythema, dryness), photosensitivity, post-inflammatory hyperpigmentation (initial darkening), initial worsening of acne (\"flare\"), eyelid / lip irritation, allergic contact dermatitis (rare).",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("Benzoyl peroxide — same application time inactivates; separate by 2+ hours OR use combo formulation.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Other photosensitizing agents — additive sun damage; counsel.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Other irritating topicals — additive irritation; alpha hydroxy acids, salicylic acid, harsh cleansers.", citationIDs: ["specialty_round22"])
        ],
        nursingImplications: [
            AttributedBullet("Apply to CLEAN DRY skin; wait 20-30 min after washing (wet skin enhances absorption + irritation).", citationIDs: ["specialty_round22"]),
            AttributedBullet("PEA-SIZED amount for entire face — more is not better, increases irritation.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Start EVERY-OTHER-NIGHT × 1-2 weeks then nightly; titrate to nightly tolerance.", citationIDs: ["specialty_round22"]),
            AttributedBullet("DAILY SUNSCREEN SPF 30+ broad-spectrum; counsel sun avoidance.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Pregnancy counseling + contraception — Category X; document.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Combine with benzoyl peroxide (morning) + tretinoin (evening) for synergistic acne benefit.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Counsel — improvement in 8-12 weeks; initial flare is normal not failure.", citationIDs: ["specialty_round22"])
        ],
        patientTeaching: AttributedProse(
            "Wash your face gently and wait 20-30 minutes for it to fully dry. Use a pea-sized amount for your whole face at bedtime. Your skin may peel and look worse for the first 2-4 weeks — don't stop, push through. Wear sunscreen daily — this medicine makes you burn easily. AVOID this medicine if you might be pregnant. It can take 2-3 months to see real improvement.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum BenzoylPeroxideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "benzoyl-peroxide",
        title: "Benzoyl peroxide topical (BP, BPO)",
        subtitle: "Antibacterial + comedolytic · OTC + Rx · 2.5-10% · bleaches fabric · combine with topical retinoid + abx",
        category: "Topical antimicrobial / comedolytic for acne",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Topical peroxide — antibacterial + comedolytic"),
            KeyValueRow(key: "Use", value: "Acne vulgaris (mild-moderate); combination with topical antibiotics, retinoids"),
            KeyValueRow(key: "Strength", value: "OTC 2.5-10%; Rx as combination products"),
            KeyValueRow(key: "Watch", value: "BLEACHES fabric / hair / towels permanently; initial irritation; reduces antibiotic resistance vs abx alone")
        ],
        indications: AttributedProse(
            "Acne vulgaris — first-line OTC + Rx; mild-moderate inflammatory + comedonal acne. Combination with topical antibiotics (clindamycin or erythromycin) reduces antibiotic resistance development. Body acne (chest, back) per primary source.",
            citationIDs: ["specialty_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Releases free radical oxygen → kills Cutibacterium (Propionibacterium) acnes + reduces inflammation. Mild keratolytic / comedolytic. NO antibiotic resistance development per primary source.",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Acne (face)", body: "Apply thin layer to affected areas 1-2× daily; start once daily to assess tolerance per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Acne (body)", body: "5-10% wash used as cleanser in shower 1-2× daily; rinse thoroughly per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Combination products", body: "Adapalene-BP (Epiduo), clindamycin-BP (BenzaClin), tretinoin-BP — once-daily formulations per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Pediatric (>12 years)", body: "Same as adult; cautious in younger children.", citationIDs: ["specialty_round22"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — broken / irritated skin, severe eczema, simultaneous tretinoin (inactivation), pregnancy (limited data — likely safe topical).",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("BLEACHES — permanently bleaches clothing, towels, sheets, hair; use white pillowcase + towels; counsel.", citationIDs: ["specialty_round22"]),
            AttributedBullet("INITIAL IRRITATION — burning, redness, peeling, dryness common first 2-4 weeks; reduce frequency / strength if severe.", citationIDs: ["specialty_round22"]),
            AttributedBullet("PHOTOSENSITIVITY (mild) — daily sunscreen recommended.", citationIDs: ["openfda_round22"]),
            AttributedBullet("SEVERE ALLERGIC reactions (rare) — discontinue if angioedema, throat swelling, fainting per primary source.", citationIDs: ["openfda_round22"]),
            AttributedBullet("AVOID concurrent application with tretinoin — BP inactivates at same time; SEPARATE by AM (BP) + PM (tretinoin).", citationIDs: ["specialty_round22"])
        ],
        adverseReactions: AttributedProse(
            "Local irritation, burning, dryness, peeling, erythema; bleaching of clothing / hair; rare allergic contact dermatitis; rare anaphylactic reactions (FDA warning).",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("TRETINOIN — same-time application inactivates; separate by AM/PM.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Other topical irritants — additive irritation.", citationIDs: ["specialty_round22"]),
            AttributedBullet("CLINDAMYCIN-BP combination — synergistic + reduces clindamycin resistance.", citationIDs: ["specialty_round22"])
        ],
        nursingImplications: [
            AttributedBullet("WASH HANDS thoroughly after application; bleaches anything touched.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Use WHITE pillowcase + towels; counsel hair color may lighten.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Start LOWER concentration (2.5-5%) + ONCE daily; titrate to BID + higher concentration as tolerated.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Apply BP in MORNING + tretinoin at NIGHT — avoid simultaneous application.", citationIDs: ["specialty_round22"]),
            AttributedBullet("DAILY sunscreen — mild photosensitizer.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Consider combination Rx products (Epiduo, BenzaClin) for adherence + efficacy.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Counsel improvement in 8-12 weeks; persistent failure → dermatology referral.", citationIDs: ["specialty_round22"])
        ],
        patientTeaching: AttributedProse(
            "This cleans bacteria off your skin and helps unclog pores. Wash your hands after — it bleaches towels and clothes (use white ones!). Use it in the morning if you also use tretinoin at night. Wear sunscreen daily. Improvement takes 2-3 months. If you get a rash beyond mild irritation or have trouble breathing, stop and call us.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum MinocyclineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "minocycline",
        title: "Minocycline (Minocin, Solodyn)",
        subtitle: "Tetracycline class · acne + skin / soft tissue + others · DRESS / autoimmune hepatitis risk · skin pigmentation",
        category: "Tetracycline class antibiotic (oral)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Tetracycline antibiotic"),
            KeyValueRow(key: "Use", value: "Acne vulgaris (severe / refractory inflammatory); rosacea; hidradenitis; community-acquired MRSA skin infections; rickettsial disease"),
            KeyValueRow(key: "Dose", value: "Acne 50-100 mg PO BID; extended-release 1 mg/kg/day"),
            KeyValueRow(key: "Watch", value: "DRESS syndrome, drug-induced lupus, autoimmune hepatitis, blue-gray skin pigmentation, vestibular toxicity"),
            KeyValueRow(key: "Pregnancy", value: "Category D — avoid; permanent tooth discoloration in fetus + child <8 yrs")
        ],
        indications: AttributedProse(
            "Severe / refractory inflammatory acne vulgaris (when topical + first-line oral abx inadequate); rosacea (papulopustular); hidradenitis suppurativa; community-acquired MRSA skin / soft tissue infection; rickettsial disease; selected gram-negative + atypical infections per primary source.",
            citationIDs: ["specialty_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Tetracycline — binds 30S ribosomal subunit → inhibits protein synthesis → bacteriostatic. Anti-inflammatory effects independent of antibacterial action — useful in acne, rosacea, periodontitis. Better tissue penetration + lipid solubility vs doxycycline.",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Acne — immediate-release", body: "50-100 mg PO BID per primary source; lower dose for maintenance.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Acne — extended-release (Solodyn)", body: "1 mg/kg/day PO once daily per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Skin/soft tissue infection", body: "200 mg PO × 1, then 100 mg PO BID × 5-10 days per primary source.", citationIDs: ["openfda_round22"]),
            DosingBlock(label: "Hidradenitis suppurativa", body: "50-100 mg PO BID × 3-6 months; combination per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Pediatric (>8 yrs)", body: "200 mg PO × 1, then 100 mg PO BID; AVOID <8 yrs (dental staining).", citationIDs: ["specialty_round22"])
        ],
        contraindications: AttributedProse(
            "Pregnancy (Category D — fetal tooth discoloration, growth retardation), children <8 years (permanent tooth discoloration), hypersensitivity to tetracyclines, severe hepatic / renal impairment per primary source.",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("DRESS SYNDROME (drug rash with eosinophilia + systemic symptoms) — fever, rash, lymphadenopathy, eosinophilia, organ involvement; 2-8 weeks after start; LIFE-THREATENING per primary source.", citationIDs: ["specialty_round22"]),
            AttributedBullet("DRUG-INDUCED LUPUS — arthralgia, ANA+, occasionally serositis; reversible on discontinuation.", citationIDs: ["specialty_round22"]),
            AttributedBullet("AUTOIMMUNE HEPATITIS — transaminitis up to 24x ULN; weeks to years after start; check LFTs at 6-8 weeks then periodically.", citationIDs: ["specialty_round22"]),
            AttributedBullet("BLUE-GRAY SKIN PIGMENTATION — long-term use; sun-exposed areas, scars, oral mucosa, sclera, teeth; partial reversibility.", citationIDs: ["specialty_round22"]),
            AttributedBullet("VESTIBULAR TOXICITY — dizziness, vertigo (~10%); usually resolves in days but can persist.", citationIDs: ["openfda_round22"]),
            AttributedBullet("PHOTOSENSITIVITY (less than doxy) — daily sunscreen.", citationIDs: ["openfda_round22"]),
            AttributedBullet("PSEUDOTUMOR CEREBRI — headache, papilledema, vision changes; emergent neuro eval.", citationIDs: ["specialty_round22"]),
            AttributedBullet("C. DIFFICILE colitis possible.", citationIDs: ["openfda_round22"])
        ],
        adverseReactions: AttributedProse(
            "GI (nausea, vomiting, diarrhea), photosensitivity, vestibular (dizziness, vertigo), DRESS, drug-induced lupus, autoimmune hepatitis, blue-gray pigmentation, pseudotumor cerebri, esophagitis (take with full glass water), C. diff.",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("Antacids, calcium, iron, magnesium, dairy — chelate + reduce absorption; separate by 2+ hrs.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Warfarin — potentiates anticoagulant effect; monitor INR.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Oral contraceptives — possible reduced efficacy (modest); counsel backup contraception.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Isotretinoin — concurrent use can cause pseudotumor cerebri.", citationIDs: ["specialty_round22"])
        ],
        nursingImplications: [
            AttributedBullet("Take with FULL GLASS WATER + while standing / sitting upright × 30 min — esophagitis risk.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Separate from antacids / iron / dairy by 2+ hrs.", citationIDs: ["openfda_round22"]),
            AttributedBullet("DAILY SUNSCREEN SPF 30+; counsel.", citationIDs: ["specialty_round22"]),
            AttributedBullet("BASELINE LFTs + ANA before extended use; periodic monitoring per primary source.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Counsel on DRESS warning signs — fever, rash, malaise, lymphadenopathy 2-8 weeks after start.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Counsel on lupus warning signs — joint pain, fatigue, fever; ANA + check.", citationIDs: ["specialty_round22"]),
            AttributedBullet("AVOID in pregnancy + children <8 years; pregnancy testing pre-treatment in females of reproductive age.", citationIDs: ["specialty_round22"])
        ],
        patientTeaching: AttributedProse(
            "Take this with a full glass of water; stay upright (sitting / standing) for 30 minutes after to prevent throat irritation. Use sunscreen daily. Tell us right away about fever, rash, joint pain, headache, vision changes, or feeling really sick — these are serious side effects. Do NOT take if you might be pregnant. Avoid dairy, antacids, and iron pills within 2 hours of dose.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum FluticasoneNasalSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fluticasone-nasal",
        title: "Fluticasone nasal (Flonase)",
        subtitle: "Intranasal corticosteroid · first-line allergic rhinitis · OTC · daily use most effective · 2-week onset",
        category: "Intranasal corticosteroid",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Intranasal corticosteroid"),
            KeyValueRow(key: "Use", value: "Allergic rhinitis (seasonal + perennial); non-allergic rhinitis; nasal polyps"),
            KeyValueRow(key: "Dose", value: "1-2 sprays each nostril once daily; OTC available"),
            KeyValueRow(key: "Watch", value: "Onset 12 hrs - 2 weeks; minor systemic absorption; rare epistaxis, perforation; not for nasal congestion alone")
        ],
        indications: AttributedProse(
            "Allergic rhinitis (seasonal + perennial) — first-line per AAAAI guidelines per primary source; non-allergic rhinitis; nasal polyposis (selected); chronic rhinosinusitis (with appropriate workup).",
            citationIDs: ["specialty_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Topical corticosteroid — reduces inflammation in nasal mucosa via inhibition of inflammatory cytokines + cell migration. Multifactorial — reduces eosinophils, mast cells, vascular permeability; improves nasal congestion, rhinorrhea, sneezing, itching.",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Adult allergic rhinitis", body: "2 sprays each nostril daily (initial); may decrease to 1 spray each daily for maintenance per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Pediatric (≥4 years)", body: "1 spray each nostril daily; may increase to 2 if needed; pediatric weight-based for younger.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Nasal polyps", body: "2 sprays each nostril BID; specialist supervision.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Chronic rhinosinusitis", body: "2 sprays each nostril BID per ENT.", citationIDs: ["specialty_round22"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — recent nasal surgery / trauma / septum injury, ocular HSV, untreated systemic infection, asthma without inhaled corticosteroid.",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("ONSET 12 hrs to 2 weeks — counsel patience; daily use most effective vs PRN.", citationIDs: ["specialty_round22"]),
            AttributedBullet("EPISTAXIS — common (~10%); usually mild; angle nozzle AWAY from septum to reduce.", citationIDs: ["openfda_round22"]),
            AttributedBullet("NASAL SEPTAL PERFORATION (rare) — long-term use; counsel + monitor.", citationIDs: ["specialty_round22"]),
            AttributedBullet("CANDIDIASIS (oral / nasal) — uncommon; rinse mouth + spit after if also using inhaled steroid.", citationIDs: ["openfda_round22"]),
            AttributedBullet("SLOWED PEDIATRIC GROWTH (mild) — minimal at recommended doses; growth monitoring; reduce dose if possible.", citationIDs: ["specialty_round22"]),
            AttributedBullet("SYSTEMIC ABSORPTION — minimal vs oral steroids; HPA axis suppression rare at standard doses.", citationIDs: ["openfda_round22"]),
            AttributedBullet("CATARACTS / GLAUCOMA — long-term use; baseline + periodic eye exam in long-term users.", citationIDs: ["specialty_round22"])
        ],
        adverseReactions: AttributedProse(
            "Epistaxis, nasal burning / irritation, cough, throat irritation, headache, sneezing, nasal candidiasis, rare septal perforation, very rare adrenal suppression / growth slowing.",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (ritonavir, ketoconazole) — increase systemic levels; consider alternative.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Other corticosteroids — additive systemic effects with concurrent oral / inhaled.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Generally safe with antihistamines, leukotriene modifiers — combination commonly used.", citationIDs: ["specialty_round22"])
        ],
        nursingImplications: [
            AttributedBullet("CORRECT TECHNIQUE — head slightly forward, angle spray AWAY from septum (toward ear), gentle inhalation; do NOT sniff vigorously per primary source.", citationIDs: ["specialty_round22"]),
            AttributedBullet("DAILY use × 1-2 weeks for maximum effect; not for as-needed congestion relief.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Counsel onset of action — initial 12 hrs; full effect 2 weeks.", citationIDs: ["specialty_round22"]),
            AttributedBullet("EPISTAXIS — angle properly + don't blow nose immediately after.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Combine with allergen avoidance + oral antihistamine (cetirizine) if uncontrolled.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Pediatric — growth monitoring at well visits; reduce dose if possible.", citationIDs: ["specialty_round22"])
        ],
        patientTeaching: AttributedProse(
            "Tilt your head slightly forward. Aim the spray away from the middle of your nose — toward your ear on each side. Take a gentle breath in as you spray. Use this EVERY day even when you feel okay — it works best with regular use. It takes 2 weeks to work fully. If you get nosebleeds, change your aim. Don't blow your nose right after.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AzelastineNasalSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "azelastine-nasal",
        title: "Azelastine nasal (Astelin, Astepro)",
        subtitle: "Intranasal H1 antihistamine · faster onset than fluticasone · bitter taste · combine with steroid",
        category: "Intranasal H1 antihistamine",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Intranasal H1 antihistamine"),
            KeyValueRow(key: "Use", value: "Allergic rhinitis (seasonal + perennial); non-allergic rhinitis; faster onset than nasal steroids"),
            KeyValueRow(key: "Dose", value: "1-2 sprays each nostril BID"),
            KeyValueRow(key: "Watch", value: "Bitter taste, sedation possible (vs other antihistamine routes), often combined with fluticasone (Dymista)")
        ],
        indications: AttributedProse(
            "Allergic rhinitis (seasonal + perennial) — alternative to or combination with intranasal corticosteroid. Non-allergic vasomotor rhinitis (azelastine has labeled indication). Faster onset of action than nasal steroids per primary source.",
            citationIDs: ["specialty_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "H1 receptor antagonist (also mast cell stabilizing + anti-inflammatory effects). Topical action in nasal mucosa with minimal systemic absorption. Onset 15-30 min vs hours-weeks for nasal steroid.",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Astelin (0.1%)", body: "2 sprays each nostril BID (adult); 1 spray each nostril BID (children 5-11) per primary source.", citationIDs: ["openfda_round22"]),
            DosingBlock(label: "Astepro (0.15%)", body: "1-2 sprays each nostril BID per primary source.", citationIDs: ["openfda_round22"]),
            DosingBlock(label: "Combination Dymista (azelastine + fluticasone)", body: "1 spray each nostril BID — combined antihistamine + steroid in single device.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Pediatric (≥5 years)", body: "Per product label; lower dose for younger patients.", citationIDs: ["specialty_round22"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to azelastine. Caution — recent nasal trauma / surgery, alcohol / CNS depressants (additive sedation possible despite topical route).",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("BITTER TASTE — common; angle spray away from septum, breathe gently, avoid sniffing back.", citationIDs: ["openfda_round22"]),
            AttributedBullet("SEDATION possible (small minority) — caution with driving / ETOH initially; less than oral antihistamines.", citationIDs: ["openfda_round22"]),
            AttributedBullet("EPISTAXIS — minor; angle properly.", citationIDs: ["openfda_round22"]),
            AttributedBullet("HEADACHE common; usually self-limited.", citationIDs: ["openfda_round22"]),
            AttributedBullet("DYMISTA combination — most effective per primary source for moderate-severe allergic rhinitis vs single agent; superior to either alone.", citationIDs: ["specialty_round22"])
        ],
        adverseReactions: AttributedProse(
            "Bitter taste, headache, somnolence, nasal burning, fatigue, weight gain (rare), epistaxis.",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("Alcohol + CNS depressants — additive sedation possible.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Other antihistamines — additive antihistaminic effects.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Combination with intranasal steroid (Dymista) is preferred over separate sprays for adherence.", citationIDs: ["specialty_round22"])
        ],
        nursingImplications: [
            AttributedBullet("CORRECT TECHNIQUE — head slightly forward, angle AWAY from septum, gentle inhalation; minimize bitter taste.", citationIDs: ["openrn_pharm_round22"]),
            AttributedBullet("DRINK fluids after dosing to wash bitter taste.", citationIDs: ["openrn_pharm_round22"]),
            AttributedBullet("FASTER onset than nasal steroid — useful for breakthrough symptoms.", citationIDs: ["specialty_round22"]),
            AttributedBullet("DYMISTA (azelastine + fluticasone) — combined product for moderate-severe; better than either alone.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Caution with driving + alcohol initially — sedation in small minority.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Daily use during allergy season for maximum benefit.", citationIDs: ["specialty_round22"])
        ],
        patientTeaching: AttributedProse(
            "This works faster than the steroid spray — within 30 minutes. Use it twice daily during allergy season. Aim away from the middle of your nose. It tastes bitter — that's normal; drink water after. If you also have a steroid spray, combination products (Dymista) work even better.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum NystatinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "nystatin",
        title: "Nystatin (Mycostatin)",
        subtitle: "Polyene topical / oral antifungal · oral candidiasis (thrush) · diaper rash · NOT systemically absorbed",
        category: "Polyene topical / oral antifungal",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Polyene antifungal — Candida species coverage"),
            KeyValueRow(key: "Use", value: "Oral candidiasis (oropharyngeal thrush); cutaneous candidiasis (intertrigo, diaper rash); vaginal candidiasis (less common today)"),
            KeyValueRow(key: "Dose", value: "Oral suspension 100,000 units/mL — 4-6 mL swish-swallow QID; topical cream/powder"),
            KeyValueRow(key: "Watch", value: "Not systemically absorbed; bitter taste oral suspension; poor adherence common")
        ],
        indications: AttributedProse(
            "Oral candidiasis (thrush) — first-line topical for mild-moderate; cutaneous candidiasis (intertrigo, diaper rash, paronychia); vaginal candidiasis (azoles preferred today). NOT effective for systemic / esophageal candidiasis (use fluconazole) per primary source.",
            citationIDs: ["specialty_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Polyene macrolide — binds ergosterol in fungal cell membrane → pore formation → leaky cell + fungistatic / fungicidal. Active against Candida species; minimal mammalian toxicity (binds cholesterol weakly).",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Oral candidiasis (adults)", body: "4-6 mL nystatin oral suspension (100,000 units/mL) QID — swish 30 sec, then swallow OR spit; continue 48 hrs after symptom resolution per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Oral candidiasis (infants)", body: "1-2 mL each side of mouth QID using cotton swab; continue 48 hrs after resolution.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Cutaneous candidiasis", body: "Apply cream / ointment / powder BID-TID until resolution + 7 days.", citationIDs: ["openfda_round22"]),
            DosingBlock(label: "Vaginal", body: "1 vaginal tablet 100,000 units intravaginally daily × 14 days (azoles preferred today).", citationIDs: ["openfda_round22"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Generally safe — topical / oral suspension not absorbed systemically; limited contraindications.",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("BITTER TASTE — major adherence issue; may add small amount sweetener / refrigerate to improve.", citationIDs: ["specialty_round22"]),
            AttributedBullet("ESOPHAGEAL CANDIDIASIS — nystatin INADEQUATE; use fluconazole for any extension to esophagus or systemic disease.", citationIDs: ["specialty_round22"]),
            AttributedBullet("REFRACTORY ORAL CANDIDIASIS — consider fluconazole; immunocompromised state evaluation.", citationIDs: ["specialty_round22"]),
            AttributedBullet("RISK FACTORS for recurrent oral candidiasis — inhaled corticosteroids (rinse mouth after), denture wearers (clean dentures + remove at night), antibiotics, diabetes, HIV.", citationIDs: ["specialty_round22"]),
            AttributedBullet("DIAPER RASH — combine with zinc oxide barrier cream + frequent diaper changes for candidal diaper dermatitis.", citationIDs: ["specialty_round22"])
        ],
        adverseReactions: AttributedProse(
            "Bitter / unpleasant taste, nausea, vomiting, diarrhea (with oral); local irritation (topical); rare hypersensitivity reactions.",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("Limited systemic absorption — minimal drug interactions.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Inhaled corticosteroid users — rinse mouth + spit after each dose to prevent thrush; routine prevention.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Antibiotics — predispose to candidal overgrowth; counsel on signs.", citationIDs: ["specialty_round22"])
        ],
        nursingImplications: [
            AttributedBullet("ORAL SUSPENSION — swish in mouth 30 sec to maximize contact, then swallow OR spit per primary source.", citationIDs: ["specialty_round22"]),
            AttributedBullet("CONTINUE × 48 hrs after symptoms resolve to prevent recurrence.", citationIDs: ["specialty_round22"]),
            AttributedBullet("DENTURE WEARERS — remove dentures + brush with nystatin / clean separately; soak dentures overnight in chlorhexidine.", citationIDs: ["specialty_round22"]),
            AttributedBullet("INFANTS — apply with cotton-tipped applicator to inside of cheeks + tongue; lower dose; check for white plaques.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Refractory or extensive — consider fluconazole; immunocompromised workup.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Inhaled corticosteroid use — counsel rinse + spit prevention.", citationIDs: ["specialty_round22"])
        ],
        patientTeaching: AttributedProse(
            "Swish this thick liquid in your mouth for 30 seconds, getting all the white patches, then swallow it. Don't eat or drink for 30 minutes after. Continue for 2 days after the white patches are gone. If you wear dentures, take them out at night and clean them. If you use a steroid inhaler, rinse your mouth and spit after each puff.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ClotrimazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "clotrimazole-topical",
        title: "Clotrimazole topical (Lotrimin AF)",
        subtitle: "Imidazole · cutaneous fungal · OTC · BID × 2-4 weeks · safe in pregnancy",
        category: "Topical imidazole antifungal",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Imidazole topical antifungal — broad spectrum"),
            KeyValueRow(key: "Use", value: "Tinea (corporis, cruris, pedis); cutaneous candidiasis; vaginal candidiasis"),
            KeyValueRow(key: "Dose", value: "Apply BID × 2-4 weeks (continue 1-2 weeks after symptom resolution)"),
            KeyValueRow(key: "Watch", value: "Local irritation; OTC widely available; safe in pregnancy")
        ],
        indications: AttributedProse(
            "Cutaneous tinea infections — corporis (ringworm), cruris (jock itch), pedis (athlete's foot), versicolor; cutaneous candidiasis (intertrigo, diaper rash); vaginal candidiasis. Available OTC + Rx per primary source.",
            citationIDs: ["specialty_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Imidazole — inhibits ergosterol synthesis (CYP51 enzyme) → disrupts fungal cell membrane → fungistatic. Broad spectrum — dermatophytes, yeasts, some molds.",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Cutaneous (cream/lotion/solution)", body: "Apply thin layer BID × 2-4 weeks (tinea pedis sometimes 4 weeks); continue 1-2 weeks after symptom resolution per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Vaginal candidiasis (1% cream / vaginal tablet)", body: "1 applicator daily × 7 days OR 100 mg vaginal tablet × 7 days OR 200 mg × 3 days OR 500 mg × 1 dose per primary source.", citationIDs: ["openfda_round22"]),
            DosingBlock(label: "Pediatric", body: "Same dosing as adult; safe in infants for diaper candidiasis.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Pregnancy / lactation", body: "Topical / vaginal generally safe; preferred over oral fluconazole in pregnancy.", citationIDs: ["specialty_round22"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to imidazoles. Caution — application near eyes / mucous membranes; broken / inflamed skin (irritation).",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("LOCAL IRRITATION — burning, erythema, pruritus, peeling possible; usually mild.", citationIDs: ["openfda_round22"]),
            AttributedBullet("NO IMPROVEMENT in 2 weeks — reconsider diagnosis; KOH prep / culture; consider non-fungal cause.", citationIDs: ["specialty_round22"]),
            AttributedBullet("RECURRENCE common — environmental factors, treat household contacts (esp. tinea pedis with shared shower), continue treatment full duration.", citationIDs: ["specialty_round22"]),
            AttributedBullet("ONYCHOMYCOSIS — topical poorly effective; oral terbinafine / itraconazole needed.", citationIDs: ["specialty_round22"]),
            AttributedBullet("TINEA CAPITIS — REQUIRES oral therapy (griseofulvin / terbinafine); topical inadequate.", citationIDs: ["specialty_round22"]),
            AttributedBullet("CANDIDIASIS recurrent — workup for diabetes, immunocompromise.", citationIDs: ["specialty_round22"])
        ],
        adverseReactions: AttributedProse(
            "Local burning, erythema, pruritus, peeling, blistering (rare); rare allergic contact dermatitis.",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("Limited systemic absorption — minimal drug interactions.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Other topical agents — apply separately; combination with steroid (Lotrisone — clotrimazole + betamethasone) — controversial; can mask infection.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Vaginal cream — may weaken latex condoms / diaphragms; counsel.", citationIDs: ["openfda_round22"])
        ],
        nursingImplications: [
            AttributedBullet("Apply to CLEAN DRY skin including 2 cm beyond visible edge of lesion.", citationIDs: ["specialty_round22"]),
            AttributedBullet("CONTINUE × 1-2 weeks AFTER symptoms resolve to prevent recurrence per primary source.", citationIDs: ["specialty_round22"]),
            AttributedBullet("TINEA PEDIS — keep feet dry, change socks daily, separate towels, treat shoes / shower.", citationIDs: ["specialty_round22"]),
            AttributedBullet("CUTANEOUS CANDIDIASIS (intertrigo) — keep area dry + cool; barrier cream; absorbent underwear.", citationIDs: ["specialty_round22"]),
            AttributedBullet("AVOID Lotrisone (clotrimazole + betamethasone) for tinea — steroid worsens fungal infection long-term despite initial symptom relief.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Refractory / extensive — KOH prep + culture; switch to oral terbinafine for severe / refractory.", citationIDs: ["specialty_round22"])
        ],
        patientTeaching: AttributedProse(
            "Apply a thin layer twice daily to the rash + the skin around it (2 cm beyond). Keep using it for 1-2 weeks AFTER the rash is gone. Keep the area DRY — change socks daily for athlete's foot, dry well between toes / skin folds. If no improvement in 2 weeks, come back.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum TerbinafineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "terbinafine",
        title: "Terbinafine (Lamisil)",
        subtitle: "Allylamine · oral for onychomycosis + severe tinea · topical OTC · LFTs baseline + 6 weeks · taste loss",
        category: "Allylamine antifungal (oral + topical)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Allylamine antifungal — fungicidal vs dermatophytes"),
            KeyValueRow(key: "Use", value: "Oral — onychomycosis, tinea capitis, severe tinea corporis / pedis. Topical OTC — tinea pedis, corporis, cruris"),
            KeyValueRow(key: "Oral dose", value: "250 mg PO daily × 6 weeks (fingernails) / 12 weeks (toenails) / 4 weeks (severe tinea)"),
            KeyValueRow(key: "Watch", value: "Hepatotoxicity (LFTs baseline + at 6 weeks); taste loss / dysgeusia; psoriasis flare; SJS/TEN rare")
        ],
        indications: AttributedProse(
            "Oral — onychomycosis (toenail / fingernail); tinea capitis (children — first-line); severe / refractory tinea corporis, cruris, pedis. Topical (OTC) — uncomplicated tinea pedis, corporis, cruris per primary source.",
            citationIDs: ["specialty_round22", "openfda_round22"]
        ),
        mechanism: AttributedProse(
            "Allylamine — inhibits squalene epoxidase → blocks ergosterol synthesis at earlier step than imidazoles → toxic squalene accumulation → fungicidal. Highly effective against dermatophytes; less effective against Candida.",
            citationIDs: ["openfda_round22"]
        ),
        dosing: [
            DosingBlock(label: "Onychomycosis (fingernail)", body: "250 mg PO daily × 6 weeks per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Onychomycosis (toenail)", body: "250 mg PO daily × 12 weeks per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Tinea capitis (children >4 yrs)", body: "Weight-based — <25 kg: 125 mg/day; 25-35 kg: 187.5 mg/day; >35 kg: 250 mg/day × 4-6 weeks per primary source.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Tinea corporis / cruris / pedis (severe)", body: "250 mg PO daily × 2-4 weeks.", citationIDs: ["specialty_round22"]),
            DosingBlock(label: "Topical (OTC) tinea", body: "1% cream apply BID × 1-4 weeks depending on location.", citationIDs: ["openfda_round22"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Active liver disease — check LFTs + alternative agent. Caution — pregnancy (Category B but limited data); breastfeeding (excreted in milk; consider alternative); pediatric onychomycosis (limited indication).",
            citationIDs: ["openfda_round22"]
        ),
        warnings: [
            AttributedBullet("HEPATOTOXICITY — LFTs baseline + at 6 weeks; discontinue if 2-3x ULN; rare cases of fulminant hepatic failure per primary source.", citationIDs: ["specialty_round22"]),
            AttributedBullet("TASTE LOSS / DYSGEUSIA — common (~3%); usually reversible weeks to months; can be permanent in some.", citationIDs: ["specialty_round22"]),
            AttributedBullet("PSORIASIS FLARE / induction — case reports; caution in patients with psoriasis.", citationIDs: ["specialty_round22"]),
            AttributedBullet("SJS / TEN / ERYTHEMA MULTIFORME — rare but serious; discontinue + emergent eval.", citationIDs: ["specialty_round22"]),
            AttributedBullet("DRESS SYNDROME — rare.", citationIDs: ["specialty_round22"]),
            AttributedBullet("DRUG-INDUCED LUPUS — rare.", citationIDs: ["specialty_round22"]),
            AttributedBullet("RENAL — adjust dose if CrCl <50; not well studied.", citationIDs: ["openfda_round22"])
        ],
        adverseReactions: AttributedProse(
            "GI (nausea, diarrhea, abdominal pain), headache, taste / smell disturbance, rash, hepatotoxicity, hematologic (rare neutropenia), SJS/TEN/DRESS (rare), psoriasis flare.",
            citationIDs: ["openfda_round22"]
        ),
        drugInteractions: [
            AttributedBullet("CYP2D6 inhibitor — significant interaction with TCAs, beta-blockers, antipsychotics, codeine — may increase / decrease levels.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Cyclosporine — terbinafine can lower cyclosporine levels.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Warfarin — may potentiate; monitor INR.", citationIDs: ["openfda_round22"]),
            AttributedBullet("Caffeine clearance reduced — may have more side effects.", citationIDs: ["openfda_round22"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE LFTs + repeat at 6 weeks per primary source; stop + workup if 2-3x ULN.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Counsel TASTE LOSS — common; usually resolves; alert if persistent past treatment.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Counsel HEPATOTOXICITY warning signs — anorexia, nausea, jaundice, dark urine; emergent eval.", citationIDs: ["specialty_round22"]),
            AttributedBullet("ONYCHOMYCOSIS — clinical improvement may take MONTHS after treatment ends (slow nail growth); culture / KOH at baseline to confirm fungal etiology + avoid unnecessary use.", citationIDs: ["specialty_round22"]),
            AttributedBullet("TINEA CAPITIS — children; oral required; topical inadequate.", citationIDs: ["specialty_round22"]),
            AttributedBullet("Document baseline psoriasis history.", citationIDs: ["specialty_round22"])
        ],
        patientTeaching: AttributedProse(
            "Take this once daily for the full duration prescribed (6 weeks for fingernails, 12 weeks for toenails). It can take MONTHS after treatment for the nail to look normal as it grows out. Tell us right away about yellow eyes / skin, dark urine, no appetite, vomiting — these are liver problems. Some people lose their sense of taste — usually returns after stopping. Need a blood test before starting and after 6 weeks.",
            citationIDs: ["openrn_pharm_round22"]
        ),
        citations: [openfdaR22, openrnPharmR22, cdcR22, specialtyR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}
