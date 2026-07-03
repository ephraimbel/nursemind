import SwiftUI

/// Shared body for every "long list of library entries" surface (category
/// lists, NCLEX subcategory lists): a pinned scoped filter field above a
/// lazy scrolling list. Large unfiltered lists get sticky letter headers;
/// small or filtered lists render flat — a letter header per one or two
/// entries is noise, not navigation.
struct FilteredEntryList: View {
    let entries: [LibraryEntry]
    @Binding var filter: String
    @State private var highAlertOnly = false

    /// Below this size a list is scannable without letter grouping.
    private static let groupingThreshold = 40

    private var trimmedFilter: String {
        filter.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private var highAlertCount: Int {
        entries.lazy.filter(\.isHighAlert).count
    }

    private var filtered: [LibraryEntry] {
        var out = entries
        if highAlertOnly {
            out = out.filter(\.isHighAlert)
        }
        guard !trimmedFilter.isEmpty else { return out }
        let q = trimmedFilter.lowercased()
        return out.filter { entry in
            entry.title.lowercased().contains(q)
                || (entry.subtitle?.lowercased().contains(q) ?? false)
        }
    }

    var body: some View {
        let visible = filtered
        VStack(alignment: .leading, spacing: 0) {
            ListFilterField(prompt: filterPrompt, text: $filter)
                .padding(.horizontal, NMSpace.lg)
                .padding(.top, NMSpace.base)
                .padding(.bottom, NMSpace.md)
            if highAlertCount > 0 {
                HighAlertFilterToggle(isOn: $highAlertOnly, count: highAlertCount)
                    .padding(.horizontal, NMSpace.lg)
                    .padding(.bottom, NMSpace.md)
            }
            Hairline()
            if visible.isEmpty {
                noMatches
            } else if trimmedFilter.isEmpty && visible.count >= Self.groupingThreshold {
                groupedList(visible)
            } else {
                flatList(visible)
            }
        }
    }

    private var filterPrompt: String {
        "Filter \(entries.count) \(entries.count == 1 ? "entry" : "entries")"
    }

    // MARK: - Lists

    private func flatList(_ entries: [LibraryEntry]) -> some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                rows(entries)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.sm)
            .padding(.bottom, NMSpace.huge)
        }
    }

    private func groupedList(_ entries: [LibraryEntry]) -> some View {
        // Digit-titled entries ("4-factor PCC", "12-lead ECG") group under a
        // single "#" bucket, sorted first — a letter header per digit is noise.
        let grouped = Dictionary(grouping: entries) { entry -> String in
            let first = String(entry.title.prefix(1)).uppercased()
            return first.first?.isNumber == true ? "#" : first
        }
        let letters = grouped.keys.sorted { a, b in
            if a == "#" { return true }
            if b == "#" { return false }
            return a < b
        }

        return ScrollView {
            LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                ForEach(letters, id: \.self) { letter in
                    Section {
                        rows(grouped[letter] ?? [])
                    } header: {
                        LetterHeader(letter: letter)
                    }
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.bottom, NMSpace.huge)
        }
    }

    @ViewBuilder
    private func rows(_ entries: [LibraryEntry]) -> some View {
        ForEach(Array(entries.enumerated()), id: \.element.id) { idx, entry in
            NavigationLink(value: LibraryDestination.entry(entry.id)) {
                EntryRow(entry: entry, hidesCategoryFallback: true)
            }
            .buttonStyle(.plain)
            if idx < entries.count - 1 {
                Hairline(color: NMColor.borderSubtle)
            }
        }
    }

    private var noMatches: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            Text("Nothing matches \(Text("\u{201C}\(trimmedFilter)\u{201D}").italic()).")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
            Text("Try fewer letters, or search the whole library.")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.horizontal, NMSpace.lg)
        .padding(.top, NMSpace.xxl)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

/// ISMP high-alert filter — appears only on lists that contain high-alert
/// entries (drugs, drips). Uses the exact `isHighAlert` flag, mirroring the
/// terracotta chip vocabulary from entry rows.
private struct HighAlertFilterToggle: View {
    @Binding var isOn: Bool
    let count: Int

    var body: some View {
        Button {
            Haptic.light()
            withAnimation(.easeOut(duration: 0.15)) { isOn.toggle() }
        } label: {
            HStack(spacing: 5) {
                Image(systemName: "exclamationmark.triangle")
                    .font(.system(size: 9, weight: .medium))
                Text("HIGH-ALERT · \(count)")
                    .font(.system(size: 10, weight: .medium))
                    .tracking(1.0)
            }
            .foregroundStyle(isOn ? NMColor.alertHigh : NMColor.textTertiary)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(isOn ? NMColor.alertHighBg : Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(isOn ? NMColor.alertHighBorder : NMColor.border, lineWidth: 1)
                    )
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Show only high-alert medications")
        .accessibilityValue(isOn ? "On" : "Off")
    }
}

/// Sticky letter header. Solid base-color bar so scrolling rows disappear
/// cleanly beneath it — the grain texture is subtle enough that the seam
/// is invisible.
private struct LetterHeader: View {
    let letter: String

    var body: some View {
        Text(letter)
            .font(NMFont.displayItalicMD)
            .foregroundStyle(NMColor.textTertiary)
            .padding(.vertical, NMSpace.xs)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(NMColor.bgPrimary)
    }
}
