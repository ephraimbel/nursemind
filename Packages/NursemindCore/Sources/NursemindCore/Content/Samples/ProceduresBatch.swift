import Foundation

// Curator-model procedure entries.
// Sources: OpenStax Clinical Nursing Skills (CC BY 4.0 with AI display restriction —
// content is displayed in the Library with attribution; AI corpus use of OpenStax is pending
// permission per CONTENT_SOURCING.md §2.6), Open RN Nursing Skills (CC BY 4.0), CDC HICPAC
// (public domain), INS Standards (concept citation only).

// MARK: - Shared citation sources

private let openstaxClinicalSkills = CitationSource(
    id: "openstax_clinical_skills_book",
    shortName: "OpenStax Clinical Nursing Skills",
    detail: "OpenStax · Rice University",
    publisher: "OpenStax",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)

private let openrnSkills = CitationSource(
    id: "openrn_skills_book",
    shortName: "Open RN Nursing Skills",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=iv+procedure+catheter+ostomy",
    lastRetrieved: "2026-05-04"
)

private let cdcCLABSIRef = CitationSource(
    id: "cdc_clabsi_ref",
    shortName: "CDC Guidelines for Prevention of Intravascular Catheter-Related Infections",
    detail: "O'Grady NP et al. — HICPAC",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/intravascular-catheter-related-infection/",
    lastRetrieved: "2026-05-04"
)

private let cdcHandHygieneRef = CitationSource(
    id: "cdc_hand_hygiene_ref",
    shortName: "CDC Hand Hygiene in Healthcare Settings",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/clean-hands/hcp/clinical-safety/",
    lastRetrieved: "2026-05-04"
)

private let infectionRiskTags = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .infection
)

private let pharmTags = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .pharmacologicalAndParenteralTherapies,
    priorityConcept: .safety
)

// MARK: - Tracheostomy Care

public enum TracheostomyCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "tracheostomy-care",
        title: "Tracheostomy care",
        subtitle: "Cleaning, inner cannula, and dressing change",
        nclexTags: infectionRiskTags,
        indications: AttributedProse(
            "Tracheostomy care is performed to maintain airway patency, prevent infection, and assess the stoma. Frequency is typically every shift and as needed for soiling or secretions, per facility policy. New tracheostomies (less than 7 days) require especially careful handling because the tract is not yet established.",
            citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]
        ),
        contraindications: AttributedProse(
            "There are no absolute contraindications to routine care, but a freshly placed (less than 7 days) tracheostomy should never be decannulated by the bedside nurse and tube changes during this period are physician-only because of the risk of losing the airway.",
            citationIDs: ["openrn_skills_book"]
        ),
        equipment: [
            AttributedBullet("Sterile tracheostomy care kit (sterile gloves, drape, basin, brushes, gauze, cotton-tipped swabs, twill ties or tracheostomy holder).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Sterile normal saline; hydrogen peroxide only if facility protocol allows (caution — can be cytotoxic and impair healing).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Suction equipment ready and tested at bedside (rigid Yankauer and sterile suction catheters).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Spare tracheostomy tube of the same size and one size smaller at the bedside.", citationIDs: ["openrn_skills_book"]),
            AttributedBullet("Bag-valve mask attached to oxygen.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Personal protective equipment — gloves, gown, mask with eye protection.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders and identify patient using two identifiers.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Explain procedure; offer reassurance — patients are often anxious about airway manipulation.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Position patient semi-Fowler's or high Fowler's; provide oxygen as needed.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hand hygiene; don PPE.", citationIDs: ["cdc_hand_hygiene_ref"]),
            AttributedBullet("Suction the tracheostomy first if secretions are present (separate procedure with separate sterile setup).", citationIDs: ["openstax_clinical_skills_book"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Set up sterile field", body: "Open the tracheostomy care kit on a clean overbed table to create a sterile field. Pour sterile saline (and peroxide if used per protocol) into the basin compartments.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 2, title: "Don sterile gloves and remove inner cannula", body: "Don sterile gloves. With non-dominant hand stabilize the outer cannula faceplate. With dominant hand, unlock and remove the inner cannula and place it in the basin to soak.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 3, title: "Clean inner cannula", body: "Use the small brush to clean the inside and outside of the inner cannula. Rinse in sterile saline. If a disposable inner cannula is used, replace rather than clean.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 4, title: "Reinsert inner cannula", body: "Reinsert the cleaned inner cannula into the outer cannula and lock it into place. Confirm secure attachment.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 5, title: "Clean stoma", body: "Use saline-moistened cotton-tipped swabs and gauze to clean around the stoma in a circular motion, working from the stoma outward. Use a fresh swab for each pass to avoid recontaminating the stoma. Dry the area.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 6, title: "Replace dressing and ties", body: "Apply a clean, pre-cut tracheostomy dressing under the faceplate (do NOT cut your own gauze — fibers can be aspirated). Change ties with a second person holding the tube in place. Tie should be snug enough to admit one finger between the tie and the patient's neck.", citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"])
        ],
        postProcedure: [
            AttributedBullet("Reassess respiratory status — rate, work of breathing, SpO2, lung sounds, secretions.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Ensure call bell is within reach and communication method (writing board, picture board) is available since the patient cannot speak above the cuff.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Maintain humidified oxygen as ordered to prevent mucus plugging.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        documentation: [
            AttributedBullet("Date, time, type of care performed, condition of stoma and surrounding skin.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Character and amount of secretions.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Patient tolerance and respiratory status.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        watchFor: [
            AttributedBullet("Accidental decannulation — call for help, attempt to reinsert if mature stoma; bag-mask ventilate over the stoma if unable; never attempt to reinsert an immature (<7 day) tracheostomy without provider — risk of false tract.", citationIDs: ["openrn_skills_book"]),
            AttributedBullet("Mucus plugging — sudden respiratory distress; suction immediately; if not relieved, consider tube obstruction and call for help.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Bleeding — mild oozing is expected post-op; brisk or pulsatile bleeding is an emergency (potential tracheoinnominate fistula).", citationIDs: ["openrn_skills_book"]),
            AttributedBullet("Stoma infection — purulent drainage, erythema, fever; obtain culture per protocol.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        citations: [openstaxClinicalSkills, openrnSkills, cdcHandHygieneRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Wound Dressing Change

public enum WoundDressingChangeSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "wound-dressing-change",
        title: "Wound dressing change",
        subtitle: "Sterile technique for acute or surgical wound",
        nclexTags: infectionRiskTags,
        indications: AttributedProse(
            "Dressing change is performed to assess the wound, remove drainage and debris, protect the site from contamination, and apply a fresh sterile dressing. Frequency depends on the type of dressing, amount of drainage, and provider order — typically every 1–3 days for clean surgical wounds, more often for heavily draining or infected wounds.",
            citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]
        ),
        equipment: [
            AttributedBullet("Sterile dressing supplies appropriate to the order (gauze, transparent film, foam, hydrocolloid, alginate).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Sterile gloves and clean gloves.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Sterile normal saline or wound cleanser as ordered.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Sterile drape, sterile field setup.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Tape or securement device.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Biohazard bag for soiled dressing.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Personal protective equipment.", citationIDs: ["cdc_hand_hygiene_ref"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders, including type of dressing and any specific cleansing solution.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Identify patient using two identifiers; explain procedure.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Premedicate for pain 30 minutes before if anticipated discomfort.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Position the patient to expose the wound and protect privacy.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hand hygiene; don clean gloves and PPE.", citationIDs: ["cdc_hand_hygiene_ref"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Remove old dressing", body: "Don clean gloves. Loosen the tape toward the wound. Remove the dressing carefully — moisten with saline if it is adherent. Inspect the dressing for type, amount, color, and odor of drainage. Discard the dressing into the biohazard bag.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 2, title: "Remove gloves and perform hand hygiene", body: "Remove and dispose of clean gloves. Perform hand hygiene.", citationIDs: ["cdc_hand_hygiene_ref"]),
            ProcedureStep(number: 3, title: "Set up sterile field", body: "Open the sterile dressing supplies onto a sterile field on a clean overbed table. Pour cleansing solution into the sterile basin if needed.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 4, title: "Don sterile gloves", body: "Don sterile gloves using sterile technique.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 5, title: "Assess and cleanse the wound", body: "Inspect the wound for size, depth, color, exudate, surrounding skin, and signs of infection. Cleanse from the cleanest area outward — wipe once and discard each gauze. Pat dry with sterile gauze.", citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]),
            ProcedureStep(number: 6, title: "Apply new dressing", body: "Apply the dressing per the order — primary dressing in contact with the wound, secondary dressing for absorption and protection. Avoid touching anything outside the sterile field.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 7, title: "Secure and label", body: "Secure the dressing with tape or securement device. Label with the date, time, and your initials.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        postProcedure: [
            AttributedBullet("Position patient comfortably; ensure call bell is within reach.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Dispose of all soiled materials into the biohazard bag; remove PPE; perform hand hygiene.", citationIDs: ["cdc_hand_hygiene_ref"])
        ],
        documentation: [
            AttributedBullet("Wound location, size (length × width × depth in cm), stage if pressure injury.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Wound bed appearance — granulation, slough, eschar, epithelialization.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Drainage — type (serous, sanguineous, serosanguineous, purulent), amount, odor.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Surrounding skin — intact, erythematous, macerated, broken.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Type of dressing applied; patient tolerance and pain level.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        watchFor: [
            AttributedBullet("Signs of infection — increased pain, erythema, warmth, swelling, purulent drainage, foul odor, fever.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Dehiscence — separation of wound edges; emergency for surgical wounds.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Evisceration — protrusion of internal organs through dehisced wound; cover with saline-moistened sterile gauze, position supine with knees flexed, NPO, call provider immediately.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Excessive bleeding — apply pressure, elevate if extremity, notify provider.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        citations: [openstaxClinicalSkills, openrnSkills, cdcHandHygieneRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Subcutaneous Injection

public enum SubcutaneousInjectionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "subcutaneous-injection",
        title: "Subcutaneous injection",
        subtitle: "Insulin · heparin · enoxaparin · vaccines",
        nclexTags: pharmTags,
        indications: AttributedProse(
            "Subcutaneous injection is used for medications that require slow, sustained absorption — insulin, heparin, enoxaparin, certain vaccines, growth hormone. The subcutaneous tissue is well perfused with capillaries but contains less vasculature than muscle, slowing absorption. Volume is typically limited to 1 mL; larger volumes risk tissue damage and unreliable absorption.",
            citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]
        ),
        equipment: [
            AttributedBullet("Syringe — typically 1 mL with 25–31 gauge needle, 3/8 to 5/8 inch length.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Medication ampule, vial, or prefilled syringe.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Alcohol swabs.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Gloves; sharps container at point of use.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        preProcedure: [
            AttributedBullet("Verify the seven rights of medication administration: right patient, drug, dose, route, time, reason, documentation.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Check medication three times against the MAR — when retrieved, when prepared, at the bedside.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Identify patient using two identifiers; check allergies.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hand hygiene; don gloves.", citationIDs: ["cdc_hand_hygiene_ref"]),
            AttributedBullet("Select site — abdomen (away from umbilicus by at least 2 inches), upper outer arm, anterior or lateral thigh, upper buttocks. Rotate sites for repeated administration.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Prepare medication", body: "Draw up medication using sterile technique. Confirm dose and air bubble removal. For prefilled enoxaparin, do NOT expel the air bubble — it follows the medication and clears the needle.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 2, title: "Cleanse site", body: "Cleanse the selected site with an alcohol swab using a circular motion from inside outward. Allow to air dry completely (alcohol stings on injection if not dry, and reduces medication efficacy for some agents).", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 3, title: "Pinch tissue (most sites)", body: "Pinch a fold of subcutaneous tissue between thumb and forefinger of the non-dominant hand to elevate it from underlying muscle.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 4, title: "Insert needle", body: "Insert the needle at a 45° or 90° angle depending on patient body habitus and needle length — 90° for short needles or larger patients, 45° for thin patients with longer needles.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 5, title: "Inject medication", body: "Release the pinch (or maintain per medication-specific guidance — heparin and enoxaparin have specific instructions). Inject the medication slowly. Aspiration is NOT recommended for routine subcutaneous injections.", citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]),
            ProcedureStep(number: 6, title: "Withdraw and dispose", body: "Withdraw the needle at the same angle. Activate the safety device immediately and dispose into the sharps container. Apply gentle pressure with gauze; do NOT massage heparin or enoxaparin sites — increases risk of bruising.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        postProcedure: [
            AttributedBullet("Observe site for bleeding or hematoma.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Remove gloves; perform hand hygiene.", citationIDs: ["cdc_hand_hygiene_ref"]),
            AttributedBullet("Document medication, dose, route, site, time, and patient response.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        documentation: [
            AttributedBullet("Medication, dose, route, site of administration, time given.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Patient response and any local reaction.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("For insulin — blood glucose at administration time and any sliding-scale rationale.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        watchFor: [
            AttributedBullet("Lipodystrophy from repeated injection at the same site — rotate sites systematically.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hypoglycemia after insulin — assess for symptoms (diaphoresis, tremor, confusion); BG check per protocol.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Bleeding or hematoma at heparin/enoxaparin sites — abdomen with at least 2 inches from umbilicus reduces this risk.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Inadvertent intramuscular administration of insulin — alters absorption rate, can cause hypoglycemia. Use appropriate needle length for patient body habitus.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        citations: [openstaxClinicalSkills, openrnSkills, cdcHandHygieneRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - IM Injection (Z-track)

public enum IMInjectionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "im-injection",
        title: "Intramuscular injection",
        subtitle: "Z-track technique · ventrogluteal · deltoid · vastus lateralis",
        nclexTags: pharmTags,
        indications: AttributedProse(
            "Intramuscular (IM) injection delivers medication into a muscle for faster absorption than subcutaneous and to accommodate larger volumes (typically up to 3 mL in the ventrogluteal site for adults). Used for many vaccines, certain antibiotics, hormonal medications, vitamin B12, and irritating medications that should not contact subcutaneous tissue. The Z-track technique displaces the skin laterally to seal medication within the muscle and prevent leak-back.",
            citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]
        ),
        contraindications: AttributedProse(
            "Avoid sites with infection, broken skin, scarring, paralysis, or compromised circulation. Avoid the dorsogluteal site in adults and children due to proximity of the sciatic nerve and superior gluteal artery — ventrogluteal is preferred.",
            citationIDs: ["openstax_clinical_skills_book"]
        ),
        equipment: [
            AttributedBullet("Syringe (1–3 mL) with 21–25 gauge needle, 1–1.5 inch length depending on site and patient body habitus.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Medication.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Alcohol swabs.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Gloves; sharps container.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        preProcedure: [
            AttributedBullet("Verify seven rights of medication administration; check three times against MAR.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Identify patient using two identifiers; assess for allergies.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hand hygiene; don gloves.", citationIDs: ["cdc_hand_hygiene_ref"]),
            AttributedBullet("Select site — ventrogluteal (preferred adult site, large volumes, irritating medications), deltoid (vaccines, ≤1 mL), vastus lateralis (infants, alternative for self-administration).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Rotate sites for repeated administration.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Locate the site", body: "Ventrogluteal: place the heel of your hand on the greater trochanter of the patient's hip with thumb pointing toward umbilicus, index finger on anterior superior iliac spine, middle finger spread to form a V — inject in the center of the V. Deltoid: 2–3 finger-widths below the acromion. Vastus lateralis: middle third of the lateral thigh.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 2, title: "Cleanse and dry", body: "Cleanse with alcohol swab in a circular motion from center outward. Allow to air dry completely.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 3, title: "Apply Z-track", body: "With non-dominant hand, pull the skin and subcutaneous tissue 1–1.5 inches laterally and hold throughout the injection.", citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]),
            ProcedureStep(number: 4, title: "Insert needle", body: "Insert the needle at 90° in one swift motion using a dart-like grip.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 5, title: "Inject slowly", body: "Inject the medication slowly (approximately 10 seconds per mL). Aspiration before injection is no longer recommended for vaccines or most IM injections per CDC, but check facility protocol for specific medications (some institutions still aspirate for medications other than vaccines).", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 6, title: "Wait and withdraw", body: "Wait 10 seconds before withdrawing the needle to allow medication to disperse. Withdraw at the same angle and only then release the lateral skin traction — this seals the medication in the muscle (Z-track).", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 7, title: "Activate safety and dispose", body: "Activate the safety device on the needle immediately and dispose in the sharps container. Apply gentle pressure with gauze — do NOT massage the site (defeats Z-track and can cause irritation).", citationIDs: ["openstax_clinical_skills_book"])
        ],
        postProcedure: [
            AttributedBullet("Observe site for bleeding, hematoma, or immediate reaction.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Monitor patient for delayed hypersensitivity for 15–30 minutes after vaccines.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Remove gloves; hand hygiene.", citationIDs: ["cdc_hand_hygiene_ref"])
        ],
        documentation: [
            AttributedBullet("Medication, dose, route, site (specify which muscle and side), time.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Patient tolerance, any reaction.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("VIS edition date and lot number for vaccines.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        watchFor: [
            AttributedBullet("Anaphylaxis — particularly with vaccines and antibiotics. Have epinephrine available.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Sciatic nerve injury — only with dorsogluteal site (which is why ventrogluteal is preferred). Symptoms: persistent pain or weakness in the buttock or leg.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hematoma or abscess at the site — particularly with anticoagulated patients or contaminated technique.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Inadvertent IV injection — aspirate per facility protocol if the medication is one for which aspiration is still recommended.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        citations: [openstaxClinicalSkills, openrnSkills, cdcHandHygieneRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Capillary Blood Glucose

public enum CapillaryBloodGlucoseSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "capillary-blood-glucose",
        title: "Capillary blood glucose",
        subtitle: "Fingerstick BG with point-of-care meter",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .glucoseRegulation
        ),
        indications: AttributedProse(
            "Capillary blood glucose is performed to monitor blood sugar in patients with diabetes, hyperglycemic or hypoglycemic episodes, on insulin therapy, on continuous tube feeds, on TPN, on corticosteroids, or for whom serial glucose monitoring is otherwise indicated. Frequency varies from once daily fasting to every hour during insulin drips per protocol.",
            citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]
        ),
        equipment: [
            AttributedBullet("Glucose meter (calibrated and quality-controlled per facility policy).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Test strips (verify expiration and lot match if applicable).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Lancet (single-use, retractable safety lancet).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Alcohol swabs and gauze.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Gloves and sharps container.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        preProcedure: [
            AttributedBullet("Verify the order and reason for the BG check; check for time-sensitive context (pre-meal, post-meal, pre-insulin).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Identify patient using two identifiers.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hand hygiene; don gloves.", citationIDs: ["cdc_hand_hygiene_ref"]),
            AttributedBullet("Have patient wash hands with soap and water if able — alcohol residue can falsely alter results.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Select a site — lateral aspect of the fingertip is preferred (less painful than the pad). Rotate fingers; avoid the thumb and index fingers in patients who use them frequently.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Prepare meter and strip", body: "Insert a test strip into the meter; the meter will turn on. Verify the code matches if your meter requires coding.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 2, title: "Cleanse the site", body: "Cleanse the lateral fingertip with an alcohol swab. Allow to air dry completely. Inadequate drying can falsely lower the result.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 3, title: "Lance the site", body: "Hold the lancet against the lateral fingertip and activate. The patient may experience brief sharp pain. Discard the lancet immediately into the sharps container.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 4, title: "Obtain a hanging drop", body: "Allow the puncture to bleed naturally; gently milk from the base of the finger toward the tip if needed, but avoid excessive squeezing — this dilutes the sample with interstitial fluid and produces falsely low results. Wipe away the first drop and use the second drop for the test if facility protocol requires.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 5, title: "Apply blood to strip", body: "Touch the test strip to the blood drop and allow capillary action to draw the sample. Some meters require a confirmation 'beep' that adequate sample was applied.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 6, title: "Read the result", body: "The meter displays the result in approximately 5 seconds. Apply pressure to the puncture site with gauze.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        postProcedure: [
            AttributedBullet("Discard the test strip and lancet appropriately; clean meter per facility protocol.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Document the result, time, and any symptoms.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Take action based on result — administer insulin per sliding scale, treat hypoglycemia per protocol, notify provider for critical values.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Remove gloves; perform hand hygiene.", citationIDs: ["cdc_hand_hygiene_ref"])
        ],
        documentation: [
            AttributedBullet("Time, blood glucose value, site used.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Insulin or carbohydrate intervention given in response, if any.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Symptoms of hyper- or hypoglycemia present.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        watchFor: [
            AttributedBullet("Hypoglycemia (<70 mg/dL) — diaphoresis, tremor, confusion, tachycardia. Treat per facility protocol (typically 15 g fast-acting carb if alert and able to swallow; D50 or glucagon if unable). Recheck in 15 minutes.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hyperglycemia with ketones or symptoms — risk for DKA in type 1 or HHS in type 2; check ketones, electrolytes, hydration; notify provider.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Falsely elevated results from contaminated fingers (recent food handling) or alcohol on the site.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Falsely low results from edematous fingers, inadequate sample size, or aggressive squeezing diluting the sample.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        citations: [openstaxClinicalSkills, openrnSkills, cdcHandHygieneRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Central Line Dressing Change

public enum CentralLineDressingSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "central-line-dressing",
        title: "Central line dressing change",
        subtitle: "CVC · PICC · port-a-cath",
        nclexTags: infectionRiskTags,
        indications: AttributedProse(
            "Central line dressing change is performed every 7 days for transparent semipermeable dressings or every 2 days for gauze dressings, and any time the dressing is wet, soiled, loose, or peeling. Sterile technique is required throughout. The dressing change is one of the most important nurse-driven CLABSI prevention measures.",
            citationIDs: ["cdc_clabsi_ref", "openstax_clinical_skills_book"]
        ),
        equipment: [
            AttributedBullet("Sterile central line dressing kit (sterile gloves, mask for patient, mask for nurse, sterile drape, chlorhexidine prep applicator, biopatch or chlorhexidine-impregnated disk per facility, transparent dressing, securement device, alcohol caps).", citationIDs: ["openstax_clinical_skills_book", "cdc_clabsi_ref"]),
            AttributedBullet("Clean gloves for old dressing removal.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hair cover and mask per facility protocol.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        preProcedure: [
            AttributedBullet("Identify patient using two identifiers; explain procedure.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Position patient supine or semi-Fowler's with the line site exposed.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Place a mask on the patient (or have them turn head away from the site if mask not tolerated).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Don mask; perform hand hygiene.", citationIDs: ["cdc_hand_hygiene_ref"]),
            AttributedBullet("Open the kit on a clean surface, creating a sterile field.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Remove old dressing", body: "Don clean gloves. Remove the old dressing carefully — peel from outside in toward the catheter to avoid pulling the line out. Inspect the site, surrounding skin, and the catheter for security and integrity.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 2, title: "Hand hygiene; sterile gloves", body: "Remove clean gloves. Perform hand hygiene. Don sterile gloves from the kit.", citationIDs: ["cdc_hand_hygiene_ref", "openstax_clinical_skills_book"]),
            ProcedureStep(number: 3, title: "Cleanse the site with chlorhexidine", body: "Use the chlorhexidine applicator to scrub the site with friction in a back-and-forth motion for 30 seconds (or per applicator instructions). Cover an area larger than the planned dressing. Allow to air dry completely — minimum 30 seconds. Do NOT blow on or fan the site.", citationIDs: ["cdc_clabsi_ref", "openstax_clinical_skills_book"]),
            ProcedureStep(number: 4, title: "Apply biopatch", body: "Apply the chlorhexidine-impregnated disk over the catheter exit site with the slit facing the entry direction. Adheres to skin around the catheter.", citationIDs: ["cdc_clabsi_ref", "openstax_clinical_skills_book"]),
            ProcedureStep(number: 5, title: "Apply transparent dressing", body: "Apply the sterile transparent semipermeable dressing over the site, ensuring the catheter is centered and the dressing edges are sealed. Do not stretch the dressing.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 6, title: "Secure and label", body: "Apply securement device per manufacturer instructions. Label the dressing with the date, time, and your initials.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        postProcedure: [
            AttributedBullet("Scrub all hubs and access ports with alcohol or chlorhexidine for at least 15 seconds before any access.", citationIDs: ["cdc_clabsi_ref"]),
            AttributedBullet("Apply alcohol caps to all unused ports.", citationIDs: ["cdc_clabsi_ref"]),
            AttributedBullet("Discard supplies; remove gloves and PPE; perform hand hygiene.", citationIDs: ["cdc_hand_hygiene_ref"])
        ],
        documentation: [
            AttributedBullet("Date and time of dressing change.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Site assessment — appearance, drainage, redness, warmth.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Catheter — type, exit length, condition, suture/securement integrity.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Patient tolerance.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        watchFor: [
            AttributedBullet("CLABSI signs — redness, drainage, fever, chills (especially during line use); blood cultures and prompt provider notification.", citationIDs: ["cdc_clabsi_ref"]),
            AttributedBullet("Catheter migration — exit length increased from baseline; check baseline measurement at every dressing change.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Air embolism — particularly during dressing change if catheter integrity compromised; clamp tubing, place patient left lateral Trendelenburg, notify provider.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Catheter occlusion — inability to flush or aspirate; do not force; notify provider for declotting protocol.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        citations: [openstaxClinicalSkills, cdcCLABSIRef, cdcHandHygieneRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Oral Suctioning

public enum OralSuctioningSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "oral-suctioning",
        title: "Oropharyngeal suctioning",
        subtitle: "Yankauer suction for oral / pharyngeal secretions",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .gasExchange
        ),
        indications: AttributedProse(
            "Oropharyngeal suctioning with a Yankauer is performed to clear secretions, blood, vomit, or food from the mouth and oropharynx in patients who cannot manage their own secretions — post-stroke, decreased level of consciousness, post-extubation, oral or facial surgery. Maintains a patent airway and prevents aspiration.",
            citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]
        ),
        contraindications: AttributedProse(
            "Use caution in patients with bleeding disorders, recent oral or facial surgery, or fragile oral mucosa. Yankauer suction does NOT substitute for tracheal suctioning when secretions are below the cords.",
            citationIDs: ["openstax_clinical_skills_book"]
        ),
        equipment: [
            AttributedBullet("Yankauer suction catheter.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Suction source and connecting tubing; canister.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Sterile water or saline for clearing the catheter between passes.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Clean gloves; PPE (mask with eye protection if splash anticipated).", citationIDs: ["openstax_clinical_skills_book"])
        ],
        preProcedure: [
            AttributedBullet("Identify patient using two identifiers; explain procedure even if the patient is unresponsive.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Position the patient — semi-Fowler's or side-lying with head turned to the side to prevent aspiration.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hand hygiene; don gloves and PPE.", citationIDs: ["cdc_hand_hygiene_ref"]),
            AttributedBullet("Test the suction system — turn on, occlude tubing, verify negative pressure (typically 80–120 mmHg for adults).", citationIDs: ["openstax_clinical_skills_book"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Insert Yankauer", body: "Insert the Yankauer along the side of the mouth, advancing toward the oropharynx. Do NOT apply suction during insertion.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 2, title: "Apply suction", body: "Once positioned, apply suction by occluding the suction control port with your thumb. Move the Yankauer in a sweeping motion to clear secretions.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 3, title: "Limit suction time", body: "Limit each suction pass to 10–15 seconds to avoid hypoxia. Allow the patient to rest and breathe between passes.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 4, title: "Clear the catheter", body: "Between passes, clear the Yankauer by suctioning sterile water or saline through it.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 5, title: "Reassess and repeat", body: "Reassess the airway and continue as needed. If secretions persist after the oropharynx is cleared, the patient may require deeper suctioning by a credentialed provider.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        postProcedure: [
            AttributedBullet("Clean the patient's mouth as needed; provide oral care if not contraindicated.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Keep the Yankauer connected to suction at the bedside for the next use; replace per facility protocol (typically every 24 hours).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Reassess respiratory status — rate, work of breathing, SpO2, lung sounds.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Remove gloves and PPE; hand hygiene.", citationIDs: ["cdc_hand_hygiene_ref"])
        ],
        documentation: [
            AttributedBullet("Time, indication for suctioning.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Character and amount of secretions removed.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Patient tolerance and respiratory status before and after.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        watchFor: [
            AttributedBullet("Hypoxia from prolonged suctioning — limit to 10–15 seconds per pass and monitor SpO2.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Mucosal trauma — bleeding from the oral mucosa with aggressive technique.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Vagal stimulation — bradycardia from posterior pharynx contact; stop suctioning and reassess.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Aspiration — secretions persisting in the oropharynx with decreased gag reflex; may require suctioning protocol with positioning and suction equipment readily available at all times.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        citations: [openstaxClinicalSkills, openrnSkills, cdcHandHygieneRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sterile Gloving

public enum SterileGlovingSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "sterile-gloving",
        title: "Sterile gloving",
        subtitle: "Open glove technique",
        nclexTags: infectionRiskTags,
        indications: AttributedProse(
            "Sterile gloves are required for any procedure that introduces equipment or material into a normally sterile body cavity, vascular system, or non-intact skin — central line dressing changes, urinary catheter insertion, sterile wound care, certain invasive procedures. Open glove technique (described here) is the most common method outside of the operating room.",
            citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]
        ),
        equipment: [
            AttributedBullet("Sterile gloves of correct size, in unopened packaging.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Clean, dry surface (overbed table) at waist height or higher.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        preProcedure: [
            AttributedBullet("Verify the integrity of the glove package — dry, intact, within expiration.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hand hygiene immediately before donning.", citationIDs: ["cdc_hand_hygiene_ref"]),
            AttributedBullet("Remove watches and jewelry, ensure long sleeves are secured.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Open outer wrap", body: "Place the package on a clean, dry surface at or above waist level. Open the outer wrap, taking care not to touch the inner sterile surface.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 2, title: "Open inner package", body: "Open the inner package by grasping the corners and unfolding outward. The cuffed gloves are now exposed with palms facing up. Identify left and right.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 3, title: "Pick up first glove by the cuff", body: "With your non-dominant hand, pick up the first glove (typically dominant hand glove) by the inside of the cuff only — this surface will touch your skin and is considered non-sterile to your sterile gloved hand.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 4, title: "Don first glove", body: "Slide your dominant hand into the glove without touching the outside. Pull the cuff up, but leave the cuff folded over.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 5, title: "Pick up second glove with sterile gloved hand", body: "With your now-sterile gloved hand, slide four fingers UNDER the cuff of the second glove (the cuff's outside is sterile). Hold the glove away from your body.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 6, title: "Don second glove", body: "Slide your non-dominant hand into the second glove. Pull the cuff up over your wrist, keeping the gloved fingers under the cuff to avoid contaminating the sterile outside with your bare skin.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 7, title: "Adjust cuffs and assess sterility", body: "Adjust both cuffs by sliding the gloved fingers under the cuffs (not against your skin). Keep gloved hands above your waist and within your line of sight at all times. Assume any contact below waist or behind your back contaminates the gloves.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        postProcedure: [
            AttributedBullet("Maintain sterility throughout the procedure — only touch other sterile items.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("If contamination occurs, change the contaminated glove immediately.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Doff gloves using glove-to-glove and skin-to-skin technique. Hand hygiene immediately after removal.", citationIDs: ["cdc_hand_hygiene_ref", "openstax_clinical_skills_book"])
        ],
        watchFor: [
            AttributedBullet("Touching the outside of a sterile glove with your bare skin — contaminates the glove. Restart with a new pair.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Holding gloved hands below waist or behind back — considered contaminated.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("A glove tear during the procedure — change immediately.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Latex allergy in patient or staff — use latex-free sterile gloves.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        citations: [openstaxClinicalSkills, openrnSkills, cdcHandHygieneRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Specimen Collection (clean-catch urine)

public enum CleanCatchUrineSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "clean-catch-urine",
        title: "Clean-catch urine specimen",
        subtitle: "Midstream collection for culture",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .infection
        ),
        indications: AttributedProse(
            "A clean-catch midstream urine specimen is collected to obtain a culture-grade sample with minimal contamination from periurethral flora. Used for urinalysis with culture and sensitivity when UTI is suspected. Catheterization is reserved for patients who cannot voluntarily void or when a sterile sample is critical and clean-catch is unreliable.",
            citationIDs: ["openstax_clinical_skills_book", "openrn_skills_book"]
        ),
        equipment: [
            AttributedBullet("Sterile specimen cup with lid; biohazard transport bag.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Cleansing wipes (typically antiseptic towelettes provided in the collection kit).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Gloves; PPE.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        preProcedure: [
            AttributedBullet("Identify patient using two identifiers; verify the order.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Explain the procedure clearly; provide written instructions if available, especially for patients who will collect independently.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Hand hygiene; don gloves if assisting.", citationIDs: ["cdc_hand_hygiene_ref"]),
            AttributedBullet("Provide privacy and ensure ease of access to the bathroom.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene", body: "Patient (or assisting nurse) performs hand hygiene before beginning.", citationIDs: ["cdc_hand_hygiene_ref"]),
            ProcedureStep(number: 2, title: "Cleanse the perineum / meatus", body: "For females: separate the labia and cleanse front-to-back with one wipe per stroke (one for each side, one down the middle). For males: retract the foreskin if uncircumcised and cleanse the meatus in a circular motion outward. Discard each wipe after a single stroke.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 3, title: "Initiate urination", body: "Patient begins urinating into the toilet — the initial stream washes residual flora from the urethra.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 4, title: "Collect midstream sample", body: "Without stopping the stream, place the sterile container into the urine flow and collect 30–60 mL (or as required by the lab). Do not touch the inside of the container or the lid.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 5, title: "Finish voiding", body: "Move the container away and finish urinating into the toilet.", citationIDs: ["openstax_clinical_skills_book"]),
            ProcedureStep(number: 6, title: "Cap and label", body: "Cap the container without touching the inside. Label with patient identifiers, date, time, and source. Place in biohazard transport bag.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        postProcedure: [
            AttributedBullet("Transport to lab promptly — within 1 hour of collection, or refrigerate up to 24 hours per lab protocol.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Patient performs hand hygiene.", citationIDs: ["cdc_hand_hygiene_ref"]),
            AttributedBullet("Document collection time and any issues with collection technique.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        documentation: [
            AttributedBullet("Time of collection, character of urine (color, clarity, odor).", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Test ordered, lab destination.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Patient ability to follow technique; whether assisted.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        watchFor: [
            AttributedBullet("Contaminated specimen — many epithelial cells, mixed flora, or low colony count of multiple organisms; recollect.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Delayed transport — bacterial overgrowth in unrefrigerated specimen invalidates culture.", citationIDs: ["openstax_clinical_skills_book"]),
            AttributedBullet("Patients who cannot follow technique (cognitive impairment, mobility issues) — assist directly or consider straight catheterization for diagnostic sample.", citationIDs: ["openstax_clinical_skills_book"])
        ],
        citations: [openstaxClinicalSkills, openrnSkills, cdcHandHygieneRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}
