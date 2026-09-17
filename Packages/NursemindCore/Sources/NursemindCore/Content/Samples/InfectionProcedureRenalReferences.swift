import Foundation

private let ip_depth_hd = CitationSource(
    id: "ip_depth_hd", shortName: "NIDDK — Hemodialysis",
    detail: "January 2018 source review; access types, access care, treatment tolerance and access complications. No universal dialysis prescription or cannulation protocol. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/kidney-failure/hemodialysis", lastRetrieved: "2026-09-17"
)

private let ip_depth_pd_cdc = CitationSource(
    id: "ip_depth_pd_cdc", shortName: "CDC — Peritoneal dialysis infection prevention",
    detail: "July 10, 2026; catheter-related infection risks, prevention, cloudy effluent and exit-site assessment. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention", license: .publicDomain,
    url: "https://www.cdc.gov/dialysis-safety/hcp/peritoneal-dialysis/index.html", lastRetrieved: "2026-09-17"
)

private let ip_depth_pd = CitationSource(
    id: "ip_depth_pd", shortName: "NIDDK — Peritoneal dialysis",
    detail: "Patient training, exit-site and supply care, exchange preparation, infection symptoms and prompt assessment. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/kidney-failure/peritoneal-dialysis", lastRetrieved: "2026-09-17"
)

private let ip_depth_nephrotic = CitationSource(
    id: "ip_depth_nephrotic", shortName: "NIDDK — Nephrotic syndrome in adults",
    detail: "October 2020 source review; symptoms, protein loss, complications, tests, cause-specific treatment and individualized diet. Drug regimens and universal anticoagulation rules excluded. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/nephrotic-syndrome-adults", lastRetrieved: "2026-09-17"
)

private let ip_depth_stones_symptoms = CitationSource(
    id: "ip_depth_stones_symptoms", shortName: "NIDDK — Kidney stone symptoms",
    detail: "May 2017 source review; pain, urinary symptoms and prompt clinical evaluation. Symptoms do not independently establish a stone diagnosis. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/kidney-stones/symptoms-causes", lastRetrieved: "2026-09-17"
)

private let ip_depth_stones = CitationSource(
    id: "ip_depth_stones", shortName: "NIDDK — Kidney stone treatment",
    detail: "May 2017 source review; stone passage, procedures, stone analysis, fluid-plan individualization and recurrence evaluation. Medication table and fixed fluid targets excluded. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/kidney-stones/treatment", lastRetrieved: "2026-09-17"
)

public enum IPDepthHemodialysisAccessObservationSample {
    public static let entry = ReferenceEntry(
        id: "hemodialysis-access-observation", title: "Hemodialysis access: daily observation",
        subtitle: "Fistula, graft and catheter identification with early problem recognition", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the access before care", [
                AttributedBullet("An arteriovenous fistula connects an artery to a vein, while an arteriovenous graft uses an implanted tube to connect them. A venous catheter provides access through a large vein. Identify the actual access type and the dialysis team’s care instructions.", citationIDs: ["ip_depth_hd"]),
                AttributedBullet("Fistulas need time to develop before use; grafts can generally be used sooner but have more clotting and infection problems. Access readiness and suitability require the dialysis and vascular teams’ assessment, not the appearance of the incision alone.", citationIDs: ["ip_depth_hd"])
            ]),
            .bullets(title: "Inspect the fistula or graft", [
                AttributedBullet("Follow the dialysis team’s daily cleaning instructions and observe the access area for warmth, redness or other changes that may indicate infection. Report concerns to the dialysis center so problems can be assessed before the next treatment.", citationIDs: ["ip_depth_hd"]),
                AttributedBullet("NIDDK describes a palpable vibration over a functioning access. If the usual vibration cannot be felt, notify the dialysis center. A change in this finding can be important even when the skin looks unchanged.", citationIDs: ["ip_depth_hd"])
            ]),
            .bullets(title: "Recognize loss of access function", [
                AttributedBullet("Any vascular access can become infected or develop poor flow or blockage from a clot or scar. Access complications can prevent effective dialysis and may require a procedure to repair or replace the access.", citationIDs: ["ip_depth_hd"]),
                AttributedBullet("Communicate the access type, the observed change and any effect on treatment. A functional-access concern needs the dialysis team’s assessment; repeated attempts to use a poorly functioning access are not a substitute for that review.", citationIDs: ["ip_depth_hd"])
            ]),
            .bullets(title: "Watch the patient during treatment", [
                AttributedBullet("Rapid changes in fluid and chemical balance during hemodialysis can cause muscle cramps or low blood pressure. Weakness, dizziness and nausea can accompany hypotension and should be reported during treatment.", citationIDs: ["ip_depth_hd"]),
                AttributedBullet("The dialysis team may adjust the prescribed treatment to improve tolerance. Document the symptoms and response rather than treating cramps or dizziness as an unavoidable part of every dialysis session.", citationIDs: ["ip_depth_hd"])
            ]),
            .bullets(title: "Prepare for a disconnection or bleeding problem", [
                AttributedBullet("A needle leaving the access or tubing disconnecting from the dialysis system can cause blood loss. Staff and trained home-dialysis partners need to recognize the problem and use the emergency procedure taught by the dialysis program.", citationIDs: ["ip_depth_hd"]),
                AttributedBullet("Report an access or circuit problem promptly while obtaining the necessary clinical help. This guide does not authorize cannulation, access manipulation or a universal clamp sequence for unfamiliar dialysis equipment.", citationIDs: ["ip_depth_hd"])
            ]),
            .bullets(title: "Keep treatment continuity visible", [
                AttributedBullet("Follow-up combines how the person feels with laboratory measures and the dialysis team’s assessment of treatment effectiveness. Access problems, interrupted treatments and recurring intolerance need communication because they can affect delivered therapy.", citationIDs: ["ip_depth_hd"]),
                AttributedBullet("Include the current access, recent complications and the dialysis contact plan during transfers or discharge teaching. The goal is a usable access and an achievable treatment plan, with concerns brought to the team before they become a missed-treatment crisis.", citationIDs: ["ip_depth_hd"])
            ])
        ],
        citations: [ip_depth_hd],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum IPDepthPeritonealDialysisInfectionRecognitionSample {
    public static let entry = ReferenceEntry(
        id: "peritoneal-dialysis-infection-recognition", title: "Peritoneal dialysis: infection recognition",
        subtitle: "Cloudy effluent, abdominal symptoms and exit-site changes", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Understand where infection can develop", [
                AttributedBullet("Peritoneal dialysis uses the abdominal lining to remove waste and excess fluid. Repeated access through the abdominal catheter creates opportunities for microorganisms to enter during catheter handling and exchanges.", citationIDs: ["ip_depth_pd_cdc"]),
                AttributedBullet("Infection may affect the peritoneum or the catheter exit site. Observation should therefore include the person’s symptoms, the drained fluid and the tissue around the catheter, rather than checking only one of these areas.", citationIDs: ["ip_depth_pd_cdc"])
            ]),
            .bullets(title: "Recognize possible peritonitis", [
                AttributedBullet("Cloudy drained dialysis fluid, abdominal pain or tenderness, and fever or chills are common concerning findings. New symptoms or a change in effluent appearance warrant prompt clinical evaluation and treatment when infection is suspected.", citationIDs: ["ip_depth_pd_cdc"]),
                AttributedBullet("Do not wait for every symptom to occur before reporting a concern. Describe the change and its timing to the dialysis team; this guide does not diagnose peritonitis from fluid appearance alone or supply an antibiotic regimen.", citationIDs: ["ip_depth_pd_cdc"])
            ]),
            .bullets(title: "Assess the exit site separately", [
                AttributedBullet("Look for redness, swelling, drainage, pain or tenderness at the exit site. New local findings need evaluation even if the drained fluid is not visibly cloudy.", citationIDs: ["ip_depth_pd_cdc"]),
                AttributedBullet("Preserving catheter-site integrity and performing routine exit-site care are infection-prevention priorities. Follow the dialysis program’s method and report a change instead of independently adding an antiseptic or topical medicine.", citationIDs: ["ip_depth_pd_cdc"])
            ]),
            .bullets(title: "Prepare a clean exchange environment", [
                AttributedBullet("Use the training provided by the dialysis team. NIDDK describes a clean, dry, well-lit exchange area, handwashing before handling the catheter and a surgical mask during exchanges.", citationIDs: ["ip_depth_pd"]),
                AttributedBullet("Store supplies in a cool, clean, dry location and inspect each unused solution bag for evidence of contamination such as cloudiness. These checks concern the fresh supply as well as the appearance of fluid after an exchange.", citationIDs: ["ip_depth_pd"])
            ]),
            .bullets(title: "Keep technique and support reliable", [
                AttributedBullet("Aseptic technique, hand hygiene, routine catheter care and ongoing training reduce opportunities for contamination. Dialysis teams support patients with teaching and continued monitoring as needs change.", citationIDs: ["ip_depth_pd_cdc"]),
                AttributedBullet("Raise questions when the person or caregiver cannot reliably complete the trained steps. Infection prevention depends on a workable process and supplies, not simply on documentation that initial training once occurred.", citationIDs: ["ip_depth_pd_cdc"])
            ]),
            .bullets(title: "Arrange prompt help and continuity", [
                AttributedBullet("NIDDK advises immediate care for infection symptoms, including abdominal pain, fever, nausea or vomiting, unusual used-fluid color or cloudiness, and pain or redness around the catheter. A catheter cuff moving outward also needs assessment.", citationIDs: ["ip_depth_pd"]),
                AttributedBullet("Keep the dialysis team’s urgent contact pathway available. Include recent symptoms, fluid appearance and catheter changes when care transfers. Early evaluation supports timely treatment; the clinician determines specimen collection and the treatment plan.", citationIDs: ["ip_depth_pd"])
            ])
        ],
        citations: [ip_depth_pd_cdc, ip_depth_pd],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum IPDepthNephroticSyndromeFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "nephrotic-syndrome-follow-up", title: "Nephrotic syndrome: nursing follow-up",
        subtitle: "Protein loss, edema, complications and the cause-specific plan", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Connect the main findings", [
                AttributedBullet("Nephrotic syndrome combines excessive urinary protein loss, low blood albumin, edema and high blood lipids. Damage affecting the kidney’s filtering units allows proteins that should stay in the blood to pass into urine.", citationIDs: ["ip_depth_nephrotic"]),
                AttributedBullet("The syndrome has several possible causes, including kidney-limited disorders and systemic conditions such as diabetes or lupus. The cause and degree of kidney injury influence treatment and follow-up; the label alone does not define one regimen.", citationIDs: ["ip_depth_nephrotic"])
            ]),
            .bullets(title: "Track symptoms and fluid changes", [
                AttributedBullet("Ask about foamy urine, tiredness, appetite and swelling. Edema may involve the eyelids, legs, ankles, feet or lower abdomen, and retained fluid can cause weight gain.", citationIDs: ["ip_depth_nephrotic"]),
                AttributedBullet("Communicate the pattern and progression of symptoms to the treating team. Changes in appearance and function contribute to assessment alongside laboratory results rather than replacing urine and blood testing.", citationIDs: ["ip_depth_nephrotic"])
            ]),
            .bullets(title: "Understand the ordered testing", [
                AttributedBullet("Urine testing identifies protein loss. A timed collection or urine albumin-to-creatinine ratio may be used, while blood tests assess low protein levels and related abnormalities. Explain the actual ordered collection method.", citationIDs: ["ip_depth_nephrotic"]),
                AttributedBullet("Additional blood tests, kidney imaging or a biopsy may help identify the underlying cause and assess kidney function. A follow-up result needs interpretation with the clinical picture and the purpose of the test.", citationIDs: ["ip_depth_nephrotic"])
            ]),
            .bullets(title: "Recognize important complications", [
                AttributedBullet("Nephrotic syndrome increases the risk of blood clots and infection and may be associated with hypertension and worsening kidney function. Loss of protective blood proteins contributes to some of these risks.", citationIDs: ["ip_depth_nephrotic"]),
                AttributedBullet("Include infection concerns, new symptoms and changes in kidney or blood-pressure findings in clinical follow-up. The responsible team determines whether additional assessment, preventive measures or treatment is needed.", citationIDs: ["ip_depth_nephrotic"])
            ]),
            .bullets(title: "Review what each prescribed medicine addresses", [
                AttributedBullet("Treatment may include medicines that reduce blood pressure and urinary protein loss, diuretics for edema, and other medicines for associated complications. Some underlying causes require immune-suppressing treatment.", citationIDs: ["ip_depth_nephrotic"]),
                AttributedBullet("Reconcile the prescribed plan and questions with the treating team. This reference does not assume that every patient needs anticoagulation, an immune-suppressing medicine or the same combination of therapies.", citationIDs: ["ip_depth_nephrotic"])
            ]),
            .bullets(title: "Individualize nutrition and long-term follow-up", [
                AttributedBullet("The team may recommend limiting sodium and fluids to help manage edema and adjusting dietary fat and cholesterol for lipid abnormalities. Nutrition advice supports symptom management; diet has not been shown to cause or prevent the syndrome itself.", citationIDs: ["ip_depth_nephrotic"]),
                AttributedBullet("Symptoms may resolve after treatment, recur after remission or progress with kidney disease. Maintain follow-up for the underlying cause and ongoing kidney function rather than assuming that reduced swelling ends the need for monitoring.", citationIDs: ["ip_depth_nephrotic"])
            ])
        ],
        citations: [ip_depth_nephrotic],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum IPDepthKidneyStoneRecoveryPreventionSample {
    public static let entry = ReferenceEntry(
        id: "kidney-stone-recovery-prevention", title: "Kidney stones: recovery and recurrence prevention",
        subtitle: "Passage, procedures, stone analysis and individualized fluids", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Recognize symptoms needing assessment", [
                AttributedBullet("Sharp pain in the back, side, lower abdomen or groin, blood in urine, painful or frequent urination and difficulty passing urine need clinical assessment. The symptoms may reflect a stone or another condition.", citationIDs: ["ip_depth_stones_symptoms"]),
                AttributedBullet("Nausea, vomiting, fever or chills can accompany urinary symptoms. Do not assume that recurrent pain is automatically the same uncomplicated stone problem as a previous episode; communicate new symptoms promptly.", citationIDs: ["ip_depth_stones_symptoms"])
            ]),
            .bullets(title: "Understand why the treatment plan differs", [
                AttributedBullet("Treatment depends on stone size, location and type. Some small stones pass without a removal procedure, while obstruction, severe pain or larger stones may require urgent treatment.", citationIDs: ["ip_depth_stones"]),
                AttributedBullet("Persistent vomiting and dehydration may require hospital care. The clinician determines pain treatment, fluids and the need for intervention; this guide does not prescribe forced fluid intake during an obstructed or poorly tolerated episode.", citationIDs: ["ip_depth_stones"])
            ]),
            .bullets(title: "Prepare for the proposed procedure", [
                AttributedBullet("Removal options include shock-wave treatment, cystoscopy or ureteroscopy, and percutaneous nephrolithotomy. These procedures use different approaches and may involve anesthesia, same-day discharge or a hospital stay.", citationIDs: ["ip_depth_stones"]),
                AttributedBullet("A ureteral stent may be left to support drainage or stone passage. Include the stent and the individual urology instructions in the recovery discussion; the presence of a stent does not mean follow-up is optional.", citationIDs: ["ip_depth_stones"])
            ]),
            .bullets(title: "Preserve the information from the stone", [
                AttributedBullet("If requested, collect a passed stone or stone fragments using the supplied method so the laboratory can determine the type. Stone analysis helps the team identify prevention measures relevant to that person.", citationIDs: ["ip_depth_stones"]),
                AttributedBullet("A 24-hour urine collection may assess urine volume and mineral levels after a stone passes or is removed. Follow the collection instructions carefully so the result can inform the recurrence-prevention plan.", citationIDs: ["ip_depth_stones"])
            ]),
            .bullets(title: "Agree on a safe fluid and food plan", [
                AttributedBullet("Adequate liquid intake helps prevent many stone types, but the appropriate amount depends on health conditions, activity and climate. Kidney failure and other conditions may limit fluid intake, so use the individualized plan.", citationIDs: ["ip_depth_stones"]),
                AttributedBullet("Diet changes should be based on stone type and the clinical evaluation. Do not assume one universal food restriction or fluid target is appropriate for everyone with a history of stones.", citationIDs: ["ip_depth_stones"])
            ]),
            .bullets(title: "Maintain prevention and follow-up", [
                AttributedBullet("Some people receive medicines to reduce recurrence, selected according to stone type and other findings. Review the prescribed purpose, duration and possible adverse effects with the clinical team; this reference does not reproduce a medication regimen.", citationIDs: ["ip_depth_stones"]),
                AttributedBullet("Report treatment problems and complete the recommended urology and laboratory follow-up. Removing one stone addresses the immediate event, while understanding its cause supports prevention of another episode.", citationIDs: ["ip_depth_stones"])
            ])
        ],
        citations: [ip_depth_stones_symptoms, ip_depth_stones],
        lastSourceFidelityReview: "2026-09-17"
    )
}
