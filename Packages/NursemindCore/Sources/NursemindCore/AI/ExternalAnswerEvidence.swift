import Foundation

struct ExternalAnswerEvidence: Decodable, Sendable {
    let context: String
    let sources: [CitationSource]

    var isValid: Bool {
        guard !context.isEmpty, context.count <= 16_000, !sources.isEmpty, sources.count <= 4,
              sources.enumerated().allSatisfy({ $0.element.id == String(format: "c%03d", $0.offset + 1) }),
              ResponseValidator.citationIDs(in: context) == Set(sources.map(\.id)) else { return false }
        return sources.allSatisfy { source in
            guard !source.shortName.isEmpty, source.shortName.count <= 180,
                  source.license == .publicDomain || source.license == .ccBy4,
                  let url = URLComponents(string: source.url), url.scheme == "https",
                  url.user == nil, url.password == nil, url.port == nil || url.port == 443 else { return false }
            let host = (url.host ?? "").replacingOccurrences(of: "www.", with: "", options: .anchored)
            switch host {
            case "medlineplus.gov": return url.path.hasPrefix("/lab-tests/")
            case "cdc.gov": return !["/mmwr/", "/eid/", "/emerging-infectious-diseases/"].contains { url.path.hasPrefix($0) }
            case "fda.gov": return url.path.hasPrefix("/drugs/")
            case "dailymed.nlm.nih.gov": return url.path == "/dailymed/drugInfo.cfm"
            case "wtcs.pressbooks.pub": return ["/nursingfundamentals/chapter/", "/nursingskills/chapter/", "/nursingadvancedskills/chapter/"].contains { url.path.hasPrefix($0) }
            case "ncbi.nlm.nih.gov": return ["/books/NBK610839/", "/books/NBK610839/table/ptxv.tab3/"].contains(url.path)
            default: return false
            }
        }
    }
}

enum AnswerStreamEvent: Sendable {
    case text(String)
    case evidence(ExternalAnswerEvidence)
}
