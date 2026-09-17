import Foundation

private let du_depth_urodynamic = CitationSource(
    id: "du_depth_urodynamic", shortName: "NIDDK — Urodynamic testing",
    detail: "September 2021. Test components, preparation, patient experience, catheter-related infection risk and results. Uroflowmetry described as voided volume and flow; no residual-volume diagnostic cutoff or universal fluid schedule. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diagnostic-tests/urodynamic-testing", lastRetrieved: "2026-09-17"
)

private let du_depth_urinary_imaging = CitationSource(
    id: "du_depth_urinary_imaging", shortName: "NIDDK — Urinary tract imaging",
    detail: "April 2020. Imaging purposes and modalities, preparation, implants, pregnancy, reactions and results. Broad contrast-kidney-risk assertions, routine antibiotics and fixed hydration/fasting schedules excluded. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diagnostic-tests/urinary-tract-imaging", lastRetrieved: "2026-09-17"
)

public enum DUDepthUrodynamicTestingPreparationSample {
    public static let entry = ReferenceEntry(
        id: "urodynamic-testing-preparation", title: "Urodynamic testing: preparation and interpretation",
        subtitle: "Bladder storage, emptying, pressure and coordinated function", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the functional question", [
                AttributedBullet("Urodynamic testing evaluates how the bladder, urethra and sphincters store and release urine. Testing may investigate leakage, urgency, frequent urination, painful urination, difficulty starting, incomplete emptying or repeated infections.", citationIDs: ["du_depth_urodynamic"]),
                AttributedBullet("Different tests answer different questions about storage, contraction and emptying. Confirm which components were ordered so the person understands why the visit may involve more than one measurement.", citationIDs: ["du_depth_urodynamic"])
            ]),
            .bullets(title: "Distinguish flow from residual urine", [
                AttributedBullet("Uroflowmetry records the volume passed and the flow rate while the patient urinates into a special toilet or container. The pattern can help the clinician evaluate weak bladder muscles or an obstruction.", citationIDs: ["du_depth_urodynamic"]),
                AttributedBullet("A postvoid residual measurement assesses urine remaining after urination, using ultrasound or a catheter. Flow and residual volume describe different aspects of emptying; the clinician interprets them with the symptoms and other test findings.", citationIDs: ["du_depth_urodynamic"])
            ]),
            .bullets(title: "Explain bladder filling and pressure measurement", [
                AttributedBullet("Cystometry measures bladder capacity, pressure during filling and the point at which the urge to urinate occurs. After the bladder is emptied, a small catheter is used to fill it while the patient reports sensations.", citationIDs: ["du_depth_urodynamic"]),
                AttributedBullet("Another catheter may measure pressure in the rectum or vagina. The team may ask the patient to cough or strain to assess pressure changes or leakage, and may identify contractions that occur unexpectedly.", citationIDs: ["du_depth_urodynamic"])
            ]),
            .bullets(title: "Clarify leak and pressure-flow testing", [
                AttributedBullet("A leak point measurement records pressure when leakage occurs during filling or a requested maneuver. The result helps the clinician understand the urinary problem; it is not the same measurement as urine flow.", citationIDs: ["du_depth_urodynamic"]),
                AttributedBullet("A pressure-flow study assesses pressure and flow together as the person urinates after filling. This can help investigate a bladder-outlet blockage, including obstruction associated with prostate enlargement or pelvic-organ prolapse.", citationIDs: ["du_depth_urodynamic"])
            ]),
            .bullets(title: "Explain muscle and video testing", [
                AttributedBullet("Electromyography records electrical activity around the bladder and sphincters using sensors on the skin or a catheter. It helps assess whether nerve and muscle activity is coordinated.", citationIDs: ["du_depth_urodynamic"]),
                AttributedBullet("Video urodynamics adds ultrasound or x-ray images while the bladder fills and empties. Contrast may be introduced through a catheter for some studies; the team explains which imaging method is planned.", citationIDs: ["du_depth_urodynamic"])
            ]),
            .bullets(title: "Confirm preparation and aftercare", [
                AttributedBullet("Many urodynamic tests need little preparation, but the service may request a full bladder, a change in fluid intake or a medicine adjustment. Follow the instructions for the scheduled tests.", citationIDs: ["du_depth_urodynamic"]),
                AttributedBullet("Mild discomfort with urination can occur for a few hours afterward. Catheter-based testing carries a small infection risk; pain, chills or fever suggesting infection should be reported immediately. Use the clinician’s advice for fluids, comfort measures and any prescribed medicine.", citationIDs: ["du_depth_urodynamic"])
            ]),
            .bullets(title: "Arrange review of the complete study", [
                AttributedBullet("Results from simple tests may be available immediately. Electromyography or video-study interpretation can take longer, and the clinician reviews the results and possible treatment choices with the patient.", citationIDs: ["du_depth_urodynamic"]),
                AttributedBullet("Avoid interpreting a single residual or flow value as a complete diagnosis. The planned assessment includes how the bladder stores, empties and coordinates with the outlet.", citationIDs: ["du_depth_urodynamic"])
            ])
        ],
        citations: [du_depth_urodynamic],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DUDepthUrinaryTractImagingPreparationSample {
    public static let entry = ReferenceEntry(
        id: "urinary-tract-imaging-preparation", title: "Urinary tract imaging: nursing preparation",
        subtitle: "Ultrasound, CT, MRI and functional kidney imaging", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Clarify why imaging is requested", [
                AttributedBullet("Imaging may investigate blood in the urine, pain, repeated infections, difficulty emptying the bladder or suspected kidney disease. Different urinary conditions can produce similar symptoms.", citationIDs: ["du_depth_urinary_imaging"]),
                AttributedBullet("The test may also monitor a known stone, tumor, obstruction or other abnormality. Review the reason for the examination, current symptoms, previous surgery, medicines and relevant allergies with the ordering team.", citationIDs: ["du_depth_urinary_imaging"])
            ]),
            .bullets(title: "Explain ultrasound and x-ray examinations", [
                AttributedBullet("Ultrasound uses sound waves and does not expose the patient to x-rays. Kidney and bladder studies can assess structures such as stones, masses, bladder-wall changes or evidence of obstruction.", citationIDs: ["du_depth_urinary_imaging"]),
                AttributedBullet("Other urinary studies use x-rays. A voiding cystourethrogram images the bladder and urethra during filling and urination, while other x-ray examinations may assess stones or the drainage pathway. Confirm the actual study rather than assuming all imaging is an external scan.", citationIDs: ["du_depth_urinary_imaging"])
            ]),
            .bullets(title: "Differentiate CT and MRI", [
                AttributedBullet("CT combines x-rays and computer processing to show urinary stones, obstruction, infection, tumors or injury. MRI uses magnets and radio waves to produce detailed images without x-rays.", citationIDs: ["du_depth_urinary_imaging"]),
                AttributedBullet("Some studies use contrast. Magnetic resonance urography examines the urinary tract, while magnetic resonance angiography can evaluate the kidney arteries. The ordering clinician and radiology team determine which technique answers the question.", citationIDs: ["du_depth_urinary_imaging"])
            ]),
            .bullets(title: "Describe functional kidney imaging", [
                AttributedBullet("A radionuclide renal scan uses a small amount of radioactive material and a special camera to provide information about kidney function. Its purpose differs from simply showing the shape of an organ.", citationIDs: ["du_depth_urinary_imaging"]),
                AttributedBullet("The clinician may combine information from a renal scan with ultrasound, CT or MRI. Explain which test is planned and direct questions about the tracer or procedure to the imaging service.", citationIDs: ["du_depth_urinary_imaging"])
            ]),
            .bullets(title: "Confirm study-specific preparation", [
                AttributedBullet("Some examinations require a full bladder, fasting, bowel preparation or another instruction; many do not. Obtain the written preparation for the scheduled study rather than applying one instruction to every urinary scan.", citationIDs: ["du_depth_urinary_imaging"]),
                AttributedBullet("Tell the imaging team about possible pregnancy, implanted devices, metal fragments or surgical hardware. Discuss difficulty remaining still or tolerating an enclosed scanner, because the service may plan additional support or sedation.", citationIDs: ["du_depth_urinary_imaging"])
            ]),
            .bullets(title: "Recognize symptoms after instrumentation or contrast", [
                AttributedBullet("A catheter can cause mild temporary urethral discomfort. Pain, chills or fever suggesting infection require prompt contact with the treating team after a catheter-based examination.", citationIDs: ["du_depth_urinary_imaging"]),
                AttributedBullet("Report hives, itching, nausea, vomiting, headache or dizziness after contrast, and changes in breathing or heart rate after sedation. These symptoms need clinical assessment rather than being assumed to be an expected result of imaging.", citationIDs: ["du_depth_urinary_imaging"])
            ]),
            .bullets(title: "Review recovery and result timing", [
                AttributedBullet("After many imaging tests, normal activity can resume promptly, but the instructions depend on any catheter, contrast or sedative used. Follow the imaging service’s discharge advice.", citationIDs: ["du_depth_urinary_imaging"]),
                AttributedBullet("Results from a simple examination may be available sooner than a CT or MRI report. Confirm when and with whom the results will be discussed; completing the scan does not complete clinical interpretation.", citationIDs: ["du_depth_urinary_imaging"])
            ])
        ],
        citations: [du_depth_urinary_imaging],
        lastSourceFidelityReview: "2026-09-17"
    )
}
