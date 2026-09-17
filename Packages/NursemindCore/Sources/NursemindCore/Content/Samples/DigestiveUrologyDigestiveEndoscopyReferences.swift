import Foundation

private let du_depth_colonoscopy = CitationSource(
    id: "du_depth_colonoscopy", shortName: "NIDDK — Colonoscopy",
    detail: "August 2023. Indications, written bowel preparation, sedation, tissue sampling, recovery, delayed bleeding and urgent symptoms. No screening intervals or numerical complication estimates. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diagnostic-tests/colonoscopy", lastRetrieved: "2026-09-17"
)

private let du_depth_egd = CitationSource(
    id: "du_depth_egd", shortName: "NIDDK — Upper GI endoscopy",
    detail: "October 2023. Preparation, medicine review, examination, recovery, tissue results and urgent symptoms. No universal fasting or discharge interval. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diagnostic-tests/upper-gi-endoscopy", lastRetrieved: "2026-09-17"
)

private let du_depth_ercp = CitationSource(
    id: "du_depth_ercp", shortName: "NIDDK — ERCP",
    detail: "January 2024. Duct treatment, preparation, pregnancy discussion, recovery and complications. The source incorrectly groups endoscopic ultrasound with noninvasive tests; that classification is excluded. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diagnostic-tests/endoscopic-retrograde-cholangiopancreatography", lastRetrieved: "2026-09-17"
)

private let du_depth_flex_sig = CitationSource(
    id: "du_depth_flex_sig", shortName: "NIDDK — Flexible sigmoidoscopy",
    detail: "July 2024. Extent of examination, preparation, recovery, biopsy follow-up and complications. No universal preparation or screening schedule. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diagnostic-tests/flexible-sigmoidoscopy", lastRetrieved: "2026-09-17"
)

public enum DUDepthColonoscopyPreparationRecoverySample {
    public static let entry = ReferenceEntry(
        id: "colonoscopy-preparation-recovery", title: "Colonoscopy: preparation and recovery",
        subtitle: "Bowel preparation, tissue results and delayed complications", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the reason for the examination", [
                AttributedBullet("Colonoscopy examines the rectum and colon with a flexible camera. It may investigate rectal bleeding, altered bowel movements, abdominal pain or unexplained weight loss, or screen for colorectal polyps and cancer in a person without symptoms.", citationIDs: ["du_depth_colonoscopy"]),
                AttributedBullet("The clinician can remove polyps and obtain tissue during the examination. Explain whether the planned encounter is screening, investigation of symptoms or follow-up of earlier findings; the indication informs the discussion of results.", citationIDs: ["du_depth_colonoscopy"])
            ]),
            .bullets(title: "Review the preparation plan", [
                AttributedBullet("Review health problems and all prescribed medicines, over-the-counter products, vitamins and supplements with the procedural team. The team selects the bowel preparation and provides written instructions for its timing and the permitted diet.", citationIDs: ["du_depth_colonoscopy"]),
                AttributedBullet("A clear-liquid diet excludes pulp, solids and cream. The instructions may also restrict red or purple liquids and high-fiber foods before the procedure. Use the actual written plan rather than substituting a standard diet schedule.", citationIDs: ["du_depth_colonoscopy"])
            ]),
            .bullets(title: "Check whether the bowel preparation was completed", [
                AttributedBullet("A clean colon allows the clinician to inspect its lining; remaining stool can obscure the view. Bowel preparation may use liquid, powder or pill laxatives, sometimes with an enema, according to the selected regimen.", citationIDs: ["du_depth_colonoscopy"]),
                AttributedBullet("The preparation causes diarrhea, so access to a bathroom matters. Contact the procedural team when side effects prevent completion. NIDDK describes clear liquid stool after complete preparation; report incomplete intake or ongoing stool rather than assuming the examination can proceed unchanged.", citationIDs: ["du_depth_colonoscopy"])
            ]),
            .bullets(title: "Explain sedation and sampling", [
                AttributedBullet("Sedatives, anesthesia or pain medicine may be given through an IV. The clinician passes the scope through the anus, introduces air to improve the view and may change the person’s position during examination.", citationIDs: ["du_depth_colonoscopy"]),
                AttributedBullet("Polyps or abnormal tissue may be sent to a laboratory. Arrange the ride home before the procedure because recovery from sedation or anesthesia takes time and the patient should not drive afterward.", citationIDs: ["du_depth_colonoscopy"])
            ]),
            .bullets(title: "Separate expected discomfort from warning signs", [
                AttributedBullet("Cramping and bloating can occur early in recovery. Light rectal bleeding may follow a biopsy or polyp removal, and the discharge instructions should explain what to expect for the work that was performed.", citationIDs: ["du_depth_colonoscopy"]),
                AttributedBullet("NIDDK advises prompt medical care for severe abdominal pain, fever, dizziness, weakness, bloody bowel movements that do not improve or rectal bleeding that does not stop. Do not reassure a patient with these symptoms solely because a biopsy was performed.", citationIDs: ["du_depth_colonoscopy"])
            ]),
            .bullets(title: "Include delayed bleeding in discharge teaching", [
                AttributedBullet("Complications include bleeding, a perforation and a reaction to sedation affecting breathing or the heart. Bleeding may develop after discharge, including up to two weeks after the procedure.", citationIDs: ["du_depth_colonoscopy"]),
                AttributedBullet("Review the urgent-contact instructions before the person leaves. Persistent bleeding or systemic symptoms require assessment even when the immediate recovery period was uncomplicated.", citationIDs: ["du_depth_colonoscopy"])
            ]),
            .bullets(title: "Close the result-follow-up loop", [
                AttributedBullet("The clinician may share visible findings after the sedative wears off. Tissue results take longer because a pathologist examines the samples, and the team may call or arrange another appointment.", citationIDs: ["du_depth_colonoscopy"]),
                AttributedBullet("Clarify how biopsy or polyp results will be communicated. The person should follow the individual diet and activity instructions and the clinician’s plan for any subsequent examination.", citationIDs: ["du_depth_colonoscopy"])
            ])
        ],
        citations: [du_depth_colonoscopy],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DUDepthUpperGiEndoscopyPreparationRecoverySample {
    public static let entry = ReferenceEntry(
        id: "upper-gi-endoscopy-preparation-recovery", title: "Upper GI endoscopy: preparation and recovery",
        subtitle: "EGD, medicine review, swallowing symptoms and tissue follow-up", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Explain the examination and possible treatment", [
                AttributedBullet("Upper GI endoscopy, also called EGD or esophagogastroduodenoscopy, examines the esophagus, stomach and duodenum. It can investigate persistent heartburn, pain, vomiting or swallowing difficulty.", citationIDs: ["du_depth_egd"]),
                AttributedBullet("The clinician may collect tissue, cells or fluid, treat bleeding, remove a growth or open a narrowed area of the esophagus. The planned procedure may therefore include more than viewing the lining.", citationIDs: ["du_depth_egd"])
            ]),
            .bullets(title: "Review medicines and the medical history", [
                AttributedBullet("The procedural team needs the history of health problems, allergies and current symptoms, together with prescription medicines, over-the-counter products, vitamins and supplements. NIDDK specifically highlights blood thinners, aspirin, NSAIDs, iron and medicines for diabetes or blood pressure.", citationIDs: ["du_depth_egd"]),
                AttributedBullet("Some medicines need temporary adjustment, while many can continue. Obtain the procedural team’s instructions for the actual medicine list; this reference does not supply a blanket instruction to stop anticoagulation or diabetes treatment.", citationIDs: ["du_depth_egd"])
            ]),
            .bullets(title: "Confirm fasting and the ride home", [
                AttributedBullet("The stomach needs to be prepared according to the team’s food and drink restrictions. Fasting instructions can differ between patients, so confirm the specific start and stop times supplied by the procedural service.", citationIDs: ["du_depth_egd"]),
                AttributedBullet("Arrange transportation before the encounter. Sedation can affect driving after the examination, and discharge teaching may also be shared with the patient’s chosen support person.", citationIDs: ["du_depth_egd"])
            ]),
            .bullets(title: "Describe the procedure experience", [
                AttributedBullet("An IV sedative is often used, and a liquid or spray may numb the throat to reduce gagging. The patient generally lies on the side while the clinician passes the scope into the upper digestive tract.", citationIDs: ["du_depth_egd"]),
                AttributedBullet("Air improves the view, and instruments passed through the scope can obtain samples or perform treatment. Some people do not require sedation; explain the actual anesthesia plan rather than promising sleep or a particular experience.", citationIDs: ["du_depth_egd"])
            ]),
            .bullets(title: "Support recovery and recognize complications", [
                AttributedBullet("Temporary bloating, nausea or sore throat may occur afterward. The person remains in recovery while the sedative wears off, and some patients need an overnight stay. Follow the individual discharge instructions.", citationIDs: ["du_depth_egd"]),
                AttributedBullet("Potential complications include bleeding, a perforation and a sedative reaction involving breathing or the heart. The possibility of a complication changes how worsening symptoms are assessed after the procedure.", citationIDs: ["du_depth_egd"])
            ]),
            .bullets(title: "Teach the symptoms that need prompt care", [
                AttributedBullet("NIDDK advises immediate medical assessment for breathing problems, worsening swallowing difficulty or throat pain, worsening chest or abdominal pain, or fever after EGD.", citationIDs: ["du_depth_egd"]),
                AttributedBullet("Vomiting, particularly vomit containing blood or resembling coffee grounds, and bloody or black tar-colored stool also need prompt evaluation. These findings should not be dismissed as the expected short-lived sore throat or bloating.", citationIDs: ["du_depth_egd"])
            ]),
            .bullets(title: "Distinguish visual findings from tissue results", [
                AttributedBullet("Some findings are available immediately, but tissue, cell and fluid studies may take several days or longer. A pathologist examines submitted samples before those results are available.", citationIDs: ["du_depth_egd"]),
                AttributedBullet("Confirm whether the service will call or arrange a follow-up appointment. A reassuring immediate visual report does not replace review of the samples taken during the examination.", citationIDs: ["du_depth_egd"])
            ])
        ],
        citations: [du_depth_egd],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DUDepthErcpPreparationRecoverySample {
    public static let entry = ReferenceEntry(
        id: "ercp-preparation-recovery", title: "ERCP: preparation and recovery",
        subtitle: "Bile and pancreatic duct treatment, recovery and complications", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Understand the purpose of ERCP", [
                AttributedBullet("Endoscopic retrograde cholangiopancreatography combines endoscopy with x-ray imaging to evaluate and treat the bile and pancreatic ducts. It is commonly used when a duct is narrowed, blocked or leaking.", citationIDs: ["du_depth_ercp"]),
                AttributedBullet("The team generally uses ERCP when treatment is expected. Other tests, such as MRCP or ultrasound, may answer a diagnostic question with less risk; the treating clinician decides which examination fits the problem.", citationIDs: ["du_depth_ercp"])
            ]),
            .bullets(title: "Verify preparation and pregnancy information", [
                AttributedBullet("Review current symptoms, health problems, allergies, prescribed and nonprescription medicines, vitamins and supplements. The team may adjust medicines such as blood thinners or diabetes treatment for the procedure.", citationIDs: ["du_depth_ercp"]),
                AttributedBullet("Report a known or possible pregnancy before the examination because ERCP involves x-rays and the team may modify the approach. Confirm the individualized fasting instructions and arrange a ride home after sedation or anesthesia.", citationIDs: ["du_depth_ercp"])
            ]),
            .bullets(title: "Explain duct imaging and intervention", [
                AttributedBullet("The clinician passes an endoscope through the mouth to the duodenum, then guides a small catheter through the scope into the ducts. Contrast material and fluoroscopy make duct narrowing or blockage visible.", citationIDs: ["du_depth_ercp"]),
                AttributedBullet("Small instruments can treat the duct problem or obtain tissue samples. Sedation, throat numbing or general anesthesia may be used according to the procedure plan; the patient’s recovery depends in part on that plan.", citationIDs: ["du_depth_ercp"])
            ]),
            .bullets(title: "Clarify observation and return to eating", [
                AttributedBullet("Bloating, nausea or sore throat can occur for a short time after ERCP. Observation allows sedation or anesthesia to wear off, and some people remain in the hospital overnight.", citationIDs: ["du_depth_ercp"]),
                AttributedBullet("The clinician may initially recommend clear liquids and delay solid food. Review the actual diet instructions rather than automatically using the diet plan from another endoscopy procedure.", citationIDs: ["du_depth_ercp"])
            ]),
            .bullets(title: "Recognize the important complications", [
                AttributedBullet("ERCP can cause pancreatitis, infection of the bile ducts or gallbladder, bleeding, perforation of a duct or the duodenum, or a reaction to sedation involving the heart or breathing.", citationIDs: ["du_depth_ercp"]),
                AttributedBullet("Complications may require hospital treatment. Recovery teaching should include which symptoms prompt urgent assessment, because a completed procedure does not exclude a problem developing afterward.", citationIDs: ["du_depth_ercp"])
            ]),
            .bullets(title: "Make urgent-return instructions explicit", [
                AttributedBullet("Seek prompt medical care for severe chest or abdominal pain, fever, breathing difficulty, worsening throat pain or trouble swallowing after ERCP.", citationIDs: ["du_depth_ercp"]),
                AttributedBullet("Bloody or black tar-colored stool and vomiting, especially blood or coffee-ground material, also require prompt evaluation. Do not wait for a routine follow-up call when these symptoms are present.", citationIDs: ["du_depth_ercp"])
            ]),
            .bullets(title: "Track immediate and pending results", [
                AttributedBullet("The clinician may explain available findings after sedation wears off. If tissue was collected, the pathologist’s report may take several days or longer.", citationIDs: ["du_depth_ercp"]),
                AttributedBullet("Review the home-care instructions with the patient and their chosen support person, including the plan for diet, results and follow-up. Confirm which findings remain pending after the initial procedure discussion.", citationIDs: ["du_depth_ercp"])
            ])
        ],
        citations: [du_depth_ercp],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DUDepthFlexibleSigmoidoscopyPreparationRecoverySample {
    public static let entry = ReferenceEntry(
        id: "flexible-sigmoidoscopy-preparation-recovery", title: "Flexible sigmoidoscopy: preparation and recovery",
        subtitle: "Lower-colon examination, preparation and subsequent colonoscopy", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Clarify which part of the bowel is examined", [
                AttributedBullet("Flexible sigmoidoscopy examines the rectum and lower colon. It can identify inflammation, ulcers, polyps or cancer and may investigate bleeding, altered bowel movements, abdominal pain or unexplained weight loss.", citationIDs: ["du_depth_flex_sig"]),
                AttributedBullet("The examination does not show the entire colon. A clinician may recommend colonoscopy afterward if polyps or other abnormal tissue are found, so the initial procedure may be one part of the evaluation.", citationIDs: ["du_depth_flex_sig"])
            ]),
            .bullets(title: "Use the prescribed preparation", [
                AttributedBullet("Review health problems, medicines, vitamins and supplements with the team. Preparation may include dietary changes and an enema or laxative regimen; it often requires less bowel preparation than colonoscopy.", citationIDs: ["du_depth_flex_sig"]),
                AttributedBullet("Written instructions define what to eat and drink and when to use the preparation. Remaining stool can obscure the lining, so report side effects that prevent completing the plan instead of substituting an unapproved regimen.", citationIDs: ["du_depth_flex_sig"])
            ]),
            .bullets(title: "Describe the examination experience", [
                AttributedBullet("The patient generally lies on the left side as the clinician inserts the scope through the anus. Air improves visibility, and pressure or cramping may occur during the examination.", citationIDs: ["du_depth_flex_sig"]),
                AttributedBullet("Sedation or anesthesia is usually unnecessary, but the actual plan should be confirmed. The clinician may remove polyps or take tissue samples through the scope for laboratory examination.", citationIDs: ["du_depth_flex_sig"])
            ]),
            .bullets(title: "Match recovery teaching to what was done", [
                AttributedBullet("Cramping or bloating can occur afterward. If no sedative or anesthesia was used, many people can resume normal diet and activities promptly, following their discharge instructions.", citationIDs: ["du_depth_flex_sig"]),
                AttributedBullet("Light rectal bleeding may occur after a biopsy or polyp removal. Explain the expected course alongside the warning signs, rather than presenting all bleeding as harmless.", citationIDs: ["du_depth_flex_sig"])
            ]),
            .bullets(title: "Include delayed complications", [
                AttributedBullet("Potential complications include bleeding, perforation and severe abdominal pain. Bleeding may begin several days after the examination, even if the immediate recovery was uncomplicated.", citationIDs: ["du_depth_flex_sig"]),
                AttributedBullet("NIDDK advises prompt care for severe abdominal pain or bloating, fever, vomiting, dizziness, weakness, persistent rectal bleeding or bloody bowel movements that do not improve.", citationIDs: ["du_depth_flex_sig"])
            ]),
            .bullets(title: "Complete pathology and whole-colon follow-up", [
                AttributedBullet("Visible findings may be discussed immediately, while a pathologist’s examination of tissue can take several days or longer. The service may call or arrange an appointment to review those results.", citationIDs: ["du_depth_flex_sig"]),
                AttributedBullet("Confirm whether a full colonoscopy is recommended and how it will be arranged. Completion of a lower-colon examination is not the same as completion of a planned whole-colon evaluation.", citationIDs: ["du_depth_flex_sig"])
            ])
        ],
        citations: [du_depth_flex_sig],
        lastSourceFidelityReview: "2026-09-17"
    )
}
