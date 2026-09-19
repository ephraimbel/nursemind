import SwiftUI

/// Today's case, or a past one read-only. Stem → cues → prompt → four
/// hairline option rows → on answer, the best step gets a ✓, the chosen
/// wrong step is annotated, every rationale renders with its citations,
/// then the references and related library entries. No score, no timer.
struct MicroCaseView: View {
    let microCase: MicroCase
    let readOnly: Bool

    @State private var progress = MicroCaseProgress.shared
    @State private var router = AppRouter.shared
    @State private var appearedAt = Date()
    @Environment(\.openURL) private var openURL
    @AccessibilityFocusState private var lessonFocused: Bool

    private var answer: MicroCaseProgress.Answer? { progress.answer(for: microCase.id) }
    private var revealed: Bool { readOnly || answer != nil }
    private var canAnswer: Bool { !readOnly && answer == nil }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header
                    .padding(.top, NMSpace.xxl)
                    .padding(.bottom, NMSpace.xxl)

                Text(microCase.stem)
                    .font(NMFont.bodyLG)
                    .foregroundStyle(NMColor.textPrimary)
                    .lineSpacing(6)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, NMSpace.xxl)

                cuesSection
                    .padding(.bottom, NMSpace.xxl)

                Hairline()
                    .padding(.bottom, NMSpace.xxl)

                Text(microCase.prompt)
                    .font(NMFont.displayMD)
                    .tracking(-0.4)
                    .foregroundStyle(NMColor.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityAddTraits(.isHeader)
                    .padding(.bottom, NMSpace.lg)

                optionsSection
                    .padding(.bottom, NMSpace.xxl)

                if revealed {
                    Hairline().padding(.bottom, NMSpace.xxl)
                    lessonSection.padding(.bottom, NMSpace.xxl)
                    rationaleSection.padding(.bottom, NMSpace.xxl)
                    if !relatedEntries.isEmpty {
                        Hairline().padding(.bottom, NMSpace.xxl)
                        relatedSection.padding(.bottom, NMSpace.xxl)
                    }
                    Hairline().padding(.bottom, NMSpace.xxl)
                    referencesSection.padding(.bottom, NMSpace.huge)
                } else {
                    Text("Choose the single best next step. You get one answer; the rationale for every option follows.")
                        .font(NMFont.bodySM)
                        .italic()
                        .foregroundStyle(NMColor.textTertiary)
                        .padding(.bottom, NMSpace.huge)
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .frame(maxWidth: 460)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            appearedAt = Date()
            MicroCaseAnalytics.opened(microCase, readOnly: readOnly)
        }
    }

    // MARK: - Sections

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            // One eyebrow string so it wraps at large type and reads as a
            // single heading: "Today's case · Adult · Analyze cues".
            EyebrowLabel("\(readOnly ? "Past case" : "Today's case") · \(microCase.populationLabel.capitalized) · \(microCase.step.label)")
            Text(microCase.title)
                .font(NMFont.displayXL)
                .tracking(-1.6)
                .foregroundStyle(NMColor.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityAddTraits(.isHeader)
            Text(Self.longDate(microCase.publishOn))
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
        }
    }

    private var cuesSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            EyebrowLabel("WHAT YOU NOTICE", sparkle: false)
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                ForEach(Array(microCase.cues.enumerated()), id: \.offset) { idx, cue in
                    HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
                        Text("—").font(NMFont.body).foregroundStyle(NMColor.textTertiary)
                            .accessibilityHidden(true)
                        Text(cue)
                            .font(NMFont.body)
                            .foregroundStyle(NMColor.textPrimary)
                            .lineSpacing(3)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Cue \(idx + 1) of \(microCase.cues.count): \(cue)")
                }
            }
        }
    }

    private var optionsSection: some View {
        VStack(spacing: 0) {
            ForEach(Array(microCase.options.enumerated()), id: \.offset) { idx, option in
                // Before answering the rows are buttons; afterwards (and in
                // read-only past cases) they are plain text, so VoiceOver
                // does not read four "dimmed" buttons.
                if canAnswer {
                    Button {
                        choose(idx)
                    } label: {
                        optionRow(idx, option)
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel(accessibilityLabel(for: idx, option))
                    .accessibilityHint("Double tap to choose this as the next step")
                } else {
                    optionRow(idx, option)
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(accessibilityLabel(for: idx, option))
                        .accessibilityAddTraits(answer?.chosenIndex == idx ? [.isStaticText, .isSelected] : [.isStaticText])
                }
                if idx < microCase.options.count - 1 {
                    Hairline(color: NMColor.borderSubtle)
                }
            }
        }
    }

    private func optionRow(_ idx: Int, _ option: MicroCase.Option) -> some View {
        let isBest = idx == microCase.bestOptionIndex
        let isChosen = answer?.chosenIndex == idx
        let dim = revealed && !isBest && !isChosen
        return HStack(alignment: .firstTextBaseline, spacing: NMSpace.base) {
            Group {
                if revealed && isBest {
                    Text("✓").font(NMFont.title).foregroundStyle(NMColor.textPrimary)
                } else if revealed && isChosen {
                    Image(systemName: "circle.fill").font(.system(size: 9)).foregroundStyle(NMColor.textTertiary)
                } else {
                    Image(systemName: "circle").font(.system(size: 13, weight: .light)).foregroundStyle(NMColor.textTertiary)
                }
            }
            .frame(width: 18, alignment: .center)
            VStack(alignment: .leading, spacing: 3) {
                Text(option.text)
                    .font(NMFont.bodyLG)
                    .foregroundStyle(dim ? NMColor.textTertiary : NMColor.textPrimary)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(3)
                    .fixedSize(horizontal: false, vertical: true)
                if revealed && isBest {
                    Text(isChosen ? "Your choice · the best next step" : "The best next step")
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textSecondary)
                } else if revealed && isChosen {
                    Text("Your choice")
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textSecondary)
                }
            }
            Spacer(minLength: 0)
        }
        .padding(.vertical, NMSpace.base)
        .contentShape(Rectangle())
    }

    private var lessonSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            EyebrowLabel("THE LESSON", sparkle: false)
            Text(microCase.takeaway)
                .font(NMFont.displayItalicLG)
                .foregroundStyle(NMColor.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("The lesson: \(microCase.takeaway)")
        .accessibilityFocused($lessonFocused)
    }

    private var rationaleSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("WHY", sparkle: false)
            VStack(alignment: .leading, spacing: NMSpace.lg) {
                ForEach(Array(microCase.options.enumerated()), id: \.offset) { idx, option in
                    let isBest = idx == microCase.bestOptionIndex
                    VStack(alignment: .leading, spacing: NMSpace.xs) {
                        Text(isBest ? "✓ \(option.text)" : option.text)
                            .font(NMFont.title)
                            .foregroundStyle(NMColor.textPrimary)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(option.rationale.text + superscript(option.rationale.citationIDs))
                            .font(NMFont.body)
                            .foregroundStyle(NMColor.textSecondary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("\(isBest ? "Best next step" : "Option \(idx + 1)"): \(Self.sentence(option.text)) \(Self.sentence(option.rationale.text)) \(sourcesSpoken(option.rationale.citationIDs))")
                }
            }
        }
    }

    private var relatedEntries: [LibraryEntry] {
        microCase.relatedEntryIDs.compactMap { ContentRegistry.shared.entry(byID: $0) }
    }

    private var relatedSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            EyebrowLabel("IN YOUR LIBRARY", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(relatedEntries.enumerated()), id: \.element.id) { idx, entry in
                    Button {
                        MicroCaseAnalytics.relatedOpened(microCase, entryID: entry.id)
                        router.openLibraryEntry(entry.id)
                    } label: {
                        ToolLinkRow(
                            eyebrow: entry.category.singularName.uppercased(),
                            title: entry.title,
                            subtitle: entry.subtitle ?? ""
                        )
                    }
                    .buttonStyle(.plain)
                    if idx < relatedEntries.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    private var referencesSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("REFERENCES", sparkle: false)
            VStack(alignment: .leading, spacing: NMSpace.md) {
                ForEach(Array(microCase.citations.enumerated()), id: \.element.id) { idx, source in
                    Button {
                        if let url = URL(string: source.url) { openURL(url) }
                    } label: {
                        referenceRow(idx, source)
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Reference \(idx + 1): \(source.shortName)")
                    .accessibilityHint("Opens \(URL(string: source.url)?.host ?? "the source") in the browser")
                    if idx < microCase.citations.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    private func referenceRow(_ idx: Int, _ source: CitationSource) -> some View {
                        HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
                            Text("[\(idx + 1)]")
                                .font(NMFont.mono)
                                .foregroundStyle(NMColor.link)
                            VStack(alignment: .leading, spacing: NMSpace.xs) {
                                Text(source.shortName)
                                    .font(NMFont.body)
                                    .foregroundStyle(NMColor.textPrimary)
                                    .multilineTextAlignment(.leading)
                                HStack(spacing: 4) {
                                    Image(systemName: "arrow.up.right").font(.system(size: 11))
                                    Text(URL(string: source.url)?.host ?? source.url).font(NMFont.bodySM)
                                }
                                .foregroundStyle(NMColor.link)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
    }

    // MARK: - Actions & helpers

    private func choose(_ idx: Int) {
        guard canAnswer else { return }
        Haptic.selection()
        let recorded = progress.record(microCase, chosenIndex: idx)
        MicroCaseAnalytics.answered(microCase, correct: recorded.correct, secondsToAnswer: Date().timeIntervalSince(appearedAt))
        // Tell VoiceOver the page changed and land it on the lesson.
        AccessibilityNotification.Announcement(
            recorded.correct ? "That is the best next step. The lesson and rationale are below." : "Not the best step. The best step is marked; the lesson and rationale are below."
        ).post()
        Task { @MainActor in
            try? await Task.sleep(for: .milliseconds(450))
            lessonFocused = true
        }
    }

    private func sourcesSpoken(_ ids: [String]) -> String {
        let numbers = ids.compactMap { microCase.citationIndex[$0] }.map(String.init)
        guard !numbers.isEmpty else { return "" }
        return numbers.count == 1 ? "Source \(numbers[0])." : "Sources \(numbers.joined(separator: " and "))."
    }

    private func accessibilityLabel(for idx: Int, _ option: MicroCase.Option) -> String {
        var label = "Option \(idx + 1) of \(microCase.options.count): \(Self.sentence(option.text))"
        if revealed {
            if idx == microCase.bestOptionIndex { label += " The best next step." }
            if answer?.chosenIndex == idx { label += " Your choice." }
        }
        return label
    }

    /// Ends `text` with a period unless it already ends with terminal
    /// punctuation, so spoken labels never contain "..".
    static func sentence(_ text: String) -> String {
        let trimmed = text.trimmingCharacters(in: .whitespaces)
        guard let last = trimmed.last else { return trimmed }
        return ".!?".contains(last) ? trimmed : trimmed + "."
    }

    private func superscript(_ ids: [String]) -> String {
        let index = microCase.citationIndex
        let digits = ids.compactMap { index[$0] }.map(superscriptDigits).joined(separator: "·")
        return digits.isEmpty ? "" : " " + digits
    }

    private static func longDate(_ key: String) -> String {
        let parts = key.split(separator: "-").compactMap { Int($0) }
        guard parts.count == 3,
              let date = Calendar.current.date(from: DateComponents(year: parts[0], month: parts[1], day: parts[2])) else { return key }
        let fmt = DateFormatter()
        fmt.dateFormat = "EEEE, MMMM d"
        return fmt.string(from: date)
    }
}

/// The Feed's daily block: one hairline-bounded row above the stories.
/// Unanswered: title, a one-line tease, Open. Answered: a single quiet line
/// with the lesson that reopens the rationale.
struct TodaysCaseBlock: View {
    let microCase: MicroCase
    let onOpen: () -> Void

    @State private var progress = MicroCaseProgress.shared

    var body: some View {
        let answered = progress.answer(for: microCase.id) != nil
        Button(action: onOpen) {
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                if answered {
                    HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
                        Text("✓").font(NMFont.title).foregroundStyle(NMColor.textSecondary)
                        Text("Answered · ")
                            .font(NMFont.body)
                            .foregroundStyle(NMColor.textSecondary)
                        + Text(microCase.takeaway)
                            .font(NMFont.displayItalicMD)
                            .foregroundStyle(NMColor.textPrimary)
                    }
                    .lineLimit(2)
                } else {
                    EyebrowLabel("TODAY'S CASE", sparkle: false)
                    Text(microCase.title)
                        .font(NMFont.displayMD)
                        .tracking(-0.6)
                        .foregroundStyle(NMColor.textPrimary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    Text(microCase.stem)
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    HStack(spacing: 4) {
                        Text("Open the case")
                            .font(NMFont.title)
                            .foregroundStyle(NMColor.textPrimary)
                        Image(systemName: "arrow.right")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(NMColor.textPrimary)
                    }
                    .padding(.top, NMSpace.xs)
                }
            }
            .padding(.vertical, NMSpace.lg)
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(answered ? "Today's case, answered. The lesson: \(microCase.takeaway)" : "Today's case: \(microCase.title)")
        .accessibilityHint(answered ? "Opens the rationale" : "Opens today's clinical judgment case")
        .onAppear { MicroCaseAnalytics.shown(microCase, answered: answered) }
    }
}

/// Profile → Past cases: a plain dated list. ✓ answered with the best step,
/// – answered otherwise, blank when it went unanswered. Read-only inside.
public struct PastCasesView: View {
    @State private var progress = MicroCaseProgress.shared
    private let cases = MicroCaseRegistry.shared.pastCases(before: Date())

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                EyebrowLabel("PAST CASES", sparkle: false)
                    .padding(.top, NMSpace.xxl)
                Text("One a day, kept.")
                    .displayXL()
                    .accessibilityAddTraits(.isHeader)
                    .padding(.top, NMSpace.md)
                Text("Reopen any case to read the rationale. Past cases are read-only.")
                    .font(NMFont.body)
                    .foregroundStyle(NMColor.textSecondary)
                    .padding(.top, NMSpace.sm)
                    .lineSpacing(3)

                Hairline().padding(.vertical, NMSpace.xxl)

                if cases.isEmpty {
                    Text("Today's case is the first. Yesterday's will appear here tomorrow.")
                        .font(NMFont.displayItalicMD)
                        .foregroundStyle(NMColor.textSecondary)
                } else {
                    VStack(spacing: 0) {
                        ForEach(cases) { c in
                            NavigationLink(value: ProfileDestination.pastCase(c.id)) {
                                HStack(alignment: .firstTextBaseline, spacing: NMSpace.base) {
                                    Text(glyph(for: c))
                                        .font(NMFont.title)
                                        .foregroundStyle(NMColor.textSecondary)
                                        .frame(width: 18, alignment: .center)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(c.title)
                                            .font(NMFont.bodyLG)
                                            .foregroundStyle(NMColor.textPrimary)
                                            .multilineTextAlignment(.leading)
                                        Text(Self.shortDate(c.publishOn))
                                            .font(NMFont.label)
                                            .tracking(1.2)
                                            .foregroundStyle(NMColor.textTertiary)
                                    }
                                    Spacer(minLength: 0)
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(NMColor.textQuaternary)
                                }
                                .padding(.vertical, NMSpace.base)
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                            .accessibilityLabel("\(status(for: c)). \(c.title). \(Self.longDate(c.publishOn))")
                            .accessibilityHint("Opens the case read-only")
                            if c.id != cases.last?.id {
                                Hairline(color: NMColor.borderSubtle)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.bottom, NMSpace.huge)
            .frame(maxWidth: 460)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    private func glyph(for c: MicroCase) -> String {
        guard let a = progress.answer(for: c.id) else { return " " }
        return a.correct ? "✓" : "–"
    }

    private func status(for c: MicroCase) -> String {
        guard let a = progress.answer(for: c.id) else { return "Not answered" }
        return a.correct ? "Answered with the best step" : "Answered"
    }

    private static func longDate(_ key: String) -> String {
        let parts = key.split(separator: "-").compactMap { Int($0) }
        guard parts.count == 3,
              let date = Calendar.current.date(from: DateComponents(year: parts[0], month: parts[1], day: parts[2])) else { return key }
        let fmt = DateFormatter()
        fmt.dateFormat = "EEEE, MMMM d"
        return fmt.string(from: date)
    }

    private static func shortDate(_ key: String) -> String {
        let parts = key.split(separator: "-").compactMap { Int($0) }
        guard parts.count == 3,
              let date = Calendar.current.date(from: DateComponents(year: parts[0], month: parts[1], day: parts[2])) else { return key }
        let fmt = DateFormatter()
        fmt.dateFormat = "MMM d"
        return fmt.string(from: date).uppercased()
    }
}
