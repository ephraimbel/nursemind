import SwiftUI

/// Mic affordance that lives inside the Ask input capsule when the textfield
/// is empty (and the AI isn't already streaming). Tap to start dictating;
/// transcript fills the field live as the user speaks; tap again or stay
/// silent for `VoiceTranscriber.silenceTimeout` to stop.
///
/// Sized to match the existing 32×32 send-button disc so swapping send <-> mic
/// based on text content doesn't shift layout. Uses the new bright-mint accent
/// fill while listening — same visual language as the send button so the user
/// reads "active control" at a glance.
public struct VoiceInputButton: View {
    /// Called whenever a partial or final transcript arrives. Caller is
    /// expected to write the value into the input textfield. We pass the
    /// whole running transcript every time, not deltas, so caller logic is
    /// idempotent and replacing the field value is always correct.
    public let onTranscript: (String) -> Void

    /// Called when the user taps the button. Caller should dismiss the
    /// keyboard if it's up, before the audio session activates — otherwise
    /// the keyboard's own mic icon (if shown) competes for focus.
    public let onWillStart: () -> Void

    /// Disabled while the AI is generating an answer. Tapping mid-stream
    /// would create ambiguity ("am I cancelling? interrupting?") that's not
    /// worth the fluidity gain at v1.
    public let isDisabled: Bool

    /// Common nursing terms passed as `contextualStrings` to the recognizer.
    /// Bumps drug-name accuracy from "vansomyssin" to "vancomycin" for the
    /// most-asked questions. Kept short — too many phrases dilute the prior.
    public let contextualPhrases: [String]

    /// Hoisted out so the parent can keep the mic visible while recording is
    /// active, even after the transcript has filled the textfield (otherwise
    /// the user loses the stop control mid-utterance).
    @Binding var isListening: Bool

    @State private var transcriber: VoiceTranscriber?
    @State private var authStatus: VoiceTranscriber.AuthorizationStatus = .notDetermined
    @State private var errorMessage: String?
    @State private var pulseScale: CGFloat = 1.0

    public init(
        isListening: Binding<Bool>,
        contextualPhrases: [String] = [],
        isDisabled: Bool = false,
        onWillStart: @escaping () -> Void = {},
        onTranscript: @escaping (String) -> Void
    ) {
        self._isListening = isListening
        self.contextualPhrases = contextualPhrases
        self.isDisabled = isDisabled
        self.onWillStart = onWillStart
        self.onTranscript = onTranscript
    }

    public var body: some View {
        Button(action: handleTap) {
            ZStack {
                Circle()
                    .fill(isListening ? NMColor.accent : NMColor.bgSecondary)
                    .frame(width: 32, height: 32)
                    .scaleEffect(isListening ? pulseScale : 1.0)
                Image(systemName: isListening ? "stop.fill" : "mic.fill")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(isListening ? NMColor.onAccent : NMColor.textSecondary)
            }
        }
        .buttonStyle(.plain)
        .disabled(isDisabled)
        .accessibilityLabel(isListening ? "Stop dictation" : "Dictate question")
        .accessibilityHint(isListening ? "Stops voice input and keeps the transcribed text" : "Starts voice input")
        .onAppear {
            authStatus = VoiceTranscriber.currentAuthorization()
        }
        .onDisappear {
            // View lifecycle teardown — if we're still recording when the
            // user navigates away, abandon the session cleanly so the mic
            // indicator clears and the audio session releases.
            stopIfNeeded()
        }
        .onChange(of: isListening) { _, listening in
            if listening {
                withAnimation(.easeInOut(duration: 0.9).repeatForever(autoreverses: true)) {
                    pulseScale = 1.18
                }
            } else {
                withAnimation(.easeOut(duration: 0.2)) {
                    pulseScale = 1.0
                }
                // Clear callbacks BEFORE stopping. The recognizer fires its
                // final-result callback asynchronously after `endAudio()`; if
                // the parent flipped this binding off because Send was tapped,
                // the field has already been cleared and a deferred final
                // would refill it with the just-sent question. Nil-ing the
                // callbacks suppresses that ghost write. `beginRecording()`
                // re-attaches them on the next session, so this isn't
                // destructive across recordings.
                transcriber?.onPartialTranscript = nil
                transcriber?.onFinalTranscript = nil
                transcriber?.onAutoStop = nil
                transcriber?.onError = nil
                if let t = transcriber, t.isRecording {
                    t.stop()
                }
            }
        }
        .alert("Voice input unavailable", isPresented: errorAlertBinding) {
            Button("OK", role: .cancel) { errorMessage = nil }
        } message: {
            Text(errorMessage ?? "")
        }
    }

    // MARK: - Actions

    private func handleTap() {
        if isListening {
            stopIfNeeded()
            return
        }
        onWillStart()

        switch authStatus {
        case .authorized:
            beginRecording()
        case .denied:
            openSettings()
        case .unavailable:
            errorMessage = "Speech recognition isn't available on this device."
        case .notDetermined:
            Task {
                let t = transcriber ?? VoiceTranscriber()
                self.transcriber = t
                let result = await t.requestAuthorization()
                self.authStatus = result
                if result == .authorized {
                    beginRecording()
                } else {
                    errorMessage = "NurseMind needs microphone and speech-recognition access. Enable them in Settings to dictate questions."
                }
            }
        }
    }

    private func beginRecording() {
        let t = transcriber ?? VoiceTranscriber()
        self.transcriber = t

        t.onPartialTranscript = { text in
            onTranscript(text)
        }
        t.onFinalTranscript = { text in
            // Final result is already covered by the last partial in practice,
            // but emit explicitly so callers that filter on final-only also
            // receive the text. Then drop the listening flag.
            onTranscript(text)
            isListening = false
        }
        t.onAutoStop = {
            isListening = false
        }
        t.onError = { err in
            errorMessage = err.errorDescription
            isListening = false
        }

        do {
            try t.start(contextualStrings: contextualPhrases)
            isListening = true
        } catch let err as VoiceTranscriber.TranscriberError {
            errorMessage = err.errorDescription
            isListening = false
        } catch {
            errorMessage = error.localizedDescription
            isListening = false
        }
    }

    private func stopIfNeeded() {
        guard let transcriber, transcriber.isRecording else {
            isListening = false
            return
        }
        transcriber.stop()
        isListening = false
    }

    private func openSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(url)
    }

    private var errorAlertBinding: Binding<Bool> {
        Binding(
            get: { errorMessage != nil },
            set: { if !$0 { errorMessage = nil } }
        )
    }
}
