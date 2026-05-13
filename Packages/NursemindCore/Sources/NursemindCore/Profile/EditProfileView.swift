import SwiftUI

public struct EditProfileView: View {
    @State private var prefs = UserPreferences.shared
    @State private var nameDraft: String = ""
    @State private var yearsDraft: String = ""
    @FocusState private var nameFocused: Bool

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                EyebrowLabel("EDIT PROFILE", sparkle: false)
                    .padding(.top, NMSpace.xxl)
                Text("Tell us who you are")
                    .displayXL()
                    .padding(.top, NMSpace.md)
                Text("This personalizes content and is stored only on this device. We never collect your name or unit.")
                    .font(NMFont.body)
                    .foregroundStyle(NMColor.textSecondary)
                    .padding(.top, NMSpace.sm)
                    .lineSpacing(3)

                Hairline().padding(.vertical, NMSpace.xxl)

                fieldSection
                Hairline().padding(.vertical, NMSpace.xxl)
                roleSection
                Hairline().padding(.vertical, NMSpace.xxl)
                unitSection
                if prefs.unit == .icu {
                    Hairline().padding(.vertical, NMSpace.xxl)
                    icuSubspecialtySection
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            nameDraft = prefs.displayName
            if let yrs = prefs.yearsOfExperience { yearsDraft = String(yrs) }
        }
    }

    // MARK: - Name + years

    private var fieldSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            EyebrowLabel("BASICS", sparkle: false)
                .padding(.bottom, NMSpace.md)
            VStack(spacing: 0) {
                HStack(alignment: .firstTextBaseline) {
                    Text("Name")
                        .font(NMFont.bodyLG)
                    Spacer(minLength: NMSpace.base)
                    TextField("First name", text: $nameDraft)
                        .multilineTextAlignment(.trailing)
                        .font(NMFont.body)
                        .foregroundStyle(NMColor.textPrimary)
                        .focused($nameFocused)
                        .onChange(of: nameDraft) { _, newValue in
                            prefs.displayName = newValue
                        }
                }
                .padding(.vertical, NMSpace.base)
                Hairline(color: NMColor.borderSubtle)
                HStack(alignment: .firstTextBaseline) {
                    Text("Years of experience")
                        .font(NMFont.bodyLG)
                    Spacer(minLength: NMSpace.base)
                    TextField("0", text: $yearsDraft)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                        .font(NMFont.monoXL)
                        .foregroundStyle(NMColor.textPrimary)
                        .frame(maxWidth: 80)
                        .onChange(of: yearsDraft) { _, newValue in
                            let trimmed = newValue.trimmingCharacters(in: .whitespaces)
                            if trimmed.isEmpty { prefs.yearsOfExperience = nil }
                            else if let parsed = Int(trimmed), parsed >= 0, parsed < 80 {
                                prefs.yearsOfExperience = parsed
                            }
                        }
                    Text("yrs")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textTertiary)
                        .frame(minWidth: 36, alignment: .leading)
                }
                .padding(.vertical, NMSpace.base)
            }
        }
    }

    // MARK: - Role

    private var roleSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            EyebrowLabel("ROLE", sparkle: false)
                .padding(.bottom, NMSpace.md)
            VStack(spacing: 0) {
                ForEach(Array(UserRole.allCases.enumerated()), id: \.element) { idx, role in
                    Button {
                        prefs.role = role
                    } label: {
                        HStack {
                            Text(role.displayName)
                                .font(NMFont.bodyLG)
                                .foregroundStyle(NMColor.textPrimary)
                            Spacer()
                            if prefs.role == role {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(NMColor.accent)
                            }
                        }
                        .padding(.vertical, NMSpace.base)
                    }
                    .buttonStyle(.plain)
                    if idx < UserRole.allCases.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    // MARK: - ICU sub-specialty

    private var icuSubspecialtySection: some View {
        VStack(alignment: .leading, spacing: 0) {
            EyebrowLabel("ICU SUB-SPECIALTY", sparkle: false)
                .padding(.bottom, NMSpace.md)
            Text("Tunes the AI's default clinical context — Neuro ICU and CVICU have different drips, targets, and watch-fors.")
                .font(NMFont.body)
                .foregroundStyle(NMColor.textSecondary)
                .lineSpacing(3)
                .padding(.bottom, NMSpace.md)
            VStack(spacing: 0) {
                ForEach(Array(ICUSubspecialty.allCases.enumerated()), id: \.element) { idx, sub in
                    Button {
                        prefs.icuSubspecialty = sub
                    } label: {
                        HStack {
                            Text(sub.displayName)
                                .font(NMFont.bodyLG)
                                .foregroundStyle(NMColor.textPrimary)
                            Spacer()
                            if prefs.icuSubspecialty == sub {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(NMColor.accent)
                            }
                        }
                        .padding(.vertical, NMSpace.base)
                    }
                    .buttonStyle(.plain)
                    if idx < ICUSubspecialty.allCases.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    // MARK: - Unit

    private var unitSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            EyebrowLabel("UNIT / SETTING", sparkle: false)
                .padding(.bottom, NMSpace.md)
            VStack(spacing: 0) {
                ForEach(Array(NursingUnit.allCases.enumerated()), id: \.element) { idx, unit in
                    Button {
                        prefs.unit = unit
                    } label: {
                        HStack {
                            Text(unit.displayName)
                                .font(NMFont.bodyLG)
                                .foregroundStyle(NMColor.textPrimary)
                            Spacer()
                            if prefs.unit == unit {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(NMColor.accent)
                            }
                        }
                        .padding(.vertical, NMSpace.base)
                    }
                    .buttonStyle(.plain)
                    if idx < NursingUnit.allCases.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }
}
