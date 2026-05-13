import SwiftUI

/// Renders one of NurseMind's bundled legal documents (Terms of Use or Privacy
/// Policy) from the Resources/Legal/ folder. Bundling the documents means the
/// "functional link" Apple Guideline 3.1.2(c) requires is always present, even
/// offline — no hosting dependency, no broken-link risk during review.
public struct LegalDocumentView: View {
    public enum Document: String, Sendable, Hashable {
        case termsOfUse = "terms"
        case privacyPolicy = "privacy"

        var resourceName: String { rawValue }

        var title: String {
            switch self {
            case .termsOfUse:    return "Terms of Use"
            case .privacyPolicy: return "Privacy Policy"
            }
        }

        var eyebrow: String {
            switch self {
            case .termsOfUse:    return "TERMS OF USE"
            case .privacyPolicy: return "PRIVACY POLICY"
            }
        }

        /// Canonical hosted URL — single source of truth lives in `LegalLinks`.
        var webURL: URL {
            switch self {
            case .termsOfUse:    return LegalLinks.termsOfUse
            case .privacyPolicy: return LegalLinks.privacyPolicy
            }
        }
    }

    public let document: Document

    public init(_ document: Document) {
        self.document = document
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                EyebrowLabel(document.eyebrow, sparkle: false)
                    .padding(.top, NMSpace.xxl)
                Text(document.title)
                    .displayXL()
                    .padding(.top, NMSpace.md)

                Hairline().padding(.vertical, NMSpace.xxl)

                if let rendered = renderedBody {
                    rendered
                        .font(NMFont.body)
                        .foregroundStyle(NMColor.textPrimary)
                        .lineSpacing(4)
                        .textSelection(.enabled)
                } else {
                    Text("This document is temporarily unavailable. Please contact support.")
                        .font(NMFont.body)
                        .foregroundStyle(NMColor.textSecondary)
                }

                Hairline().padding(.vertical, NMSpace.xxl)

                webLinkFooter
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    /// Surfaces the canonical web URL at the bottom of the in-app document
    /// so users can share, bookmark, or open in Safari. The in-app rendering
    /// is always the primary surface — Apple Review can read the full doc
    /// without leaving the app — but linking the hosted version helps users
    /// share a canonical reference link with colleagues.
    private var webLinkFooter: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            EyebrowLabel("ALSO ON THE WEB", sparkle: false)
            Link(destination: document.webURL) {
                HStack(spacing: NMSpace.xs) {
                    Text(document.webURL.host ?? "nursemind.app")
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.accent)
                    Text(document.webURL.path)
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.accent)
                    Image(systemName: "arrow.up.forward.app")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundStyle(NMColor.accent)
                }
                .contentShape(Rectangle())
            }
        }
    }

    /// Reads the bundled markdown and renders it as Swift `Text` with native
    /// markdown rendering. Plain markdown (headings, **bold**, lists, etc.)
    /// renders via SwiftUI's AttributedString markdown support — adequate for
    /// the editorial pattern these documents follow.
    private var renderedBody: Text? {
        guard let url = Bundle.module.url(forResource: document.resourceName, withExtension: "md"),
              let raw = try? String(contentsOf: url, encoding: .utf8) else {
            return nil
        }
        // SwiftUI's AttributedString markdown parser doesn't handle multi-
        // line layout (headings, lists separated by blank lines) as well as
        // we want. Rendering paragraph-by-paragraph preserves visual rhythm.
        return Text(renderedParagraphs(from: raw))
    }

    /// Convert plain markdown to an AttributedString chunk-by-chunk, treating
    /// blank-line-separated paragraphs as independent blocks. Preserves
    /// bold, italics, and inline code; strips the bare `#` headers since
    /// our title is already shown above.
    private func renderedParagraphs(from markdown: String) -> AttributedString {
        var out = AttributedString()
        let blocks = markdown.components(separatedBy: "\n\n")
        for (index, raw) in blocks.enumerated() {
            let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmed.isEmpty else { continue }
            // Headings (lines starting with #) — surface as bolded paragraph
            // with a leading newline gap; we drop the # symbols.
            let isHeading = trimmed.hasPrefix("#")
            let cleaned: String
            if isHeading {
                cleaned = trimmed.drop(while: { $0 == "#" || $0 == " " }).description
            } else {
                cleaned = trimmed
            }

            var attr: AttributedString
            do {
                attr = try AttributedString(
                    markdown: cleaned,
                    options: AttributedString.MarkdownParsingOptions(
                        interpretedSyntax: .inlineOnlyPreservingWhitespace
                    )
                )
            } catch {
                attr = AttributedString(cleaned)
            }

            if isHeading {
                attr.font = .system(size: 17, weight: .semibold)
            }

            if index > 0 { out += AttributedString("\n\n") }
            out += attr
        }
        return out
    }
}
