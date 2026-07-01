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

    enum Step: Int, CaseIterable {
        case name, role, unit, experience

        var number: Int { rawValue + 1 }
        static let total = Self.allCases.count
    }

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            stepView
                .transition(directionalTransition)
        }
        .animation(.easeInOut(duration: 0.32), value: step)
    }

    /// Asymmetric slide derived from direction. Forward = new from trailing,
    /// old to leading. Back = mirrored.
    private var directionalTransition: AnyTransition {
        if isForward {
            return .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            )
        } else {
            return .asymmetric(
                insertion: .move(edge: .leading).combined(with: .opacity),
                removal: .move(edge: .trailing).combined(with: .opacity)
            )
        }
    }

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
                Text(question)
                    .font(NMFont.displayLG)
                    .foregroundStyle(NMColor.textPrimary)
                    .lineSpacing(2)
                    .opacity(visible[0] ? 1 : 0)
                    .offset(y: visible[0] ? 0 : 12)
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
            // Progress dots — minimal magazine-y signal of position.
            HStack(spacing: 6) {
                ForEach(1...PersonalizationFlow.Step.total, id: \.self) { i in
                    Circle()
                        .fill(i <= stepNumber ? NMColor.accent : NMColor.borderSubtle)
                        .frame(width: 6, height: 6)
                }
            }
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
                Text("This is how NurseMind will greet you.")
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textTertiary)
                    .padding(.top, NMSpace.xs)
            }
        }
        .onAppear { focused = true }
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
                    if idx < options.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
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
/// Title on the left, accent-color check on the right when selected.
/// Hairline-separated; consistent with the rest of the app's row patterns.
private struct OptionRow: View {
    let title: String
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button {
            if !isSelected { Haptic.selection() }
            onTap()
        } label: {
            HStack(spacing: NMSpace.base) {
                Text(title)
                    .font(NMFont.bodyLG)
                    .foregroundStyle(NMColor.textPrimary)
                Spacer(minLength: 0)
                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(NMColor.accent)
                        .transition(.scale(scale: 0.5).combined(with: .opacity))
                }
            }
            .padding(.vertical, NMSpace.base)
            .contentShape(Rectangle())
        }
        .buttonStyle(PressableButtonStyle())
        .animation(.easeOut(duration: 0.18), value: isSelected)
    }
}
