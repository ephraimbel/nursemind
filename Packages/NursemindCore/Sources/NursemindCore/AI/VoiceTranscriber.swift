import Foundation
import Speech
import AVFoundation

/// On-device speech-to-text for the Ask input. Uses Apple's `SFSpeechRecognizer`
/// in `requiresOnDeviceRecognition = true` mode so audio bytes never leave the
/// device — preserves the architectural "no PHI to a third party" guarantee
/// even though the existing `PHIScrubber` would catch text-level leaks.
///
/// Streams partial transcripts as the user speaks (`onPartialTranscript`) and a
/// final transcript when recognition stabilizes (`onFinalTranscript`). Auto-
/// stops after `silenceTimeout` seconds of no new speech so the user doesn't
/// have to find the stop button mid-thought.
///
/// Designed to be created fresh per recording session — call `start()` once,
/// then `stop()` when finished or when the view goes away. Reusing a single
/// instance across sessions works but isn't required.
@MainActor
public final class VoiceTranscriber {

    public enum AuthorizationStatus: Sendable {
        case notDetermined
        case authorized
        case denied
        case unavailable    // recognizer not available for the device locale
    }

    public enum TranscriberError: Error, LocalizedError {
        case authorizationDenied
        case recognizerUnavailable
        case audioEngineFailure(String)
        case onDeviceUnavailable

        public var errorDescription: String? {
            switch self {
            case .authorizationDenied:    return "Microphone or speech-recognition permission was denied."
            case .recognizerUnavailable:  return "Speech recognition isn't available for this device's language."
            case .audioEngineFailure(let m): return "Audio engine failed: \(m)"
            case .onDeviceUnavailable:    return "On-device recognition isn't supported on this device."
            }
        }
    }

    private let recognizer: SFSpeechRecognizer?
    private let audioEngine = AVAudioEngine()
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    /// Last time a non-empty partial result was received. Used to drive the
    /// silence-based auto-stop so users can pause briefly without losing the
    /// session but a long pause ends it cleanly.
    private var lastSpeechAt: Date = .distantPast
    private var silenceTimer: Timer?

    /// Seconds of silence before auto-stop fires. 6s tested as the sweet spot
    /// between "I paused to think" and "I'm done speaking."
    public var silenceTimeout: TimeInterval = 6.0

    public var onPartialTranscript: ((String) -> Void)?
    public var onFinalTranscript: ((String) -> Void)?
    public var onError: ((TranscriberError) -> Void)?
    public var onAutoStop: (() -> Void)?
    /// Smoothed microphone level, 0…1, delivered on the main actor at the
    /// audio tap rate (~40 Hz). Drives the waveform in `VoiceInputButton`.
    public var onLevel: ((Float) -> Void)?

    /// Level above which the input counts as speech for the silence timer,
    /// so a pause between recognizer partials does not end the session
    /// while the user is audibly still talking.
    nonisolated public static let speechLevelThreshold: Float = 0.18

    private var smoothedLevel: Float = 0
    private var finalizeTimer: Timer?

    public init(locale: Locale = .current) {
        // Apple falls back to en-US when the device locale isn't supported,
        // so the recognizer is almost always non-nil — but it can be unavailable
        // when first created (network/auth not yet ready), which `isAvailable`
        // surfaces at `start()` time.
        self.recognizer = SFSpeechRecognizer(locale: locale) ?? SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    }

    // Cleanup contract: callers MUST invoke `stop()` before releasing. The
    // owning SwiftUI view does this from `.onDisappear`. We can't run cleanup
    // from `deinit` under Swift 6 strict concurrency (non-Sendable properties
    // are MainActor-isolated and deinit is nonisolated). ARC will release the
    // audio engine and recognizer normally on dealloc.

    // MARK: - Authorization

    public static func currentAuthorization() -> AuthorizationStatus {
        let speech = SFSpeechRecognizer.authorizationStatus()
        let mic = AVAudioApplication.shared.recordPermission
        if speech == .denied || mic == .denied { return .denied }
        if speech == .restricted { return .denied }
        if speech == .authorized && mic == .granted { return .authorized }
        return .notDetermined
    }

    /// Requests both microphone and speech-recognition permissions in sequence.
    /// Returns the resulting combined status.
    public func requestAuthorization() async -> AuthorizationStatus {
        // Speech first — if denied, no point asking for the mic.
        let speech = await withCheckedContinuation { (cont: CheckedContinuation<SFSpeechRecognizerAuthorizationStatus, Never>) in
            SFSpeechRecognizer.requestAuthorization { cont.resume(returning: $0) }
        }
        guard speech == .authorized else { return .denied }

        let micGranted = await withCheckedContinuation { (cont: CheckedContinuation<Bool, Never>) in
            AVAudioApplication.requestRecordPermission { cont.resume(returning: $0) }
        }
        return micGranted ? .authorized : .denied
    }

    // MARK: - Recording lifecycle

    /// Begins a new recording session. Throws if authorization is missing,
    /// the recognizer is unavailable, or the audio engine refuses to start.
    /// Caller is expected to keep `self` alive until `stop()` is called.
    public func start(contextualStrings: [String] = []) throws {
        guard let recognizer, recognizer.isAvailable else {
            throw TranscriberError.recognizerUnavailable
        }
        guard recognizer.supportsOnDeviceRecognition else {
            throw TranscriberError.onDeviceUnavailable
        }

        // Tear down any prior session so re-tapping the mic is safe.
        cancelInternal()

        // Audio session: spoken-audio category gives best mic processing for
        // dictation; .duckOthers temporarily lowers any background audio so
        // the recognizer hears the speaker cleanly.
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(.record, mode: .measurement, options: [.duckOthers])
        try session.setActive(true, options: .notifyOthersOnDeactivation)

        let request = SFSpeechAudioBufferRecognitionRequest()
        request.shouldReportPartialResults = true
        request.requiresOnDeviceRecognition = true
        if !contextualStrings.isEmpty {
            request.contextualStrings = contextualStrings
        }
        if #available(iOS 16.0, *) {
            request.addsPunctuation = true
        }
        self.recognitionRequest = request

        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        smoothedLevel = 0
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { [weak self, weak request] buffer, _ in
            request?.append(buffer)
            let rms = Self.rms(of: buffer)
            Task { @MainActor in
                guard let self, self.audioEngine.isRunning else { return }
                self.smoothedLevel = Self.smooth(previous: self.smoothedLevel, next: Self.normalizedLevel(rms: rms))
                if self.smoothedLevel > Self.speechLevelThreshold { self.lastSpeechAt = Date() }
                self.onLevel?(self.smoothedLevel)
            }
        }

        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            cancelInternal()
            throw TranscriberError.audioEngineFailure(error.localizedDescription)
        }

        lastSpeechAt = Date()
        startSilenceTimer()

        recognitionTask = recognizer.recognitionTask(with: request) { [weak self] result, error in
            guard let self else { return }
            Task { @MainActor in
                if let result {
                    let text = result.bestTranscription.formattedString
                    if !text.isEmpty {
                        self.lastSpeechAt = Date()
                        self.onPartialTranscript?(text)
                    }
                    if result.isFinal {
                        self.onFinalTranscript?(text)
                        self.cancelInternal()
                    }
                }
                if let error {
                    let wasRecording = self.audioEngine.isRunning
                    self.cancelInternal()
                    // Cancellation (our own stop) and "no speech" are not
                    // failures; anything else while still recording is, and
                    // the button must not stay lit on a dead session.
                    let code = (error as NSError).code
                    let benign = [203, 216, 301, 1110].contains(code)
                    if wasRecording && !benign {
                        self.onError?(.audioEngineFailure(error.localizedDescription))
                    } else if wasRecording {
                        self.onAutoStop?()
                    }
                }
            }
        }
    }

    /// Ends recording, flushes the recognizer, and emits a final transcript
    /// via `onFinalTranscript` if one is available.
    public func stop() {
        // Ending audio causes the recognizer to deliver `result.isFinal = true`
        // on its next callback, which is where we tear down. If the recognizer
        // has already finished (auto-stop path), this is a no-op.
        recognitionRequest?.endAudio()
        // Stop pulling audio so the mic indicator clears immediately even if
        // the final-result callback is still in flight.
        if audioEngine.isRunning {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
        }
        silenceTimer?.invalidate()
        silenceTimer = nil
        onLevel?(0)
        // The recognizer normally answers endAudio() with a final result,
        // which tears down and releases the audio session. If it never does
        // (recognizer reset, nothing recognized), release it ourselves.
        finalizeTimer?.invalidate()
        finalizeTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [weak self] _ in
            Task { @MainActor in self?.cancelInternal() }
        }
    }

    public var isRecording: Bool {
        audioEngine.isRunning
    }

    // MARK: - Level maths (pure, tested)

    /// Root-mean-square of the first channel.
    nonisolated static func rms(of buffer: AVAudioPCMBuffer) -> Float {
        guard let data = buffer.floatChannelData?[0], buffer.frameLength > 0 else { return 0 }
        let n = Int(buffer.frameLength)
        var sum: Float = 0
        for i in 0..<n { sum += data[i] * data[i] }
        return (sum / Float(n)).squareRoot()
    }

    /// Maps microphone RMS to 0…1 on a decibel scale: silence (below -50 dB)
    /// is 0, normal speech (about -20 dB) lands near 0.6, loud speech reaches 1.
    nonisolated static func normalizedLevel(rms: Float) -> Float {
        guard rms > 0 else { return 0 }
        let db = 20 * log10(rms)
        let floor: Float = -50, ceiling: Float = -8
        return min(1, max(0, (db - floor) / (ceiling - floor)))
    }

    /// Fast attack, slower release, so bars jump with a syllable and settle
    /// between words instead of flickering.
    nonisolated static func smooth(previous: Float, next: Float) -> Float {
        let k: Float = next > previous ? 0.55 : 0.18
        return previous + (next - previous) * k
    }

    // MARK: - Internals

    private func startSilenceTimer() {
        silenceTimer?.invalidate()
        silenceTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            Task { @MainActor in
                guard let self, self.isRecording else { return }
                if Date().timeIntervalSince(self.lastSpeechAt) > self.silenceTimeout {
                    self.onAutoStop?()
                    self.stop()
                }
            }
        }
    }

    private func cancelInternal() {
        silenceTimer?.invalidate()
        silenceTimer = nil
        finalizeTimer?.invalidate()
        finalizeTimer = nil
        smoothedLevel = 0
        recognitionTask?.cancel()
        recognitionTask = nil
        recognitionRequest = nil
        // removeTap unconditionally — if a prior `start()` threw between
        // `installTap` and `audioEngine.start()`, the engine isn't running
        // but a stale tap is still installed. Without removing it here, the
        // next `installTap(onBus: 0, ...)` would throw "input bus 0 already
        // has a tap installed". `removeTap` on an empty bus is a no-op.
        audioEngine.inputNode.removeTap(onBus: 0)
        if audioEngine.isRunning {
            audioEngine.stop()
        }
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    }
}
