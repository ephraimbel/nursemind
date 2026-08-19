import Foundation

extension EntryLinkRegistry {
    /// Seed batch: the ISMP high-alert / high-risk drug hub — monitoring labs
    /// and reversal agents, the two link classes with the highest bedside
    /// payoff. Every id verified against ContentRegistry by
    /// EntryLinkRegistryTests.
    static func highAlertLinks() -> [EntryLink] {
        [
            // ===== Anticoagulation =====
            EntryLink(from: "drug:heparin", to: "lab:aptt", relation: .monitorsWith),
            EntryLink(from: "drug:heparin", to: "lab:anti-xa", relation: .monitorsWith),
            EntryLink(from: "drug:heparin", to: "lab:platelets", relation: .monitorsWith),
            EntryLink(from: "drug:heparin", to: "drug:protamine-sulfate", relation: .reversedBy),
            EntryLink(from: "drip:heparin-drip", to: "lab:aptt", relation: .monitorsWith),
            EntryLink(from: "drip:heparin-drip", to: "lab:anti-xa", relation: .monitorsWith),
            EntryLink(from: "drip:heparin-drip", to: "lab:platelets", relation: .monitorsWith),
            EntryLink(from: "drip:heparin-drip", to: "drug:protamine-sulfate", relation: .reversedBy),
            EntryLink(from: "drug:warfarin", to: "lab:inr", relation: .monitorsWith),
            EntryLink(from: "drug:warfarin", to: "lab:pt", relation: .monitorsWith),
            EntryLink(from: "drug:warfarin", to: "drug:vitamin-k", relation: .reversedBy),
            EntryLink(from: "drug:warfarin", to: "drug:4-factor-pcc", relation: .reversedBy),
            EntryLink(from: "drug:enoxaparin", to: "lab:anti-xa", relation: .monitorsWith),
            EntryLink(from: "drug:enoxaparin", to: "lab:platelets", relation: .monitorsWith),
            EntryLink(from: "drug:enoxaparin", to: "drug:protamine-sulfate", relation: .reversedBy),
            EntryLink(from: "drug:apixaban", to: "drug:andexanet-alfa", relation: .reversedBy),
            EntryLink(from: "drug:rivaroxaban", to: "drug:andexanet-alfa", relation: .reversedBy),
            EntryLink(from: "drug:dabigatran", to: "drug:idarucizumab", relation: .reversedBy),
            EntryLink(from: "drip:argatroban-drip", to: "lab:aptt", relation: .monitorsWith),
            EntryLink(from: "drip:bivalirudin-drip", to: "lab:aptt", relation: .monitorsWith),
            EntryLink(from: "drip:bivalirudin-drip", to: "lab:activated-clotting-time", relation: .monitorsWith),
            EntryLink(from: "drug:alteplase", to: "lab:fibrinogen", relation: .monitorsWith),

            // ===== Insulin =====
            EntryLink(from: "drug:insulin-regular", to: "lab:glucose", relation: .monitorsWith),
            EntryLink(from: "drug:insulin-regular", to: "lab:potassium", relation: .monitorsWith),
            EntryLink(from: "drip:insulin-drip", to: "lab:glucose", relation: .monitorsWith),
            EntryLink(from: "drip:insulin-drip", to: "lab:potassium", relation: .monitorsWith),
            EntryLink(from: "drug:insulin-glargine", to: "lab:glucose", relation: .monitorsWith),
            EntryLink(from: "drug:insulin-glargine", to: "lab:hba1c", relation: .monitorsWith),
            EntryLink(from: "drug:insulin-lispro", to: "lab:glucose", relation: .monitorsWith),
            EntryLink(from: "drug:insulin-nph", to: "lab:glucose", relation: .monitorsWith),

            // ===== Opioids =====
            EntryLink(from: "drug:morphine", to: "drug:naloxone", relation: .reversedBy),
            EntryLink(from: "drug:fentanyl", to: "drug:naloxone", relation: .reversedBy),
            EntryLink(from: "drip:fentanyl-drip", to: "drug:naloxone", relation: .reversedBy),
            EntryLink(from: "drug:fentanyl-patch", to: "drug:naloxone", relation: .reversedBy),
            EntryLink(from: "drug:hydromorphone", to: "drug:naloxone", relation: .reversedBy),
            EntryLink(from: "drug:oxycodone", to: "drug:naloxone", relation: .reversedBy),
            EntryLink(from: "drug:methadone", to: "drug:naloxone", relation: .reversedBy),
            EntryLink(from: "drug:hydrocodone-acetaminophen", to: "drug:naloxone", relation: .reversedBy),
            EntryLink(from: "drug:hydrocodone-acetaminophen", to: "lab:acetaminophen-level", relation: .monitorsWith),

            // ===== Benzodiazepines =====
            EntryLink(from: "drug:diazepam", to: "drug:flumazenil", relation: .reversedBy),
            EntryLink(from: "drug:alprazolam", to: "drug:flumazenil", relation: .reversedBy),
            EntryLink(from: "drug:clonazepam", to: "drug:flumazenil", relation: .reversedBy),
            EntryLink(from: "drug:lorazepam", to: "drug:flumazenil", relation: .reversedBy),
            EntryLink(from: "drug:midazolam", to: "drug:flumazenil", relation: .reversedBy),
            EntryLink(from: "drip:midazolam-drip", to: "drug:flumazenil", relation: .reversedBy),

            // ===== Narrow therapeutic index =====
            EntryLink(from: "drug:digoxin", to: "lab:digoxin-level", relation: .monitorsWith),
            EntryLink(from: "drug:digoxin", to: "lab:potassium", relation: .monitorsWith),
            EntryLink(from: "drug:digoxin", to: "drug:digoxin-immune-fab", relation: .reversedBy),
            EntryLink(from: "drug:vancomycin", to: "lab:vancomycin-trough", relation: .monitorsWith),
            EntryLink(from: "drug:vancomycin", to: "lab:creatinine", relation: .monitorsWith),
            EntryLink(from: "drug:gentamicin", to: "lab:creatinine", relation: .monitorsWith),
            EntryLink(from: "drug:gentamicin", to: "lab:tdm-narrow-therapeutic-index", relation: .monitorsWith),
            EntryLink(from: "drug:lithium", to: "lab:lithium-level", relation: .monitorsWith),
            EntryLink(from: "drug:lithium", to: "lab:creatinine", relation: .monitorsWith),
            EntryLink(from: "drug:lithium", to: "lab:tsh", relation: .monitorsWith),
            EntryLink(from: "drug:phenytoin", to: "lab:phenytoin-level", relation: .monitorsWith),
            EntryLink(from: "drug:fosphenytoin", to: "lab:phenytoin-level", relation: .monitorsWith),
            EntryLink(from: "drug:valproic-acid", to: "lab:valproic-acid-level", relation: .monitorsWith),
            EntryLink(from: "drug:valproic-acid", to: "lab:ammonia", relation: .monitorsWith),
            EntryLink(from: "drug:carbamazepine", to: "lab:carbamazepine-level", relation: .monitorsWith),
            EntryLink(from: "drug:tacrolimus", to: "lab:tacrolimus-level", relation: .monitorsWith),
            EntryLink(from: "drug:tacrolimus", to: "lab:creatinine", relation: .monitorsWith),
            EntryLink(from: "drug:methotrexate", to: "lab:creatinine", relation: .monitorsWith),
            EntryLink(from: "drug:methotrexate", to: "drug:leucovorin-rescue", relation: .reversedBy),
            EntryLink(from: "drug:amiodarone", to: "lab:tsh", relation: .monitorsWith),
            EntryLink(from: "drug:amiodarone", to: "lab:free-t4", relation: .monitorsWith),
            EntryLink(from: "drug:amiodarone", to: "lab:ast-alt", relation: .monitorsWith),

            // ===== Electrolytes & osmotherapy =====
            EntryLink(from: "drug:magnesium-sulfate", to: "lab:magnesium", relation: .monitorsWith),
            EntryLink(from: "drip:magnesium-sulfate-drip", to: "lab:magnesium", relation: .monitorsWith),
            EntryLink(from: "drug:hypertonic-saline-3-percent", to: "lab:sodium", relation: .monitorsWith),
            EntryLink(from: "drug:hypertonic-saline-3-percent", to: "lab:serum-osmolality", relation: .monitorsWith),
            EntryLink(from: "drip:hypertonic-saline-drip", to: "lab:sodium", relation: .monitorsWith),
            EntryLink(from: "drip:hypertonic-saline-drip", to: "lab:serum-osmolality", relation: .monitorsWith),

            // ===== Other high-alert monitoring =====
            EntryLink(from: "drug:clozapine", to: "lab:wbc", relation: .monitorsWith),
            EntryLink(from: "drug:amphotericin-b", to: "lab:potassium", relation: .monitorsWith),
            EntryLink(from: "drug:amphotericin-b", to: "lab:magnesium", relation: .monitorsWith),
            EntryLink(from: "drug:amphotericin-b", to: "lab:creatinine", relation: .monitorsWith),
            EntryLink(from: "drug:cisplatin", to: "lab:creatinine", relation: .monitorsWith),
            EntryLink(from: "drug:cisplatin", to: "lab:magnesium", relation: .monitorsWith),
            EntryLink(from: "drug:cyclophosphamide", to: "lab:wbc", relation: .monitorsWith),
            EntryLink(from: "drug:cyclophosphamide", to: "lab:urinalysis", relation: .monitorsWith),
            EntryLink(from: "drug:doxorubicin", to: "lab:wbc", relation: .monitorsWith),
        ]
    }
}
