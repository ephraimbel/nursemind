import Foundation

private let ip_depth_pacemaker_after = CitationSource(
    id: "ip_depth_pacemaker_after", shortName: "NHLBI — After getting a pacemaker",
    detail: "March 24, 2022; early device checks, recovery, activity instructions and complication recognition. Fixed recovery intervals and the source’s fluid/pericarditis wording are not reproduced. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/pacemakers/after", lastRetrieved: "2026-09-17"
)

private let ip_depth_pacemaker_living = CitationSource(
    id: "ip_depth_pacemaker_living", shortName: "NHLBI — Living with a pacemaker",
    detail: "March 24, 2022; identification, device follow-up, interference precautions, medical procedures and symptom reporting. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/pacemakers/living-with", lastRetrieved: "2026-09-17"
)

private let ip_depth_icd = CitationSource(
    id: "ip_depth_icd", shortName: "NHLBI — Living with an ICD or WCD",
    detail: "Follow-up, shock response, remote monitoring, interference precautions, mental health and goals of care. Fixed battery-life estimates, driving-law claims and wearable-device operating instructions excluded. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/defibrillators/living-with", lastRetrieved: "2026-09-17"
)

public enum IPDepthPermanentPacemakerFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "permanent-pacemaker-follow-up", title: "Permanent pacemaker: recovery and follow-up",
        subtitle: "Device checks, identification, interference and symptom reporting", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Understand the early device checks", [
                AttributedBullet("After implantation, the team observes recovery and checks the pacemaker’s operation. Tests may include a chest X-ray to evaluate lead position and an ECG to assess the heart’s electrical activity.", citationIDs: ["ip_depth_pacemaker_after"]),
                AttributedBullet("Before discharge, the team checks and programs the device for the person’s needs. Explain that these checks are part of evaluating the implanted system; feeling well alone does not establish that every setting and lead has been assessed.", citationIDs: ["ip_depth_pacemaker_after"])
            ]),
            .bullets(title: "Review individualized recovery instructions", [
                AttributedBullet("The implantation site may be sore during early recovery. Follow the team’s wound-care and activity instructions, including restrictions on heavy lifting or movement that could disturb healing or newly placed leads.", citationIDs: ["ip_depth_pacemaker_after"]),
                AttributedBullet("Recovery instructions depend on the procedure and device. Confirm the plan before discharge and communicate new symptoms rather than applying one activity timeline to all pacemakers or treating persistent concerns as routine soreness.", citationIDs: ["ip_depth_pacemaker_after"])
            ]),
            .bullets(title: "Keep device identification available", [
                AttributedBullet("Carry the pacemaker identification card and show it to healthcare professionals and security personnel when relevant. It identifies the device and helps others obtain the information needed for safe care.", citationIDs: ["ip_depth_pacemaker_living"]),
                AttributedBullet("Keep the implanting or device-follow-up team’s contact information available. New clinicians need to know about the pacemaker before planning procedures, even if the visit concerns another part of the body.", citationIDs: ["ip_depth_pacemaker_living"])
            ]),
            .bullets(title: "Maintain device follow-up", [
                AttributedBullet("Regular follow-up checks the battery, leads and programming. Remote monitoring may allow some information to be sent from home, while in-person evaluation remains part of the individual follow-up plan.", citationIDs: ["ip_depth_pacemaker_living"]),
                AttributedBullet("Clarify how the monitoring equipment is used and when visits are scheduled. Device checks can identify problems and guide programming changes; they do not replace reporting new symptoms to the clinical team.", citationIDs: ["ip_depth_pacemaker_living"])
            ]),
            .bullets(title: "Use practical interference precautions", [
                AttributedBullet("NHLBI advises keeping cell phones and headphones at least six inches from the pacemaker. Hold a phone to the opposite ear and avoid carrying it in a pocket directly over the device.", citationIDs: ["ip_depth_pacemaker_living"]),
                AttributedBullet("Properly working household appliances are generally safe, but strong electrical or magnetic fields may interfere with a pacemaker. Use the device team’s and manufacturer’s instructions when unsure about equipment, and show the device card during security screening.", citationIDs: ["ip_depth_pacemaker_living"])
            ]),
            .bullets(title: "Plan medical procedures with the device team", [
                AttributedBullet("MRI, electrocautery, radiation treatment and some other therapies require review for possible effects on the device. Tell medical and dental teams about the pacemaker before treatment.", citationIDs: ["ip_depth_pacemaker_living"]),
                AttributedBullet("Compatibility and precautions depend on the implanted system and procedure. Avoid a blanket assumption that every MRI is prohibited or that every device needs the same adjustment; the responsible teams determine the safe plan.", citationIDs: ["ip_depth_pacemaker_living"])
            ]),
            .bullets(title: "Recognize symptoms that need contact", [
                AttributedBullet("Contact the healthcare provider immediately for shortness of breath, dizziness or fainting that may indicate a device or heart problem. Fever, chills, or pain or redness near the device can indicate infection and also require prompt contact.", citationIDs: ["ip_depth_pacemaker_living"]),
                AttributedBullet("Infection concerns can develop after the initial healing period. Include current symptoms and device history when reporting a change, and continue the follow-up plan even if the incision previously appeared healed.", citationIDs: ["ip_depth_pacemaker_living"])
            ])
        ],
        citations: [ip_depth_pacemaker_after, ip_depth_pacemaker_living],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum IPDepthIcdShockFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "icd-shock-follow-up", title: "Implanted defibrillator: shocks and follow-up",
        subtitle: "Emergency symptoms, device review and everyday precautions", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the implanted system", [
                AttributedBullet("Carry the implanted cardioverter-defibrillator identification card and keep the device team’s contact information available. Some systems also provide pacing, and the specific device matters when planning procedures or discussing its functions.", citationIDs: ["ip_depth_icd"]),
                AttributedBullet("Explain the person’s own monitoring and follow-up arrangements. Remote equipment can transmit information about the heart and device, but a new symptom or shock still requires the response specified by the clinical team.", citationIDs: ["ip_depth_icd"])
            ]),
            .bullets(title: "Report every shock to the clinical team", [
                AttributedBullet("NHLBI advises contacting the healthcare provider whenever the device delivers a shock. A person may feel a strong brief jolt, and shocks can occur for appropriate rhythm treatment or because of a device-related problem.", citationIDs: ["ip_depth_icd"]),
                AttributedBullet("A shock that ends and is followed by feeling better still needs contact with the device team. The team evaluates the event and device information; symptoms alone cannot establish whether the shock was appropriate.", citationIDs: ["ip_depth_icd"])
            ]),
            .bullets(title: "Recognize an emergency response situation", [
                AttributedBullet("Several strong shocks within a short time require emergency assessment. NHLBI also advises emergency care for heart-attack symptoms or warning signs of cardiac arrest; call 911 outside the hospital or use the hospital emergency response pathway.", citationIDs: ["ip_depth_icd"]),
                AttributedBullet("Do not dismiss repeated shocks or concerning symptoms because a defibrillator is implanted. The device does not eliminate the need for urgent medical care when these events occur.", citationIDs: ["ip_depth_icd"])
            ]),
            .bullets(title: "Maintain scheduled interrogation and monitoring", [
                AttributedBullet("Follow-up reviews the device’s programming, battery and lead function along with the person’s heart condition and medicines. Programming changes or further treatment may be needed when the device is not working as intended.", citationIDs: ["ip_depth_icd"]),
                AttributedBullet("Contact the provider for dizziness, fainting, breathlessness, fever or palpitations. Confirm that home monitoring is being used as instructed and keep appointments even when there has been no obvious shock.", citationIDs: ["ip_depth_icd"])
            ]),
            .bullets(title: "Review interference and procedure precautions", [
                AttributedBullet("Keep cell phones and headphones at least six inches from the implanted device, and avoid storing a phone directly over it. Strong magnets and some electrical equipment may interfere with device operation; ask the device team about unfamiliar equipment.", citationIDs: ["ip_depth_icd"]),
                AttributedBullet("Inform medical and dental teams about the implant before a procedure. Some tests and therapies require special precautions or device programming; compatibility depends on the device and procedure, so planning should involve the appropriate clinicians.", citationIDs: ["ip_depth_icd"])
            ]),
            .bullets(title: "Address activity and the emotional response", [
                AttributedBullet("Discuss returning to activity with the healthcare provider, including activities that could damage the implanted system. Recovery and longer-term restrictions depend on the person’s condition and the device plan.", citationIDs: ["ip_depth_icd"]),
                AttributedBullet("Living with the possibility of shocks can cause anxiety or distress, and some people develop depression or post-traumatic stress symptoms. Encourage discussion with the clinical team so emotional support is part of follow-up.", citationIDs: ["ip_depth_icd"])
            ]),
            .bullets(title: "Include device preferences in goals of care", [
                AttributedBullet("When health declines, discuss the benefits and burdens of ongoing shocks with the treating and palliative-care teams. For some transvenous ICD or CRT-D systems, clinicians can disable shock therapy while pacing continues.", citationIDs: ["ip_depth_icd"]),
                AttributedBullet("Document the person’s preferences through the advance-care planning process. Device deactivation is a clinician-managed decision based on the actual system and goals of care; this guide does not provide instructions for independently disabling a device.", citationIDs: ["ip_depth_icd"])
            ])
        ],
        citations: [ip_depth_icd],
        lastSourceFidelityReview: "2026-09-17"
    )
}
