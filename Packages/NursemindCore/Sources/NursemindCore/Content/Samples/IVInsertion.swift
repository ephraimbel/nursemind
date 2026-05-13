import Foundation

public enum IVInsertionSample {
    public static let entry: ProcedureEntry = {
        let openstax = CitationSource(
            id: "openstax_clinical_iv",
            shortName: "OpenStax Clinical Nursing Skills — Peripheral IV Insertion",
            publisher: "OpenStax · Rice University",
            license: .ccBy4WithAIRestriction,
            url: "https://openstax.org/books/clinical-nursing-skills/pages/1-introduction",
            lastRetrieved: "2026-05-03"
        )
        let ins = CitationSource(
            id: "ins_standards_2024",
            shortName: "Infusion Nurses Society — Infusion Therapy Standards of Practice (paraphrased)",
            detail: "Cite-only — INS standards are copyrighted",
            publisher: "Infusion Nurses Society",
            license: .factCitationOnly,
            url: "https://www.ins1.org/publications/infusion-therapy-standards-of-practice/",
            lastRetrieved: "2026-05-03"
        )
        let cdc = CitationSource(
            id: "cdc_intravascular_2011",
            shortName: "CDC Guidelines for the Prevention of Intravascular Catheter-Related Infections, 2011",
            detail: "O'Grady NP, et al.",
            publisher: "Centers for Disease Control and Prevention",
            license: .publicDomain,
            url: "https://www.cdc.gov/infection-control/hcp/intravascular-catheter-related-infection/",
            lastRetrieved: "2026-05-03"
        )

        return ProcedureEntry(
            id: "iv-insertion",
            title: "Peripheral IV insertion",
            subtitle: "Short peripheral catheter, adult",
            nclexTags: NCLEXTags(
                category: .physiologicalIntegrity,
                subcategory: .reductionOfRiskPotential,
                priorityConcept: .infection
            ),
            indications: AttributedProse(
                "IV access for fluid resuscitation, medication administration, blood product transfusion, contrast for imaging, or laboratory sampling. Anticipated short-term use (typically up to 96 hours per facility policy).",
                citationIDs: ["openstax_clinical_iv", "ins_standards_2024"]
            ),
            contraindications: AttributedProse(
                "Avoid the side of mastectomy or lymphedema, AV fistula extremity, paralyzed limb, and areas with cellulitis, burns, or skin breakdown. Avoid lower-extremity sites in adults when possible (DVT risk).",
                citationIDs: ["openstax_clinical_iv", "ins_standards_2024"]
            ),
            equipment: [
                AttributedBullet("Appropriate-gauge IV catheter (typically 18–22g for adults; 16g or larger for trauma/blood)", citationIDs: ["openstax_clinical_iv"]),
                AttributedBullet("Tourniquet, gloves, chlorhexidine prep, gauze, transparent dressing, securement device", citationIDs: ["openstax_clinical_iv", "cdc_intravascular_2011"]),
                AttributedBullet("Sharps container at the point of use", citationIDs: ["cdc_intravascular_2011"]),
                AttributedBullet("Saline flush, IV start kit, extension tubing, IV solution and primed tubing if continuous", citationIDs: ["openstax_clinical_iv"]),
                AttributedBullet("Site selection assistance device if available (e.g., vein illuminator, ultrasound)", citationIDs: ["ins_standards_2024"])
            ],
            preProcedure: [
                AttributedBullet("Verify provider order and indication; verify patient using two identifiers.", citationIDs: ["openstax_clinical_iv"]),
                AttributedBullet("Assess for allergies — adhesive, chlorhexidine, latex.", citationIDs: ["openstax_clinical_iv"]),
                AttributedBullet("Explain procedure to patient; obtain verbal consent.", citationIDs: ["openstax_clinical_iv"]),
                AttributedBullet("Perform hand hygiene and don clean gloves (CDC recommends gloves; sterile gloves not required for short peripheral catheter unless re-palpating after prep).", citationIDs: ["cdc_intravascular_2011"]),
                AttributedBullet("Select an appropriate site — distal first, dominant hand for short stays, avoid joints when possible.", citationIDs: ["openstax_clinical_iv", "ins_standards_2024"])
            ],
            steps: [
                ProcedureStep(number: 1, title: "Apply tourniquet", body: "Apply tourniquet 4–6 inches above the intended insertion site. Assess for vein selection — palpable, soft, springy, well-anchored.", citationIDs: ["openstax_clinical_iv"]),
                ProcedureStep(number: 2, title: "Cleanse the site", body: "Cleanse the site with chlorhexidine using a back-and-forth scrub for 30 seconds. Allow to air dry completely (do not blow or fan).", citationIDs: ["cdc_intravascular_2011", "openstax_clinical_iv"]),
                ProcedureStep(number: 3, title: "Anchor the vein", body: "Anchor the vein 1–2 inches below the intended insertion site using your non-dominant thumb. Do not re-palpate the cleaned site without re-cleansing.", citationIDs: ["openstax_clinical_iv"]),
                ProcedureStep(number: 4, title: "Insert the catheter", body: "With bevel up, insert the catheter at a 10–30° angle. Advance until you observe blood return in the flashback chamber.", citationIDs: ["openstax_clinical_iv"]),
                ProcedureStep(number: 5, title: "Lower and advance", body: "Lower the angle, advance the catheter another 1/8 inch to ensure the catheter (not just the needle) is in the vein, then thread the catheter off the stylet into the vein.", citationIDs: ["openstax_clinical_iv"]),
                ProcedureStep(number: 6, title: "Release tourniquet, retract stylet", body: "Release the tourniquet. Apply pressure above the catheter tip with your non-dominant hand to occlude the vein. Retract the stylet using a safety mechanism and dispose immediately into the sharps container.", citationIDs: ["openstax_clinical_iv", "cdc_intravascular_2011"]),
                ProcedureStep(number: 7, title: "Connect and flush", body: "Attach the primed extension tubing or saline lock. Flush with normal saline; assess for swelling, resistance, pain — any of which suggest infiltration. Connect to IV tubing if continuous infusion.", citationIDs: ["openstax_clinical_iv"]),
                ProcedureStep(number: 8, title: "Secure and dress", body: "Apply a sterile transparent dressing over the insertion site. Secure tubing with a securement device or tape. Label with date, time, gauge, and your initials.", citationIDs: ["openstax_clinical_iv", "ins_standards_2024"])
            ],
            postProcedure: [
                AttributedBullet("Assess site every 1–2 hours for redness, swelling, pain, leakage, and dressing integrity.", citationIDs: ["ins_standards_2024", "cdc_intravascular_2011"]),
                AttributedBullet("Replace peripheral IV per facility policy (typically every 72–96 hours unless clinically indicated to leave).", citationIDs: ["cdc_intravascular_2011", "ins_standards_2024"]),
                AttributedBullet("Discard PIV that is no longer needed promptly to reduce infection risk.", citationIDs: ["cdc_intravascular_2011"])
            ],
            documentation: [
                AttributedBullet("Date, time, site location, catheter gauge and brand, number of attempts.", citationIDs: ["openstax_clinical_iv"]),
                AttributedBullet("Patient tolerance, any complications.", citationIDs: ["openstax_clinical_iv"]),
                AttributedBullet("Type of dressing applied; whether continuous fluid was started or saline lock.", citationIDs: ["openstax_clinical_iv"])
            ],
            watchFor: [
                AttributedBullet("Infiltration — swelling, coolness, pain, slowing of infusion. Discontinue and restart in another site.", citationIDs: ["openstax_clinical_iv", "ins_standards_2024"]),
                AttributedBullet("Phlebitis — redness, warmth, pain along the vein, palpable cord. Discontinue and apply warm compress.", citationIDs: ["ins_standards_2024"]),
                AttributedBullet("Air embolism with central tubing — clamp tubing, place patient left lateral Trendelenburg, notify provider.", citationIDs: ["ins_standards_2024"])
            ],
            citations: [openstax, ins, cdc],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
