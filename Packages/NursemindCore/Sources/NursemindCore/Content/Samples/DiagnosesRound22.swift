import Foundation

// Curator-model diagnosis entries (round 22 — ENT + ophthalmology + common dermatology).

private let openrnDxR22 = CitationSource(
    id: "openrn_dx_round22",
    shortName: "Open RN Health Alterations + Pediatrics",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-12"
)
private let cdcDxR22 = CitationSource(
    id: "cdc_dx_round22",
    shortName: "CDC + AAP + AAFP guidance",
    publisher: "CDC · AAP · AAFP",
    license: .publicDomain,
    url: "https://www.cdc.gov/groupastrep/diseases-hcp/strep-throat.html",
    lastRetrieved: "2026-05-12"
)
private let specialtyDxR22 = CitationSource(
    id: "specialty_dx_round22",
    shortName: "AAO-HNS + AAO + AAD + IDSA + ARA / WAO guidelines",
    publisher: "AAO-HNS · AAO · AAD · IDSA · WAO",
    license: .factCitationOnly,
    url: "https://www.aad.org/member/clinical-quality/guidelines",
    lastRetrieved: "2026-05-12"
)

private let entR22 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let ophthR22 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .sensoryPerception)
private let dermR22 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .safety)
private let infR22 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)

public enum AcuteBacterialSinusitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-bacterial-sinusitis",
        title: "Acute bacterial sinusitis",
        subtitle: "≥10 days OR worsening after 5 · double sickening · amoxicillin-clavulanate first-line · most are viral",
        nclexTags: entR22,
        definition: AttributedProse(
            "Bacterial infection of paranasal sinuses (maxillary most common) — distinguished from viral rhinosinusitis (~98% of \"sinus infections\") by duration ≥10 days without improvement OR worsening after initial improvement (\"double sickening\") OR severe (>39°C + purulent nasal discharge / facial pain for 3+ days). Most cases are viral + self-resolving per primary source.",
            citationIDs: ["specialty_dx_round22", "openrn_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Viral URI → mucosal edema → ostial obstruction → impaired sinus drainage → bacterial overgrowth (Strep pneumoniae, H. influenzae, Moraxella catarrhalis). Anaerobes + Staph in chronic cases.",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("≥10 days without improvement OR symptoms worsen after initial improvement (\"double sickening\").", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Purulent nasal discharge, facial pain / pressure (worse bending forward), congestion, hyposmia / anosmia.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Fever, headache, dental pain (maxillary teeth — referred), postnasal drip, cough (worse at night).", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Severe — high fever, severe unilateral facial pain, suggests bacterial.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Red flags — periorbital swelling, vision changes, severe headache, AMS → complications (orbital cellulitis, brain abscess, cavernous sinus thrombosis).", citationIDs: ["specialty_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis — no imaging / cultures routinely; reserve CT for refractory / complicated / immunocompromised.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CDC + IDSA + AAFP criteria for bacterial — duration ≥10 days, biphasic course, OR severe onset (≥39°C + facial pain 3+ consecutive days) per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CT sinuses — for recurrent, refractory, complicated, immunocompromised; baseline pre-FESS.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Nasal endoscopy — ENT referral for chronic, refractory, or atypical cases.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Duration + symptom pattern (continuous vs biphasic) — guides viral vs bacterial.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Red flags for complication — vision, neuro, severe HA.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Risk factors — recent abx (resistance), immunocompromise, asthma, allergic rhinitis.", citationIDs: ["openrn_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("WATCHFUL WAITING acceptable for uncomplicated even when meeting bacterial criteria — 7 days; shared decision-making per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("AMOXICILLIN-CLAVULANATE 875/125 mg PO BID × 5-10 days — first-line; better gram-negative coverage than amoxicillin alone per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HIGH-DOSE amoxicillin-clavulanate (2 g BID) — for severe / high-risk (recent abx, day care, age >65, immunocompromised, diabetes).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("PCN ALLERGY — doxycycline OR levofloxacin (with cardiac caution); not macrolides (high pneumococcal resistance).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("SYMPTOMATIC — intranasal corticosteroid (fluticasone), analgesics (acetaminophen, NSAIDs), saline irrigation (sinus rinse).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("DECONGESTANTS — short-term (<3 days) for symptom relief; rhinitis medicamentosa risk with prolonged use.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Follow-up if no improvement in 3-5 days — consider broader-spectrum abx OR ENT referral.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ENT REFERRAL — recurrent (≥4/year), chronic (>12 weeks), refractory, complications, immunocompromised; consider FESS.", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("ORBITAL CELLULITIS — periorbital swelling, pain, vision changes, proptosis; emergent ENT + ophthalmology + IV abx + drainage.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("INTRACRANIAL COMPLICATIONS — brain abscess, cavernous sinus thrombosis, meningitis; severe headache, neuro deficit, AMS; emergent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("POTTS PUFFY TUMOR — frontal sinus subperiosteal abscess; tender forehead swelling; surgical emergency.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CHRONIC RHINOSINUSITIS — >12 weeks symptoms; allergic / structural / nasal polyp workup; FESS.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("FUNGAL SINUSITIS — immunocompromised; mucormycosis emergent in diabetic DKA / chemo — necrotic black eschar in nose; surgical + amphotericin.", citationIDs: ["specialty_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AcutePharyngitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-pharyngitis",
        title: "Acute pharyngitis (sore throat + GAS pharyngitis)",
        subtitle: "Most viral · Centor / McIsaac · RADT + culture · PCN / amoxicillin for GAS · no abx for viral",
        nclexTags: entR22,
        definition: AttributedProse(
            "Inflammation of pharynx / tonsils — most cases viral (rhinovirus, adenovirus, EBV, influenza, COVID-19). Bacterial — group A streptococcus (GAS, S. pyogenes) most common; less commonly Fusobacterium (Lemierre), GC, Mycoplasma, Arcanobacterium. Major nursing role — distinguish viral from GAS to avoid unnecessary abx + identify GAS complications per primary source.",
            citationIDs: ["openrn_dx_round22", "cdc_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Viral — direct mucosal infection + inflammation. Bacterial GAS — direct adherence + toxin production; can lead to scarlet fever (erythrogenic toxin), rheumatic fever (delayed immune response affecting heart / joints / CNS), post-strep GN.",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("Sore throat, fever, malaise; lymphadenopathy.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("VIRAL clues — cough, rhinorrhea, conjunctivitis, hoarseness, congestion, vesicles / ulcers (herpangina, HFMD).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("GAS clues — sudden onset, no cough, tender anterior cervical LAD, tonsillar exudate, fever ≥38°C, scarlatiniform rash, palatal petechiae.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("EBV / mono — splenomegaly, posterior cervical LAD, fatigue weeks-months, atypical lymphocytes.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("GONOCOCCAL — sexually active, oral sex history; severe sore throat.", citationIDs: ["specialty_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CENTOR criteria (modified McIsaac for age) — fever >38, tonsillar exudate, tender anterior cervical LAD, absent cough; ≥3 → test; <2 → no test, no abx per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("RAPID ANTIGEN DETECTION TEST (RADT) — sensitivity ~75-90%; if negative + clinical suspicion → throat culture.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("THROAT CULTURE — gold standard; 24-48 hr turnaround; required in children if RADT negative per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ASO titer — NOT for acute diagnosis; reflects recent past infection (rheumatic fever workup).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Monospot if EBV suspected (mono); positive ~6 weeks after onset.", citationIDs: ["openrn_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Centor / McIsaac score; risk stratify before testing / abx.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Red flags — drooling, stridor, trismus → epiglottitis / peritonsillar abscess; emergent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Penicillin allergy + severity.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Hydration + airway.", citationIDs: ["openrn_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("VIRAL — supportive: rest, fluids, acetaminophen / ibuprofen, salt-water gargle, lozenges; NO antibiotics per primary source.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("GAS POSITIVE — Penicillin V 500 mg PO BID-TID × 10 days OR amoxicillin 500 mg PO BID × 10 days (pediatric weight-based) per primary source.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("PCN ALLERGY — cephalexin (non-anaphylactic only), azithromycin 12 mg/kg/day × 5 days OR clindamycin 7 mg/kg/dose TID × 10 days per primary source.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("Single-dose benzathine penicillin G IM × 1 — option for poor adherence (painful injection).", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("Symptomatic for all — acetaminophen + ibuprofen + salt-water gargle + lozenges.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("School / work — return after 24 hrs of antibiotic therapy + afebrile per primary source.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("ENT REFERRAL — peritonsillar abscess (hot potato voice, trismus, deviated uvula), recurrent GAS pharyngitis (≥7 episodes / year) → tonsillectomy consideration.", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("PERITONSILLAR ABSCESS — severe sore throat, trismus, deviated uvula, drooling; needle drainage + abx; emergent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("EPIGLOTTITIS — adult or pediatric; severe sore throat, drooling, stridor, sitting upright; airway emergency.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("LEMIERRE SYNDROME — Fusobacterium → jugular vein thrombosis + septic emboli; emergent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ACUTE RHEUMATIC FEVER — 2-3 weeks after GAS untreated; Jones criteria; treat to prevent recurrence.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("POST-STREP GLOMERULONEPHRITIS — 1-3 weeks after GAS; hematuria, edema, HTN; supportive.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("INFECTIOUS MONONUCLEOSIS — splenomegaly + avoid contact sports × 4-6 weeks; rupture risk.", citationIDs: ["openrn_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum EpistaxisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "epistaxis",
        title: "Epistaxis (nosebleed)",
        subtitle: "Anterior 90% (Kiesselbach plexus) · pinch + lean forward · refractory → packing / cautery · workup anticoag / HTN",
        nclexTags: entR22,
        definition: AttributedProse(
            "Bleeding from nasal vasculature — most often anterior nasal septum (Kiesselbach's plexus, ~90%). Posterior bleeds (~10%) — more severe, often from sphenopalatine artery, require posterior packing + admission. Common across age — kids (nose-picking), elderly (HTN, anticoagulation) per primary source.",
            citationIDs: ["openrn_dx_round22", "specialty_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Mucosal trauma → vessel rupture. Risk factors — dry air, trauma, nose-picking, HTN, anticoagulation, antiplatelet, NSAIDs, alcohol, nasal sprays, septal deviation, neoplasm, HHT (hereditary hemorrhagic telangiectasia).",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("Anterior — visible bleeding from nose, often unilateral, controllable with pressure; mild.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Posterior — bilateral bleeding, blood running into throat (hemoptysis / hematemesis confusion); often severe; airway compromise risk.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Children — recurrent, mild, usually anterior; nose-picking.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Elderly — often posterior; severe; HTN + anticoagulation history.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Massive epistaxis — hypotension, tachycardia, anemia signs.", citationIDs: ["specialty_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — visualize bleeding source.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Vital signs + estimate blood loss; CBC if significant; coags if anticoagulated.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Nasal endoscopy — for refractory, recurrent, posterior bleeds, or to identify source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Imaging (CT) for trauma / suspected neoplasm.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Hemodynamic stability + airway protection.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Identify anterior vs posterior (after attempts at anterior management).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Medication review — anticoagulants, antiplatelets, NSAIDs, nasal sprays.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Underlying conditions — HTN, HHT, neoplasm, coagulopathy.", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("INITIAL FIRST AID — sit upright, lean FORWARD (prevents swallowing blood), PINCH nostrils firmly × 10-15 minutes continuous; do NOT release to check per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Topical vasoconstrictor — oxymetazoline (Afrin) or phenylephrine spray; effective for many anterior bleeds.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Topical anesthetic — lidocaine 4% (with concurrent vasoconstrictor) for procedures.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("REFRACTORY ANTERIOR — silver nitrate cautery (visualize source first; ONE side only — septal perforation risk if bilateral).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("NASAL PACKING (anterior) — Merocel sponge, Rapid Rhino, nasal gauze with petrolatum; expand with saline; remove 24-48 hrs; antibiotic prophylaxis (cephalexin) for TSS prevention per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("POSTERIOR PACKING — for posterior bleeds; balloon (Epistat) OR gauze; admission with continuous monitoring (apnea / airway risk); ENT consult.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("REFRACTORY / RECURRENT — endoscopic sphenopalatine artery ligation OR embolization (IR); ENT.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Reverse anticoagulation if life-threatening — vitamin K + PCC for warfarin; idarucizumab for dabigatran; andexanet for Xa inhibitors.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Treat underlying — BP control, humidification, nasal saline / petrolatum prophylaxis.", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("AIRWAY COMPROMISE / aspiration in posterior packing — admit + monitor.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("TOXIC SHOCK SYNDROME — anterior packing; abx prophylaxis (cephalexin); remove ≤48 hrs.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HYPOVOLEMIC SHOCK from severe / prolonged bleed — transfusion + ICU.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HEREDITARY HEMORRHAGIC TELANGIECTASIA — recurrent epistaxis + family history + telangiectasias; refer.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("NASOPHARYNGEAL TUMOR — unilateral recurrent epistaxis + unilateral nasal obstruction; refer ENT.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("SEPTAL HEMATOMA — trauma-related; emergent drainage to prevent septal cartilage necrosis.", citationIDs: ["specialty_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CerumenImpactionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cerumen-impaction",
        title: "Cerumen impaction",
        subtitle: "Hearing loss / discomfort · NEVER cotton swab · irrigation / curette / ceruminolytic · perforation risk if TM violated",
        nclexTags: entR22,
        definition: AttributedProse(
            "Accumulation of cerumen in external auditory canal causing symptoms (hearing loss, fullness, discomfort, vertigo, tinnitus) OR impairing examination. Affects ~10% of children, 5% of adults, 33% of elderly + cognitively impaired. AAO-HNS guidelines for safe management per primary source.",
            citationIDs: ["specialty_dx_round22", "openrn_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Cerumen normally self-clears via epithelial migration + jaw movement. Impaction from anatomy (narrow / curved canal), trauma (cotton swabs push wax in), hearing aids, age, eczema, ear plugs, retained foreign body.",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("Hearing loss (conductive — may be sudden if water trapped behind wax), fullness, pressure, otalgia.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Tinnitus, vertigo, dizziness (water trapped or canal occlusion).", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Otoscopy — visible cerumen obstructing canal / view of TM.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Pediatric — usually visible during well-child or sick visit.", citationIDs: ["openrn_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Otoscopy confirms cerumen impaction + assesses TM (intact / perforated).", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Tympanometry — assesses middle ear if hearing concerns persist after cerumen removal.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Audiometry — if hearing concerns persist.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("TM intact + history of perforation (contraindication to irrigation).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Anticoagulation + bleeding disorders (curette/cerumenolytic alternatives).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Diabetes (irrigation increases malignant otitis externa risk — alternative methods preferred).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Cognitively impaired + uncooperative — sedation / specialty.", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("AVOID COTTON SWABS — push wax deeper; cause TM perforation, canal abrasions, wax impaction.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CERUMENOLYTICS — carbamide peroxide (Debrox) 5-10 drops × 5-10 days; mineral oil; saline drops; soften before mechanical removal per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("IRRIGATION — body-temperature water with curved tip, aimed at canal wall (not directly at TM); CONTRAINDICATED if TM perforated, mastoid surgery, tympanostomy tubes, prior trauma per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CURETTE EXTRACTION — direct visualization; gentle traction with cerumen loop or alligator forceps; risk of canal trauma.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ENT REFERRAL — for refractory / recurrent / complicated cases; microscopy + suction.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HOME PREVENTION — counsel against Q-tips; warm mineral oil / saline drops periodically; use hearing aid moisturizer.", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("TM PERFORATION from irrigation pressure or curette trauma — pain, bleeding, hearing change; ENT referral.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("MALIGNANT OTITIS EXTERNA — diabetics + immunocompromised; deep persistent pain after irrigation; emergent IV abx.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CANAL ABRASION + cellulitis — overzealous instrumentation.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("RECURRENT IMPACTION — habitual cotton swab use; hearing aid users; eczema; counsel.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("FOREIGN BODY (especially pediatric) — beads, food, insects; specialist removal.", citationIDs: ["openrn_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ConjunctivitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "conjunctivitis",
        title: "Conjunctivitis (pink eye)",
        subtitle: "Viral most common · bacterial 24-48h purulent · allergic itchy bilateral · NOT for chlamydia/gonococcal in adults (urgent)",
        nclexTags: ophthR22,
        definition: AttributedProse(
            "Inflammation of conjunctiva — bulbar (covers sclera) + palpebral (lines inner eyelid). Etiology: viral (most common — adenovirus), bacterial (staph, strep, H. flu, MORE serious in newborns + STIs in sexually active adults), allergic (seasonal, perennial), irritant / chemical. CDC guidance + AAO red eye algorithm per primary source.",
            citationIDs: ["specialty_dx_round22", "openrn_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Inflammation from viral / bacterial / allergic / chemical insult → vasodilation + mediator release → conjunctival hyperemia + discharge. Different etiologies have characteristic patterns.",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("VIRAL — bilateral (start unilateral, spreads), WATERY / serous discharge, preauricular lymphadenopathy, often URI symptoms, contagious 10-14 days.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("BACTERIAL — PURULENT discharge with crusting / matted lashes on awakening, usually unilateral initially, less LAD, less itchy.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("ALLERGIC — bilateral, ITCHY, watery, often with allergic rhinitis, eyelid swelling, cobblestone papillae on upper lid.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("CHEMICAL / IRRITANT — pain, redness, often history of exposure; immediate irrigation.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("RED FLAGS — vision loss, severe photophobia, severe pain, history of contact lens wear (consider keratitis), recent trauma → emergent ophthalmology.", citationIDs: ["specialty_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis based on pattern.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Bacterial culture — refractory, severe, contact lens-related, HIV+, immunocompromised, suspected GC / chlamydia.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Gram stain + culture for GC suspected (severe hyperpurulent with eyelid swelling) — emergency.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Chlamydia testing (PCR) — chronic conjunctivitis, lymphoid follicles, treatment failure.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Distinguish etiology via discharge type + symptoms.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Contact lens wear — KERATITIS risk (Pseudomonas, fungal); urgent ophthalmology.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Newborn — different management; STI exposure consideration.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Sexual history if hyperpurulent / chronic — STI screening.", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("VIRAL — supportive: cool compresses, lubricant tears, hand hygiene + isolation; NO antibiotics; lasts 10-14 days.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("BACTERIAL — erythromycin ophthalmic ointment OR moxifloxacin ophthalmic drops TID-QID × 5-7 days per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CONTACT LENS-RELATED — fluoroquinolone for Pseudomonas coverage; STOP contacts during treatment; emergent ophthalmology if keratitis suspected.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ALLERGIC — antihistamine / mast cell stabilizer drops (olopatadine) + oral antihistamines (cetirizine); cool compresses; avoid allergen.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HYPERPURULENT (suspected GC) — emergent ophthalmology + IM ceftriaxone + treat partner + STI workup; CHLAMYDIAL — azithromycin / doxycycline systemic per primary source.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("NEONATAL — different organism profile (chlamydia, GC, HSV, S. aureus); systemic treatment; ophthalmia neonatorum prophylaxis at birth (erythromycin ointment).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HYGIENE — wash hands, separate towels, hot water laundry, replace contact lens case + makeup, no shared eye products.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("RETURN TO SCHOOL / WORK — bacterial: after 24 hrs of treatment + improvement; viral: until discharge clear; per local guidelines.", citationIDs: ["cdc_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("KERATITIS — contact lens-related; vision threatening; emergent ophthalmology + admission for IV abx if Pseudomonas.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CORNEAL ULCER — pain, vision loss, photophobia; emergent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HSV KERATITIS — branching dendritic ulcers on fluorescein stain; recurrent; emergent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ORBITAL CELLULITIS — periorbital swelling + pain + vision changes + fever + proptosis; emergent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("OPHTHALMIA NEONATORUM — chlamydia 5-14 days; gonococcus 24-48 hrs; HSV 5-14 days; HSV emergent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("SEVERE GIANT PAPILLARY CONJUNCTIVITIS — contact lens-related allergic; stop lenses, switch to daily disposable.", citationIDs: ["specialty_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum HordeolumChalazionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hordeolum-chalazion",
        title: "Hordeolum + chalazion (stye + chronic lid lesion)",
        subtitle: "Hordeolum acute tender · chalazion chronic firm painless · warm compresses · ophthalmology if persistent",
        nclexTags: ophthR22,
        definition: AttributedProse(
            "HORDEOLUM (stye) — acute Staph aureus infection of eyelid sebaceous (Zeis, Moll — external) or meibomian (internal) gland; tender, red, focal swelling. CHALAZION — chronic non-infectious granulomatous obstruction of meibomian gland; firm, non-tender, persistent. Common; usually self-limited per primary source.",
            citationIDs: ["specialty_dx_round22", "openrn_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "HORDEOLUM — bacterial infection of gland → acute inflammation. CHALAZION — meibomian gland obstruction → lipogranulomatous reaction (sterile). Underlying blepharitis predisposes.",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("HORDEOLUM — acute (24-48 hrs), tender, erythematous focal swelling at lid margin; may have pustule.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("CHALAZION — chronic (>weeks), firm, painless, NOT erythematous; may follow hordeolum; can cause induced astigmatism.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Eyelid edema variable; vision usually unaffected.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Red flags — vision change, severe pain, large diffuse swelling, fever → consider preseptal / orbital cellulitis.", citationIDs: ["specialty_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis by inspection.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Biopsy — RECURRENT or atypical chalazion may need biopsy to rule out sebaceous cell carcinoma (especially elderly, unusual location).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("If preseptal cellulitis suspected — CT orbits + emergent ophthalmology / ENT.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Distinguish hordeolum (acute, tender) from chalazion (chronic, painless).", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Rule out preseptal / orbital cellulitis if diffuse swelling + fever + vision concerns.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Recurrent or atypical — biopsy consideration.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Concurrent blepharitis — chronic management.", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("WARM COMPRESSES — 10-15 min 4×/day; gold standard first-line per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("LID HYGIENE — gentle cleansing with diluted baby shampoo or commercial wipes BID; reduces blepharitis.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("LID MASSAGE after warm compress — gentle expression of gland.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("TOPICAL ANTIBIOTIC — erythromycin ointment to lid margin if persistent + clearly infected hordeolum.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ORAL ANTIBIOTIC — doxycycline 100 mg PO BID × 7-10 days for severe / recurrent or rosacea-associated meibomitis.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("INCISION + DRAINAGE — refractory chalazion (>4 weeks) or large hordeolum with abscess; ophthalmology / dermatology.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("INTRALESIONAL STEROID injection — alternative for chalazion (off-label triamcinolone).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("AVOID squeezing — can worsen + cause cellulitis.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Ophthalmology referral — persistent >4-6 weeks, recurrent, large, atypical, vision-affecting, or in elderly (cancer eval).", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("PRESEPTAL CELLULITIS — diffuse lid swelling without orbital signs; oral abx (amox-clav).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ORBITAL CELLULITIS — proptosis, pain with EOM, vision changes, fever; emergent IV abx + admit + CT.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("SEBACEOUS CELL CARCINOMA — elderly with recurrent or atypical chalazion; biopsy needed; aggressive.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("RECURRENT — workup chronic blepharitis, rosacea, demodex; doxycycline + lid hygiene.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ASTIGMATISM from large chalazion — vision correction may change post-resolution.", citationIDs: ["specialty_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CornealAbrasionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "corneal-abrasion",
        title: "Corneal abrasion + foreign body",
        subtitle: "Pain + tearing + photophobia · fluorescein staining diagnostic · topical abx · NO patching · NO topical anesthetics home",
        nclexTags: ophthR22,
        definition: AttributedProse(
            "Superficial epithelial defect of cornea from trauma (fingernail, paper, contact lens, foreign body, plant matter). Severe pain (cornea richly innervated), photophobia, tearing. Fluorescein staining diagnostic. Usually heals within 24-72 hours per primary source.",
            citationIDs: ["specialty_dx_round22", "openrn_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Mechanical trauma → corneal epithelial defect → exposure of nerve endings → severe pain. Risk for infection (especially contact lens — Pseudomonas keratitis), recurrence (recurrent erosion syndrome), corneal scarring if deep.",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("Severe eye pain, foreign body sensation, photophobia, tearing, blepharospasm.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("History — recent trauma (fingernail, paper edge, branch), contact lens wear, foreign body.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Vision often blurred from tearing; should be normal once defect heals.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Red flag — penetrating injury (severe pain, vision loss, irregular pupil, leaking aqueous = Seidel sign) → emergent.", citationIDs: ["specialty_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("FLUORESCEIN STAINING + cobalt blue light — defects light up bright green; gold standard per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Slit lamp — for foreign body, depth assessment, evert upper lid for retained foreign body.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Visual acuity — document baseline; affected by tearing temporarily.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Seidel test — for suspected penetration; fluorescein dilutes with aqueous flow.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Mechanism of injury — high-velocity (metal grinding, hammering) → suspect intraocular FB → CT orbit.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Contact lens use — Pseudomonas keratitis risk; switch antibiotic + emergent ophthalmology.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Rule out penetrating injury / open globe — emergent ophthalmology + CT.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Retained foreign body — evert lid, examine carefully.", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("FOREIGN BODY REMOVAL — topical anesthetic (proparacaine) for procedure ONLY; cotton swab gentle sweep OR 27g needle for adherent; ophthalmology for embedded / metallic / deep / non-cooperative.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("TOPICAL ANTIBIOTIC — erythromycin ointment OR polymyxin / trimethoprim drops QID × 3-5 days per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CONTACT LENS-RELATED — fluoroquinolone (moxifloxacin / ofloxacin) for Pseudomonas coverage; STOP lenses; emergent ophthalmology consideration.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ORAL ANALGESIA — acetaminophen / ibuprofen; AVOID home topical anesthetics (delayed healing + corneal toxicity).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("AVOID PATCHING — evidence does NOT show benefit; possibly delays healing + increases infection risk per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CYCLOPLEGIC — for photophobia + ciliary spasm; cyclopentolate / homatropine; not routine.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("FOLLOW-UP at 24-48 hrs — most heal in 24-72 hrs; persistent / worsening → ophthalmology.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Counsel — return for vision change, increased pain, worsening, discharge.", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("PSEUDOMONAS KERATITIS — contact lens-related; corneal ulcer + hypopyon; vision threatening; emergent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("PENETRATING INJURY / open globe — irregular pupil, hyphema, vision loss; emergent surgical.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("RUST RING — metallic FB; ophthalmology for removal of remaining rust.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("RECURRENT EROSION SYNDROME — typical morning eye pain weeks-months post-injury; lubricant ointment QHS, possibly procedure (PTK).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("INFECTIOUS KERATITIS — corneal infiltrate / haze, worsening pain, vision changes; emergent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("INTRAOCULAR FOREIGN BODY — high-velocity mechanism; subtle entry wound; CT orbits + emergent.", citationIDs: ["specialty_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum DiabeticRetinopathySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "diabetic-retinopathy",
        title: "Diabetic retinopathy",
        subtitle: "Leading cause of vision loss working-age adults · annual screening · A1c + BP control · anti-VEGF + laser",
        nclexTags: ophthR22,
        definition: AttributedProse(
            "Microvascular complication of diabetes affecting retina — nonproliferative (NPDR) stages of microaneurysms, hemorrhages, exudates → proliferative (PDR) with neovascularization → vitreous hemorrhage, tractional retinal detachment, blindness. Leading cause of working-age vision loss in US per primary source.",
            citationIDs: ["openrn_dx_round22", "specialty_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Chronic hyperglycemia → microvascular damage → pericyte loss, basement membrane thickening, capillary occlusion → ischemia → VEGF release → neovascularization (PDR) + edema (DME). Risk factors — duration of diabetes (most important), poor glycemic control, HTN, dyslipidemia, pregnancy.",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("EARLY — asymptomatic; found on screening exam.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("ADVANCED — gradual blurred vision, floaters (vitreous hemorrhage), curtain across vision (retinal detachment), sudden severe vision loss.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Macular edema — central vision distortion, color change, metamorphopsia.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Fundus findings — microaneurysms (early), hemorrhages, exudates, cotton-wool spots, venous beading, neovascularization (PDR), fibrovascular tissue.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Staging — Mild / Moderate / Severe NPDR; PDR; Diabetic Macular Edema (DME) separate.", citationIDs: ["specialty_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DILATED FUNDUSCOPIC EXAM — gold standard; ophthalmology with indirect ophthalmoscopy.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("OCT — optical coherence tomography for macular edema assessment.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Fluorescein angiography — neovascularization + non-perfusion mapping.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Fundus photography — documentation + telemedicine screening.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("ALL DIABETICS — screening dilated eye exam.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Type 1 DM — initial exam 3-5 years after diagnosis (children < puberty per onset).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Type 2 DM — at DIAGNOSIS, then ANNUALLY (sooner intervals for advanced disease).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Pregnancy — every trimester + 1 year postpartum; can rapidly progress.", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("GLYCEMIC CONTROL — A1c <7% per ADA; DCCT shows reduces progression significantly per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("BP CONTROL — <130/80; UKPDS shows reduces progression; ACE inhibitor / ARB preferred.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("LIPID CONTROL — fenofibrate has evidence in mild-moderate NPDR (FIELD, ACCORD trials).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ANTI-VEGF INJECTIONS — bevacizumab, ranibizumab, aflibercept — for DME + PDR + advanced NPDR per primary source; intravitreal monthly initially.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("LASER PHOTOCOAGULATION — PRP (panretinal photocoagulation) for PDR; focal/grid laser for DME (anti-VEGF often preferred).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("VITRECTOMY — vitreous hemorrhage, tractional retinal detachment, refractory DME.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("INTRAVITREAL STEROIDS — dexamethasone implant (Ozurdex) or triamcinolone for DME refractory to anti-VEGF.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Patient education — annual exams critical; symptom reporting (floaters, vision changes).", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("VITREOUS HEMORRHAGE — sudden floaters / vision loss; emergent ophthalmology; vitrectomy if persistent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("TRACTIONAL RETINAL DETACHMENT — fibrovascular contraction; surgical urgency.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("NEOVASCULAR GLAUCOMA — iris neovascularization; intractable IOP rise; emergent management.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("RAPID PROGRESSION — pregnancy, rapid glucose control improvement, cataract surgery; close follow-up.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("OTHER OCULAR — cataracts (younger / earlier in DM), open-angle glaucoma (increased risk), ischemic optic neuropathy.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CARDIOVASCULAR risk — diabetic retinopathy is marker of systemic microvascular disease + cardiac risk; aggressive CV management.", citationIDs: ["specialty_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AMDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "amd",
        title: "Age-related macular degeneration (AMD)",
        subtitle: "Leading cause of vision loss in elderly · dry (geographic atrophy) vs wet (neovascular) · AREDS vitamins + anti-VEGF",
        nclexTags: ophthR22,
        definition: AttributedProse(
            "Progressive degenerative disease of macula — affects central vision (peripheral preserved). Two forms — DRY AMD (geographic atrophy, ~85%) progresses slowly; WET AMD (neovascular, ~15%) rapidly progressive with subretinal fluid + hemorrhage. Leading cause of vision loss in age >50 in developed countries per primary source.",
            citationIDs: ["openrn_dx_round22", "specialty_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Aging RPE → drusen (lipid + protein deposits) accumulation → photoreceptor dysfunction + cell death (dry). VEGF release → choroidal neovascularization → subretinal fluid + hemorrhage (wet). Risk factors — age (strongest), smoking, family history, white race, female, light iris color, CV disease, dietary.",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("CENTRAL vision loss + DISTORTION — METAMORPHOPSIA (straight lines appear wavy); peripheral vision preserved.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("DRY — gradual onset, scotoma in central vision; difficulty reading + face recognition.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("WET — sudden / progressive vision loss + metamorphopsia (lines wavy); emergent.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Amsler grid distortion or scotoma — patient home screening.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Fundus — drusen, RPE changes, geographic atrophy (dry); subretinal fluid, hemorrhage, neovascular membrane (wet).", citationIDs: ["specialty_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DILATED FUNDUSCOPIC EXAM — characteristic drusen + RPE changes.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("OCT — gold standard for fluid detection in wet AMD + monitoring.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("FLUORESCEIN ANGIOGRAPHY — identifies neovascular membrane; pre-treatment for wet.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("AMSLER GRID — home + clinic screening for distortion / scotoma; sensitive for progression.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Genetic testing — research; not routine.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Distinguish dry vs wet — different management urgency.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Risk factors — smoking (modifiable!), family history.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Bilateral vs unilateral disease (typically bilateral progression).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Quality of life — driving, reading, daily activities; OT / low-vision services.", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("DRY AMD — AREDS2 supplementation (vitamin C 500 mg, vitamin E 400 IU, lutein 10 mg, zeaxanthin 2 mg, zinc 80 mg, copper 2 mg) — reduces progression in intermediate AMD per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("WET AMD — INTRAVITREAL ANTI-VEGF (bevacizumab, ranibizumab, aflibercept, faricimab); monthly initially → tailored interval; restores vision in ~30%, stabilizes in most per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("SMOKING CESSATION — most important modifiable risk factor per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("DIET — Mediterranean diet, leafy greens, fish (omega-3); zinc-rich foods.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("BLOOD PRESSURE + CV risk control — vascular protection.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HOME AMSLER GRID — daily / weekly for early wet AMD detection.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("LOW VISION rehabilitation — magnifiers, large-print, voice-assistive technology, eccentric viewing training.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Photodynamic therapy (older treatment) — replaced largely by anti-VEGF.", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("SUDDEN VISION CHANGE / metamorphopsia — wet AMD requires emergent anti-VEGF; delay = vision loss.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("BILATERAL PROGRESSION — second eye involved in 5-15% per year; close monitoring.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("INTRAVITREAL INJECTION COMPLICATIONS — endophthalmitis (rare), retinal detachment, cataract progression; counsel.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("DEPRESSION + SOCIAL ISOLATION — vision loss; mental health screening + counseling.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("FALLS RISK from central vision loss — home safety, mobility aids.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("DRIVING SAFETY — DMV reporting; rehabilitation specialist.", citationIDs: ["specialty_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AcneVulgarisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acne-vulgaris",
        title: "Acne vulgaris",
        subtitle: "Comedonal + inflammatory · 4 pathogenic factors · topical retinoid + BP base · oral abx + isotretinoin for severe",
        nclexTags: dermR22,
        definition: AttributedProse(
            "Chronic inflammatory disease of pilosebaceous unit characterized by comedones (whiteheads / blackheads), papules, pustules, nodules, cysts. Affects 85% of adolescents + ~50% of adults at some point. AAD treatment guidelines per primary source.",
            citationIDs: ["specialty_dx_round22", "openrn_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Four contributing factors — follicular hyperkeratinization (comedo formation), increased sebum production (androgens), Cutibacterium acnes colonization, inflammation. Hormones (androgens including PCOS), genetics, stress, certain meds (steroids, lithium), dairy / high-glycemic diet contribute.",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("COMEDONAL — open (blackheads) + closed (whiteheads) comedones; mostly forehead, T-zone.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("INFLAMMATORY — erythematous papules + pustules.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("NODULOCYSTIC — deep nodules + cysts; scarring; severe.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Distribution — face, chest, back, shoulders.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Severity — mild (comedonal only / few papules), moderate (multiple), severe (nodulocystic).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("PCOS clues — irregular menses, hirsutism, weight gain, insulin resistance; workup if suspicion.", citationIDs: ["specialty_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis by inspection + grading severity.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Workup PCOS — total + free testosterone, DHEA-S, prolactin, LH/FSH, lipid panel, glucose tolerance — if hirsutism / oligomenorrhea / weight gain.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Rule out — rosacea (no comedones, telangiectasias, flushing), perioral dermatitis, folliculitis, drug-induced acne (steroids, lithium, EGFR inhibitors).", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity classification — guides therapy.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Psychosocial impact — major in adolescents; depression / suicidality screening per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Hormonal contributors — PCOS in women, androgen excess.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Medication history — drug-induced.", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("MILD — topical retinoid (tretinoin / adapalene) + benzoyl peroxide ± topical antibiotic (clindamycin) per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("MODERATE — add oral antibiotic (doxycycline 100 mg PO BID OR minocycline 50-100 mg PO BID) × 3-6 months ALWAYS combined with topical retinoid + BP to prevent resistance.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("SEVERE / NODULOCYSTIC / refractory — isotretinoin (Accutane); REMS program; teratogen; cumulative 120-150 mg/kg dose.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HORMONAL acne (women) — combined OCP (with estrogen) + spironolactone 50-100 mg PO BID effective.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ADJUNCTS — chemical peels, light therapy, intralesional steroids for cysts.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("DIET — limited evidence for milk + high-glycemic foods; individualized.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("SKIN CARE — gentle non-comedogenic cleansers, sunscreen, avoid harsh scrubbing.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("PSYCHOLOGICAL support — depression / anxiety / suicidality screening; isotretinoin REMS includes mental health assessment.", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("SCARRING — early aggressive treatment of inflammatory acne; intralesional steroids for cysts; lasers / fillers for scarring.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("POST-INFLAMMATORY HYPERPIGMENTATION (darker skin types) — sunscreen + retinoid + hydroquinone / azelaic acid.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ISOTRETINOIN — REMS + iPLEDGE (US) for teratogen prevention; mood / depression screening; LFTs + lipids monthly.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("PCOS in women — workup if hirsutism / oligomenorrhea; metabolic risks.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ANTIBIOTIC RESISTANCE — limit oral abx 3-6 months; always combine with topical retinoid + BP.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ACNE FULMINANS — rare severe form with fever + systemic symptoms; oral prednisone + isotretinoin under specialty.", citationIDs: ["specialty_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum TineaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tinea",
        title: "Tinea (cutaneous dermatophyte infection)",
        subtitle: "Corporis / cruris / pedis / capitis / unguium · KOH prep · topical for skin · oral for nails + scalp",
        nclexTags: infR22,
        definition: AttributedProse(
            "Superficial fungal infection of skin / hair / nails caused by dermatophytes (Trichophyton, Microsporum, Epidermophyton). Named by anatomic location — corporis (body), cruris (groin), pedis (foot), capitis (scalp), unguium (nail), barbae (beard), faciei (face). AAD guidelines per primary source.",
            citationIDs: ["specialty_dx_round22", "openrn_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Dermatophytes invade superficial keratinized tissue → keratinase enzyme → inflammation. Spread by direct contact (human, animal, soil), shared items (towels, clothing), warm moist environments (gyms, locker rooms).",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("CORPORIS (ringworm) — round / annular plaque with raised scaly border + central clearing; pruritic.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("CRURIS (jock itch) — groin / inner thighs; sparing of scrotum; pruritic.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("PEDIS (athlete's foot) — interdigital maceration / scaling, moccasin distribution, or vesicobullous; pruritic.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("CAPITIS (scalp ringworm) — patches of hair loss with black dot stubble or scaly patches; cervical LAD; KERION (boggy abscess); CHILDREN predominantly.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("UNGUIUM / onychomycosis — thickened, discolored, dystrophic nails; toenails > fingernails.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("VERSICOLOR (Malassezia, not true dermatophyte) — hypo-/hyperpigmented round patches on trunk; mild itch.", citationIDs: ["specialty_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("KOH PREP — scrape scale, add KOH, microscopy shows septate hyphae per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("FUNGAL CULTURE — gold standard but slow (4 weeks); for refractory / atypical.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("WOOD'S LAMP — some Microsporum fluoresce green-yellow; less commonly used today.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("DERMOSCOPY — hair shafts in tinea capitis show characteristic patterns.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Location guides treatment (topical vs oral).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Risk factors — diabetes, immunocompromise, athletes, animal contact.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Spread to household — treat all contacts in tinea capitis.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Differentiate — psoriasis, nummular eczema, pityriasis rosea, intertrigo (candidal vs tinea).", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("CUTANEOUS (corporis, cruris, pedis) — topical antifungal BID × 2-4 weeks; clotrimazole / terbinafine / ketoconazole; continue 1-2 weeks after symptom resolution per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("TINEA CAPITIS — ORAL terbinafine 6 mg/kg/day × 4-6 weeks (children >4) OR griseofulvin 20-25 mg/kg/day × 6-8 weeks (older standard); topical inadequate.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ONYCHOMYCOSIS — ORAL terbinafine 250 mg/day × 6 weeks (fingernails) / 12 weeks (toenails) per primary source; LFTs baseline + 6 weeks.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("SEVERE / REFRACTORY cutaneous — oral terbinafine 250 mg/day × 2-4 weeks.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("VERSICOLOR — selenium sulfide 2.5% shampoo OR topical ketoconazole 2% × 2 weeks; oral itraconazole / fluconazole for refractory.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("PEDIATRIC kerion — oral antifungal + sometimes brief oral steroid for severe inflammation.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HYGIENE — keep affected area DRY, change socks daily (pedis), separate towels, treat shoes, treat fomites.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("AVOID Lotrisone (clotrimazole + betamethasone) for tinea — steroid worsens long-term despite initial symptom relief.", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("REFRACTORY — KOH negative or atypical; consider other diagnoses or fungal culture.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("SECONDARY BACTERIAL INFECTION (especially pedis with maceration) — abx if cellulitis develops.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("TINEA INCOGNITO — modified appearance from topical steroids; abx not effective; switch agent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("MAJOCCHI GRANULOMA — deep folliculitis from tinea; requires ORAL antifungal.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("KERION — boggy inflammatory plaque (capitis); scarring + permanent alopecia risk if untreated.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ID REACTION — autoeczematization (vesicular eruption distant from infection); resolves with treating tinea.", citationIDs: ["specialty_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ScabiesSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "scabies",
        title: "Scabies",
        subtitle: "Sarcoptes scabiei mite · severe nocturnal itch · burrows · permethrin neck-down · treat household",
        nclexTags: infR22,
        definition: AttributedProse(
            "Skin infestation by Sarcoptes scabiei mite — female burrows into stratum corneum, lays eggs → severe pruritic eruption (worse at night) + characteristic burrows + papules. Highly contagious by direct skin-to-skin contact OR fomite (less efficient). CDC + AAD guidance per primary source.",
            citationIDs: ["cdc_dx_round22", "specialty_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Sarcoptes scabiei (human-specific) → female mite burrows into stratum corneum, deposits eggs → larvae hatch + migrate → hypersensitivity reaction to mite proteins + feces causes intense pruritus (4-6 weeks after first infestation; faster on re-infestation).",
            citationIDs: ["cdc_dx_round22"]
        ),
        presentation: [
            AttributedBullet("SEVERE PRURITUS — worse at night; the cardinal symptom.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("DISTRIBUTION — finger webs, wrists, elbows, axillae, waist, belt line, areolae, genitalia, buttocks; usually SPARES face + scalp in adults (involves them in infants).", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("BURROWS — thin gray-white wavy lines (1-10 mm); pathognomonic but often subtle; finger webs + wrists.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Papules, pustules, vesicles, excoriations; secondary bacterial infection common.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("INFANTS — vesicles on palms + soles; widespread including face + scalp.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("CRUSTED (Norwegian) SCABIES — immunocompromised + elderly; hyperkeratotic crusts + millions of mites; severely contagious; less itchy paradoxically.", citationIDs: ["cdc_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis based on intense itch + characteristic distribution + burrows.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("SKIN SCRAPING (mineral oil mount) — view mite, eggs, scybala under microscopy; gold standard.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("INK / FELT TIP test — ink seeps into burrow; identifies for scraping.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("DERMOSCOPY — \"hang glider\" sign (mite head + body); skilled examiner.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Negative scraping does NOT rule out — typical patient has only 10-15 mites; treat empirically.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Distribution + symptom history + close contacts.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("Immunocompromised status — crusted scabies risk.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("Outbreak setting — nursing home, school, daycare; mandatory reporting in some states.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("Secondary bacterial infection (impetiginization).", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("PERMETHRIN 5% CREAM — first-line; apply NECK-DOWN, leave 8-14 hrs, repeat in 7 days per primary source.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("IVERMECTIN ORAL — 200 mcg/kg PO × 2 doses (day 1 + day 14); alternative when topical impractical or refractory per primary source.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("TREAT ALL HOUSEHOLD + SEXUAL CONTACTS simultaneously even if asymptomatic.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("CRUSTED (Norwegian) — combination permethrin + ivermectin; multiple ivermectin doses (day 1, 2, 8, 9, 15 — sometimes more); isolation precautions; environmental treatment.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("ENVIRONMENTAL — wash all clothing + bedding HOT WATER + dry HIGH heat; non-washable items sealed in bag × 72 hours.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("ITCH MANAGEMENT — antihistamines (cetirizine, hydroxyzine), low-potency topical steroid for residual inflammation; itch persists 2-4 weeks despite successful treatment.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("Secondary bacterial infection — topical / oral antibiotics for impetiginized skin (cephalexin / amoxicillin-clavulanate).", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("INFANTS — permethrin 5% safe ≥2 months; apply including face + scalp.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("Pregnancy — permethrin Category B; ivermectin Category C; permethrin preferred.", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("POST-SCABIETIC ITCH — 2-4 weeks after successful treatment; antihistamines + topical steroid; NOT treatment failure.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("REINFESTATION — common without contact treatment + environmental measures; re-treat + counsel.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("CRUSTED (Norwegian) SCABIES — highly contagious; airborne / fomite transmission; institutional outbreaks; epidemiologic emergency.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("SECONDARY BACTERIAL INFECTION → IMPETIGO → POST-STREP GLOMERULONEPHRITIS in children.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("OUTBREAK in institutional setting (nursing home, prison) — public health notification + mass treatment of facility.", citationIDs: ["cdc_dx_round22"]),
            AttributedBullet("PSYCHOSOCIAL — stigma + isolation; counsel.", citationIDs: ["openrn_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ImpetigoSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "impetigo",
        title: "Impetigo",
        subtitle: "Strep + Staph · honey-crusted erosions · topical mupirocin for limited · oral abx for widespread · post-strep GN risk",
        nclexTags: infR22,
        definition: AttributedProse(
            "Common superficial bacterial skin infection caused by S. pyogenes (group A strep) + S. aureus. Two forms — NON-BULLOUS (most common, ~70%) — honey-colored crusted erosions; BULLOUS — flaccid bullae from S. aureus exfoliative toxin. Highly contagious; pediatric predominant per primary source.",
            citationIDs: ["specialty_dx_round22", "openrn_dx_round22"]
        ),
        pathophysiology: AttributedProse(
            "Skin trauma (insect bites, eczema, scratches) → bacterial inoculation → superficial epidermal infection. Strep + Staph predominate; bullous form from S. aureus exfoliative toxin A/B causing intraepidermal cleavage.",
            citationIDs: ["openrn_dx_round22"]
        ),
        presentation: [
            AttributedBullet("NON-BULLOUS — small vesicles / pustules rupture → HONEY-COLORED CRUSTS on erythematous base; face (around mouth + nose), extremities; spread by autoinoculation.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("BULLOUS — flaccid bullae with clear / yellow fluid; rupture leaves shiny erosion + collarette of scale; less commonly + can be elsewhere.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("ECTHYMA — deeper variant with ulceration + thick crust; usually lower legs; heals with scarring.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Mild systemic symptoms in extensive; regional LAD.", citationIDs: ["openrn_dx_round22"]),
            AttributedBullet("Children 2-5 years most affected; outbreaks in daycare / sports teams.", citationIDs: ["openrn_dx_round22"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis based on characteristic appearance.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Gram stain + culture — for atypical, recurrent, refractory, immunocompromised, suspected MRSA.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("MRSA suspected — culture + susceptibility guides therapy.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Differentiate from HSV (vesicles in clusters, recurrent same site), insect bites, contact dermatitis.", citationIDs: ["specialty_dx_round22"])
        ],
        priorityAssessments: [
            AttributedBullet("Extent (limited vs widespread) — guides topical vs systemic.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("MRSA risk factors — recent abx, household contact, daycare outbreak.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Underlying skin condition — eczema, scabies, trauma; treat concurrently.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("Outbreak setting — school / daycare contact tracing.", citationIDs: ["specialty_dx_round22"])
        ],
        commonInterventions: [
            AttributedBullet("LIMITED disease — TOPICAL MUPIROCIN 2% ointment / cream TID × 5 days per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("EXTENSIVE / bullous / unsuccessful topical — ORAL CEPHALEXIN 25-50 mg/kg/day in divided doses × 7 days OR dicloxacillin OR amoxicillin-clavulanate.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("PCN ALLERGY — clindamycin OR azithromycin.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("MRSA SUSPECTED — TMP-SMX OR doxycycline (>8 years) OR clindamycin per primary source.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("RETAPAMULIN 1% ointment — alternative topical for non-MRSA when mupirocin resistance.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("HYGIENE — wash hands frequently, separate towels, soft cloth + soapy water to remove crusts before topical, keep nails short, no shared items, contagious until 24 hrs after starting treatment.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("RETURN TO SCHOOL / DAYCARE — 24 hrs after starting effective antibiotic.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("FOLLOW-UP — assess at 7 days; persistent lesions = re-evaluation + culture; treat household contacts if outbreak.", citationIDs: ["specialty_dx_round22"])
        ],
        watchFor: [
            AttributedBullet("POST-STREP GLOMERULONEPHRITIS — 1-3 weeks after GAS impetigo; hematuria, edema, HTN; treatment of impetigo doesn't prevent (unlike pharyngitis); monitor.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("MRSA SPREAD — household / institutional outbreaks; decolonization (mupirocin nasal + chlorhexidine wash) in recurrent.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("STAPHYLOCOCCAL SCALDED SKIN SYNDROME — severe bullous form in young children; sloughing widespread; hospital admission + IV abx.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("ECTHYMA — deeper infection; scarring + slower healing.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("CELLULITIS / abscess complications.", citationIDs: ["specialty_dx_round22"]),
            AttributedBullet("MUPIROCIN RESISTANCE — increasing; alternative topicals or systemic.", citationIDs: ["specialty_dx_round22"])
        ],
        citations: [openrnDxR22, cdcDxR22, specialtyDxR22],
        lastSourceFidelityReview: "2026-05-12"
    )
}
