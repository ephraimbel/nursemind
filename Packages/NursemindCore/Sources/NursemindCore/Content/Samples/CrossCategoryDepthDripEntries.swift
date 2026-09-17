import Foundation

private let cc_depth_giapreza = CitationSource(
    id: "cc_depth_giapreza",
    shortName: "FDA SPL — GIAPREZA (angiotensin II)",
    detail: "SPL set c265d69a-3efe-4107-9a9e-e6fd3d531c48, version 18, effective 20260722. Adult prescribing-information excerpts and source-grounded summaries; sections 1, 2, 4–7 and 12.4 (antibiotics) or 12.1 (infusions). Dosing blocks are label reference, not patient-specific orders. Tables reformatted for readability. Pediatric dosing excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "FDA prescribing information distributed by DailyMed; National Library of Medicine",
    license: .cc0,
    url: "https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=c265d69a-3efe-4107-9a9e-e6fd3d531c48",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_kengreal = CitationSource(
    id: "cc_depth_kengreal",
    shortName: "FDA SPL — KENGREAL (cangrelor)",
    detail: "SPL set 88b434fa-8891-4fd5-9d86-7ea64667c08f, version 10, effective 20251021. Adult prescribing-information excerpts and source-grounded summaries; sections 1, 2, 4–7 and 12.4 (antibiotics) or 12.1 (infusions). Dosing blocks are label reference, not patient-specific orders. Tables reformatted for readability. Pediatric dosing excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "FDA prescribing information distributed by DailyMed; National Library of Medicine",
    license: .cc0,
    url: "https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=88b434fa-8891-4fd5-9d86-7ea64667c08f",
    lastRetrieved: "2026-09-17"
)

public enum CCDepthAngiotensinIiDripSample {
    public static let entry = DrugEntry(
        id: "angiotensin-ii-drip",
        title: "Angiotensin II infusion",
        subtitle: "Giapreza · adult distributive shock label reference",
        category: "Vasoconstrictor",
        isHighRisk: true,
        quickReference: [],
        indications: AttributedProse("GIAPREZA increases blood pressure in adults with septic or other distributive shock [see Clinical Studies (14)] .", citationIDs: ["cc_depth_giapreza"]),
        mechanism: AttributedProse("Angiotensin II raises blood pressure through vasoconstriction and increased aldosterone release. It acts directly at angiotensin II type 1 receptors on vascular smooth muscle.", citationIDs: ["cc_depth_giapreza"]),
        dosing: [
            DosingBlock(label: "FDA adult label — starting dose and titration", body: "The recommended starting dosage of GIAPREZA is 20 nanograms (ng)/kg/min via continuous intravenous infusion. Administration through a central venous line is recommended. Monitor blood pressure response and titrate GIAPREZA as frequently as every 5 minutes by increments of up to 15 ng/kg/min as needed to achieve or maintain target blood pressure. Do not exceed 80 ng/kg/min during the first 3 hours of treatment. Maintenance dose should not exceed 40 ng/kg/min. Doses as low as 1.25 ng/kg/min may be used. Once the underlying shock has sufficiently improved, down-titrate every 5 to 15 minutes by increments of up to 15 ng/kg/min based on blood pressure.", citationIDs: ["cc_depth_giapreza"]),
            DosingBlock(label: "FDA label — dilution and storage", body: "Parenteral drug products should be inspected visually for particulate matter and discoloration prior to administration, whenever solution and container permit. GIAPREZA must be administered as an intravenous infusion. GIAPREZA must be diluted in 0.9% sodium chloride prior to use. Dilute the appropriate amount of GIAPREZA in a normal saline (0.9% sodium chloride) infusion bag to achieve the desired final concentration of 5,000 ng/mL or 10,000 ng/mL. Discard vial and any unused portion of the drug product after use. Diluted solution may be stored at room temperature (20°C to 25°C [68°F to 77°F]) or under refrigeration (2°C to 8°C [36°F to 46°F]). Discard prepared solution after 24 hours at room temperature or under refrigeration.", citationIDs: ["cc_depth_giapreza"]),
            DosingBlock(label: "Vial strength and infusion units", body: "The current label lists 0.5 mg/mL and 2.5 mg/mL vial strengths. The final infusion concentrations are 5,000 or 10,000 ng/mL, and the dose is expressed in ng/kg/min. These are distinct quantities: vial concentration, final infusion concentration and weight-based dose rate.", citationIDs: ["cc_depth_giapreza"])
        ],
        contraindications: AttributedProse("The FDA label lists no contraindications. This does not remove the thrombosis warning or the need to monitor the blood-pressure response.", citationIDs: ["cc_depth_giapreza"]),
        warnings: [
            AttributedBullet("Thrombosis warning: arterial and venous thrombotic or thromboembolic events were more frequent with GIAPREZA than placebo in ATHOS-3 (13% versus 5%); deep-vein thrombosis accounted for the major imbalance. The label specifies concurrent VTE prophylaxis.", citationIDs: ["cc_depth_giapreza"]),
            AttributedBullet("The label ties titration and down-titration to blood-pressure response and improvement of the underlying shock. Its early-treatment ceiling and maintenance ceiling differ; the cited adult protocol must be reconciled with the prescribed target and local infusion policy.", citationIDs: ["cc_depth_giapreza"])
        ],
        adverseReactions: AttributedProse("ATHOS-3 reported thromboembolic events, thrombocytopenia, tachycardia, fungal infection, delirium, acidosis, hyperglycemia and peripheral ischemia more often in the GIAPREZA group under the table’s reporting criteria. Trial rates do not establish causality for an individual event.", citationIDs: ["cc_depth_giapreza"]),
        drugInteractions: [
            AttributedBullet("ACE inhibitors may increase the response to GIAPREZA; angiotensin II receptor blockers may decrease it. These effects belong in the medication review when assessing an unexpected blood-pressure response.", citationIDs: ["cc_depth_giapreza"])
        ],
        citations: [cc_depth_giapreza],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CCDepthCangrelorDripSample {
    public static let entry = DrugEntry(
        id: "cangrelor-drip",
        title: "Cangrelor infusion",
        subtitle: "Kengreal · PCI infusion and oral transition",
        category: "P2Y12 platelet inhibitor",
        isHighRisk: true,
        quickReference: [],
        indications: AttributedProse("KENGREAL is indicated as an adjunct to percutaneous coronary intervention (PCI) to reduce the risk of periprocedural myocardial infarction (MI), repeat coronary revascularization, and stent thrombosis (ST) in patients who have not been treated with a P2Y 12 platelet inhibitor and are not being given a glycoprotein IIb/IIIa inhibitor [see Clinical Studies ( 14.1 )].", citationIDs: ["cc_depth_kengreal"]),
        mechanism: AttributedProse("Cangrelor is a direct P2Y 12 platelet receptor inhibitor that blocks ADP-induced platelet activation and aggregation. Cangrelor binds selectively and reversibly to the P2Y 12 receptor to prevent further signaling and platelet activation.", citationIDs: ["cc_depth_kengreal"]),
        dosing: [
            DosingBlock(label: "FDA adult PCI label — bolus and infusion", body: "The recommended dosage of KENGREAL is a 30 mcg/kg IV bolus followed immediately by a 4 mcg/kg/min IV infusion. Initiate the bolus infusion prior to PCI. The maintenance infusion should ordinarily be continued for at least 2 hours or for the duration of PCI, whichever is longer.", citationIDs: ["cc_depth_kengreal"]),
            DosingBlock(label: "FDA label — oral P2Y12 transition", body: "To maintain platelet inhibition after discontinuation of KENGREAL infusion, administer an oral P2Y 12 platelet inhibitor, as described below: Ticagrelor: 180 mg at any time during KENGREAL infusion or immediately after discontinuation [see Clinical Pharmacology ( 12.2 )] . Prasugrel: 60 mg immediately after discontinuation of KENGREAL [see Drug Interactions ( 7.1 ) and Clinical Pharmacology ( 12.2 )] . Clopidogrel: 600 mg immediately after discontinuation of KENGREAL [see Drug Interactions ( 7.1 ) and Clinical Pharmacology ( 12.2 )] .", citationIDs: ["cc_depth_kengreal"]),
            DosingBlock(label: "Preparation and administration — label summary", body: "The 50 mg vial is reconstituted with 5 mL sterile water, gently swirled and further diluted in a 250 mL bag of normal saline or 5% dextrose, yielding 200 mcg/mL. The label requires a dedicated IV line, the bolus from the diluted bag before PCI, and immediate infusion after the bolus. Patients weighing 100 kg or more require at least two bags. The full preparation instructions remain in section 2.3.", citationIDs: ["cc_depth_kengreal"]),
            DosingBlock(label: "Storage after dilution — label summary", body: "Reconstituted solution is diluted immediately. At room temperature, the diluted infusion is stable up to 12 hours in 5% dextrose or 24 hours in normal saline. Discard unused reconstituted solution remaining in the vial.", citationIDs: ["cc_depth_kengreal"])
        ],
        contraindications: AttributedProse("KENGREAL is contraindicated in patients with significant active bleeding [see Warnings and Precautions ( 5.1 ) and Adverse Reactions ( 6.1 )] .\n\nKENGREAL is contraindicated in patients with known hypersensitivity (e.g., anaphylaxis) to KENGREAL or any component of the product [see Adverse Reactions ( 6.1 )] .", citationIDs: ["cc_depth_kengreal"]),
        warnings: [
            AttributedBullet("Bleeding can be serious. The label reports more bleeding events of all severities with cangrelor than clopidogrel in CHAMPION PHOENIX. It states that the antiplatelet effect is no longer present one hour after discontinuation; that pharmacologic offset does not establish that an active bleed has resolved.", citationIDs: ["cc_depth_kengreal"]),
            AttributedBullet("The label’s oral transition timing differs by drug: ticagrelor may overlap the infusion, while clopidogrel and prasugrel are given after it ends. A transition plan must identify the actual oral agent and timing rather than simply stating “start oral antiplatelet.”", citationIDs: ["cc_depth_kengreal"])
        ],
        adverseReactions: AttributedProse("Bleeding is the principal adverse reaction; dyspnea and hypersensitivity reactions are also described. The trial discussion includes severe bleeding events.", citationIDs: ["cc_depth_kengreal"]),
        drugInteractions: [
            AttributedBullet("Clopidogrel or prasugrel administered during KENGREAL infusion will have no antiplatelet effect until the next dose is administered. Therefore, administer clopidogrel or prasugrel after KENGREAL infusion is discontinued [see Dosage and Administration ( 2.2 ) and Clinical Pharmacology ( 12.3 )].", citationIDs: ["cc_depth_kengreal"])
        ],
        citations: [cc_depth_kengreal],
        lastSourceFidelityReview: "2026-09-17"
    )
}
