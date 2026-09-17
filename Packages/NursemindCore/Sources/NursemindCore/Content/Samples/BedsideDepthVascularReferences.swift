import Foundation

private let bedside_depth_central = CitationSource(
    id: "bedside_depth_central", shortName: "Open RN — Manage Central Lines",
    detail: "Nursing Advanced Skills (2023). Sections 4.2–4.4, device identification, assessment and maintenance. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. The outdated chlorhexidine-dressing statement in 4.3 is superseded here by the CDC 2017 update; no third-party device comparison table reproduced. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK594495/", lastRetrieved: "2026-09-17"
)

private let bedside_depth_clabsi = CitationSource(
    id: "bedside_depth_clabsi", shortName: "CDC — Intravascular catheter infection prevention",
    detail: "2011 guideline summary, CDC page updated February 28, 2024. Adult site selection, asepsis, dressings, access, replacement and administration-set recommendations restructured from federal prose. Guideline year is distinct from webpage update. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention / HICPAC", license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/intravascular-catheter-related-infections/summary-recommendations.html", lastRetrieved: "2026-09-17"
)

private let bedside_depth_chg = CitationSource(
    id: "bedside_depth_chg", shortName: "CDC — Chlorhexidine dressing update (2017)",
    detail: "2017 update, CDC webpage April 12, 2024. Recommendation for FDA-cleared dressings with a clinical infection-reduction indication in adults with short-term, non-tunneled CVCs. Not generalized to every vascular device or age group. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention / HICPAC", license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/c-i-dressings/summary-recommendations.html", lastRetrieved: "2026-09-17"
)

private let bedside_depth_iv = CitationSource(
    id: "bedside_depth_iv", shortName: "Open RN — IV Therapy Management",
    detail: "Nursing Skills, 2nd edition (2023). Sections 23.2–23.5, local complications, bedside assessment and infusion checks. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. No medication-specific antidote, thermal treatment or dosing protocol. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596734/", lastRetrieved: "2026-09-17"
)

private let bedside_depth_extravasation = CitationSource(
    id: "bedside_depth_extravasation", shortName: "eviQ — Extravasation management: clinical procedure",
    detail: "Clinical procedure 4156, primary actions and drug-specific management. Brief original factual paraphrase; no reproduced flowchart, assessment tool, dose table or algorithm. Australian cancer/contrast guidance cited for initial precautions, not a universal US protocol. Source-fidelity review is not independent clinical approval.",
    publisher: "Cancer Institute NSW / eviQ", license: .factCitationOnly,
    url: "https://www.eviq.org.au/clinical-resources/extravasation/4156-extravasation-management-clinical-procedure", lastRetrieved: "2026-09-17"
)

public enum CentralVenousCatheterSample {
    public static let entry = ReferenceEntry(
        id: "central-venous-catheter", title: "Central venous catheters (CVC)",
        subtitle: "Device identification, site assessment, access and daily maintenance", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Know which device is present", [
                AttributedBullet("Identify whether the line is non-tunneled, tunneled, a peripherally inserted central catheter (PICC), or an implanted port. A PICC is a central catheter despite entering through the arm; its maintenance needs should not be inferred from an ordinary peripheral IV.", citationIDs: ["bedside_depth_central"]),
                AttributedBullet("Review the documented indication, insertion information, tip-verification record, number of lumens and permitted uses before accessing the device. An implanted port requires the appropriate non-coring needle and staff competent in that device’s care.", citationIDs: ["bedside_depth_central"])
            ]),
            .bullets(title: "Assess the patient and insertion site", [
                AttributedBullet("Ask about pain, tenderness, burning, numbness or tingling near the line. Inspect and palpate as appropriate for swelling, erythema or other color change, drainage, warmth and a palpable cord. Include the surrounding arm, neck or chest rather than looking only at the puncture.", citationIDs: ["bedside_depth_central"]),
                AttributedBullet("Compare findings with baseline and assess at the frequency required by the patient’s condition and local policy. Fever or a new local change warrants evaluation; the appearance of a dressing alone cannot establish whether the catheter is free of complications.", citationIDs: ["bedside_depth_central"])
            ]),
            .bullets(title: "Check securement and migration", [
                AttributedBullet("Inspect the stabilization device, connections and dressing. Compare the visible external catheter length with the insertion record and prior measurements. A changed length or new ipsilateral swelling needs prompt assessment before continuing routine use.", citationIDs: ["bedside_depth_central"]),
                AttributedBullet("Keep the catheter protected from traction during turning, transfers and dressing care. Document the location and extent of swelling or skin changes so the receiving nurse can recognize progression instead of relying on an undocumented impression.", citationIDs: ["bedside_depth_central"])
            ]),
            .bullets(title: "Maintain a clean, intact dressing", [
                AttributedBullet("Use sterile gauze or a sterile transparent semipermeable dressing. Replace a dressing when it becomes damp, loose or visibly soiled; a scheduled change date does not justify leaving a compromised dressing in place. Gauze is preferred when the site is bleeding, oozing or the patient is diaphoretic.", citationIDs: ["bedside_depth_clabsi"]),
                AttributedBullet("For short-term CVCs, CDC recommends gauze changes every two days and transparent dressing changes at least every seven days. Follow the applicable device and facility procedure, with aseptic technique and skin antiseptic allowed to dry according to its instructions.", citationIDs: ["bedside_depth_clabsi"])
            ]),
            .bullets(title: "Apply the current chlorhexidine recommendation", [
                AttributedBullet("For adults with short-term, non-tunneled CVCs, CDC recommends chlorhexidine-impregnated dressings with an FDA-cleared label indicating reduction of catheter-related or catheter-associated bloodstream infection. Check the product indication and patient tolerance. This recommendation should not be generalized to every catheter type or age group.", citationIDs: ["bedside_depth_chg"])
            ]),
            .bullets(title: "Protect every access point", [
                AttributedBullet("Perform hand hygiene before and after catheter manipulation and dressing care. Disinfect access ports with an appropriate antiseptic and access them only with sterile devices. Maintain aseptic technique during each connection, sampling episode and infusion change.", citationIDs: ["bedside_depth_clabsi"]),
                AttributedBullet("Keep unused access points protected and connections secure. Scrub and drying requirements depend on the antiseptic and connector instructions; one memorized scrub duration does not replace the validated process for the equipment in use.", citationIDs: ["bedside_depth_clabsi"])
            ]),
            .bullets(title: "Distinguish flushing from locking", [
                AttributedBullet("Flushing clears the lumen of blood, medicines or incompatible solutions; locking instills the prescribed solution when the catheter will not be used. Device design, therapy and local policy determine the solution, volume and technique. Do not apply one heparin or saline regimen to every device.", citationIDs: ["bedside_depth_central"]),
                AttributedBullet("Assess line function and investigate resistance, pump pressure alarms, leakage or pain. Do not force a resistant catheter. Bring patency concerns to the vascular-access or treating team and follow the prescribed assessment pathway before further use.", citationIDs: ["bedside_depth_central"])
            ]),
            .bullets(title: "Review necessity and communicate changes", [
                AttributedBullet("Review whether each catheter is still essential and arrange prompt removal when no longer needed. Routine scheduled replacement of CVCs or PICCs solely to prevent infection is not recommended. Fever alone is not an automatic reason to remove a central line.", citationIDs: ["bedside_depth_clabsi"]),
                AttributedBullet("Communicate the current indication, site and dressing findings, function concerns and changes in patient condition. Removal and replacement decisions require the responsible team’s assessment of infectious, mechanical and treatment needs.", citationIDs: ["bedside_depth_clabsi"])
            ])
        ],
        citations: [bedside_depth_central, bedside_depth_clabsi, bedside_depth_chg],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CLABSIBundleSample {
    public static let entry = ReferenceEntry(
        id: "clabsi-bundle", title: "CLABSI prevention bundle",
        subtitle: "Adult insertion, access, dressings and maintenance checks", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Start with necessity and the right device", [
                AttributedBullet("A central line should have a current clinical indication. Review its need regularly and remove it promptly when it is no longer essential. Use the minimum number of ports or lumens needed for the patient’s treatment rather than adding lumens without a purpose.", citationIDs: ["bedside_depth_clabsi"]),
                AttributedBullet("A prevention bundle spans insertion and every subsequent access. Staff education, demonstrated competence, supplies and consistent observation of aseptic practice matter throughout the catheter’s life, including transport and handoff.", citationIDs: ["bedside_depth_clabsi"])
            ]),
            .bullets(title: "Understand adult site-selection tradeoffs", [
                AttributedBullet("CDC advises avoiding femoral access in adults and favors the subclavian site over jugular or femoral sites for infection prevention with non-tunneled CVCs. Selection must also weigh mechanical risks, patient anatomy and the clinician’s expertise.", citationIDs: ["bedside_depth_clabsi"]),
                AttributedBullet("Subclavian access should be avoided in advanced kidney disease or patients receiving hemodialysis because of subclavian vein stenosis risk. Site choice is therefore not a universal infection-risk ranking that overrides future dialysis-access preservation.", citationIDs: ["bedside_depth_clabsi"])
            ]),
            .bullets(title: "Check insertion precautions", [
                AttributedBullet("CVC and PICC insertion and guidewire exchange use maximal sterile barriers: cap, mask, sterile gown, sterile gloves and a full-body sterile drape. Hand hygiene and aseptic technique remain required even when gloves are worn.", citationIDs: ["bedside_depth_clabsi"]),
                AttributedBullet("For central venous insertion and dressing changes, CDC recommends an alcohol-based preparation containing more than 0.5% chlorhexidine. When contraindicated, its listed alternatives include tincture of iodine, an iodophor or 70% alcohol. Allow the preparation to dry according to the manufacturer.", citationIDs: ["bedside_depth_clabsi"])
            ]),
            .bullets(title: "Keep dressings intact", [
                AttributedBullet("Cover the site with sterile gauze or a sterile transparent semipermeable dressing. Change a damp, loose or visibly soiled dressing promptly. Use gauze when bleeding, oozing or diaphoresis interferes with a transparent dressing.", citationIDs: ["bedside_depth_clabsi"]),
                AttributedBullet("For short-term CVCs, change gauze every two days and transparent dressings at least every seven days, alongside earlier changes for loss of integrity. Avoid submerging the catheter; showering requires protection that prevents water entering the catheter or connecting device.", citationIDs: ["bedside_depth_clabsi"])
            ]),
            .bullets(title: "Use the adult chlorhexidine update", [
                AttributedBullet("CDC’s 2017 update recommends chlorhexidine-impregnated dressings for adults with short-term, non-tunneled CVCs when the FDA-cleared label includes an infection-reduction indication. The 2011 summary’s older dressing language should be read together with this update, not used alone.", citationIDs: ["bedside_depth_chg"])
            ]),
            .bullets(title: "Protect hubs and medication connections", [
                AttributedBullet("Disinfect catheter access ports with an appropriate antiseptic and use sterile devices to access them. Follow the product’s friction and drying instructions and maintain aseptic technique when changing caps, tubing or connections.", citationIDs: ["bedside_depth_clabsi"]),
                AttributedBullet("Do not routinely apply topical antibiotic ointments or creams to insertion sites; dialysis catheters have separate recommendations. Routine systemic antibiotic prophylaxis solely to prevent catheter colonization or bloodstream infection is not recommended.", citationIDs: ["bedside_depth_clabsi"])
            ]),
            .bullets(title: "Match tubing changes to the infusion", [
                AttributedBullet("For continuously used sets not administering blood, blood products or fat emulsions, CDC recommends replacement no more frequently than every 96 hours but at least every seven days. Its summary does not establish an interval for intermittently used sets; use institutional policy.", citationIDs: ["bedside_depth_clabsi"]),
                AttributedBullet("Tubing for blood, blood products or fat emulsions is replaced within 24 hours of starting the infusion. Propofol tubing is changed every 6 or 12 hours when the vial is changed, according to the manufacturer. Do not apply one interval to all infusions.", citationIDs: ["bedside_depth_clabsi"])
            ]),
            .bullets(title: "Recognize when the plan needs review", [
                AttributedBullet("Assess for local tenderness and other signs of infection. If a site hidden beneath a dressing needs inspection because of unexplained fever, tenderness or other concern, follow the sterile assessment procedure rather than leaving the concern unexamined.", citationIDs: ["bedside_depth_clabsi"]),
                AttributedBullet("Do not routinely replace functioning CVCs or PICCs to prevent infection, and do not remove a CVC solely for fever. If asepsis could not be ensured during emergency insertion, CDC recommends replacement as soon as possible, within 48 hours, through the responsible clinical team.", citationIDs: ["bedside_depth_clabsi"])
            ])
        ],
        citations: [bedside_depth_clabsi, bedside_depth_chg],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum BedsideDepthPeripheralIvComplicationAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "peripheral-iv-complication-assessment", title: "Peripheral IV: complications and reassessment",
        subtitle: "Site findings, patency, infusion checks and escalation", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Check the infusion and patient context", [
                AttributedBullet("Verify the prescribed fluid or medicine, route and rate against the medication record. Review allergies and conditions such as heart failure or kidney disease that increase vulnerability to fluid overload.", citationIDs: ["bedside_depth_iv"]),
                AttributedBullet("Inspect the fluid container for leakage, abnormal color or cloudiness and check expiration. Trace the tubing and review the access type; a PICC placed in the arm is a central catheter and needs its own maintenance and assessment requirements.", citationIDs: ["bedside_depth_iv"])
            ]),
            .bullets(title: "Ask about the site repeatedly", [
                AttributedBullet("Ask about pain or discomfort at rest and during the infusion. Encourage the patient to report tenderness, swelling or a new sensation promptly instead of waiting for the next scheduled observation.", citationIDs: ["bedside_depth_iv"]),
                AttributedBullet("Inspect the site before initiating therapy and throughout treatment. Compare the findings with baseline and reassess during interactions with the patient; a site that was comfortable before the infusion may become painful after delivery begins.", citationIDs: ["bedside_depth_iv"])
            ]),
            .bullets(title: "Recognize local abnormal findings", [
                AttributedBullet("Look for redness, swelling, tenderness, unusual coolness or warmth, leakage and a change in the surrounding skin. An expected site is free of these findings, and the infusion should flow without local pain.", citationIDs: ["bedside_depth_iv"]),
                AttributedBullet("Infiltration occurs when fluid enters the surrounding tissue rather than remaining in the vein. Swelling, discomfort and cool skin can be clues. Phlebitis involves inflammation along a vein and may cause redness and tenderness.", citationIDs: ["bedside_depth_iv"])
            ]),
            .bullets(title: "Assess a flow or patency problem", [
                AttributedBullet("Poor flow, pain during a flush, leaking around the insertion site or swelling during infusion requires assessment. Stop delivery through a site suspected of infiltration and follow the facility’s evaluation and replacement procedure.", citationIDs: ["bedside_depth_iv"]),
                AttributedBullet("Check the patient and access site when a delivery problem occurs, not only the tubing or pump display. Do not treat a previously normal check as proof that a newly painful or swollen site remains suitable for use.", citationIDs: ["bedside_depth_iv"])
            ]),
            .bullets(title: "Recognize when tissue injury is possible", [
                AttributedBullet("Extravasation describes leakage of a tissue-damaging infused medicine into surrounding tissue and can lead to serious injury. Identify the exact drug or solution when a site problem occurs; different agents require different management.", citationIDs: ["bedside_depth_iv"]),
                AttributedBullet("Redness, warmth or blistering at the site requires immediate reporting and evaluation. Distinguishing a simple mechanical problem from tissue-damaging leakage requires the clinical team and the applicable drug-specific procedure.", citationIDs: ["bedside_depth_iv"])
            ]),
            .bullets(title: "Use the drug-specific emergency pathway", [
                AttributedBullet("For suspected extravasation of anti-cancer therapy or contrast, eviQ advises immediately stopping delivery and obtaining assistance. Initially leave the access device in place for trained assessment and aspiration; do not flush it. Notify the treating team and pharmacist and use the local extravasation procedure.", citationIDs: ["bedside_depth_extravasation"]),
                AttributedBullet("Antidotes, warm or cold applications, device removal and follow-up depend on the agent and injury. Do not apply one compress or removal rule to every medication. This brief precaution is not a complete extravasation treatment protocol.", citationIDs: ["bedside_depth_extravasation"])
            ]),
            .bullets(title: "Assess systemic tolerance too", [
                AttributedBullet("Monitor for fluid overload, especially in older adults and people with heart or kidney disease. Increasing respiratory rate or blood pressure, falling oxygen saturation, peripheral edema and new posterior lung crackles warrant assessment and communication.", citationIDs: ["bedside_depth_iv"]),
                AttributedBullet("Include breathing and circulation findings when reporting an infusion concern. A normal-looking insertion site does not establish that the administered fluid or rate is being tolerated systemically.", citationIDs: ["bedside_depth_iv"])
            ]),
            .bullets(title: "Document findings and follow-up", [
                AttributedBullet("Record the site location, fluid or medicine, rate, symptom onset, observed changes and actions taken. Include the response after the infusion was stopped or the access plan changed, and any notifications.", citationIDs: ["bedside_depth_iv"]),
                AttributedBullet("Communicate unresolved pain, swelling, skin changes or systemic symptoms at handoff. Reassessment should verify the patient’s response and whether ongoing treatment has a safe, functional route.", citationIDs: ["bedside_depth_iv"])
            ])
        ],
        citations: [bedside_depth_iv, bedside_depth_extravasation],
        lastSourceFidelityReview: "2026-09-17"
    )
}
