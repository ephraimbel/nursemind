import Foundation

// Curator-model procedure + reference entries (round 7 expansion).
// Sources: Open RN Skills + Health Alterations (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), CDC + ABA + NPIAP + AGS Beers concept citations.

private let openrnSkR7p = CitationSource(
    id: "openrn_skills_round7",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=burn+ng+inhaler",
    lastRetrieved: "2026-05-04"
)
private let openrnHar7 = CitationSource(
    id: "openrn_ha_round7_proc",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=burn+pressure+geriatric",
    lastRetrieved: "2026-05-04"
)
private let openstaxSkR7p = CitationSource(
    id: "openstax_skills_round7",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let abaConceptR7 = CitationSource(
    id: "aba_concept_round7",
    shortName: "American Burn Association guidelines (concept citation)",
    publisher: "American Burn Association",
    license: .factCitationOnly,
    url: "https://ameriburn.org/resources/practice-guidelines/",
    lastRetrieved: "2026-05-04"
)
private let npiapConceptR7 = CitationSource(
    id: "npiap_round7",
    shortName: "NPIAP pressure-injury staging (concept citation)",
    publisher: "National Pressure Injury Advisory Panel",
    license: .factCitationOnly,
    url: "https://npiap.com/page/PIClassification",
    lastRetrieved: "2026-05-04"
)
private let beersConceptR7 = CitationSource(
    id: "beers_round7",
    shortName: "AGS Beers Criteria for Potentially Inappropriate Medication Use in Older Adults (concept citation)",
    publisher: "American Geriatrics Society",
    license: .factCitationOnly,
    url: "https://www.americangeriatrics.org/publications-tools/clinical-practice/beers-criteria",
    lastRetrieved: "2026-05-04"
)
private let aaoConceptR7 = CitationSource(
    id: "aao_round7",
    shortName: "AAO Snellen / visual-acuity reference (concept citation)",
    publisher: "American Academy of Ophthalmology",
    license: .factCitationOnly,
    url: "https://www.aao.org/eye-health/diseases/visual-acuity",
    lastRetrieved: "2026-05-04"
)

private let safetyR7 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let comfortR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition)
private let respR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .gasExchange)
private let burnRefR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let geriRefR7 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .safety)
private let pharmRefR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)
private let visionRefR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .sensoryPerception)

// MARK: - Burn Wound Care

public enum BurnWoundCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "burn-wound-care",
        title: "Burn wound care + dressing change",
        subtitle: "Cleansing · debridement · topical antimicrobial · sterile dressing",
        nclexTags: safetyR7,
        indications: AttributedProse(
            "Daily or twice-daily wound care for partial- and full-thickness burns to remove debris, prevent infection, support healing, and assess wound progress per primary source.",
            citationIDs: ["openrn_skills_round7", "aba_concept_round7"]
        ),
        contraindications: AttributedProse(
            "Patient hemodynamic instability requiring resuscitation; uncontrolled severe pain (premedicate first); known allergy to ordered topical agent (e.g., sulfa allergy with silver sulfadiazine).",
            citationIDs: ["openrn_skills_round7"]
        ),
        equipment: [
            AttributedBullet("Sterile gloves, gown, mask, eye protection; sterile drape; sterile basin.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Warm sterile saline / wound cleanser (avoid povidone-iodine — cytotoxic to granulation per primary source).", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Topical antimicrobial per provider — silver sulfadiazine (avoid in sulfa allergy and pregnancy near term), mafenide acetate (good eschar penetration; can cause metabolic acidosis), bacitracin (face), silver-impregnated dressings.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Sterile gauze, non-adherent dressing (e.g., Adaptic), conforming gauze wrap, tape; trauma scissors; warm room / overhead heater.", citationIDs: ["openrn_skills_round7"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order — frequency, agent, debridement parameters.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("PREMEDICATE 30–60 minutes before — IV opioid ± anxiolytic per provider; consider procedural sedation for major changes per primary source.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Warm room (≥80°F / 27°C), reduce drafts; burn patients lose heat rapidly.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Position patient comfortably; expose only the area being treated.", citationIDs: ["openrn_skills_round7"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + sterile setup", body: "Hand hygiene; don PPE; create sterile field; warm cleanser to body temperature.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 2, title: "Remove old dressing", body: "Loosen tape; if dressing adhered, moisten with sterile saline; remove gently while assessing wound bed and drainage. Note color, consistency, odor of any drainage.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 3, title: "Cleanse wound", body: "Irrigate / cleanse with warm sterile saline using gentle pressure; remove loose debris and old topical agent. Avoid scrubbing intact eschar — debride per provider order only.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 4, title: "Inspect + photograph", body: "Assess depth, TBSA, color (pink / red / waxy / leathery), capillary refill (in partial-thickness), exudate, signs of infection (purulent drainage, surrounding cellulitis, increased pain, fever). Photograph per protocol for serial documentation.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 5, title: "Apply topical antimicrobial", body: "Apply ordered topical (silver sulfadiazine, mafenide, bacitracin) in 1/8\" thickness to wound bed using sterile tongue depressor or gloved finger. AVOID face for silver sulfadiazine (use bacitracin); avoid mafenide on large surface area continuously due to acidosis risk.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 6, title: "Apply non-adherent layer + outer wrap", body: "Cover wound with non-adherent dressing (Adaptic, Xeroform), then layered sterile gauze, then conforming gauze wrap. Avoid circumferential tightness — re-edema can compromise circulation.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 7, title: "Position + reposition", body: "Position to prevent contracture (extend joints, no pillow under knees, avoid hip flexion). Splint per OT/PT recommendation.", citationIDs: ["openrn_skills_round7"])
        ],
        postProcedure: [
            AttributedBullet("Reassess pain and respiratory status post-medication; monitor for sedation if procedural sedation used.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Daily weights, strict I&O — burn patients have ongoing fluid losses.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Nutritional support — high calorie, high protein (1.5–2 g/kg/day per primary source); enteral if extensive burn.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Daily skin and wound surveillance for signs of infection or burn-wound sepsis.", citationIDs: ["openrn_skills_round7"])
        ],
        documentation: [
            AttributedBullet("TBSA, depth, location, drainage, topical agent, dressing, photographs, patient tolerance, vital signs pre/post, premedications.", citationIDs: ["openrn_skills_round7"])
        ],
        watchFor: [
            AttributedBullet("BURN-WOUND SEPSIS — change in wound color (violet / brown / black), conversion to deeper, fever, systemic deterioration; emergent ID + burn-team workup.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Hypothermia during dressing change — limit exposure, warm room, warm cleanser.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Pain anticipation — schedule analgesia; consider non-opioid adjuncts (gabapentin, ketamine drip per provider).", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Mafenide acidosis — monitor ABG, bicarb; rotate to alternative if acidotic.", citationIDs: ["openrn_skills_round7"])
        ],
        citations: [openrnSkR7p, openstaxSkR7p, abaConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NG Tube Insertion

public enum NGTInsertionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ng-tube-insertion",
        title: "NG tube insertion (nasogastric)",
        subtitle: "Decompression / lavage / feeding · radiograph confirms placement",
        nclexTags: comfortR7,
        indications: AttributedProse(
            "Gastric decompression (ileus, obstruction, post-op), gastric lavage (overdose, GI bleeding per provider), short-term enteral feeding, medication administration when patient cannot swallow safely. Long-term feeding (>4 weeks) typically uses PEG instead per primary source.",
            citationIDs: ["openrn_skills_round7"]
        ),
        contraindications: AttributedProse(
            "Severe facial trauma / midface fractures (cribriform plate disruption — risk of intracranial placement; use OROgastric instead). Esophageal varices, recent esophageal surgery, esophageal strictures (relative); coagulopathy (relative — increased epistaxis risk).",
            citationIDs: ["openrn_skills_round7"]
        ),
        equipment: [
            AttributedBullet("NG tube — typical sizes 14–18 Fr (adult); smaller for pediatrics; small-bore (8–12 Fr) for feeding only.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Water-soluble lubricant; topical lidocaine spray / gel (provider preference).", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("60-mL catheter-tip syringe; cup of water with straw; emesis basin; tissues; permanent marker; tape / nasal-bridge securement device.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Stethoscope; pH strips (gastric pH 1–5.5 supports placement per primary source); suction setup.", citationIDs: ["openrn_skills_round7"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order; explain procedure; obtain consent.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Position upright (high Fowler's) if able.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Inspect nares; choose more patent side; ASK if patient has had nasal trauma or surgery.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("ESTIMATE insertion length — measure from tip of nose to earlobe to xiphoid (NEX); mark tube with tape/marker.", citationIDs: ["openrn_skills_round7"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + don gloves", body: "Hand hygiene per primary source; clean gloves.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 2, title: "Lubricate tube", body: "Apply water-soluble lubricant to first 4–6 inches; consider topical lidocaine spray to nostril and oropharynx per provider for comfort.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 3, title: "Pass through nare", body: "Tilt patient's head slightly forward (NOT back — opens trachea); insert tube into nostril aimed posteriorly along the floor of the nasopharynx (NOT upward).", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 4, title: "Have patient swallow", body: "When tube reaches the oropharynx (about 4–6 inches), pause and have patient SIP WATER and SWALLOW; advance with each swallow until pre-marked length is reached. STOP if cough, gag, dyspnea, cyanosis (likely tracheal placement) — withdraw and reattempt.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 5, title: "Initial bedside placement check", body: "Aspirate gastric contents — pH 1–5.5 supports gastric placement per primary source. Auscultatory \"whoosh\" while injecting air is NO LONGER recommended as a reliable check.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 6, title: "X-RAY confirmation BEFORE USE", body: "ABDOMINAL X-RAY is the GOLD STANDARD before any feeding or medication administration per primary source. Do NOT use until confirmed.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 7, title: "Secure tube", body: "Secure to nose with tape or commercial nasal-bridge device; secure to gown with safety pin slack. Document length at nare.", citationIDs: ["openrn_skills_round7"])
        ],
        postProcedure: [
            AttributedBullet("Connect to suction (intermittent low for decompression — typical 30–80 mmHg) or feeding pump per order.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Skin care to nare; reposition tube q4h to reduce pressure injury.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Verify length at nare every shift and before each medication / feeding bolus.", citationIDs: ["openrn_skills_round7"])
        ],
        documentation: [
            AttributedBullet("Tube size, side of insertion, length at nare, x-ray confirmation, patient tolerance, gastric output color and volume.", citationIDs: ["openrn_skills_round7"])
        ],
        watchFor: [
            AttributedBullet("MISPLACEMENT — tracheobronchial placement causes cough, dyspnea, hypoxia; intracranial placement in midface trauma is catastrophic; ALWAYS confirm with x-ray before use.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Migration — tube can move; reassess length at nare every shift, before every feed / med, after vomiting, after coughing fits.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Pressure injury at nare — common; rotate side, use commercial securement.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Aspiration — keep HOB ≥30°; avoid bolus feeds in high-aspiration-risk patients (use continuous).", citationIDs: ["openrn_skills_round7"])
        ],
        citations: [openrnSkR7p, openstaxSkR7p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - MDI Inhaler Teaching

public enum MDITeachingSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "mdi-inhaler-teaching",
        title: "MDI inhaler teaching (with spacer)",
        subtitle: "Metered-dose inhaler technique · spacer use · adherence",
        nclexTags: respR7,
        indications: AttributedProse(
            "Patient education for the use of metered-dose inhalers (MDIs) for asthma, COPD, and other respiratory conditions. Poor inhaler technique is the leading reason inhaled medications fail to deliver expected benefit per primary source.",
            citationIDs: ["openrn_skills_round7", "openrn_ha_round7_proc"]
        ),
        contraindications: AttributedProse(
            "None for teaching itself; use of MDI without spacer in young children (<5–6 years) is generally inadequate — use valved holding chamber with mask or nebulizer.",
            citationIDs: ["openrn_skills_round7"]
        ),
        equipment: [
            AttributedBullet("Patient's actual MDI canister (do not teach with sample / different med).", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Spacer / valved holding chamber (preferred for adults AND children, especially with steroids per primary source).", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Cleaning supplies for spacer; rinse cup of water.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Patient teaching sheet; visual demonstration.", citationIDs: ["openrn_skills_round7"])
        ],
        preProcedure: [
            AttributedBullet("Assess current inhaler technique (have patient demonstrate FIRST — most patients have errors).", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Identify barriers — dexterity, vision, cognition, language; involve caregiver.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Confirm understanding of WHEN to use the inhaler (rescue vs controller) and frequency.", citationIDs: ["openrn_skills_round7"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Shake + prime", body: "Shake the inhaler well for 5 seconds. Prime new canisters or after >2-week non-use per medication-specific instructions (typically 2–4 puffs into the air).", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 2, title: "Remove cap and attach to spacer", body: "Remove mouthpiece cap; inspect for debris; attach inhaler to spacer.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 3, title: "Exhale completely", body: "Patient breathes out fully (away from spacer to avoid moisture buildup).", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 4, title: "Place spacer in mouth + actuate", body: "Patient places spacer mouthpiece between teeth and seals lips around it. Press canister DOWN to release ONE puff.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 5, title: "Slow deep inhalation", body: "Patient breathes in SLOWLY and DEEPLY for 4–5 seconds (use the spacer's whistle / sound feedback to slow inhalation if too fast).", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 6, title: "Hold breath 10 sec", body: "Hold breath for ~10 seconds (or as long as comfortable) to allow medication deposition. Exhale slowly.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 7, title: "Wait + repeat if ordered", body: "Wait 30–60 seconds between puffs (allows valve recovery + deeper deposition). Repeat steps 1–6 for each ordered puff.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 8, title: "Rinse mouth (if steroid)", body: "After inhaled corticosteroids (fluticasone, budesonide, mometasone), RINSE mouth with water and SPIT — reduces oral candidiasis (thrush) and dysphonia.", citationIDs: ["openrn_skills_round7"]),
            ProcedureStep(number: 9, title: "Clean spacer weekly", body: "Wash spacer in warm soapy water once per week; rinse, air dry (do NOT towel dry — static buildup reduces medication delivery).", citationIDs: ["openrn_skills_round7"])
        ],
        postProcedure: [
            AttributedBullet("Observe TEACH-BACK — patient demonstrates entire technique unprompted.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Check canister tracking method (dose counter on most modern inhalers; calendar tracking otherwise) — counsel against \"floating\" canister to estimate fullness (unreliable).", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Reinforce difference between RESCUE (SABA) and CONTROLLER (ICS, ICS-LABA) inhalers; review color of each and when to use.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Provide written / visual instructions; document teach-back result.", citationIDs: ["openrn_skills_round7"])
        ],
        documentation: [
            AttributedBullet("Inhaler(s) reviewed, technique observed pre/post teaching, teach-back result, written materials provided, follow-up plan.", citationIDs: ["openrn_skills_round7"])
        ],
        watchFor: [
            AttributedBullet("Common errors — failure to shake, fast inhalation, no breath hold, no spacer with steroids, no mouth rinse, mismatch of rescue vs controller use.", citationIDs: ["openrn_skills_round7"]),
            AttributedBullet("Overuse of SABA (>2 canisters / month) is a marker of POORLY CONTROLLED asthma — escalate to controller per primary source.", citationIDs: ["openrn_ha_round7_proc"]),
            AttributedBullet("Oral thrush, dysphonia — preventable with rinse / spacer.", citationIDs: ["openrn_skills_round7"])
        ],
        citations: [openrnSkR7p, openrnHar7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Burn TBSA Estimation

public enum BurnTBSASample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "burn-tbsa-estimation",
        title: "Burn TBSA estimation",
        subtitle: "Rule of Nines · Lund-Browder · palmar method · Parkland formula",
        eyebrow: "REFERENCE · BURNS",
        nclexTags: burnRefR7,
        sections: [
            .prose(title: "Why TBSA matters", AttributedProse(
                "Total body surface area (TBSA) of partial- and full-thickness burns drives fluid resuscitation volume, decisions about burn-center transfer, and prognosis. Superficial (1st-degree / sunburn type) burns are NOT counted in TBSA per primary source.",
                citationIDs: ["aba_concept_round7"]
            )),
            .keyValueTable(title: "Rule of Nines (adult — 9% increments)", [
                KeyValueRow(key: "Head + neck", value: "9% (4.5% face + 4.5% scalp)"),
                KeyValueRow(key: "Each arm", value: "9%"),
                KeyValueRow(key: "Anterior trunk", value: "18%"),
                KeyValueRow(key: "Posterior trunk", value: "18%"),
                KeyValueRow(key: "Each leg", value: "18%"),
                KeyValueRow(key: "Genitalia / perineum", value: "1%")
            ]),
            .keyValueTable(title: "Pediatric Rule of Nines (head : leg ratio shifts)", [
                KeyValueRow(key: "Infant head", value: "18%"),
                KeyValueRow(key: "Infant each leg", value: "13.5%"),
                KeyValueRow(key: "Age 5", value: "Head 13%, each leg 16%"),
                KeyValueRow(key: "Age 10+", value: "Approaches adult"),
                KeyValueRow(key: "Best practice", value: "Use Lund-Browder chart for children — far more accurate per primary source")
            ]),
            .keyValueTable(title: "Palmar method (rapid estimate)", [
                KeyValueRow(key: "1% TBSA", value: "Patient's PALM + FINGERS together (per primary source)"),
                KeyValueRow(key: "Use case", value: "Scattered burns; quick bedside or field estimate")
            ]),
            .keyValueTable(title: "Parkland formula (LR resuscitation)", [
                KeyValueRow(key: "Volume", value: "4 mL × kg × %TBSA in 24 hours of Lactated Ringer's"),
                KeyValueRow(key: "Timing", value: "HALF in first 8 hours from time of BURN (not from arrival)"),
                KeyValueRow(key: "Remainder", value: "Other half over next 16 hours"),
                KeyValueRow(key: "Titrate to UOP", value: "Adult 0.5 mL/kg/hr; peds 1 mL/kg/hr per primary source"),
                KeyValueRow(key: "Pediatric", value: "Add maintenance (e.g., 4-2-1 rule) ON TOP of Parkland")
            ]),
            .keyValueTable(title: "ABA burn-center referral criteria", [
                KeyValueRow(key: "Partial-thickness", value: ">10% TBSA"),
                KeyValueRow(key: "Any full-thickness", value: "Any age"),
                KeyValueRow(key: "Special sites", value: "Face, hands, feet, genitalia, perineum, major joints"),
                KeyValueRow(key: "Burn type", value: "Electrical (incl. lightning), chemical, inhalation"),
                KeyValueRow(key: "Patient factors", value: "Pediatrics in non-pediatric facility; comorbidity that complicates management; concomitant trauma; psychosocial needs requiring burn center per primary source")
            ]),
            .bullets(title: "Nursing actions in initial burn assessment", [
                AttributedBullet("ABCs FIRST; airway management ahead of burn assessment.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Estimate TBSA → calculate Parkland → start LR via 2 large-bore IVs (in unburned skin if possible).", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Foley to monitor UOP; NG tube (gastric stasis common in major burns).", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Tetanus update; analgesia; cover wounds with clean dry sheet for transfer.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("KEEP PATIENT WARM — limit exposure, warm fluids, warm room.", citationIDs: ["openrn_ha_round7_proc"])
            ])
        ],
        citations: [abaConceptR7, openrnHar7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NPIAP Pressure Injury Staging

public enum NPIAPStagingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "npiap-pressure-injury-staging",
        title: "NPIAP pressure injury staging",
        subtitle: "Stage 1 → 4 · unstageable · deep tissue · staging is irreversible",
        eyebrow: "REFERENCE · WOUND CARE",
        nclexTags: safetyR7,
        sections: [
            .prose(title: "Source", AttributedProse(
                "The National Pressure Injury Advisory Panel (NPIAP, formerly NPUAP) defines current pressure-injury staging in U.S. practice. Staging applies only at the deepest level of tissue loss visible — and a staged injury does NOT \"reverse\" through stages as it heals (a Stage 4 that closes is a healed Stage 4, not a Stage 1) per primary source.",
                citationIDs: ["npiap_round7"]
            )),
            .keyValueTable(title: "Stage 1", [
                KeyValueRow(key: "Description", value: "Intact skin with non-blanchable erythema; may be painful, firm, soft, warmer or cooler than surrounding tissue"),
                KeyValueRow(key: "In darker skin tones", value: "May appear differently — may not show as erythema; assess for warmth, edema, pain, induration"),
                KeyValueRow(key: "Action", value: "Off-load IMMEDIATELY; protect skin; reposition q1–2h")
            ]),
            .keyValueTable(title: "Stage 2", [
                KeyValueRow(key: "Description", value: "Partial-thickness skin loss with exposed dermis — pink/red wound bed, may present as intact or ruptured serum-filled blister"),
                KeyValueRow(key: "Not", value: "Skin tears, MASD (moisture-associated skin damage), tape injuries — these are not pressure injuries"),
                KeyValueRow(key: "Action", value: "Hydrocolloid / foam dressing per facility; off-load")
            ]),
            .keyValueTable(title: "Stage 3", [
                KeyValueRow(key: "Description", value: "Full-thickness skin loss — adipose visible; may have slough or eschar but does not obscure the depth of tissue loss; may include undermining or tunneling"),
                KeyValueRow(key: "Not visible", value: "Fascia, muscle, tendon, ligament, cartilage, bone NOT exposed"),
                KeyValueRow(key: "Action", value: "Wound-care consult; nutrition optimization; off-load; possibly negative-pressure therapy")
            ]),
            .keyValueTable(title: "Stage 4", [
                KeyValueRow(key: "Description", value: "Full-thickness skin AND tissue loss with EXPOSED or DIRECTLY PALPABLE fascia, muscle, tendon, ligament, cartilage, or bone"),
                KeyValueRow(key: "Often includes", value: "Undermining, tunneling, slough, eschar"),
                KeyValueRow(key: "Action", value: "Surgical / wound consult; debridement; high-protein nutrition; off-load")
            ]),
            .keyValueTable(title: "Unstageable", [
                KeyValueRow(key: "Description", value: "Full-thickness skin AND tissue loss in which the extent of tissue damage cannot be confirmed because it is OBSCURED by slough or eschar"),
                KeyValueRow(key: "Stable eschar", value: "Dry, adherent, intact eschar on heel or ischemic limb is the body's natural cover and should NOT be removed per primary source"),
                KeyValueRow(key: "Once debrided", value: "Will reveal Stage 3 or 4")
            ]),
            .keyValueTable(title: "Deep tissue pressure injury (DTPI)", [
                KeyValueRow(key: "Description", value: "Intact or non-intact skin with localized area of persistent non-blanchable deep red, maroon, or purple discoloration; or epidermal separation revealing dark wound bed or blood-filled blister"),
                KeyValueRow(key: "Mechanism", value: "Pressure / shear damage to underlying soft tissue"),
                KeyValueRow(key: "Action", value: "Off-load aggressively — may evolve rapidly to Stage 3/4; reassess frequently")
            ]),
            .keyValueTable(title: "Medical-device-related and mucosal pressure injury", [
                KeyValueRow(key: "Medical device", value: "From device pressure (oxygen tubing, foley, NGT, BIPAP mask) — staged with the standard system"),
                KeyValueRow(key: "Mucosal", value: "On mucous membranes (oral, nasal, perineal); CANNOT be staged using the standard system per primary source")
            ]),
            .bullets(title: "Nursing actions for prevention + care", [
                AttributedBullet("Braden Scale on admission, then per facility (typically each shift in acute care).", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Reposition q1–2h in bed; q1h in chair; HOB <30° when possible (shear).", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Heel elevation with pillow/floats; off-load bony prominences with foam, gel cushions, specialty surfaces.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Skin care — keep clean and dry; barrier creams for incontinence; minimize moisture.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Nutrition + hydration — high protein, adequate calories; albumin/prealbumin trend; RD consult for at-risk patients.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Reassess medical devices q-shift (NG, oxygen tubing, BIPAP, ID bracelet, sequential compression); rotate sites.", citationIDs: ["openrn_ha_round7_proc"])
            ])
        ],
        citations: [npiapConceptR7, openrnHar7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Beers Criteria Reference

public enum BeersCriteriaSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "beers-criteria",
        title: "AGS Beers Criteria — potentially inappropriate medications in older adults",
        subtitle: "Concept reference · class-level cautions · deprescribing in 65+",
        eyebrow: "REFERENCE · GERIATRICS",
        nclexTags: geriRefR7,
        sections: [
            .prose(title: "Source + scope", AttributedProse(
                "The American Geriatrics Society Beers Criteria identifies medications and classes that are potentially inappropriate for adults ≥65 years. Use IN COMBINATION with clinical judgment — Beers does not categorically forbid drugs but flags higher-risk choices and identifies safer alternatives. THIS IS A CONCEPT REFERENCE per primary source — verify the current published list when applying clinically.",
                citationIDs: ["beers_round7"]
            )),
            .keyValueTable(title: "Drugs / classes commonly listed (avoid in most older adults)", [
                KeyValueRow(key: "First-generation antihistamines", value: "Diphenhydramine, hydroxyzine, doxylamine — anticholinergic burden, sedation, falls, delirium"),
                KeyValueRow(key: "Anticholinergics", value: "Oxybutynin, scopolamine, tertiary TCAs (amitriptyline) — confusion, urinary retention, falls"),
                KeyValueRow(key: "Benzodiazepines (any)", value: "Lorazepam, diazepam, alprazolam — falls, fractures, delirium, dependence"),
                KeyValueRow(key: "Z-drugs", value: "Zolpidem, zaleplon, eszopiclone — falls, delirium, parasomnias"),
                KeyValueRow(key: "Antipsychotics", value: "All — increased mortality in dementia (boxed); reserve for documented psychosis or severe agitation per primary source"),
                KeyValueRow(key: "NSAIDs (chronic)", value: "GI bleed, AKI, HF exacerbation; topical preferred; PPI cover if oral required"),
                KeyValueRow(key: "Skeletal muscle relaxants", value: "Cyclobenzaprine, methocarbamol, carisoprodol — sedation, falls, anticholinergic"),
                KeyValueRow(key: "Sliding-scale insulin alone", value: "Less effective than scheduled basal-bolus; hypoglycemia risk"),
                KeyValueRow(key: "Glyburide", value: "Long-acting sulfonylurea — prolonged hypoglycemia"),
                KeyValueRow(key: "Megestrol", value: "Modest appetite stimulant; significant thrombosis / mortality risk"),
                KeyValueRow(key: "Digoxin >0.125 mg/day", value: "Risk of toxicity in CKD"),
                KeyValueRow(key: "Estrogen (oral) for vaginal symptoms", value: "Vaginal estrogen preferred"),
                KeyValueRow(key: "Long-acting opioids first-line", value: "Higher overdose / sedation risk than short-acting in opioid-naive")
            ]),
            .keyValueTable(title: "Drugs to avoid with specific conditions", [
                KeyValueRow(key: "HF", value: "NSAIDs, COX-2 inhibitors, dronedarone, thiazolidinediones, cilostazol"),
                KeyValueRow(key: "Syncope / falls history", value: "Antipsychotics, AChEi (donepezil) reassess, alpha-blockers (terazosin), TCAs, benzos, Z-drugs"),
                KeyValueRow(key: "Dementia", value: "Anticholinergics, antipsychotics (boxed), benzos, Z-drugs"),
                KeyValueRow(key: "CKD", value: "NSAIDs, contrast, aminoglycosides, certain DOACs at low CrCl per primary source"),
                KeyValueRow(key: "GI bleed history", value: "Aspirin (chronic non-cardiac), NSAIDs, dabigatran (slightly higher GI bleed risk)"),
                KeyValueRow(key: "Parkinson disease", value: "Metoclopramide, prochlorperazine, first-gen antipsychotics, promethazine — extrapyramidal worsening")
            ]),
            .keyValueTable(title: "High-risk drug-drug combinations", [
                KeyValueRow(key: "Three or more CNS-active drugs", value: "Falls + cognitive impairment risk (opioids, benzos, Z-drugs, antipsychotics, gabapentinoids, antidepressants, antiepileptics)"),
                KeyValueRow(key: "Lithium + ACEi / ARB / loops / NSAIDs / thiazides", value: "Lithium toxicity"),
                KeyValueRow(key: "Warfarin + amiodarone, NSAIDs, sulfa", value: "Bleeding risk"),
                KeyValueRow(key: "RAS-inhibitor + NSAID + diuretic (\"triple whammy\")", value: "AKI"),
                KeyValueRow(key: "Multiple anticholinergics", value: "Cumulative cognitive + urinary effects")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Medication reconciliation EVERY transition; flag Beers-list drugs to provider with safer alternative suggested when feasible.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Compute anticholinergic burden — many OTCs (sleep aids, allergy, motion sickness) contain diphenhydramine.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Deprescribing is gradual — taper benzos, opioids, PPIs, antipsychotics; avoid abrupt withdrawal.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Assess and address symptoms first — pain, sleep, anxiety, GERD, agitation often have non-pharmacologic options.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Engage patient + family in medication-review conversations; goals-of-care matter.", citationIDs: ["openrn_ha_round7_proc"])
            ])
        ],
        citations: [beersConceptR7, openrnHar7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Visual Acuity Testing

public enum VisualAcuitySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "visual-acuity-testing",
        title: "Visual acuity testing",
        subtitle: "Snellen + near vision · pinhole · documentation",
        eyebrow: "REFERENCE · OPHTHALMOLOGY",
        nclexTags: visionRefR7,
        sections: [
            .prose(title: "Purpose", AttributedProse(
                "Visual acuity is the cornerstone of any eye assessment. It is required documentation in any patient with a visual complaint, eye trauma, or before any procedure that may affect vision. THIS IS A CONCEPT REFERENCE per primary source — apply within local protocols.",
                citationIDs: ["aao_round7"]
            )),
            .keyValueTable(title: "Snellen chart (distance)", [
                KeyValueRow(key: "Test distance", value: "20 feet from chart (or 10 feet with mirror to simulate 20)"),
                KeyValueRow(key: "Test sequence", value: "Right eye first (cover left), then left, then both"),
                KeyValueRow(key: "Documentation", value: "OD (right), OS (left), OU (both); record line read with corrective lenses if patient wears them"),
                KeyValueRow(key: "Best correction", value: "Use patient's everyday glasses or pinhole (corrects refractive error → estimates best-corrected acuity)")
            ]),
            .keyValueTable(title: "Snellen reading reference", [
                KeyValueRow(key: "20/20", value: "Normal"),
                KeyValueRow(key: "20/40", value: "Driving requirement in many U.S. states"),
                KeyValueRow(key: "20/200", value: "Legally blind in better-seeing eye with best correction"),
                KeyValueRow(key: "Inability to read top line", value: "Move closer (e.g., 10/200), or count fingers (CF), hand motion (HM), light perception (LP), no light perception (NLP)")
            ]),
            .keyValueTable(title: "Near-vision testing", [
                KeyValueRow(key: "Card", value: "Rosenbaum / Jaeger card — held at 14 inches (35 cm)"),
                KeyValueRow(key: "Use case", value: "Patient cannot stand for distance acuity; bedside assessment"),
                KeyValueRow(key: "Document", value: "J1 = best near acuity; J16 = poorest")
            ]),
            .keyValueTable(title: "Pinhole acuity", [
                KeyValueRow(key: "Use", value: "If acuity is decreased — recheck through pinhole"),
                KeyValueRow(key: "Improves", value: "Refractive error (corrects if patient lost glasses)"),
                KeyValueRow(key: "Does NOT improve", value: "Pathology (cataract, macular disease, optic neuropathy, retinal detachment)")
            ]),
            .keyValueTable(title: "When to refer urgently to ophthalmology", [
                KeyValueRow(key: "Sudden vision loss", value: "Stroke / CRAO / retinal detachment / GCA"),
                KeyValueRow(key: "Acute eye pain + decreased acuity", value: "Acute angle-closure glaucoma, endophthalmitis, keratitis"),
                KeyValueRow(key: "Eye trauma with decreased acuity", value: "Open globe — emergency"),
                KeyValueRow(key: "Floaters + flashes + curtain", value: "Retinal detachment"),
                KeyValueRow(key: "Diabetic patient with new visual change", value: "Possible vitreous hemorrhage, macular edema, retinal detachment")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Document acuity BEFORE any eye examination, treatment, or procedure — medico-legal record.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Use the patient's HABITUAL correction (current glasses) for documented acuity; pinhole if not available or for best-corrected estimate.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("If patient cannot read English Snellen, use illiterate E chart, picture chart (peds), tumbling E.", citationIDs: ["openrn_ha_round7_proc"]),
                AttributedBullet("Sudden vision loss is an emergency — stroke alert level of urgency; ophthalmology and neurology consult.", citationIDs: ["openrn_ha_round7_proc"])
            ])
        ],
        citations: [aaoConceptR7, openrnHar7],
        lastSourceFidelityReview: "2026-05-04"
    )
}
