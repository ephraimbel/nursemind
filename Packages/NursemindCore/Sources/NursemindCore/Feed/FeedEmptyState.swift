import SwiftUI

/// Empty / loading / error states for the Feed list. All three follow the
/// editorial pattern: small eyebrow, large italic headline, short body
/// paragraph. No spinners except in the loading variant — and even there,
/// the spinner is subtle.
struct FeedEmptyState: View {
    enum Kind: Equatable {
        case loading
        case empty
        case offline
        case error(String)
    }

    let kind: Kind
    let onRetry: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel(eyebrowText, sparkle: false)

            Text(headline)
                .font(NMFont.displayItalicLG)
                .foregroundStyle(NMColor.textSecondary)
                .lineLimit(3)
                .multilineTextAlignment(.leading)

            Text(bodyCopy)
                .font(NMFont.body)
                .foregroundStyle(NMColor.textTertiary)
                .lineSpacing(3)

            if showRetry {
                Button(action: onRetry) {
                    HStack(spacing: 4) {
                        Text("Try again")
                            .font(NMFont.title)
                            .foregroundStyle(NMColor.accent)
                        Image(systemName: "arrow.right")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(NMColor.accent)
                    }
                    .padding(.top, NMSpace.sm)
                }
                .buttonStyle(.plain)
            } else if case .loading = kind {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(NMColor.textTertiary)
                    .padding(.top, NMSpace.sm)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, NMSpace.huge)
        .padding(.horizontal, NMSpace.lg)
    }

    // MARK: - Copy

    private var eyebrowText: String {
        switch kind {
        case .loading: return "LOADING"
        case .empty:   return "FEED"
        case .offline: return "OFFLINE"
        case .error:   return "COULDN'T LOAD"
        }
    }

    private var headline: String {
        switch kind {
        case .loading: return "Catching up on today's news."
        case .empty:   return "Nothing new yet."
        case .offline: return "No connection."
        case .error:   return "Something went sideways."
        }
    }

    private var bodyCopy: String {
        switch kind {
        case .loading:
            return "Hold tight — pulling the latest from the FDA, CDC, and MMWR."
        case .empty:
            return "We surface curated, cited items as they're published. Check back tomorrow."
        case .offline:
            return "The Feed works best on Wi-Fi or cellular. Once you're back online, pull to refresh."
        case .error(let detail):
            return detail.isEmpty
                ? "We couldn't load the Feed. Pull to refresh, or try again in a moment."
                : detail
        }
    }

    private var showRetry: Bool {
        switch kind {
        case .offline, .error: return true
        default: return false
        }
    }
}
