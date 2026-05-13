import Foundation

// Curator-model references (round 36 part C — chief-complaint workup: trauma + ENT + triage frameworks).

private let openrnCC36C = CitationSource(
    id: "openrn_cc36c",
    shortName: "Open RN Health Alterations + Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcCC36C = CitationSource(
    id: "cdc_cc36c",
    shortName: "CDC + AHRQ + NIH + DOT concept citations",
    publisher: "CDC · AHRQ · NIH · DOT",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyCC36C = CitationSource(
    id: "specialty_cc36c",
    shortName: "ACS-COT ATLS + ABA + AAO + ACEP + ENA + START fact citations",
    publisher: "ACS-COT · ABA · AAO · ACEP · ENA · START",
    license: .factCitationOnly,
    url: "https://www.facs.org/quality-programs/trauma/",
    lastRetrieved: "2026-05-13"
)

private let ccTagsR36C = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let triageTagsR36C = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum AcuteTraumaEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "acute-trauma-evaluation",
        title: "Acute trauma evaluation (ATLS framework)",
        subtitle: "Primary survey (ABCDE) · secondary survey · damage control · massive transfusion · trauma team activation · serial reassessment",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36C,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Trauma is leading cause of death in adults <45 years in US. ATLS (Advanced Trauma Life Support) framework standardizes initial evaluation through PRIMARY SURVEY (A-B-C-D-E) addressing immediate life threats, followed by SECONDARY SURVEY (head-to-toe) identifying all injuries. Trauma team activation criteria + protocol determines resource allocation. Damage control surgery + massive transfusion protocols for severe hemorrhage per primary source.",
                citationIDs: ["specialty_cc36c"]
            )),
            .keyValueTable(title: "Primary survey — ABCDE", [
                KeyValueRow(key: "A — AIRWAY with C-spine protection", value: "Patent + protected airway; jaw thrust if C-spine concern; intubate if GCS ≤8 OR airway compromise; cervical collar + manual stabilization"),
                KeyValueRow(key: "B — BREATHING + ventilation", value: "Bilateral breath sounds, RR, SpO2, chest wall integrity; identify + treat tension pneumothorax (needle decompression 2nd ICS midclavicular OR finger thoracostomy 5th ICS midaxillary), open pneumothorax (3-sided occlusive dressing), massive hemothorax (chest tube + surgery), flail chest"),
                KeyValueRow(key: "C — CIRCULATION + hemorrhage control", value: "Pulse, BP, peripheral perfusion, mental status; STOP bleeding (direct pressure → tourniquet → wound packing); 2 large-bore IV (16-18 g antecubital OR IO); permissive hypotension SBP 80-90 in penetrating; massive transfusion 1:1:1 PRBC:FFP:platelets"),
                KeyValueRow(key: "D — DISABILITY + neuro", value: "GCS + pupil exam + motor exam + glucose; head trauma → CT; spinal cord injury → MRI + steroids selected"),
                KeyValueRow(key: "E — EXPOSURE + environment", value: "Complete undressing for full assessment; prevent hypothermia (active warming, warm IV fluids, warm room); log roll for back exam")
            ]),
            .keyValueTable(title: "Adjuncts to primary survey", [
                KeyValueRow(key: "Imaging", value: "FAST exam (focused assessment for trauma sonography) — free fluid; CXR; pelvic X-ray; CT pan-scan for major trauma (head, C-spine, chest, abdomen, pelvis); CT-A for vascular injury"),
                KeyValueRow(key: "Labs", value: "Type + screen/crossmatch, CBC, BMP, coagulation, lactate, ABG, ethanol + tox screen, β-hCG female reproductive age"),
                KeyValueRow(key: "Monitoring", value: "Continuous cardiac, SpO2, BP, capnography if intubated, urinary catheter (UOP marker of perfusion), NG tube (decompression, monitoring), serial GCS"),
                KeyValueRow(key: "Procedures", value: "Chest tubes (pneumothorax, hemothorax), pericardiocentesis (tamponade), cricothyrotomy (failed airway), tourniquet (extremity hemorrhage)")
            ]),
            .keyValueTable(title: "Secondary survey — head-to-toe", [
                KeyValueRow(key: "Head + face", value: "Scalp lacerations, palpate skull, raccoon eyes (basilar skull fracture), Battle sign (mastoid), hemotympanum, CSF rhinorrhea/otorrhea, facial fractures (LeFort)"),
                KeyValueRow(key: "Neck", value: "Cervical spine tenderness, JVD (tamponade, tension PTX), tracheal deviation, subcutaneous emphysema, expanding hematoma, carotid bruit"),
                KeyValueRow(key: "Chest", value: "Inspection (paradoxical movement = flail chest), palpation (crepitus, tenderness, fractures), auscultation (decreased = hemo/pneumothorax)"),
                KeyValueRow(key: "Abdomen", value: "Inspection (distension, contusion, Cullen, Grey-Turner), palpation (tenderness, peritoneal signs, mass), auscultation (bowel sounds)"),
                KeyValueRow(key: "Pelvis", value: "DO NOT spring pelvis (worsens hemorrhage); single gentle compression for stability; pelvic binder if unstable"),
                KeyValueRow(key: "Genitourinary", value: "Blood at meatus (urethral injury — do NOT Foley until retrograde urethrogram); perineal hematoma; rectal exam (high-riding prostate, tone, blood)"),
                KeyValueRow(key: "Extremities", value: "Deformity, swelling, neurovascular status (5 P's — Pain, Pallor, Pulse, Paresthesia, Paralysis), compartment syndrome, open vs closed fractures"),
                KeyValueRow(key: "Back / posterior", value: "Log roll with C-spine precautions; palpate entire spine; inspect for wounds, deformity, sensation")
            ]),
            .keyValueTable(title: "Special situations", [
                KeyValueRow(key: "MASSIVE TRANSFUSION", value: "1:1:1 PRBC:FFP:platelets ratio; TXA 1g IV within 3 hr (CRASH-2 trial — reduces mortality); calcium replacement; rewarming; lactate + base deficit + ROTEM/TEG"),
                KeyValueRow(key: "PERMISSIVE HYPOTENSION", value: "Penetrating torso trauma — SBP target 80-90 to avoid disrupting clot; AVOID in head injury + spinal cord injury (need perfusion)"),
                KeyValueRow(key: "TRAUMATIC BRAIN INJURY", value: "Maintain SBP >90, SpO2 >90, avoid hyperventilation unless herniation; head of bed 30°; mannitol/hypertonic saline for ICP; surgery for hematoma"),
                KeyValueRow(key: "SPINE INJURY", value: "Maintain neutral spine precautions; methylprednisolone controversial (NASCIS protocol not standard); surgical decompression for selected"),
                KeyValueRow(key: "PREGNANCY", value: "Left lateral tilt 15° (relieves IVC compression), fetal monitoring, β-hCG, RhIG if Rh-negative + abruption assessment, Kleihauer-Betke; mother first then fetus"),
                KeyValueRow(key: "PEDIATRIC", value: "Higher head:body ratio (head trauma more common), more flexible bones (internal injury without obvious external), proportionally smaller airway, hypothermia risk (greater surface area), broselow tape for weight-based meds")
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Trauma team activation per institutional criteria; level designation; multidisciplinary response.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Primary survey first — life threats before injuries; reassess after each intervention.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Hemorrhage control PRIORITY — direct pressure, pressure dressings, tourniquet, wound packing; do not delay for vascular access.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Rapid IV access — 2 large-bore peripheral (16-18 g) OR intraosseous if failed; warm IV fluids.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Pain management — fentanyl boluses 25-50 mcg titrated; AVOID morphine/large doses if hemodynamically unstable.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Maintain spine precautions until cleared; cervical collar; log roll for back exam.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Hypothermia prevention — warm room, warm IV fluids, warm blankets, Bair Hugger; remove wet clothing.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Family + patient communication — chaplaincy + social work + trauma counselor; secondary victim support.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Documentation — chronology, mechanism, injuries, interventions, response; forensic evidence preservation if applicable.", citationIDs: ["specialty_cc36c"])
            ])
        ],
        citations: [openrnCC36C, cdcCC36C, specialtyCC36C],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BurnEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "burn-evaluation",
        title: "Burn evaluation + Parkland formula",
        subtitle: "Depth (1°/2°/3°/4°) · TBSA (Rule of 9s, Lund-Browder) · Parkland fluid resuscitation · airway in inhalation injury · escharotomy · referral criteria",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36C,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Burns range from minor first-degree to life-threatening major burns with multi-organ involvement. Initial evaluation: airway (inhalation injury), depth, total body surface area (TBSA), associated trauma. Major burns (>20% TBSA adult, >10% peds) require ICU + burn unit referral + aggressive fluid resuscitation (Parkland formula) + multidisciplinary care. Inhalation injury significantly increases mortality + airway management often emergent per primary source.",
                citationIDs: ["specialty_cc36c"]
            )),
            .keyValueTable(title: "Burn depth classification", [
                KeyValueRow(key: "FIRST DEGREE (superficial)", value: "Epidermis only; erythema, dry, painful, blanches (e.g., sunburn); heals 3-7 days without scar; NOT included in TBSA calculation"),
                KeyValueRow(key: "SECOND DEGREE — superficial partial-thickness", value: "Epidermis + papillary dermis; blisters, pink/red, moist, very painful, blanches; heals 2-3 weeks with minimal scar"),
                KeyValueRow(key: "SECOND DEGREE — deep partial-thickness", value: "Epidermis + reticular dermis; white/red mottled, less painful (nerve damage), does not blanch; heals 3-8 weeks with significant scar; may need grafting"),
                KeyValueRow(key: "THIRD DEGREE (full-thickness)", value: "Epidermis + dermis + subcutaneous; white/leathery/charred, painless, hair pulls out easily; requires excision + grafting"),
                KeyValueRow(key: "FOURTH DEGREE", value: "Through subcutaneous to muscle/bone; surgical reconstruction or amputation; rare")
            ]),
            .keyValueTable(title: "TBSA estimation — Rule of 9s (adult)", [
                KeyValueRow(key: "Head + neck", value: "9% (4.5% anterior + 4.5% posterior)"),
                KeyValueRow(key: "Each upper extremity", value: "9% (4.5% anterior + 4.5% posterior)"),
                KeyValueRow(key: "Anterior trunk", value: "18%"),
                KeyValueRow(key: "Posterior trunk", value: "18%"),
                KeyValueRow(key: "Each lower extremity", value: "18% (9% anterior + 9% posterior)"),
                KeyValueRow(key: "Perineum", value: "1%"),
                KeyValueRow(key: "Palm of hand", value: "~1% TBSA — useful for scattered patchy burns"),
                KeyValueRow(key: "Pediatric — modified", value: "Head is larger %, legs smaller; use Lund-Browder chart for age-adjusted percentages (infant head 18%, age 5 head 13%, age 10 head 11%)")
            ]),
            .keyValueTable(title: "Parkland formula — fluid resuscitation", [
                KeyValueRow(key: "Formula", value: "4 mL × weight (kg) × TBSA (%) of LR over first 24 hours; HALF in first 8 hours from time of injury, HALF in next 16 hours"),
                KeyValueRow(key: "Example", value: "70 kg patient with 40% TBSA: 4 × 70 × 40 = 11,200 mL total; 5,600 mL in first 8 hr (700 mL/hr); 5,600 mL over next 16 hr (350 mL/hr)"),
                KeyValueRow(key: "Indications", value: "Adult ≥20% TBSA second/third degree; pediatric ≥10% TBSA; smaller burns adequate hydration with maintenance"),
                KeyValueRow(key: "Adjustments", value: "Time from injury (not from arrival); titrate to URINE OUTPUT 0.5-1 mL/kg/hr adult OR 1 mL/kg/hr peds (NOT TO FORMULA); inhalation injury + electrical may require more"),
                KeyValueRow(key: "Resuscitation endpoints", value: "Urine output, mental status, hemodynamics, lactate clearance, base deficit improvement; AVOID over-resuscitation (\"fluid creep\" — compartment syndrome, pulmonary edema)")
            ]),
            .keyValueTable(title: "Inhalation injury", [
                KeyValueRow(key: "Risk factors", value: "Closed space fire, facial burns, singed nasal hair, soot in airways, hoarseness, carbonaceous sputum, stridor, dyspnea, altered mental status"),
                KeyValueRow(key: "Pathophysiology", value: "Thermal injury (above vocal cords typically), chemical injury (smoke + products of combustion), systemic toxicity (CO, cyanide)"),
                KeyValueRow(key: "Management", value: "EARLY INTUBATION before edema obstructs airway; 100% O2 (treats CO); flexible bronchoscopy for diagnosis + lavage; bronchodilators; consider hyperbaric for severe CO; hydroxocobalamin for cyanide"),
                KeyValueRow(key: "Carbon monoxide", value: "COHb level (pulse ox unreliable); >25% with symptoms OR pregnant OR cardiac → consider hyperbaric; 100% O2 reduces half-life"),
                KeyValueRow(key: "Cyanide", value: "Fire victims + lactic acidosis + altered mental status; HYDROXOCOBALAMIN 5 g IV (preferred — no methemoglobinemia) OR sodium thiosulfate + nitrites")
            ]),
            .keyValueTable(title: "Burn unit referral criteria (American Burn Association)", [
                KeyValueRow(key: "Partial-thickness >10% TBSA", value: "Adult; transfer to burn unit"),
                KeyValueRow(key: "ANY full-thickness burn", value: "Regardless of size"),
                KeyValueRow(key: "Burns to face, hands, feet, genitalia, perineum, major joints", value: "Functional + cosmetic implications"),
                KeyValueRow(key: "Electrical burns including lightning", value: "Hidden internal injury, rhabdomyolysis, arrhythmias"),
                KeyValueRow(key: "Chemical burns", value: "Specialized decontamination"),
                KeyValueRow(key: "Inhalation injury", value: "Airway + respiratory care"),
                KeyValueRow(key: "Burn with concomitant trauma or pre-existing medical conditions", value: "Higher complexity"),
                KeyValueRow(key: "Pediatric burns", value: "Pediatric burn centers"),
                KeyValueRow(key: "Burns with social/emotional/long-term rehabilitation needs", value: "Multidisciplinary care")
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("STOP the burning process — remove from heat, remove burned clothing (don't pull stuck), cool with room temp water 10-20 minutes (NOT ice — vasoconstriction worsens injury), brush off chemicals before flushing.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Airway assessment — early intubation if inhalation injury (don't wait for obstruction); 100% O2.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("IV access — large-bore antecubital through unburned skin preferred; 2 lines for major burns.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Parkland fluid resuscitation per protocol; titrate to UOP NOT formula.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Pain management — IV opioids (morphine, fentanyl); often very large doses needed.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Wound care — clean with mild soap + water; cover with sterile dressing (do not apply ice/butter/ointments to fresh burns); transfer to burn unit.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Watch for compartment syndrome (circumferential burns) — pallor, paresthesia, paralysis, pulselessness; escharotomy for circumferential extremity or torso burns affecting breathing.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Foley catheter (UOP monitoring), NG tube (ileus prevention), IV antibiotic prophylaxis NOT routine.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Tetanus prophylaxis per immunization status; do NOT give silver sulfadiazine if patient sulfa allergic.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Hypothermia prevention — warm environment + IV fluids + blankets; major burns lose significant heat.", citationIDs: ["openrn_cc36c"])
            ])
        ],
        citations: [openrnCC36C, cdcCC36C, specialtyCC36C],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AcuteVisionLossEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "acute-vision-loss-evaluation",
        title: "Acute vision loss evaluation",
        subtitle: "Time-critical (CRAO, retinal detachment, acute angle-closure glaucoma, optic neuritis, GCA) · monocular vs binocular · sudden vs gradual",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36C,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Acute vision loss is an ophthalmologic emergency. Most causes are TIME-CRITICAL — CRAO has only 90-100 minute window for vision preservation; acute angle-closure glaucoma + retinal detachment require emergent intervention. Distinguish MONOCULAR (eye, retina, optic nerve) from BINOCULAR (CNS, occipital lobe, bilateral retinal) + SUDDEN from GRADUAL. Emergent ophthalmology referral for sudden monocular vision loss per primary source.",
                citationIDs: ["specialty_cc36c"]
            )),
            .keyValueTable(title: "Time-critical monocular sudden vision loss", [
                KeyValueRow(key: "CENTRAL RETINAL ARTERY OCCLUSION (CRAO)", value: "Sudden painless monocular vision loss; cherry-red spot on fundus + pale retina; vascular embolic source (carotid, cardiac); 90-100 min window; ocular massage + IOP-lowering + thrombolytics (selected); stroke workup essential"),
                KeyValueRow(key: "CENTRAL RETINAL VEIN OCCLUSION", value: "Sudden painless vision loss; \"blood + thunder\" fundus (diffuse hemorrhages); hypertension + glaucoma + thrombophilia risk; observation vs anti-VEGF + photocoagulation"),
                KeyValueRow(key: "ACUTE ANGLE-CLOSURE GLAUCOMA", value: "Severe eye pain + headache + N/V + blurred vision + halos around lights + red eye + fixed mid-dilated pupil; IOP markedly elevated; topical pilocarpine + IV mannitol/acetazolamide + emergent laser iridotomy"),
                KeyValueRow(key: "RETINAL DETACHMENT", value: "Flashes + floaters + curtain over vision; progresses; emergent surgical repair (scleral buckle, vitrectomy)"),
                KeyValueRow(key: "GIANT CELL ARTERITIS / TEMPORAL ARTERITIS", value: "Age >50 + temporal HA + jaw claudication + scalp tenderness + vision loss (often anterior ischemic optic neuropathy — AION); ESR/CRP elevated; HIGH-DOSE STEROIDS EMPIRICALLY before biopsy (prevents fellow eye involvement)"),
                KeyValueRow(key: "OPTIC NEURITIS", value: "Subacute vision loss + pain with eye movement + color desaturation; MS risk; MRI + steroids (IV methylpred for severe)"),
                KeyValueRow(key: "VITREOUS HEMORRHAGE", value: "Sudden vision loss + floaters; diabetic retinopathy + trauma + retinal tear; observation + treat underlying"),
                KeyValueRow(key: "AMAUROSIS FUGAX", value: "Transient monocular vision loss (curtain coming down); carotid + cardiac emboli; TIA workup + stroke prevention")
            ]),
            .keyValueTable(title: "Binocular sudden vision loss", [
                KeyValueRow(key: "OCCIPITAL STROKE", value: "Homonymous hemianopia or bilateral; vascular risk factors; emergent imaging + stroke workup"),
                KeyValueRow(key: "PITUITARY APOPLEXY", value: "Sudden HA + visual field defects (bitemporal hemianopia) + cranial nerve palsies + adrenal crisis; MRI + steroids + neurosurgery"),
                KeyValueRow(key: "BILATERAL OPTIC NEURITIS", value: "Neuromyelitis optica (NMO/Devic disease); MRI + autoantibodies; steroids + plasmapheresis"),
                KeyValueRow(key: "BILATERAL CRAO", value: "Cardioembolic source; emergent workup"),
                KeyValueRow(key: "METHANOL POISONING", value: "Bilateral vision loss + anion gap acidosis + history; fomepizole + dialysis"),
                KeyValueRow(key: "POSTERIOR REVERSIBLE ENCEPHALOPATHY", value: "Severe HTN + HA + visual changes + seizures; MRI shows posterior edema; treat HTN")
            ]),
            .keyValueTable(title: "Subacute/gradual vision loss", [
                KeyValueRow(key: "MACULAR DEGENERATION (AMD)", value: "Age >50; central vision loss (\"missing center\"); dry vs wet (anti-VEGF for wet)"),
                KeyValueRow(key: "CATARACTS", value: "Gradual painless blurring + glare + halos; surgical removal"),
                KeyValueRow(key: "OPEN-ANGLE GLAUCOMA", value: "Asymptomatic progressive peripheral vision loss; elevated IOP + cup-disc ratio; topical IOP-lowering"),
                KeyValueRow(key: "DIABETIC RETINOPATHY", value: "Diabetic with progressive vision changes; annual eye exam + glycemic control + anti-VEGF + photocoagulation"),
                KeyValueRow(key: "REFRACTIVE ERRORS", value: "Most common; refraction + corrective lenses")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("History — monocular vs binocular, sudden vs gradual, painful vs painless, associated symptoms (HA, eye pain, halos, flashes, floaters, N/V), trauma, age, medical history (CV, diabetes, MS).", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Visual acuity — Snellen chart or pinhole testing; record finger counting, hand motion, light perception, no light perception if cannot read chart.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Visual fields — confrontation testing; central vs peripheral.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Pupil exam — direct + consensual + swinging flashlight (relative afferent pupillary defect — RAPD).", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Extraocular movements + alignment + diplopia.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Funduscopic exam — disc, macula, vessels, hemorrhages, exudates.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("IOP measurement (tonometry) — markedly elevated in acute angle-closure glaucoma.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("STAT ESR + CRP if GCA suspected (age >50 + temporal HA + jaw claudication).", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Neuroimaging — CT/MRI brain if central etiology suspected.", citationIDs: ["specialty_cc36c"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("EMERGENT ophthalmology consultation for sudden monocular vision loss; do not delay.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Position upright; do NOT pressure on globe; do NOT use eye drops without ophthalmology direction.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("GCA workup — empiric high-dose steroids (prednisone 60-80 mg PO daily OR methylprednisolone 1g IV × 3 days for severe) before biopsy to preserve fellow eye.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Acute angle-closure glaucoma — emergent IOP-lowering (topical timolol/pilocarpine + IV acetazolamide/mannitol + analgesia + antiemetic); laser iridotomy.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("CRAO — ocular massage (digital pressure × 5 sec on/off cycles), IOP-lowering (acetazolamide), 100% O2 + CO2 (carbogen), anterior chamber paracentesis selected; stroke workup essential.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Patient + family education — diagnosis + plan + follow-up + safety (vision impairment + falls).", citationIDs: ["openrn_cc36c"])
            ])
        ],
        citations: [openrnCC36C, cdcCC36C, specialtyCC36C],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EpistaxisEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "epistaxis-evaluation",
        title: "Epistaxis evaluation + control",
        subtitle: "Anterior (Kiesselbach plexus, 90%) vs posterior · direct pressure → topical agents → packing → emergent · risk factors · coagulopathy + anticoagulation",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36C,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Epistaxis — common chief complaint; 90% from ANTERIOR nasal septum (Kiesselbach plexus) + usually self-limited; 10% POSTERIOR (sphenopalatine artery) + can be severe + life-threatening. Risk factors — HTN, anticoagulation, antiplatelets, trauma, dry air, allergies, nose-picking, cocaine use, Osler-Weber-Rendu (HHT), neoplasm. Stepwise approach: direct pressure → topical vasoconstrictors → packing → cautery → surgery/embolization per primary source.",
                citationIDs: ["specialty_cc36c"]
            )),
            .keyValueTable(title: "Anterior vs Posterior epistaxis", [
                KeyValueRow(key: "ANTERIOR (90%)", value: "Kiesselbach plexus at nasal septum; usually unilateral; visible bleeding source; controlled with direct pressure + topical; outpatient management typical"),
                KeyValueRow(key: "POSTERIOR (10%)", value: "Sphenopalatine artery + branches; bilateral or posterior pharyngeal drainage; harder to control + can be life-threatening; admission + posterior packing or balloon + ENT consultation"),
                KeyValueRow(key: "Distinction", value: "Bleeding from BOTH nares OR persistent bleeding into posterior pharynx OR failed anterior packing suggests posterior source")
            ]),
            .keyValueTable(title: "Risk factors + special considerations", [
                KeyValueRow(key: "ANTICOAGULATION", value: "Warfarin, DOACs, heparin; check INR; reversal for severe (vitamin K, 4F-PCC, andexanet, idarucizumab)"),
                KeyValueRow(key: "ANTIPLATELET", value: "Aspirin, clopidogrel; bleeding time + platelet function tests; hold; platelet transfusion if severe"),
                KeyValueRow(key: "HYPERTENSION", value: "Manage BP <160/100 acutely while controlling bleeding; not direct cause but contributes; chronic management"),
                KeyValueRow(key: "COAGULOPATHY", value: "Von Willebrand disease (most common inherited bleeding disorder), hemophilia, ITP, liver disease, vitamin K deficiency; targeted workup + replacement"),
                KeyValueRow(key: "OSLER-WEBER-RENDU (HHT)", value: "Hereditary hemorrhagic telangiectasia; recurrent epistaxis + AV malformations elsewhere; nasal closure procedures + tranexamic acid"),
                KeyValueRow(key: "NEOPLASM", value: "Recurrent unilateral epistaxis or unilateral nasal obstruction in adult — rule out tumor; ENT eval + imaging"),
                KeyValueRow(key: "PEDIATRIC", value: "Usually anterior + benign; nose-picking, dry air, foreign body, allergic rhinitis; consider abuse if recurrent severe; vWD evaluation if recurrent")
            ]),
            .keyValueTable(title: "Management — stepwise approach", [
                KeyValueRow(key: "STEP 1: Direct pressure + position", value: "Lean forward (not back — prevents swallowing blood + airway), pinch soft part of nose × 10-15 min continuous; ice pack to bridge of nose; spit out blood + don't swallow"),
                KeyValueRow(key: "STEP 2: Topical vasoconstrictor + anesthetic", value: "Oxymetazoline 0.05% (Afrin) spray × 2-3 sprays OR phenylephrine + lidocaine soaked cotton pledget; reassess after 10-15 min"),
                KeyValueRow(key: "STEP 3: Anterior packing", value: "Rapid Rhino (hydrocolloid balloon), Merocel sponge, ribbon gauze with petrolatum; check posterior pharynx; antibiotic prophylaxis (cephalexin) for toxic shock syndrome prevention if packing >48 hr"),
                KeyValueRow(key: "STEP 4: Cautery", value: "Silver nitrate stick (anterior visible bleeding source) OR electrocautery (ENT); avoid bilateral septal cautery (septal perforation risk)"),
                KeyValueRow(key: "STEP 5: Posterior packing or balloon", value: "If posterior source — Foley catheter balloon OR commercial posterior balloon (Epistat); ICU admission + cardiac monitoring (vagal stimulation risk); ENT consultation"),
                KeyValueRow(key: "STEP 6: Embolization or surgical ligation", value: "Refractory bleeding — interventional radiology (sphenopalatine artery embolization) OR surgical ligation (endoscopic sphenopalatine ligation)")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("Vital signs — assess for shock if heavy bleeding; orthostatic if concerned for volume loss.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("History — duration, frequency of recent episodes, trauma, anticoagulation, antiplatelet, hypertension control, prior procedures, bleeding history (vWD signs), cocaine use, nose-picking.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Examination — identify anterior vs posterior source; speculum + light + bayonet forceps to inspect Kiesselbach + posterior; suction to clear; bilateral bleeding or posterior pharyngeal drainage suggests posterior.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Labs — CBC (anemia, thrombocytopenia), INR if anticoagulated, type + screen if heavy.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Coagulation workup if recurrent or family history — PT/PTT, vWF antigen + activity, factor VIII, platelet function.", citationIDs: ["specialty_cc36c"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Position upright + leaning forward; pinch nose × 10-15 min continuous (most fail because pinch incorrectly or release too soon).", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Ice pack to bridge of nose + back of neck; reduces blood flow.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Suction blood from posterior pharynx; bowl/emesis basin for spitting; aspiration precautions.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Vital signs frequently; IV access if heavy bleeding; type + screen + crossmatch if severe; transfuse PRN.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Anxiety management — sense of doom common; reassurance + calm explanation.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Tranexamic acid topical (500 mg in 5 mL) on pledget soaked + applied to bleeding site; effective adjunct.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Anticoagulation reversal — coordinate with provider + pharmacy; depends on severity + agent.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Discharge teaching — humidification, saline spray, avoid nose-picking + heavy lifting × 1 week, avoid hot showers + spicy foods (vasodilation), avoid aspirin if possible, follow-up.", citationIDs: ["openrn_cc36c"])
            ])
        ],
        citations: [openrnCC36C, cdcCC36C, specialtyCC36C],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ESITriageRound36Sample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "esi-emergency-severity-index",
        title: "ESI (Emergency Severity Index) triage",
        subtitle: "5-level triage · life threats + high-risk + resource prediction · ESI 1-5 categorization · pediatric considerations · widely adopted US standard",
        eyebrow: "REFERENCE · TRIAGE",
        nclexTags: triageTagsR36C,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "ESI (Emergency Severity Index) — 5-level triage tool widely used in US emergency departments. Triage nurse assigns level based on (1) immediate life threat, (2) high-risk situation, (3) predicted resource utilization. ESI is reliable, valid, and predicts patient acuity + resource needs. Pediatric considerations require modified vital sign thresholds. Effective triage is fundamental to ED flow + patient safety per primary source.",
                citationIDs: ["specialty_cc36c"]
            )),
            .keyValueTable(title: "ESI Algorithm — 5 Levels", [
                KeyValueRow(key: "LEVEL 1 — Resuscitation", value: "Requires IMMEDIATE life-saving intervention; cardiopulmonary arrest, severe respiratory distress, severe trauma, unresponsive, severe shock, intubated transfer; immediate physician + nurse + resources"),
                KeyValueRow(key: "LEVEL 2 — Emergent", value: "HIGH-RISK situation OR confused/lethargic/disoriented OR severe pain/distress (10/10 OR vital sign abnormalities); cannot safely wait — STEMI, CVA, sepsis, severe trauma, severe asthma, suicidal ideation with plan, severe psychiatric crisis"),
                KeyValueRow(key: "LEVEL 3 — Urgent", value: "Many resources predicted (≥2 resources) + stable vitals — abdominal pain workup, complex laceration, CT/labs/IV meds; assess vital signs for danger zones (age-specific)"),
                KeyValueRow(key: "LEVEL 4 — Less urgent", value: "One resource predicted — simple laceration, UTI evaluation, simple wrist injury, simple URI; single intervention"),
                KeyValueRow(key: "LEVEL 5 — Non-urgent", value: "No resources predicted (other than oral medications, simple wound care, immunizations, prescription refill); med refill, simple suture removal, wart eval")
        ]),
            .keyValueTable(title: "ESI vital sign danger zones (Level 3 → upgrade to Level 2 if exceeded)", [
                KeyValueRow(key: "Adult", value: "HR >100, RR >20, SpO2 <92%; consider individual context"),
                KeyValueRow(key: "Children >3-12 years", value: "HR >120, RR >30, SpO2 <92%"),
                KeyValueRow(key: "Children 1-3 years", value: "HR >140, RR >40, SpO2 <92%"),
                KeyValueRow(key: "Infants 3-12 months", value: "HR >160, RR >50, SpO2 <92%"),
                KeyValueRow(key: "Newborn <3 months", value: "HR >180, RR >60, SpO2 <92%; fever ≥38°C in <3 months is HIGH-RISK regardless of appearance")
            ]),
            .keyValueTable(title: "Resource counting (ESI Level 3 vs 4 vs 5)", [
                KeyValueRow(key: "COUNT as resources", value: "Labs (any), ECG, X-ray, CT/MRI/US, IV fluids, IV/IM/nebulized meds, specialty consultation, simple procedure (e.g., laceration repair with sutures), complex procedure"),
                KeyValueRow(key: "DO NOT count", value: "History + physical exam, point-of-care testing, saline lock, PO meds, tetanus, prescription refill, simple wound care + dressing"),
                KeyValueRow(key: "0 resources = Level 5", value: "Med refill, suture removal, wart eval"),
                KeyValueRow(key: "1 resource = Level 4", value: "Simple UTI workup with UA, simple laceration, ankle X-ray"),
                KeyValueRow(key: "≥2 resources = Level 3", value: "Abdominal pain with labs + CT, asthma with neb + steroids, complex laceration with X-ray")
            ]),
            .bullets(title: "High-risk situations (Level 2 considerations)", [
                AttributedBullet("Time-sensitive — STEMI (ECG within 10 min), stroke (LKW within 4.5 hr for tPA, 24 hr for thrombectomy), sepsis (Hour-1 bundle).", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Cardiac concerns — chest pain with risk factors, palpitations + hemodynamic compromise, syncope with cardiac features.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Neurologic — focal deficits, severe HA + red flags, status epilepticus, new-onset seizure.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Respiratory — severe asthma exacerbation, suspected PE, severe COPD exacerbation, anaphylaxis.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Trauma — head injury with LOC, mechanism (high-speed MVC, fall >20 ft), penetrating injuries, severe abdominal pain.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Psychiatric — suicidal ideation with plan, homicidal ideation, severe agitation, psychotic + dangerous.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Pregnancy — heavy vaginal bleeding, preeclampsia symptoms, ruptured ectopic concern, severe abdominal pain.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Pediatric — fever <3 months, lethargic/inconsolable infant, severe respiratory distress, dehydration, ALTE/BRUE.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Immunocompromised — febrile neutropenia, post-transplant fever, severe sepsis risk.", citationIDs: ["specialty_cc36c"])
            ]),
            .bullets(title: "Triage nursing priorities", [
                AttributedBullet("Brief targeted history + chief complaint + onset + severity within ~3-5 min per patient.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Vital signs + visual assessment (general appearance, mental status, work of breathing, color).", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Immediate interventions if Level 1 (resuscitation room transfer, immediate physician notification, IV access, supplemental O2).", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Continuous reassessment — patients can deteriorate while waiting; reassess Level 3-5 patients every 2 hours minimum.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Communication — clear handoff to next provider; SBAR; clear documentation of level + rationale.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Cultural + language competence — interpreter services + culturally appropriate communication.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Trauma-informed approach — many ED patients have trauma history; privacy + dignity + minimal traumatization.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Mental health + substance use considerations — non-judgmental + harm reduction + appropriate level assignment.", citationIDs: ["openrn_cc36c"])
            ])
        ],
        citations: [openrnCC36C, cdcCC36C, specialtyCC36C],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TraumaTeamActivationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "trauma-team-activation-criteria",
        title: "Trauma team activation criteria",
        subtitle: "Level I/II/III trauma center · activation criteria · multidisciplinary response · time-to-imaging + intervention metrics · reverse triage",
        eyebrow: "REFERENCE · TRIAGE",
        nclexTags: triageTagsR36C,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Trauma team activation triggers a coordinated multidisciplinary response to severely injured patients. American College of Surgeons (ACS-COT) sets criteria for FULL ACTIVATION (most severe — highest resources) vs PARTIAL ACTIVATION (still significant — moderate resources) vs CONSULT (less acute). Activation criteria based on physiology + anatomy + mechanism + special considerations (age, comorbidities, anticoagulation). Time-to-imaging + time-to-intervention metrics tracked for quality improvement per primary source.",
                citationIDs: ["specialty_cc36c"]
            )),
            .keyValueTable(title: "Trauma center levels", [
                KeyValueRow(key: "LEVEL I", value: "Highest level; comprehensive trauma surgery + subspecialties 24/7 + research + education; treats most complex cases; CT + OR + ICU + neurosurgery + orthopedics + radiology in-house"),
                KeyValueRow(key: "LEVEL II", value: "Comprehensive trauma surgery; most subspecialties; may transfer some complex cases"),
                KeyValueRow(key: "LEVEL III", value: "Initial assessment + resuscitation + emergency surgery; transfer to higher level for definitive care"),
                KeyValueRow(key: "LEVEL IV / V", value: "Stabilize + transfer; common in rural areas; basic trauma care"),
                KeyValueRow(key: "PEDIATRIC trauma center", value: "Pediatric-specific resources + specialists; preferred for major pediatric trauma when available")
            ]),
            .keyValueTable(title: "FULL ACTIVATION criteria (\"Level 1\" or \"Code Trauma\")", [
                KeyValueRow(key: "PHYSIOLOGIC criteria", value: "GCS ≤8 with mechanism, SBP <90 sustained, RR <10 or >29 (or need for ventilator), revised trauma score <12; \"unstable\" by clinical judgment"),
                KeyValueRow(key: "ANATOMIC criteria", value: "Penetrating injury to head/neck/torso/groin/proximal extremity, flail chest, open or depressed skull fracture, paralysis from trauma, amputation proximal to wrist/ankle, traumatic limb amputation, pelvic fracture, suspected open or depressed skull fracture, suspected spinal cord injury, 2+ proximal long-bone fractures, crushed/degloved/mangled/pulseless extremity"),
                KeyValueRow(key: "MECHANISM criteria", value: "Falls — adult >20 ft, peds >10 ft; high-risk auto crash (intrusion >12 in, ejection, death in same compartment); auto vs pedestrian/bicyclist thrown/run over/significant impact; motorcycle crash >20 mph"),
                KeyValueRow(key: "SPECIAL POPULATIONS", value: "Age >55 (or <5), anticoagulation/bleeding disorder, burns + trauma, pregnancy >20 weeks, EMS judgment"),
                KeyValueRow(key: "Response", value: "Multidisciplinary team in trauma bay; trauma surgery + ED + nursing + anesthesia + respiratory + radiology + lab + chaplain + social work; OR + ICU available; massive transfusion ready")
            ]),
            .keyValueTable(title: "PARTIAL ACTIVATION criteria (\"Level 2\" or \"Trauma Consult\")", [
                KeyValueRow(key: "Lower-severity criteria", value: "Less severe physiology + anatomy + mechanism; meets criteria but does not require full team"),
                KeyValueRow(key: "Examples", value: "Isolated extremity fractures, simple lacerations needing surgery, hemodynamically stable abdominal pain post-trauma"),
                KeyValueRow(key: "Response", value: "Trauma surgery + ED nursing + OR available if needed; smaller team")
            ]),
            .bullets(title: "Reverse triage + over-triage acceptable", [
                AttributedBullet("Over-triage acceptable (target ~25-50%) — safer to mobilize team than miss injuries; under-triage (target <5%) is more dangerous.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Reverse triage in mass casualty — sickest waits LONGER if survival unlikely; resources to those who benefit most.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Quality improvement — over-triage + under-triage rates tracked + reviewed.", citationIDs: ["specialty_cc36c"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Trauma activation per institutional criteria — overhead page + multidisciplinary response.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Trauma bay preparation — equipment ready, blood ready, OR informed, ICU informed.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Roles — clear role assignment (recorder, airway, primary survey, secondary survey, IV/labs, family liaison).", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Primary + secondary survey per ATLS framework with continuous reassessment.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Documentation — chronology + interventions + responses; trauma flow sheet.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Family communication + chaplaincy + counseling support.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Transfer coordination if higher-level care needed — phone consultation + EMS + receiving facility.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Team debrief post-event — what worked + improvements + emotional support.", citationIDs: ["openrn_cc36c"])
            ])
        ],
        citations: [openrnCC36C, cdcCC36C, specialtyCC36C],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MassCasualtyTriageSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "mass-casualty-triage-start-jumpstart",
        title: "Mass casualty triage (START / JumpSTART / SALT)",
        subtitle: "Disaster + multiple casualty event triage · greatest good for greatest number · color-coded tags (red/yellow/green/black) · START adult · JumpSTART peds · SALT national standard",
        eyebrow: "REFERENCE · TRIAGE",
        nclexTags: triageTagsR36C,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Mass casualty incident (MCI) triage prioritizes patients when needs exceed available resources — fundamental shift from normal practice (\"do everything for everyone\") to \"greatest good for greatest number.\" START (Simple Triage And Rapid Treatment) is most widely used adult algorithm; JumpSTART adapts for pediatric. SALT (Sort, Assess, Lifesaving Interventions, Treatment + Transport) is national MCI standard. Triage tags use 4 colors — RED (immediate), YELLOW (delayed), GREEN (minor/walking wounded), BLACK (deceased/expectant) per primary source.",
                citationIDs: ["specialty_cc36c"]
            )),
            .keyValueTable(title: "START Algorithm — Adult MCI", [
                KeyValueRow(key: "STEP 1: SORT walking wounded", value: "\"Anyone who can walk, please move to [designated area]\" — GREEN tag (minor); reassess later"),
                KeyValueRow(key: "STEP 2: ASSESS Respirations", value: "If NOT breathing → open airway; if still no breathing → BLACK; if breathing >30/min → RED; if ≤30/min → next step"),
                KeyValueRow(key: "STEP 3: ASSESS Perfusion", value: "Check radial pulse OR capillary refill; no radial pulse OR cap refill >2 sec → RED; pulse present → next step"),
                KeyValueRow(key: "STEP 4: ASSESS Mental status", value: "Cannot follow simple commands → RED; follows commands → YELLOW"),
                KeyValueRow(key: "Spend <60 seconds per patient", value: "Brief interventions only — open airway, control hemorrhage with tourniquet; move on; revisit"),
                KeyValueRow(key: "Mnemonic: RPM 30-2-Can Do", value: "Respirations 30, Perfusion 2 sec cap refill, Mental status Can Do — fail any → RED; pass all + can walk → GREEN; pass all + cannot walk → YELLOW")
            ]),
            .keyValueTable(title: "JumpSTART — Pediatric MCI (age 1-8)", [
                KeyValueRow(key: "Walking", value: "If walking → GREEN; if not → assess"),
                KeyValueRow(key: "Breathing", value: "If apneic → open airway; if breathing now → RED; if still apneic + has pulse → give 5 rescue breaths → if breathing → RED; if not → BLACK"),
                KeyValueRow(key: "Respiratory rate", value: "<15 or >45/min → RED; 15-45 → next step"),
                KeyValueRow(key: "Perfusion", value: "Absent peripheral pulse → RED; present → next step"),
                KeyValueRow(key: "Mental status — AVPU", value: "A or V (alert or responds to voice) → YELLOW; P (responds to pain) with inappropriate or P → painful stimulus only → RED; U (unresponsive) → RED"),
                KeyValueRow(key: "Key differences from START", value: "Pediatric rescue breaths attempted (peds frequently primarily respiratory failure); RR thresholds different; AVPU instead of follow commands")
            ]),
            .keyValueTable(title: "SALT Triage — National Model", [
                KeyValueRow(key: "S — SORT (Global)", value: "Walk → assess last; wave/purposeful movement → assess second; obvious life threat → assess first; SORT walking wounded similar to START"),
                KeyValueRow(key: "A — ASSESS (Individual)", value: "Quick individual assessment — obvious life-threats first"),
                KeyValueRow(key: "L — LIFESAVING INTERVENTIONS", value: "Control major hemorrhage (tourniquet), open airway (jaw thrust, recovery position), chest decompression (penetrating chest + tension), auto-injectors for nerve agents; <1 min per patient"),
                KeyValueRow(key: "T — TREATMENT AND/OR TRANSPORT", value: "Categorize: IMMEDIATE (red), DELAYED (yellow), MINIMAL (green), EXPECTANT (black if cannot follow simple commands AND respirations absent after airway maneuvers AND pulse absent — survival unlikely with resources)")
            ]),
            .keyValueTable(title: "Triage tag colors", [
                KeyValueRow(key: "RED — IMMEDIATE", value: "Life-threatening injuries; salvageable with immediate intervention; e.g., respiratory failure responsive to intervention, massive hemorrhage with tourniquet, sucking chest wound, severe head injury with respiratory compromise"),
                KeyValueRow(key: "YELLOW — DELAYED", value: "Serious injuries but can wait 1-2 hours; stable enough for delayed transport; e.g., open extremity fractures without vascular compromise, abdominal pain without hypotension, head injury without respiratory compromise"),
                KeyValueRow(key: "GREEN — MINIMAL", value: "Minor injuries; can wait hours; walking wounded; e.g., simple lacerations, sprains, contusions, simple closed fractures"),
                KeyValueRow(key: "BLACK — EXPECTANT / DECEASED", value: "Dead OR not salvageable with available resources OR resource consumption disproportionate to survival probability; controversial — context-dependent; in resource-rich settings + with sufficient personnel may attempt resuscitation")
            ]),
            .bullets(title: "Triage principles + ethics", [
                AttributedBullet("Greatest good for the greatest number — shift from individual to population mindset.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Triage is DYNAMIC — patients re-categorized as condition changes; revisit + re-triage frequently.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Minimal interventions during triage — open airway, control bleeding with tourniquet; no extended care.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Resource scarcity drives triage — what's life-saving in normal practice may be inappropriate in MCI; supplies + personnel + transport limitations.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Ethics — Crisis Standards of Care provide framework when needs exceed resources; documented institutional policies; reviewed by ethics + leadership.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Children — particular emotional impact; triage them as adults but with developmental considerations; family separation policies; security.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Communication + command structure — Incident Command System (ICS); roles + chain of command; clear protocols.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("PSYCHOLOGICAL impact on triage staff — making life-or-death decisions; institutional support + counseling + debriefing.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Hospital surge planning — staffing, supplies, decontamination, isolation, family reunification, security, communication.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("CHEMICAL/BIOLOGICAL/RADIOLOGICAL/NUCLEAR/EXPLOSIVE (CBRNE) — decontamination FIRST (do not enter hospital until decontaminated), PPE, specific antidotes, public health coordination.", citationIDs: ["specialty_cc36c"])
            ]),
            .bullets(title: "Nursing priorities during MCI", [
                AttributedBullet("Activate institutional MCI plan; report to assigned role.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Triage by algorithm — START/JumpSTART/SALT per institutional protocol.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Brief interventions during triage — airway + hemorrhage control; move on; revisit.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Document — triage tags + chronology + interventions.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Communication — chain of command + ICS + radio discipline.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Family reunification + tracking + communication.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Surge capacity — discharge appropriate inpatients, cancel elective surgeries, mobilize off-duty staff, set up alternate care areas.", citationIDs: ["specialty_cc36c"]),
                AttributedBullet("Self-care + team support — emotionally + physically demanding; rotate, hydrate, eat, debrief.", citationIDs: ["openrn_cc36c"]),
                AttributedBullet("Post-event debrief + mental health support — Critical Incident Stress Management (CISM) + counseling.", citationIDs: ["specialty_cc36c"])
            ])
        ],
        citations: [openrnCC36C, cdcCC36C, specialtyCC36C],
        lastSourceFidelityReview: "2026-05-13"
    )
}
