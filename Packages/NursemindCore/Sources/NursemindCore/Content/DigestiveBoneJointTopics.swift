import Foundation

extension LibraryTopic {
    static let digestiveBoneJointCollections: [LibraryTopic] = [
        .init(id: "digestive-nutrition-symptoms", group: .bodySystems, title: "Digestive nutrition & symptoms",
              subtitle: "Bowel routines, food planning & nutrition support",
              entryIDs: [
                  "reference:ibs-daily-symptom-food-support",
                  "reference:adult-constipation-bowel-routine",
                  "reference:diverticular-disease-food-recovery",
                  "reference:short-bowel-nutrition-continuity",
                  "reference:focused-abdominal-assessment",
                  "reference:bedside-nutrition-assessment",
                  "reference:celiac-disease-food-planning",
                  "reference:gastroparesis-nutrition-support",
                  "reference:ibd-nutrition-follow-up",
                  "reference:gerd-daily-care-follow-up",
                  "reference:cirrhosis-nutrition-daily-support",
                  "reference:pancreatic-insufficiency-nutrition-support",
                  "reference:bowel-ostomy-daily-support",
                  "reference:fecal-incontinence-support",
                  "reference:cancer-treatment-constipation-support",
                  "reference:stool-sample-collection",
                  "procedure:tpn-administration"
              ]),
        .init(id: "bone-joint-care", group: .bodySystems, title: "Bone & joint care",
              subtitle: "Arthritis, fracture prevention & daily function",
              entryIDs: [
                  "reference:osteoporosis-daily-fracture-prevention",
                  "reference:osteoarthritis-daily-function-support",
                  "reference:gout-daily-care-follow-up",
                  "reference:scleroderma-daily-system-support",
                  "reference:musculoskeletal-assessment",
                  "reference:bedside-mobility-assessment",
                  "reference:rheumatoid-arthritis-daily-function",
                  "reference:osteoporosis-screening-frax",
                  "reference:fall-fracture-prevention",
                  "reference:hip-replacement-home-preparation",
                  "reference:fibromyalgia-sleep-pacing-support",
                  "reference:chronic-pain-management-framework",
                  "procedure:ambulatory-aid-teaching",
                  "procedure:cast-care"
              ])
    ]
}
