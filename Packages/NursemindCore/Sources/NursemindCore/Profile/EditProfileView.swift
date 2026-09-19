import SwiftUI
import PhotosUI

public struct EditProfileView: View {
    @State private var prefs = UserPreferences.shared
    @State private var nameDraft: String = ""
    @State private var yearsDraft: String = ""
    @State private var photoSelection: PhotosPickerItem?
    @State private var photoFailed = false
    @State private var cameraPresented = false
    @State private var cameraDenied = false
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
                Text("This personalizes content and is stored only on this device. We never collect your name, unit, or photo.")
                    .font(NMFont.body)
                    .foregroundStyle(NMColor.textSecondary)
                    .padding(.top, NMSpace.sm)
                    .lineSpacing(3)

                Hairline().padding(.vertical, NMSpace.xxl)

                photoSection
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
        .onChange(of: photoSelection) { _, item in
            guard let item else { return }
            Task { await importPhoto(item) }
        }
        .alert("That photo couldn't be used", isPresented: $photoFailed) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Try a different photo from your library.")
        }
        .alert("Camera access is off", isPresented: $cameraDenied) {
            Button("Open Settings") {
                if let url = URL(string: UIApplication.openSettingsURLString) { UIApplication.shared.open(url) }
            }
            Button("Not now", role: .cancel) {}
        } message: {
            Text("Allow NurseMind to use the camera in Settings to take a profile photo. You can still choose one from your library.")
        }
        .fullScreenCover(isPresented: $cameraPresented) {
            ProfilePhotoCamera { image in
                cameraPresented = false
                guard let image else { return }
                Task { await store(image) }
            }
            .ignoresSafeArea()
        }
    }

    // MARK: - Photo

    /// The avatar with its quiet actions. The picker is Apple's own sheet,
    /// which runs outside the app, so no photo-library permission is asked
    /// for and nothing but the chosen image ever reaches NurseMind. The
    /// camera appears only where one exists and asks for access first.
    private var photoSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            EyebrowLabel("PHOTO", sparkle: false)
                .padding(.bottom, NMSpace.md)
            HStack(alignment: .center, spacing: NMSpace.lg) {
                ProfileAvatarView(initials: ProfileAvatarView.initials(for: nameDraft), size: 72)
                VStack(alignment: .leading, spacing: NMSpace.sm) {
                    PhotosPicker(selection: $photoSelection, matching: .images, photoLibrary: .shared()) {
                        HStack(spacing: NMSpace.xs) {
                            Text(prefs.profilePhotoVersion > 0 ? "Change photo" : "Choose photo")
                                .font(NMFont.title)
                                .foregroundStyle(NMColor.accent)
                            Image(systemName: "arrow.right")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundStyle(NMColor.accent)
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel(prefs.profilePhotoVersion > 0 ? "Change photo" : "Choose photo")
                    if ProfilePhotoCamera.isAvailable {
                        Button {
                            Task { await openCamera() }
                        } label: {
                            HStack(spacing: NMSpace.xs) {
                                Text("Take photo")
                                    .font(NMFont.title)
                                    .foregroundStyle(NMColor.accent)
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundStyle(NMColor.accent)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                    if prefs.profilePhotoVersion > 0 {
                        Button {
                            Haptic.light()
                            withAnimation(.easeOut(duration: 0.2)) { prefs.removeProfilePhoto() }
                        } label: {
                            Text("Remove photo")
                                .font(NMFont.body)
                                .foregroundStyle(NMColor.textSecondary)
                                .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    } else {
                        Text("Stays on this device.")
                            .font(NMFont.displayItalicSM)
                            .foregroundStyle(NMColor.textTertiary)
                    }
                }
                Spacer(minLength: 0)
            }
            .padding(.vertical, NMSpace.xs)
        }
    }

    private func importPhoto(_ item: PhotosPickerItem) async {
        defer { photoSelection = nil }
        guard let data = try? await item.loadTransferable(type: Data.self),
              let image = UIImage(data: data) else {
            photoFailed = true
            return
        }
        await store(image, source: "library")
    }

    private func openCamera() async {
        switch await ProfilePhotoCamera.requestAccess() {
        case .granted: cameraPresented = true
        case .denied: cameraDenied = true
        }
    }

    /// Crop and encode off the main actor; only the version bump happens on it.
    private func store(_ image: UIImage, source: String = "camera") async {
        let saved = await Task.detached(priority: .userInitiated) { ProfilePhotoStore.shared.save(image) }.value
        if saved {
            withAnimation(.easeOut(duration: 0.2)) { prefs.profilePhotoVersion += 1 }
            Haptic.light()
            AnalyticsService.shared.capture("profile_photo_set", properties: ["source": source])
        } else {
            photoFailed = true
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
