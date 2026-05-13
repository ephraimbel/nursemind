import Foundation

public enum SBARSample {
    public static let entry: ReferenceEntry = {
        let ahrq = CitationSource(
            id: "ahrq_teamstepps_sbar",
            shortName: "AHRQ TeamSTEPPS — SBAR communication tool",
            detail: "TeamSTEPPS Pocket Guide",
            publisher: "Agency for Healthcare Research and Quality",
            license: .publicDomain,
            url: "https://www.ahrq.gov/teamstepps-program/index.html",
            lastRetrieved: "2026-05-03"
        )
        let tjc = CitationSource(
            id: "tjc_communication",
            shortName: "Joint Commission National Patient Safety Goals — Communication (paraphrased)",
            detail: "Standardized handoff communication is a TJC NPSG",
            publisher: "The Joint Commission",
            license: .factCitationOnly,
            url: "https://www.jointcommission.org/standards/national-patient-safety-goals/",
            lastRetrieved: "2026-05-03"
        )

        let intro: AttributedProse = AttributedProse(
            "SBAR (Situation, Background, Assessment, Recommendation) is a standardized communication framework that ensures critical information is conveyed quickly and completely. Use SBAR for provider notifications, rapid response calls, change-of-shift handoffs, and any time you escalate concerns about a patient.",
            citationIDs: ["ahrq_teamstepps_sbar", "tjc_communication"]
        )

        return ReferenceEntry(
            id: "sbar",
            title: "SBAR communication",
            subtitle: "Situation · Background · Assessment · Recommendation",
            eyebrow: "REFERENCE · COMMUNICATION",
            nclexTags: NCLEXTags(
                category: .safeAndEffectiveCare,
                subcategory: .managementOfCare,
                priorityConcept: nil
            ),
            sections: [
                .prose(title: "What it is", intro),
                .keyValueTable(title: "Quick template", [
                    KeyValueRow(key: "S — Situation",       value: "Who you are, who the patient is, what's happening NOW"),
                    KeyValueRow(key: "B — Background",      value: "Relevant medical history, admit reason, current course"),
                    KeyValueRow(key: "A — Assessment",      value: "Your clinical assessment, vitals, what you think is going on"),
                    KeyValueRow(key: "R — Recommendation",  value: "What you need from them — order, evaluation, transfer")
                ]),
                .bullets(title: "S — Situation: what to include", [
                    AttributedBullet("Your name, unit, and role.", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("Patient name, room, age, sex.", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("The reason you're calling: 'I'm calling about [patient] who has [acute change].'", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("Pertinent vital signs right now.", citationIDs: ["ahrq_teamstepps_sbar"])
                ]),
                .bullets(title: "B — Background: what to include", [
                    AttributedBullet("Reason for admission and admit date.", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("Pertinent past medical history.", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("Current treatments — drips, IV fluids, oxygen, recent meds (and times).", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("Most recent labs and imaging if relevant.", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("Code status, allergies if relevant.", citationIDs: ["ahrq_teamstepps_sbar"])
                ]),
                .bullets(title: "A — Assessment: what to include", [
                    AttributedBullet("Your clinical assessment in your own words: 'I think the patient is...'", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("Trends, not just snapshots — 'BP has been dropping over the last 2 hours.'", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("If you're unsure, say so: 'I'm not sure what's going on, but I'm concerned about...'", citationIDs: ["ahrq_teamstepps_sbar"])
                ]),
                .bullets(title: "R — Recommendation: what to include", [
                    AttributedBullet("Be specific about what you need: 'Can you come evaluate?', 'Can I have an order for...', 'Should I call rapid response?'", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("Confirm next steps and timing before ending the call: 'You'll be at the bedside in 10 minutes — correct?'", citationIDs: ["ahrq_teamstepps_sbar"]),
                    AttributedBullet("Repeat back any new orders to confirm (read-back per Joint Commission).", citationIDs: ["tjc_communication"])
                ]),
                .prose(title: "Example", AttributedProse(
                    "S: Hi Dr. Chen, this is Sarah on 4 West. I'm calling about Mr. Johnson in 412 — he's a 68-year-old admitted yesterday for pneumonia, and his blood pressure has dropped to 88/52, heart rate is 118, and he's becoming confused. B: He came in two days ago with right lower lobe pneumonia, started on ceftriaxone and azithromycin. He has a history of CHF and CKD stage 3. His last lactate was 2.1 four hours ago. A: I'm concerned he's becoming septic — his MAP is 64, he's tachycardic, and he wasn't confused this morning. R: Can you come evaluate? Should we get a repeat lactate and start a fluid bolus while you're on your way?",
                    citationIDs: ["ahrq_teamstepps_sbar"]
                ))
            ],
            citations: [ahrq, tjc],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
