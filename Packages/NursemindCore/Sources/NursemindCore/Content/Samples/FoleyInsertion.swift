import Foundation

public enum FoleyInsertionSample {
    public static let entry: ProcedureEntry = {
        let openstax = CitationSource(
            id: "openstax_clinical_foley",
            shortName: "OpenStax Clinical Nursing Skills — Indwelling Urinary Catheter Insertion",
            publisher: "OpenStax · Rice University",
            license: .ccBy4WithAIRestriction,
            url: "https://openstax.org/books/clinical-nursing-skills/pages/1-introduction",
            lastRetrieved: "2026-05-03"
        )
        let cdc = CitationSource(
            id: "cdc_cauti_2009",
            shortName: "CDC Guideline for Prevention of Catheter-Associated Urinary Tract Infections (CAUTI), 2009",
            detail: "Gould CV, et al.",
            publisher: "Centers for Disease Control and Prevention",
            license: .publicDomain,
            url: "https://www.cdc.gov/infection-control/hcp/cauti/index.html",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_skills_foley",
            shortName: "Open RN Nursing Skills — Urinary Elimination",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK615342/",
            lastRetrieved: "2026-05-03"
        )

        return ProcedureEntry(
            id: "foley-insertion",
            title: "Indwelling urinary catheter insertion",
            subtitle: "Foley catheter, sterile technique, adult",
            nclexTags: NCLEXTags(
                category: .safeAndEffectiveCare,
                subcategory: .safetyAndInfectionControl,
                priorityConcept: .infection
            ),
            indications: AttributedProse(
                "Acute urinary retention or obstruction; perioperative use for selected procedures; accurate hourly urine output measurement in critically ill patients; healing of perineal or sacral wounds in incontinent patients; comfort care at end of life. Indwelling catheters should NOT be used solely for nursing convenience or for management of incontinence.",
                citationIDs: ["cdc_cauti_2009", "openstax_clinical_foley"]
            ),
            contraindications: AttributedProse(
                "Suspected urethral injury (e.g., pelvic trauma with blood at meatus, perineal hematoma, high-riding prostate) — provider must evaluate first.",
                citationIDs: ["openstax_clinical_foley"]
            ),
            equipment: [
                AttributedBullet("Sterile catheter kit (catheter, drainage bag, sterile drape, sterile gloves, antiseptic, lubricant, prefilled water syringe, specimen collection container)", citationIDs: ["openstax_clinical_foley"]),
                AttributedBullet("Catheter size — typically 14–16 Fr for adults; smaller is better for comfort and lower risk", citationIDs: ["openstax_clinical_foley"]),
                AttributedBullet("Securement device", citationIDs: ["cdc_cauti_2009"]),
                AttributedBullet("Bath blanket and disposable bed pad", citationIDs: ["openstax_clinical_foley"])
            ],
            preProcedure: [
                AttributedBullet("Verify provider order and indication — confirm CAUTI bundle criteria are met before proceeding.", citationIDs: ["cdc_cauti_2009"]),
                AttributedBullet("Verify patient using two identifiers; explain procedure and obtain verbal consent.", citationIDs: ["openstax_clinical_foley"]),
                AttributedBullet("Assess for allergies — latex, povidone-iodine.", citationIDs: ["openstax_clinical_foley"]),
                AttributedBullet("Provide perineal care with soap and water; this reduces bacterial load before sterile prep.", citationIDs: ["cdc_cauti_2009"]),
                AttributedBullet("Position patient: females supine with knees flexed; males supine with legs extended.", citationIDs: ["openstax_clinical_foley"])
            ],
            steps: [
                ProcedureStep(number: 1, title: "Hand hygiene + open kit", body: "Perform hand hygiene. Open the kit on a clean overbed table. Establish a sterile field.", citationIDs: ["openstax_clinical_foley", "cdc_cauti_2009"]),
                ProcedureStep(number: 2, title: "Don sterile gloves", body: "Don sterile gloves using sterile technique. Drape the patient.", citationIDs: ["openstax_clinical_foley"]),
                ProcedureStep(number: 3, title: "Test the balloon (optional per kit)", body: "If your kit allows, test the balloon by injecting and withdrawing the prefilled saline syringe — most modern kits skip this step to reduce balloon weakening.", citationIDs: ["openstax_clinical_foley"]),
                ProcedureStep(number: 4, title: "Lubricate the catheter tip", body: "Lubricate 1–2 inches of the catheter tip for women, 6–7 inches for men.", citationIDs: ["openstax_clinical_foley"]),
                ProcedureStep(number: 5, title: "Cleanse the meatus", body: "Female: separate labia with non-dominant hand (now contaminated, stays in place). Cleanse from clitoris down toward anus, using each cotton ball once. Male: retract foreskin (if present), hold penis perpendicular to body. Cleanse from meatus outward in circular motion.", citationIDs: ["openstax_clinical_foley", "cdc_cauti_2009"]),
                ProcedureStep(number: 6, title: "Insert the catheter", body: "Female: gently insert catheter ~2–3 inches or until urine returns, then advance another 1–2 inches. Male: hold penis perpendicular, insert catheter ~7–9 inches or until urine returns, then advance another 1–2 inches. If resistance, ask the patient to take a slow breath and gently rotate the catheter; do not force.", citationIDs: ["openstax_clinical_foley"]),
                ProcedureStep(number: 7, title: "Inflate the balloon", body: "Once urine returns and the catheter is advanced past the urine return point, inflate the balloon with the full prefilled volume of sterile water (typically 10 mL).", citationIDs: ["openstax_clinical_foley"]),
                ProcedureStep(number: 8, title: "Pull back gently", body: "Gently pull the catheter back until you feel resistance — the balloon is now seated against the bladder neck.", citationIDs: ["openstax_clinical_foley"]),
                ProcedureStep(number: 9, title: "Connect to drainage and secure", body: "Attach to a closed drainage bag (if not pre-attached). Hang the bag below bladder level but off the floor. Secure the catheter to the patient's thigh with a securement device. For uncircumcised males, replace the foreskin to prevent paraphimosis.", citationIDs: ["openstax_clinical_foley", "cdc_cauti_2009"])
            ],
            postProcedure: [
                AttributedBullet("Maintain a closed drainage system at all times — disconnections increase CAUTI risk.", citationIDs: ["cdc_cauti_2009"]),
                AttributedBullet("Keep the bag below bladder level but off the floor; do not allow tubing to loop above the bladder.", citationIDs: ["cdc_cauti_2009"]),
                AttributedBullet("Perform daily perineal care with soap and water — antiseptic cleansing is NOT recommended (CDC).", citationIDs: ["cdc_cauti_2009"]),
                AttributedBullet("Assess daily whether the catheter is still indicated; remove as soon as possible (CAUTI bundle).", citationIDs: ["cdc_cauti_2009"]),
                AttributedBullet("Empty drainage bag at least every 8 hours and when 2/3 full; use a separate clean container per patient.", citationIDs: ["cdc_cauti_2009"])
            ],
            documentation: [
                AttributedBullet("Date, time, indication, catheter type and size, balloon inflation volume, output color/clarity/amount.", citationIDs: ["openstax_clinical_foley"]),
                AttributedBullet("Patient tolerance, any difficulty during insertion.", citationIDs: ["openstax_clinical_foley"])
            ],
            watchFor: [
                AttributedBullet("CAUTI signs: cloudy or foul-smelling urine, suprapubic tenderness, fever, costovertebral angle pain, sepsis.", citationIDs: ["cdc_cauti_2009", "openrn_skills_foley"]),
                AttributedBullet("No urine return after insertion: catheter may be in vagina (in females) — leave it in place as a landmark and insert a new sterile catheter into the urethra.", citationIDs: ["openstax_clinical_foley"]),
                AttributedBullet("Bladder spasms after insertion are common; assess for kinks, blockage, or balloon irritation.", citationIDs: ["openrn_skills_foley"])
            ],
            citations: [openstax, cdc, openrn],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
