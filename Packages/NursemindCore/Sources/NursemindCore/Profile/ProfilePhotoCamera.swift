import SwiftUI
import UIKit
import AVFoundation

/// The system camera for a profile photo. Front camera first, no editing
/// pass (the store crops to a square), and the capture is handed back as a
/// UIImage the same way a library pick is.
struct ProfilePhotoCamera: UIViewControllerRepresentable {
    let onCapture: (UIImage?) -> Void

    /// False on simulators and on devices without a camera, so the option
    /// can stay out of the page instead of failing when tapped. Simulators
    /// can report the camera source type as available while having no
    /// capture device, so both are required.
    static var isAvailable: Bool {
        UIImagePickerController.isSourceTypeAvailable(.camera)
            && AVCaptureDevice.default(for: .video) != nil
    }

    enum Access {
        case granted, denied
    }

    /// Asks for camera access when it has not been decided; reports denied
    /// or restricted so the page can point at Settings instead of showing a
    /// black viewfinder.
    static func requestAccess() async -> Access {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return .granted
        case .notDetermined:
            return await AVCaptureDevice.requestAccess(for: .video) ? .granted : .denied
        default:
            return .denied
        }
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        if UIImagePickerController.isCameraDeviceAvailable(.front) {
            picker.cameraDevice = .front
        }
        picker.allowsEditing = false
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator(onCapture: onCapture) }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let onCapture: (UIImage?) -> Void
        init(onCapture: @escaping (UIImage?) -> Void) { self.onCapture = onCapture }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            onCapture(info[.originalImage] as? UIImage)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            onCapture(nil)
        }
    }
}
