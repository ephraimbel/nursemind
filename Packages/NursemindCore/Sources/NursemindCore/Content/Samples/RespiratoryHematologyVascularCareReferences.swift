import Foundation

private let rh_depth_vte_recovery = CitationSource(
    id: "rh_depth_vte_recovery", shortName: "NHLBI — VTE recovery",
    detail: "September 20, 2022. Recurrence, bleeding, post-thrombotic symptoms, pulmonary hypertension, medicines, follow-up and activity. No aspirin substitution or fixed treatment duration. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/venous-thromboembolism/recovery", lastRetrieved: "2026-09-17"
)

private let rh_depth_vte_symptoms = CitationSource(
    id: "rh_depth_vte_symptoms", shortName: "NHLBI — VTE symptoms",
    detail: "DVT and pulmonary embolism recognition and immediate medical attention. No symptom-only diagnosis. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/venous-thromboembolism/symptoms", lastRetrieved: "2026-09-17"
)

private let rh_depth_pad_living = CitationSource(
    id: "rh_depth_pad_living", shortName: "NHLBI — Living with peripheral artery disease",
    detail: "Limb and systemic complications, foot care, risk-factor follow-up and emotional support. The source’s erroneous annual pneumococcal-vaccine wording is excluded. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/peripheral-artery-disease/living-with", lastRetrieved: "2026-09-17"
)

public enum RHDepthVteRecoveryFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "vte-recovery-follow-up", title: "After DVT or PE: recovery and follow-up",
        subtitle: "Recurrent symptoms, bleeding, medicines and longer-term complications", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Make the follow-up plan explicit", [
                AttributedBullet("After venous thromboembolism, follow-up assesses recovery, the risk of another clot and whether anticoagulation should continue. The duration and choice of treatment depend on the clinical situation.", citationIDs: ["rh_depth_vte_recovery"]),
                AttributedBullet("Review the prescribed medicines, appointments and outstanding tests. Feeling better is not a reason to stop a blood thinner independently; changes to treatment belong to the responsible clinician.", citationIDs: ["rh_depth_vte_recovery"])
            ]),
            .bullets(title: "Recognize possible recurrent thrombosis", [
                AttributedBullet("New swelling, tenderness or pain in a leg can occur with deep vein thrombosis. Shortness of breath or pain with breathing can occur with pulmonary embolism. Symptoms vary, and a serious clot may develop without every typical sign.", citationIDs: ["rh_depth_vte_symptoms"]),
                AttributedBullet("NHLBI advises immediate clinical contact for suspected VTE symptoms. Pulmonary embolism can be life-threatening, so acute breathing or chest symptoms need urgent medical assessment rather than waiting for routine follow-up.", citationIDs: ["rh_depth_vte_symptoms"])
            ]),
            .bullets(title: "Ask directly about bleeding", [
                AttributedBullet("Blood-thinning treatment can cause serious bleeding. Ask about unusual bruising, unexpected gum bleeding, blood when using the toilet and heavier-than-usual menstrual bleeding, and report new findings to the treating team.", citationIDs: ["rh_depth_vte_recovery"]),
                AttributedBullet("Excessive bleeding requires prompt medical evaluation. Include the medicine being taken and the observed symptoms when seeking help; this guide does not supply a reversal regimen or tell the person to adjust the dose independently.", citationIDs: ["rh_depth_vte_recovery"])
            ]),
            .bullets(title: "Explain the actual monitoring requirements", [
                AttributedBullet("Warfarin requires blood testing to assess clotting time and guide its dose. Other anticoagulants have different monitoring needs, and the team may check kidney or liver function or order imaging when indicated.", citationIDs: ["rh_depth_vte_recovery"]),
                AttributedBullet("Confirm which tests apply to the prescribed medicine. Warfarin also interacts with changes in vitamin K intake; discuss maintaining a consistent intake and reviewing supplements and alcohol use with the clinician rather than eliminating all green vegetables.", citationIDs: ["rh_depth_vte_recovery"])
            ]),
            .bullets(title: "Follow persistent leg symptoms", [
                AttributedBullet("Post-thrombotic syndrome can cause ongoing swelling, pain, itching, skin discoloration, cramping or fatigue after DVT. Symptoms may worsen after prolonged standing, and severe cases can cause skin sores.", citationIDs: ["rh_depth_vte_recovery"]),
                AttributedBullet("Report persistent symptoms and skin changes. The clinician may recommend compression stockings for symptom relief; a prior DVT does not by itself define the right compression product or replace assessment of a new leg problem.", citationIDs: ["rh_depth_vte_recovery"])
            ]),
            .bullets(title: "Recognize ongoing cardiopulmonary concerns", [
                AttributedBullet("Pulmonary hypertension can occur after pulmonary embolism. Persistent breathlessness, reduced exercise tolerance, swelling, palpitations, fainting or coughing blood need clinical review.", citationIDs: ["rh_depth_vte_recovery"]),
                AttributedBullet("Describe whether symptoms are new, worsening or continuing despite treatment. Longer-term complications require follow-up even after the initial clot episode has been treated; acute deterioration still needs urgent assessment.", citationIDs: ["rh_depth_vte_recovery"])
            ]),
            .bullets(title: "Support activity and emotional recovery", [
                AttributedBullet("Regular movement supports recovery, but the appropriate activity level and timing should be agreed with the healthcare provider. Smoking cessation and management of relevant health conditions are also part of reducing future risk.", citationIDs: ["rh_depth_vte_recovery"]),
                AttributedBullet("A blood clot can leave the person anxious about recurrence. Invite questions and help connect persistent fear, stress or difficulty returning to everyday activity with clinical or mental-health support.", citationIDs: ["rh_depth_vte_recovery"])
            ])
        ],
        citations: [rh_depth_vte_recovery, rh_depth_vte_symptoms],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum RHDepthPeripheralArteryDiseaseFootCareSample {
    public static let entry = ReferenceEntry(
        id: "peripheral-artery-disease-foot-care", title: "Peripheral artery disease: foot and limb care",
        subtitle: "Daily inspection, wound concerns and changes in perfusion", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Assess the impact of poor circulation", [
                AttributedBullet("Peripheral artery disease is a long-term condition that can limit walking and daily activity. Persistent poor blood flow can cause rest pain, wounds, infection and tissue loss. Diabetes and smoking increase the risk of serious complications.", citationIDs: ["rh_depth_pad_living"]),
                AttributedBullet("Ask about the person’s usual walking ability, leg symptoms and foot problems. A worsening symptom pattern needs reassessment even when PAD has been diagnosed for years.", citationIDs: ["rh_depth_pad_living"])
            ]),
            .bullets(title: "Inspect and protect the feet every day", [
                AttributedBullet("Check the feet daily for injuries and sores. Diabetes-related nerve problems may make an injury hard to feel, so absence of pain should not replace looking at the skin.", citationIDs: ["rh_depth_pad_living"]),
                AttributedBullet("Wear socks and well-fitting protective shoes, and avoid walking barefoot. Footwear should reduce pressure and protect the skin; the clinical team may recommend a specialist to assess or modify shoes when needed.", citationIDs: ["rh_depth_pad_living"])
            ]),
            .bullets(title: "Arrange help for skin and nail problems", [
                AttributedBullet("PAD increases the consequences of a small foot injury. NHLBI advises clinical care for corns, calluses, long or ingrown nails and other foot problems instead of attempting self-treatment that can injure the skin.", citationIDs: ["rh_depth_pad_living"]),
                AttributedBullet("A foot sore needs follow-up to support healing and prevent infection. After a vascular procedure, follow the specific incision-care instructions and report a new problem to the treating team.", citationIDs: ["rh_depth_pad_living"])
            ]),
            .bullets(title: "Report possible infection", [
                AttributedBullet("Redness, swelling, pain, drainage or pus around a foot or leg sore can indicate infection. Fever or chills also require clinical contact. Infection may extend into deeper tissue, bone or the bloodstream.", citationIDs: ["rh_depth_pad_living"]),
                AttributedBullet("People with both PAD and diabetes have increased complication risk. Describe the wound and associated symptoms promptly; the clinician determines whether wound care, antibiotics or hospital assessment is needed.", citationIDs: ["rh_depth_pad_living"])
            ]),
            .bullets(title: "Distinguish worsening symptoms from an emergency", [
                AttributedBullet("Contact the provider if leg pain no longer settles after a few minutes of rest or other PAD symptoms worsen. Persistent rest pain and nonhealing sores may reflect severe impairment of blood supply.", citationIDs: ["rh_depth_pad_living"]),
                AttributedBullet("Sudden loss of feeling or movement in a foot that becomes colder and pale or blue compared with the other side is an emergency. NHLBI advises calling 911 or obtaining immediate medical help because prompt treatment may save the limb.", citationIDs: ["rh_depth_pad_living"])
            ]),
            .bullets(title: "Connect limb care with cardiovascular prevention", [
                AttributedBullet("PAD often accompanies atherosclerosis in other arteries and an increased risk of heart attack and stroke. Follow-up includes the prescribed medicines and management of blood pressure, cholesterol and diabetes.", citationIDs: ["rh_depth_pad_living"]),
                AttributedBullet("Support smoking cessation and regular vascular follow-up. The care plan should address the person’s overall cardiovascular health as well as the visible foot or leg problem.", citationIDs: ["rh_depth_pad_living"])
            ]),
            .bullets(title: "Ask about function and emotional burden", [
                AttributedBullet("Reduced mobility and concern about wounds or amputation can cause anxiety, depression or stress. Ask how symptoms affect independence and what help is available for daily tasks.", citationIDs: ["rh_depth_pad_living"]),
                AttributedBullet("Encourage discussion of persistent distress with the healthcare team. Support from family, peer groups or counseling may help the person manage the demands of long-term PAD care.", citationIDs: ["rh_depth_pad_living"])
            ])
        ],
        citations: [rh_depth_pad_living],
        lastSourceFidelityReview: "2026-09-17"
    )
}
