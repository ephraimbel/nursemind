import Foundation

/// Central allow-list for the free sampler. Everything NOT listed here is
/// Pro-gated; Pro unlocks every entry and every calculator regardless.
///
/// Lean teaser: a small, diverse, safety-clear cross-section that gives free
/// users real working value while the overwhelming majority of the library
/// (1,000+ entries) and tools (172 calculators) stays behind Pro. Adjust the
/// two sets to widen or narrow the free portion — it's the conversion lever.
public enum FreeTier {
    /// Calculators usable on the free tier. One per major area for breadth,
    /// all Apple-1.4.2-clear (no patient-specific drug-dose tools).
    public static let calculatorIDs: Set<String> = [
        "map",          // Cardiovascular
        "gfr",          // Renal
        "anion-gap",    // Renal · Metabolic
        "curb-65",      // Respiratory
        "bmi",          // Anthropometry
        "conv-weight"   // Conversions
    ]

    /// Library entries fully readable on the free tier — a cross-section of
    /// drugs, labs, a high-volume diagnosis, and a core nursing procedure.
    public static let libraryEntryIDs: Set<String> = [
        "acetaminophen", // drug
        "lisinopril",    // drug
        "potassium",     // lab
        "troponin",      // lab
        "sepsis",        // diagnosis
        "iv-insertion"   // procedure
    ]

    public static func isFreeCalculator(_ id: String) -> Bool {
        calculatorIDs.contains(id)
    }

    public static func isFreeEntry(_ id: String) -> Bool {
        libraryEntryIDs.contains(id)
    }
}
