import Foundation

public enum SourceLicense: String, Codable, Sendable {
    case publicDomain         // US gov work, no copyright asserted
    case cc0                  // Creative Commons 0
    case ccBy4                // Creative Commons Attribution 4.0
    case ccBy4WithAIRestriction  // CC BY 4.0 + additional AI/LLM restriction (e.g. OpenStax)
    case factCitationOnly     // Concept is fact (citable); the source's text is not reproducible
}

public struct CitationSource: Identifiable, Hashable, Codable, Sendable {
    public let id: String              // stable slug, e.g. "openfda_norepi_0ea48ab6"
    public let shortName: String       // "FDA Structured Product Labeling — Norepinephrine"
    public let detail: String?         // additional locator, e.g. "SET ID: 0ea48ab6-…"
    public let publisher: String?      // "openFDA Drug Label API"
    public let license: SourceLicense
    public let url: String
    public let lastRetrieved: String   // ISO date string

    public init(
        id: String,
        shortName: String,
        detail: String? = nil,
        publisher: String? = nil,
        license: SourceLicense,
        url: String,
        lastRetrieved: String
    ) {
        self.id = id
        self.shortName = shortName
        self.detail = detail
        self.publisher = publisher
        self.license = license
        self.url = url
        self.lastRetrieved = lastRetrieved
    }

    public var licenseDisplayName: String {
        switch license {
        case .publicDomain:               return "public domain"
        case .cc0:                        return "CC0 1.0"
        case .ccBy4:                      return "CC BY 4.0"
        case .ccBy4WithAIRestriction:     return "CC BY 4.0 (display)"
        case .factCitationOnly:           return "fact citation only"
        }
    }
}
