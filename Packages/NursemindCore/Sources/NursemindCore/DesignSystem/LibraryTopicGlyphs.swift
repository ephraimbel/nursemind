import Foundation

extension LibraryTopicGroup {
    var glyph: String {
        switch self {
        case .criticalCare: "waveform.path.ecg"
        case .bedside: "cross.case"
        case .bodySystems: "figure.stand"
        case .specialties: "stethoscope"
        }
    }
}

extension LibraryTopic {
    var glyph: String {
        switch id {
        case "shock-perfusion", "cardiovascular": "heart"
        case "airway-ventilation", "respiratory", "oxygen-noninvasive-support": "lungs"
        case "rhythms-resuscitation", "rhythm-monitoring": "waveform.path.ecg"
        case "invasive-ventilation-liberation": "waveform.path"
        case "artificial-airway-care": "stethoscope"
        case "resuscitation-post-arrest": "cross.case"
        case "sedation-delirium": "moon.zzz"
        case "neurocritical-care", "neurological", "nlm-neurology-sensory": "brain.head.profile"
        case "renal-metabolic-critical-care", "renal-urinary", "nlm-renal-urinary": "drop.halffull"
        case "critical-care-devices": "ivfluid.bag"
        case "assessment-deterioration": "stethoscope"
        case "medication-transfusion-safety": "pills"
        case "labs-specimens", "nlm-infectious-disease": "testtube.2"
        case "infection-prevention", "pathogen-specific-precautions": "shield"
        case "skin-mobility-comfort", "musculoskeletal-skin", "bone-joint-care": "figure.walk"
        case "nutrition-elimination", "gastrointestinal", "nlm-gastrointestinal", "digestive-nutrition-symptoms": "fork.knife"
        case "communication-transitions": "bubble.left.and.bubble.right"
        case "endocrine-metabolic", "nlm-endocrine-metabolic": "gauge.medium"
        case "blood-infection", "nlm-hematology": "drop"
        case "emergency-nursing": "cross.case"
        case "perioperative-nursing": "scissors"
        case "maternity-newborn", "nlm-reproductive": "figure.2.and.child.holdinghands"
        case "pediatric-nursing", "nlm-pediatric-family-screening": "figure.and.child.holdinghands"
        case "oncology-nursing", "nlm-oncology-genetics": "cross.vial"
        case "eye-hearing-care": "eye"
        case "older-adult-care": "figure.walk"
        case "behavioral-health", "nlm-mental-behavioral": "bubble.left.and.bubble.right"
        case "community-home-care": "house"
        case "nursing-workplace-health": "person.badge.shield.checkmark"
        case "nlm-cardiopulmonary-imaging": "waveform.path.ecg.rectangle"
        case "nlm-allergy-rheumatology": "allergens"
        case "nlm-diagnostic-preparation": "list.bullet.clipboard"
        case "nlm-genetic-conditions": "point.3.connected.trianglepath.dotted"
        default: group.glyph
        }
    }
}
