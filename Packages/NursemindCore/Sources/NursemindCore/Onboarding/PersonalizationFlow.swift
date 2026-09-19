import SwiftUI

/// Phase 1B onboarding sub-flow. Asks four personalization questions in
/// sequence — name, role, unit, experience — and writes them to
/// UserPreferences as the user progresses. Back from step 1 returns to
/// AuthView; Continue from step 4 advances to SafetyContract.
struct PersonalizationFlow: View {
    let onComplete: () -> Void
    let onBack: () -> Void

    @State private var step: Step = .name
    @State private var isForward: Bool = true
    @State private var prefs = UserPreferences.shared
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    enum Step: Int, CaseIterable {
        case name, role, unit, experience

        var number: Int { rawValue + 1 }
        static let total = Self.allCases.count
    }

    init(onComplete: @escaping () -> Void, onBack: @escaping () -> Void) {
        self.onComplete = onComplete
        self.onBack = onBack
        #if DEBUG
        // Dev-only: open on a given question for screenshots.
        //   SIMCTL_CHILD_NM_PERSONALIZATION_STEP=unit simctl launch …
        if let raw = ProcessInfo.processInfo.environment["NM_PERSONALIZATION_STEP"],
           let forced = Step.allCases.first(where: { "\($0)" == raw }) {
            _step = State(initialValue: forced)
        }
        #endif
    }

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            stepView
                .transition(OnboardingMotion.lift(reduceMotion: reduceMotion))
                .zIndex(Double(step.rawValue))
        }
        .animation(.easeInOut(duration: reduceMotion ? 0.2 : OnboardingMotion.base), value: step)
        // The flow's one rule advances question by question.
        .preference(key: OnboardingSubprogressKey.self,
                    value: [OnboardingSubprogress(step: "personalization", fraction: Double(step.rawValue) / Double(Step.total))])
        #if DEBUG
        .task { await autoplay() }
        #endif
    }

    #if DEBUG
    /// Under `NM_ONBOARDING_AUTOPLAY` the questions advance at the flow's
    /// cadence so the sub-step hand-offs can be reviewed too.
    private func autoplay() async {
        guard let raw = ProcessInfo.processInfo.environment["NM_ONBOARDING_AUTOPLAY"], let hold = Double(raw), hold > 0 else { return }
        while Step(rawValue: step.rawValue + 1) != nil {
            try? await Task.sleep(for: .seconds(hold))
            guard !Task.isCancelled else { return }
            advance()
        }
    }
    #endif

    @ViewBuilder
    private var stepView: some View {
        switch step {
        case .name:
            NameStep(
                stepNumber: step.number,
                onBack: { onBack() },
                onContinue: { advance() }
            )
        case .role:
            RoleStep(
                stepNumber: step.number,
                onBack: { goBack() },
                onContinue: { advance() }
            )
        case .unit:
            UnitStep(
                stepNumber: step.number,
                onBack: { goBack() },
                onContinue: { advance() }
            )
        case .experience:
            ExperienceStep(
                stepNumber: step.number,
                onBack: { goBack() },
                onContinue: { onComplete() }
            )
        }
    }

    private func advance() {
        guard let next = Step(rawValue: step.rawValue + 1) else {
            onComplete()
            return
        }
        isForward = true
        step = next
    }

    private func goBack() {
        guard let previous = Step(rawValue: step.rawValue - 1) else {
            onBack()
            return
        }
        isForward = false
        step = previous
    }
}

// MARK: - Shared step wrapper

/// Common chrome for every personalization step: back chevron, step
/// indicator, big serif question, content area, Continue button at bottom.
/// Sub-views inject their own option list / text field via the @ViewBuilder.
private struct PersonalizationStepShell<Content: View>: View {
    let stepNumber: Int
    let question: String
    let canContinue: Bool
    let onBack: () -> Void
    let onContinue: () -> Void
    let content: Content

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var visible: [Bool] = [false, false, false]

    init(
        stepNumber: Int,
        question: String,
        canContinue: Bool,
        onBack: @escaping () -> Void,
        onContinue: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.stepNumber = stepNumber
        self.question = question
        self.canContinue = canContinue
        self.onBack = onBack
        self.onContinue = onContinue
        self.content = content()
    }

    var body: some View {
        FitOrScrollLayout {
            VStack(alignment: .leading, spacing: 0) {
                header
                Spacer().frame(height: NMSpace.xxl)
                OnboardingMarkSlot(home: "personalization", size: 11)
                    .padding(.bottom, NMSpace.md)
                RevealHeadline(words: RevealHeadline.words(question, font: NMFont.displayLG, color: NMColor.textPrimary), wordSpacing: 9, lineSpacing: 2)
                    .id(question)
                    .opacity(visible[0] ? 1 : 0)
                Spacer().frame(height: NMSpace.xl)
                content
                    .opacity(visible[1] ? 1 : 0)
                    .offset(y: visible[1] ? 0 : 12)
                Spacer(minLength: NMSpace.xl)
                PrimaryCTAButton(title: "Continue", action: onContinue, isEnabled: canContinue)
                    .padding(.bottom, NMSpace.xl)
                    .opacity(visible[2] ? 1 : 0)
                    .offset(y: visible[2] ? 0 : 12)
            }
            .padding(.horizontal, NMSpace.lg)
        }
        .task { await stagger() }
    }

    /// Staggered fade-up: question → content → button, 100ms apart.
    /// Matches the Welcome page pattern. Reduce Motion: instant.
    private func stagger() async {
        guard !reduceMotion else {
            visible = Array(repeating: true, count: visible.count)
            return
        }
        for i in 0..<visible.count {
            withAnimation(.easeOut(duration: 0.45)) {
                visible[i] = true
            }
            try? await Task.sleep(nanoseconds: 100_000_000)
        }
    }

    private var header: some View {
        HStack {
            Button {
                Haptic.light()
                onBack()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(NMColor.textPrimary)
                    .frame(width: 32, height: 32)
                    .contentShape(Rectangle())
            }
            .buttonStyle(PressableButtonStyle())
            .accessibilityLabel("Back")
            Spacer()
        }
        .padding(.top, NMSpace.md)
    }
}

// MARK: - Step 1 · Name

private struct NameStep: View {
    let stepNumber: Int
    let onBack: () -> Void
    let onContinue: () -> Void

    @State private var prefs = UserPreferences.shared
    @FocusState private var focused: Bool

    var body: some View {
        PersonalizationStepShell(
            stepNumber: stepNumber,
            question: "What should\nwe call you?",
            canContinue: !prefs.displayName.trimmingCharacters(in: .whitespaces).isEmpty,
            onBack: onBack,
            onContinue: { focused = false; onContinue() }
        ) {
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                TextField("Your name", text: $prefs.displayName)
                    .font(NMFont.displayMD)
                    .foregroundStyle(NMColor.textPrimary)
                    .focused($focused)
                    .submitLabel(.continue)
                    .onSubmit {
                        if !prefs.displayName.trimmingCharacters(in: .whitespaces).isEmpty {
                            onContinue()
                        }
                    }
                    .padding(.bottom, NMSpace.sm)
                Hairline()
                greetingPreview
            }
        }
        .onAppear { focused = true }
    }

    /// Answers back as they type: the Success greeting, previewed live in
    /// the same italic serif it will be set in.
    @ViewBuilder
    private var greetingPreview: some View {
        let name = prefs.displayName.trimmingCharacters(in: .whitespaces)
        ZStack(alignment: .leading) {
            Text("This is how NurseMind will greet you.")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
                .opacity(name.isEmpty ? 1 : 0)
            (
                Text("Welcome, ").foregroundStyle(NMColor.textSecondary)
                + Text(name).foregroundStyle(NMColor.accent)
                + Text(".").foregroundStyle(NMColor.textSecondary)
            )
            .font(NMFont.displayItalicMD)
            .opacity(name.isEmpty ? 0 : 1)
        }
        .padding(.top, NMSpace.xs)
        .animation(.easeOut(duration: OnboardingMotion.quick), value: name.isEmpty)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(name.isEmpty ? "This is how NurseMind will greet you." : "Welcome, \(name).")
    }
}

// MARK: - Step 2 · Role

private struct RoleStep: View {
    let stepNumber: Int
    let onBack: () -> Void
    let onContinue: () -> Void

    @State private var prefs = UserPreferences.shared

    private let options: [UserRole] = [.rn, .lpn, .student, .cna, .other]

    var body: some View {
        PersonalizationStepShell(
            stepNumber: stepNumber,
            question: "What's your\nrole?",
            canContinue: true,  // role has a default, always valid
            onBack: onBack,
            onContinue: onContinue
        ) {
            VStack(spacing: 0) {
                ForEach(Array(options.enumerated()), id: \.element) { idx, role in
                    OptionRow(
                        title: role.displayName,
                        isSelected: prefs.role == role,
                        onTap: { prefs.role = role }
                    )
                    if idx < options.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }
}

// MARK: - Step 3 · Unit

private struct UnitStep: View {
    let stepNumber: Int
    let onBack: () -> Void
    let onContinue: () -> Void

    @State private var prefs = UserPreferences.shared

    /// Sorted with the most-common units first (Med-Surg, ICU, ER, etc.),
    /// then the rest alphabetically. Other goes last.
    private let options: [NursingUnit] = [
        .medSurg, .icu, .er, .stepDown,
        .lAndD, .pediatrics, .nicu,
        .oncology, .orthopedics, .operatingRoom,
        .psychMentalHealth, .homeHealth, .longTermCare,
        .clinic, .school, .other
    ]

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        PersonalizationStepShell(
            stepNumber: stepNumber,
            question: "Where do\nyou work?",
            canContinue: true,
            onBack: onBack,
            onContinue: onContinue
        ) {
            VStack(spacing: 0) {
                ForEach(Array(options.enumerated()), id: \.element) { idx, unit in
                    OptionRow(
                        title: unit.displayName,
                        isSelected: prefs.unit == unit,
                        onTap: { prefs.unit = unit }
                    )
                    if unit == .icu, prefs.unit == .icu {
                        icuSubspecialties
                    }
                    if idx < options.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
            .animation(reduceMotion ? nil : .easeOut(duration: OnboardingMotion.base), value: prefs.unit)
        }
    }

    /// Choosing ICU folds its sub-specialties open beneath the row. The
    /// choice tunes the AI's default context: Neuro ICU and CVICU have
    /// different drips, targets and watch-fors.
    private var icuSubspecialties: some View {
        VStack(spacing: 0) {
            Hairline(color: NMColor.borderSubtle)
            ForEach(Array(ICUSubspecialty.allCases.enumerated()), id: \.element) { idx, sub in
                OptionRow(
                    title: sub.displayName,
                    isSelected: prefs.icuSubspecialty == sub,
                    compact: true,
                    onTap: { prefs.icuSubspecialty = sub }
                )
                if idx < ICUSubspecialty.allCases.count - 1 {
                    Hairline(color: NMColor.borderSubtle)
                }
            }
        }
        .padding(.leading, NMSpace.xl)
        .transition(.asymmetric(insertion: .opacity.combined(with: .offset(y: -6)), removal: .opacity))
    }
}

// MARK: - Step 4 · Experience

private struct ExperienceStep: View {
    let stepNumber: Int
    let onBack: () -> Void
    let onContinue: () -> Void

    @State private var prefs = UserPreferences.shared

    private let options: [(label: String, years: Int?)] = [
        ("Student",       0),
        ("0–1 year",      1),
        ("2–5 years",     3),
        ("6–10 years",    8),
        ("10+ years",     12)
    ]

    var body: some View {
        PersonalizationStepShell(
            stepNumber: stepNumber,
            question: "How long have\nyou been nursing?",
            canContinue: true,
            onBack: onBack,
            onContinue: { prefs.yearsOfExperience = selectedYears; onContinue() }
        ) {
            VStack(spacing: 0) {
                ForEach(Array(options.enumerated()), id: \.offset) { idx, option in
                    OptionRow(
                        title: option.label,
                        isSelected: prefs.yearsOfExperience == option.years,
                        onTap: { prefs.yearsOfExperience = option.years }
                    )
                    if idx < options.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    private var selectedYears: Int? {
        prefs.yearsOfExperience
    }
}

// MARK: - Reusable option row

/// Tappable row used across all multiple-choice personalization steps.
/// Title on the left, an ink check on the right when selected, and a line
/// of ink that runs across the row as the choice lands, over the subtle
/// divider beneath it. Green stays with the Continue button.
private struct OptionRow: View {
    let title: String
    let isSelected: Bool
    var compact: Bool = false
    let onTap: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        Button {
            if !isSelected { Haptic.selection() }
            onTap()
        } label: {
            HStack(spacing: NMSpace.base) {
                Text(title)
                    .font(compact ? NMFont.body : NMFont.bodyLG)
                    .foregroundStyle(NMColor.textPrimary)
                Spacer(minLength: 0)
                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.system(size: compact ? 13 : 15, weight: .semibold))
                        .foregroundStyle(NMColor.textPrimary)
                        .transition(.scale(scale: 0.5).combined(with: .opacity))
                }
            }
            .padding(.vertical, compact ? NMSpace.md : NMSpace.base)
            .contentShape(Rectangle())
            .overlay(alignment: .bottom) {
                Rectangle()
                    .fill(NMColor.textPrimary)
                    .frame(height: 1)
                    .scaleEffect(x: isSelected ? 1 : 0, anchor: .leading)
                    .offset(y: 1)
            }
        }
        .buttonStyle(PressableButtonStyle())
        // The line sits where the divider below would be, so the chosen row
        // draws above its neighbours.
        .zIndex(isSelected ? 1 : 0)
        .animation(reduceMotion ? nil : .easeOut(duration: OnboardingMotion.base), value: isSelected)
    }
}
