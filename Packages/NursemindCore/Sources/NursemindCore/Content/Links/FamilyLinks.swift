import Foundation

extension EntryLinkRegistry {
    /// Fourth batch, accepted from the propose-links.py sweep: same-family
    /// pairs that are correct by construction — a drug and its continuous
    /// infusion monograph, and a drug and its own serum level.
    static func familyLinks() -> [EntryLink] {
        [
            // ===== Drug ↔ its drip monograph =====
            EntryLink(from: "drug:amiodarone", to: "drip:amiodarone-drip", relation: .seeAlso),
            EntryLink(from: "drug:argatroban", to: "drip:argatroban-drip", relation: .seeAlso),
            EntryLink(from: "drug:bivalirudin", to: "drip:bivalirudin-drip", relation: .seeAlso),
            EntryLink(from: "drug:cisatracurium", to: "drip:cisatracurium-drip", relation: .seeAlso),
            EntryLink(from: "drug:clevidipine", to: "drip:clevidipine-drip", relation: .seeAlso),
            EntryLink(from: "drug:dexmedetomidine", to: "drip:dexmedetomidine-drip", relation: .seeAlso),
            EntryLink(from: "drug:epinephrine", to: "drip:epinephrine-drip", relation: .seeAlso),
            EntryLink(from: "drug:esmolol", to: "drip:esmolol-drip", relation: .seeAlso),
            EntryLink(from: "drug:fentanyl", to: "drip:fentanyl-drip", relation: .seeAlso),
            EntryLink(from: "drug:furosemide", to: "drip:furosemide-drip", relation: .seeAlso),
            EntryLink(from: "drug:heparin", to: "drip:heparin-drip", relation: .seeAlso),
            EntryLink(from: "drug:isoproterenol", to: "drip:isoproterenol-drip", relation: .seeAlso),
            EntryLink(from: "drug:ketamine", to: "drip:ketamine-drip", relation: .seeAlso),
            EntryLink(from: "drug:labetalol", to: "drip:labetalol-drip", relation: .seeAlso),
            EntryLink(from: "drug:lidocaine", to: "drip:lidocaine-drip", relation: .seeAlso),
            EntryLink(from: "drug:magnesium-sulfate", to: "drip:magnesium-sulfate-drip", relation: .seeAlso),
            EntryLink(from: "drug:midazolam", to: "drip:midazolam-drip", relation: .seeAlso),
            EntryLink(from: "drug:milrinone", to: "drip:milrinone-drip", relation: .seeAlso),
            EntryLink(from: "drug:nitroglycerin", to: "drip:nitroglycerin-drip", relation: .seeAlso),
            EntryLink(from: "drug:norepinephrine", to: "drip:norepinephrine-drip", relation: .seeAlso),
            EntryLink(from: "drug:octreotide", to: "drip:octreotide-drip", relation: .seeAlso),
            EntryLink(from: "drug:propofol", to: "drip:propofol-drip", relation: .seeAlso),
            EntryLink(from: "drug:tranexamic-acid", to: "drip:tranexamic-acid-drip", relation: .seeAlso),

            // ===== Drug ↔ its own serum level =====
            EntryLink(from: "drug:acetaminophen", to: "lab:acetaminophen-level", relation: .monitorsWith),
            EntryLink(from: "drug:acetaminophen", to: "drug:n-acetylcysteine", relation: .reversedBy),
            EntryLink(from: "drug:aspirin", to: "lab:salicylate-level", relation: .monitorsWith),
            EntryLink(from: "drug:mycophenolate", to: "lab:mycophenolate-level", relation: .monitorsWith),
        ]
    }
}
