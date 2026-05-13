import SwiftUI

public struct AboutView: View {
    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                EyebrowLabel("ABOUT", sparkle: false)
                    .padding(.top, NMSpace.xxl)
                Text("NurseMind")
                    .displayXL()
                    .padding(.top, NMSpace.md)
                Text("A reference app built for U.S. nurses.")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                    .padding(.top, NMSpace.xs)

                Hairline().padding(.vertical, NMSpace.xxl)

                VStack(alignment: .leading, spacing: NMSpace.md) {
                    EyebrowLabel("WHAT NURSEMIND IS", sparkle: false)
                    Text("A premium reference and study tool for licensed and student nurses. We bundle a curated library of evidence-based clinical reference content, a strictly-scoped AI co-pilot grounded in that library, and a complete suite of nursing calculators into a single, beautifully designed experience.")
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineSpacing(4)
                }

                Hairline().padding(.vertical, NMSpace.xxl)

                VStack(alignment: .leading, spacing: NMSpace.md) {
                    EyebrowLabel("WHAT NURSEMIND IS NOT", sparkle: false)
                    Text("NurseMind is a reference and study tool, not clinical decision support. It does not diagnose, prescribe, or replace independent verification by a licensed provider. Treat it as a study companion — a place to look something up, build understanding, and check what you already know.")
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineSpacing(4)
                }

                Hairline().padding(.vertical, NMSpace.xxl)

                VStack(alignment: .leading, spacing: NMSpace.md) {
                    EyebrowLabel("LEGAL", sparkle: false)
                    InAppDocLink(label: "Privacy policy",  document: .privacyPolicy)
                    Hairline(color: NMColor.borderSubtle)
                    InAppDocLink(label: "Terms of service", document: .termsOfUse)
                    Hairline(color: NMColor.borderSubtle)
                    aboutLink(label: "EULA", url: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")
                }

                Hairline().padding(.vertical, NMSpace.xxl)

                VStack(alignment: .leading, spacing: NMSpace.md) {
                    EyebrowLabel("CONTACT", sparkle: false)
                    aboutLink(label: "Email support",  url: "mailto:\(LegalLinks.supportEmail)")
                    Hairline(color: NMColor.borderSubtle)
                    aboutLink(label: "nursemind.app",  url: "https://nursemind.app")
                }

                Hairline().padding(.vertical, NMSpace.xxl)

                Text("Built by nurses and engineers who care.")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textTertiary)
                    .padding(.top, NMSpace.lg)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    private func aboutLink(label: String, url: String) -> some View {
        Link(destination: URL(string: url) ?? URL(string: "https://nursemind.app")!) {
            HStack {
                Text(label)
                    .font(NMFont.bodyLG)
                    .foregroundStyle(NMColor.textPrimary)
                Spacer()
                Image(systemName: "arrow.up.forward.app")
                    .font(.system(size: 14))
                    .foregroundStyle(NMColor.textTertiary)
            }
            .padding(.vertical, NMSpace.base)
        }
    }
}

/// Row that pushes a bundled legal document onto the surrounding
/// `NavigationStack`. Matches `aboutLink`'s visual rhythm but uses the
/// in-app `LegalDocumentView` renderer rather than opening Safari — keeps
/// App Review-visible legal content reachable offline.
private struct InAppDocLink: View {
    let label: String
    let document: LegalDocumentView.Document

    var body: some View {
        NavigationLink(value: ProfileDestination(forDocument: document)) {
            HStack {
                Text(label)
                    .font(NMFont.bodyLG)
                    .foregroundStyle(NMColor.textPrimary)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
            }
            .padding(.vertical, NMSpace.base)
        }
        .buttonStyle(.plain)
    }
}

private extension ProfileDestination {
    init(forDocument doc: LegalDocumentView.Document) {
        switch doc {
        case .termsOfUse:    self = .termsOfUse
        case .privacyPolicy: self = .privacyPolicy
        }
    }
}
