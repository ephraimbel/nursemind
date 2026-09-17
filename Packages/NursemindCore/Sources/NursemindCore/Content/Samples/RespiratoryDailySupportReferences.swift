import Foundation

private let resp_cpap = CitationSource(
    id: "resp_cpap", shortName: "NHLBI — CPAP",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Heart, Lung, and Blood Institute", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/cpap", lastRetrieved: "2026-09-17"
)

private let resp_pap_daily = CitationSource(
    id: "resp_pap_daily", shortName: "NHLBI — Living with sleep apnea",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Heart, Lung, and Blood Institute", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/sleep-apnea/living-with", lastRetrieved: "2026-09-17"
)

private let resp_cpap_cleaning = CitationSource(
    id: "resp_cpap_cleaning", shortName: "FDA — Cleaning CPAP equipment",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "U.S. Food and Drug Administration", license: .publicDomain,
    url: "https://www.fda.gov/consumers/consumer-updates/do-you-need-device-claims-clean-cpap-machine", lastRetrieved: "2026-09-17"
)

private let resp_oxygen = CitationSource(
    id: "resp_oxygen", shortName: "NHLBI — Oxygen therapy",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Heart, Lung, and Blood Institute", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/lung-treatments", lastRetrieved: "2026-09-17"
)

private let resp_oxygen_fire = CitationSource(
    id: "resp_oxygen_fire", shortName: "USFA — Medical oxygen and home fire safety",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "U.S. Fire Administration, FEMA", license: .publicDomain,
    url: "https://www.usfa.fema.gov/downloads/fief/handouts/fief_older_adults_flyer_custom.pdf", lastRetrieved: "2026-09-17"
)

private let resp_oximeter = CitationSource(
    id: "resp_oximeter", shortName: "FDA — Pulse oximeter basics",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "U.S. Food and Drug Administration", license: .publicDomain,
    url: "https://www.fda.gov/consumers/consumer-updates/pulse-oximeter-basics", lastRetrieved: "2026-09-17"
)

private let resp_rehab = CitationSource(
    id: "resp_rehab", shortName: "NHLBI — Pulmonary rehabilitation",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Heart, Lung, and Blood Institute", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/pulmonary-rehabilitation", lastRetrieved: "2026-09-17"
)

private let resp_copd_daily = CitationSource(
    id: "resp_copd_daily", shortName: "NHLBI — Living with COPD",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Heart, Lung, and Blood Institute", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/copd/living-with", lastRetrieved: "2026-09-17"
)

public enum CPAPDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "cpap-daily-support", title: "CPAP use and daily support",
        subtitle: "Mask fit, comfort, equipment cleaning and follow-up", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Explain the purpose", [
                AttributedBullet("Continuous positive airway pressure keeps the airway open during sleep. The clinician sets the pressure and reviews treatment response. This guide addresses ongoing sleep-apnea support; it does not describe initiation of acute noninvasive ventilation.", citationIDs: ["resp_cpap"])
            ]),
            .bullets(title: "Make use practical", [
                AttributedBullet("Prescribed PAP therapy is used during naps and overnight sleep, including when traveling. Adjustment takes time. Practicing with the mask while awake can help a person become familiar with the equipment.", citationIDs: ["resp_pap_daily"]),
                AttributedBullet("Check fit with the patient lying down and the machine running. Air leakage, a mask that slips, noise or claustrophobia should prompt discussion of fit and equipment options with the provider.", citationIDs: ["resp_pap_daily"])
            ]),
            .bullets(title: "Ask about comfort and benefit", [
                AttributedBullet("Review sleep quality, daytime sleepiness and snoring, as well as congestion, dry mouth, nosebleeds or mask irritation. Report persistent problems so the team can assess the mask, humidification and prescribed settings.", citationIDs: ["resp_cpap"]),
                AttributedBullet("Difficulty falling asleep, nasal symptoms or discomfort can undermine regular use. Discuss these barriers directly; the provider may recommend a different interface or machine rather than leaving the patient to abandon treatment.", citationIDs: ["resp_pap_daily"])
            ]),
            .bullets(title: "Clean the actual equipment", [
                AttributedBullet("Use the manufacturer’s cleaning instructions and replacement schedule for masks, tubing, filters and humidifier parts. Detachable accessories commonly use mild soap and water. The powered machine must not be immersed in liquid.", citationIDs: ["resp_cpap_cleaning"]),
                AttributedBullet("An add-on bacterial-reduction device does not replace routine cleaning. FDA reports describe breathing symptoms after ozone-cleaner use; ozone and ultraviolet products can also damage equipment. Check authorization and device compatibility rather than relying on advertising.", citationIDs: ["resp_cpap_cleaning"])
            ]),
            .bullets(title: "Review effectiveness over time", [
                AttributedBullet("Regular follow-up and device data help the team assess use and whether settings control apnea. Major weight changes or persistent symptoms may lead to repeat sleep testing. Setting adjustments require the treating team.", citationIDs: ["resp_cpap", "resp_pap_daily"])
            ])
        ],
        citations: [resp_cpap, resp_pap_daily, resp_cpap_cleaning],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HomeOxygenSafetySample {
    public static let entry = ReferenceEntry(
        id: "home-oxygen-and-oximetry", title: "Home oxygen and pulse oximetry",
        subtitle: "Fire prevention, symptom review and measurement limitations", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Explain oxygen therapy", [
                AttributedBullet("Oxygen therapy delivers additional oxygen through a prescribed interface, such as nasal tubing or a mask, when blood oxygen is too low. It may be needed temporarily or long term. Nasal dryness, nosebleeds or morning headaches deserve discussion with the care team.", citationIDs: ["resp_oxygen"])
            ]),
            .bullets(title: "Review the home fire plan", [
                AttributedBullet("Medical oxygen increases fire and burn risk. No one should smoke in a home where it is used. Keep candles, matches, lighters and other open flames away, and keep oils and grease away from oxygen valves.", citationIDs: ["resp_oxygen_fire"]),
                AttributedBullet("Confirm working smoke alarms and an escape route that accommodates the person’s mobility. A walker or wheelchair must fit through the exit. Discuss and practice the plan with household members or caregivers.", citationIDs: ["resp_oxygen_fire"])
            ]),
            .bullets(title: "Improve the quality of a reading", [
                AttributedBullet("For a finger pulse oximeter, follow its instructions, keep the hand warm and relaxed, remove nail polish from that finger and remain still. Wait for a stable display before recording the reading and time.", citationIDs: ["resp_oximeter"])
            ]),
            .bullets(title: "Know what the number cannot tell you", [
                AttributedBullet("Pulse oximetry estimates oxygen saturation. Poor circulation, skin temperature, skin pigmentation and other factors affect accuracy. A reading must be considered alongside symptoms; a reassuring number alone does not settle a worsening breathing concern.", citationIDs: ["resp_oximeter"]),
                AttributedBullet("General-wellness or sporting devices may not have been evaluated for clinical decisions. Confirm which device the care team recommends and when measurements should be taken.", citationIDs: ["resp_oximeter"])
            ]),
            .bullets(title: "Report symptoms as well as numbers", [
                AttributedBullet("Worsening breathlessness, chest discomfort, restlessness or concerning readings warrant clinical attention. Some people with low oxygen have few obvious symptoms. Report the measurement trend together with how the person feels and follow the clinician’s monitoring plan.", citationIDs: ["resp_oximeter"])
            ]),
            .bullets(title: "Read the display correctly", [
            AttributedBullet("SpO2 is the estimated oxygen saturation, displayed as a percentage. PR is pulse rate. Some devices also display signal strength. These are different measurements; identify which number is being reported before comparing the trend.", citationIDs: ["resp_oximeter"])
        ]),
            .bullets(title: "Use a consistent measurement record", [
            AttributedBullet("FDA’s home-use technique includes a warm, relaxed hand held below heart level, no polish on the measured finger and a still position. Wait for a stable number, then record the oxygen reading with its date and time. The clinician determines when and how often to measure.", citationIDs: ["resp_oximeter"])
        ]),
            .bullets(title: "Include the limits of device performance", [
            AttributedBullet("Skin pigmentation, skin thickness, poor circulation, temperature, tobacco use and nail polish can affect accuracy. FDA describes performance differences between lighter and darker skin pigmentation. Review symptoms even when a number appears reassuring.", citationIDs: ["resp_oximeter"]),
            AttributedBullet("Some devices intended for medical use have FDA clearance for over-the-counter sale. General-wellness and sporting or aviation products are a different category and have not been evaluated for deciding whether medical intervention is needed. “Available without prescription” alone does not identify the category.", citationIDs: ["resp_oximeter"])
        ]),
            .bullets(title: "Individualize the interpretation", [
            AttributedBullet("FDA describes 95–100% as typical for most healthy people, while some people with lung or heart conditions or at higher altitude have lower values. That description is not a universal oxygen prescription or an individualized escalation threshold. Use the clinician’s monitoring plan together with symptoms and changes over time.", citationIDs: ["resp_oximeter"])
        ])
        ],
        citations: [resp_oxygen, resp_oxygen_fire, resp_oximeter],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum PulmonaryRehabilitationSupportSample {
    public static let entry = ReferenceEntry(
        id: "pulmonary-rehabilitation-support", title: "Pulmonary rehabilitation support",
        subtitle: "Activity, breathing skills, energy conservation and self-management", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Clarify the purpose", [
                AttributedBullet("Pulmonary rehabilitation is a supervised program combining exercise, education and support for people with selected chronic lung conditions. It aims to improve stamina and daily function, with an individualized plan rather than one exercise schedule for everyone.", citationIDs: ["resp_rehab"])
            ]),
            .bullets(title: "Understand the starting assessment", [
                AttributedBullet("The team may assess lung function, walking distance and oxygen level, pulse and blood pressure during activity. These findings guide training and provide a baseline for evaluating progress.", citationIDs: ["resp_rehab"])
            ]),
            .bullets(title: "Connect training to daily care", [
                AttributedBullet("Sessions may teach breathing strategies, mucus clearance, medicine use and early recognition of a flare-up. Strength, endurance and flexibility exercises support daily tasks. Any recommended oxygen or medication adjustment during exercise comes from the clinical team.", citationIDs: ["resp_rehab"]),
                AttributedBullet("For a person with COPD, review whether breathlessness or fatigue interferes with meals. The team may suggest rest before eating or smaller, more frequent meals, and arrange nutrition support when intake is limited.", citationIDs: ["resp_copd_daily"])
            ]),
            .bullets(title: "Reduce avoidable effort", [
                AttributedBullet("In COPD care, put commonly used items within reach and consider easy-to-manage clothing or tools that reduce repeated reaching. Discuss home access barriers and what assistance makes daily tasks achievable.", citationIDs: ["resp_copd_daily"]),
                AttributedBullet("Check inhaler technique with the patient’s own device and invite repeat questions. Different devices require different techniques; difficulty using an inhaler deserves reassessment rather than an assumption that the medicine is ineffective.", citationIDs: ["resp_copd_daily"])
            ]),
            .bullets(title: "Include emotional health and follow-up", [
                AttributedBullet("Anxiety, depression and stress can accompany chronic lung disease. Rehabilitation may include counseling and nutritional support. Repeat assessments help the team determine whether function has improved and guide continuing activity.", citationIDs: ["resp_rehab"]),
                AttributedBullet("Discuss worsening symptoms or fever with the provider and follow the patient’s flare-up plan. Severe deterioration needs urgent care. Keep contact information accessible and include family or caregiver support when the patient wishes.", citationIDs: ["resp_copd_daily"])
            ]),
            .bullets(title: "Explain who may benefit", [
            AttributedBullet("NHLBI includes selected patients with COPD, asthma, pulmonary hypertension and cystic fibrosis, as well as people whose other health conditions affect lung function. Rehabilitation may also be used before or after lung transplantation or lung-cancer surgery. The referral is individualized.", citationIDs: ["resp_rehab"])
        ]),
            .bullets(title: "Set functional goals with the team", [
            AttributedBullet("The program can build strength and make daily tasks, work and social activities easier. Exercise training targets the back, arms, legs and breathing muscles and develops stamina and flexibility. Goals should connect the supervised activities with the person’s actual daily needs.", citationIDs: ["resp_rehab"])
        ]),
            .bullets(title: "Prepare for the program schedule", [
            AttributedBullet("Programs commonly involve two or three sessions each week over several weeks or months. Sessions may occur in a hospital or clinic; selected exercises, breathing practice and monitoring may continue at home as part of the assigned plan.", citationIDs: ["resp_rehab"])
        ]),
            .bullets(title: "Understand supervised safety and reassessment", [
            AttributedBullet("Muscle or bone injury is an uncommon exercise-related risk. NHLBI describes the team stopping activity, providing appropriate treatment and contacting the clinician when a serious problem occurs during a supervised session. New problems belong with the rehabilitation team, not an automatic increase in exercise intensity.", citationIDs: ["resp_rehab"]),
            AttributedBullet("At the end of the program, repeat lung-function and exercise assessments can show whether breathing and performance have improved. Some are the same tests used at baseline, allowing progress to be discussed in relation to the starting assessment.", citationIDs: ["resp_rehab"])
        ])
        ],
        citations: [resp_rehab, resp_copd_daily],
        lastSourceFidelityReview: "2026-09-17"
    )
}
