import SwiftUI

/// OpenEvidence-style references panel that appears below an AI message.
/// Shows the first 3 references by default with a "Show all N" disclosure that
/// reveals the remainder. Tapping a row presents the same in-app citation card
/// the inline pills use — consistent surface across both interaction points.
public struct ReferencesSection: View {
    let citations: [CitationSource]
    @State private var showAll: Bool = false
    @State private var presentedIndex: Int?

    private static let collapsedCount = 3

    public init(citations: [CitationSource]) {
        self.citations = citations
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.base) {
            header
            VStack(alignment: .leading, spacing: NMSpace.base) {
                ForEach(Array(visibleCitations.enumerated()), id: \.element.id) { index, source in
                    ReferenceRow(number: index + 1, source: source) {
                        presentedIndex = index + 1
                    }
                }
            }
            .padding(.top, NMSpace.xs)
            if citations.count > Self.collapsedCount {
                disclosureButton
            }
        }
        .sheet(
            isPresented: Binding(
                get: { presentedIndex != nil },
                set: { if !$0 { presentedIndex = nil } }
            )
        ) {
            if let idx = presentedIndex {
                CitationCardView(
                    number: idx,
                    source: citations[idx - 1],
                    totalCount: citations.count
                )
            }
        }
    }

    private var visibleCitations: [CitationSource] {
        showAll ? citations : Array(citations.prefix(Self.collapsedCount))
    }

    private var header: some View {
        HStack(spacing: NMSpace.sm) {
            Image(systemName: "list.number")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(NMColor.textSecondary)
            Text("References")
                .font(NMFont.title)
                .foregroundStyle(NMColor.textPrimary)
            Spacer()
        }
    }

    private var disclosureButton: some View {
        Button {
            withAnimation(.easeOut(duration: 0.2)) { showAll.toggle() }
        } label: {
            HStack(spacing: NMSpace.xs) {
                Text(showAll ? "Show fewer" : "Show all \(citations.count)")
                    .font(NMFont.body)
                    .foregroundStyle(NMColor.textSecondary)
                Image(systemName: showAll ? "chevron.up" : "chevron.down")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(NMColor.textTertiary)
            }
            .padding(.top, NMSpace.xs)
        }
        .buttonStyle(.plain)
    }
}

private struct ReferenceRow: View {
    let number: Int
    let source: CitationSource
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .top, spacing: NMSpace.sm) {
                Text("\(number).")
                    .font(NMFont.bodyLG)
                    .foregroundStyle(source.pillIconColor)
                    .frame(width: 22, alignment: .trailing)
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .firstTextBaseline, spacing: 4) {
                        Text(source.shortName)
                            .font(NMFont.bodyLG)
                            .foregroundStyle(NMColor.link)
                            .multilineTextAlignment(.leading)
                        Image(systemName: "arrow.up.right")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundStyle(NMColor.link)
                    }

                    if let line = source.referenceFormattedLine {
                        Text(line)
                            .font(NMFont.bodySM)
                            .foregroundStyle(NMColor.textSecondary)
                            .lineSpacing(2)
                    }

                    HStack(spacing: NMSpace.xs + 2) {
                        if let tag = source.typeBadgeLabel {
                            TypeBadge(label: tag, color: source.pillIconColor)
                        }
                        LicenseBadge(label: source.licenseDisplayName)
                        Spacer(minLength: 0)
                    }
                    .padding(.top, 2)
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

private struct TypeBadge: View {
    let label: String
    let color: Color

    var body: some View {
        Text(label)
            .font(.system(size: 10, weight: .medium))
            .foregroundStyle(color)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(
                Capsule().fill(color.opacity(0.12))
            )
    }
}

private struct LicenseBadge: View {
    let label: String

    var body: some View {
        Text(label)
            .font(.system(size: 10, weight: .regular))
            .foregroundStyle(NMColor.textTertiary)
    }
}
