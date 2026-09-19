import SwiftUI

/// Mic affordance that lives inside the Ask input capsule when the textfield
/// is empty (and the AI isn't already streaming). Tap to start dictating;
/// transcript fills the field live as the user speaks; tap again or stay
/// silent for `VoiceTranscriber.silenceTimeout` to stop.
///
/// Listening state: the disc fills with the accent and the glyph becomes a
/// five-bar waveform driven by the microphone level, with a single soft
/// ripple ring so the eye reads "hearing you" before a word arrives. The
/// waveform is data, so it still moves under Reduce Motion; the ripple and
/// the morph springs do not.
///
/// Sized to match the existing 32×32 send-button disc so swapping send <-> mic
/// based on text content doesn't shift layout.
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

    /// Disabled while the AI is generating an answer.
    public let isDisabled: Bool

    /// Common nursing terms passed as `contextualStrings` to the recognizer.
    public let contextualPhrases: [String]

    /// Hoisted out so the parent can keep the mic visible while recording is
    /// active, even after the transcript has filled the textfield.
    @Binding var isListening: Bool

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var transcriber: VoiceTranscriber?
    @State private var authStatus: VoiceTranscriber.AuthorizationStatus = .notDetermined
    @State private var errorMessage: String?
    @State private var level: Float = 0
    @State private var rippleOn = false
    @State private var demoTask: Task<Void, Never>?

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
                if isListening && !reduceMotion {
                    // One ring, breathing outward and fading. Never more than
                    // one at a time; the accent stays quiet.
                    Circle()
                        .stroke(NMColor.accent.opacity(0.45), lineWidth: 1.5)
                        .frame(width: 32, height: 32)
                        .scaleEffect(rippleOn ? 1.75 : 1.0)
                        .opacity(rippleOn ? 0 : 0.9)
                        .allowsHitTesting(false)
                }
                Circle()
                    .fill(isListening ? NMColor.accent : NMColor.bgSecondary)
                    .frame(width: 32, height: 32)
                if isListening {
                    VoiceWaveform(level: level, color: NMColor.onAccent, animated: !reduceMotion)
                        .frame(width: 18, height: 14)
                        .transition(.scale(scale: 0.6).combined(with: .opacity))
                } else {
                    Image(systemName: "mic.fill")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(NMColor.textSecondary)
                        .transition(.scale(scale: 0.6).combined(with: .opacity))
                }
            }
            .frame(width: 32, height: 32)
            .animation(reduceMotion ? .easeOut(duration: 0.15) : .spring(response: 0.32, dampingFraction: 0.72), value: isListening)
        }
        .buttonStyle(.plain)
        .disabled(isDisabled)
        .accessibilityLabel(isListening ? "Stop dictation" : "Dictate question")
        .accessibilityHint(isListening ? "Stops voice input and keeps the transcribed text" : "Starts voice input")
        .accessibilityValue(isListening ? "Listening" : "")
        .onAppear {
            authStatus = VoiceTranscriber.currentAuthorization()
            #if DEBUG
            if ProcessInfo.processInfo.environment["NM_VOICE_DEMO"] == "1" { startDemo() }
            #endif
        }
        .onDisappear {
            demoTask?.cancel()
            stopIfNeeded()
        }
        .onChange(of: isListening) { _, listening in
            if listening {
                rippleOn = false
                guard !reduceMotion else { return }
                withAnimation(.easeOut(duration: 1.6).repeatForever(autoreverses: false)) {
                    rippleOn = true
                }
            } else {
                withAnimation(.easeOut(duration: 0.2)) {
                    rippleOn = false
                    level = 0
                }
                // Clear callbacks BEFORE stopping. The recognizer fires its
                // final-result callback asynchronously after `endAudio()`; if
                // the parent flipped this binding off because Send was tapped,
                // the field has already been cleared and a deferred final
                // would refill it with the just-sent question.
                transcriber?.onPartialTranscript = nil
                transcriber?.onFinalTranscript = nil
                transcriber?.onAutoStop = nil
                transcriber?.onError = nil
                transcriber?.onLevel = nil
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
            Haptic.light()
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

        t.onPartialTranscript = { text in onTranscript(text) }
        t.onFinalTranscript = { text in
            onTranscript(text)
            isListening = false
        }
        t.onAutoStop = { isListening = false }
        t.onError = { err in
            errorMessage = err.errorDescription
            isListening = false
        }
        t.onLevel = { value in
            // Data-driven, so it moves under Reduce Motion too; the spring
            // only shapes how the bars catch up.
            withAnimation(reduceMotion ? .linear(duration: 0.05) : .interactiveSpring(response: 0.14, dampingFraction: 0.7)) {
                level = value
            }
        }

        do {
            try t.start(contextualStrings: contextualPhrases)
            Haptic.medium()
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

    #if DEBUG
    /// `SIMCTL_CHILD_NM_VOICE_DEMO=1`: drives the listening state with a
    /// synthetic speech envelope so the animation can be inspected on a
    /// simulator without a microphone or on-device recognition.
    private func startDemo() {
        isListening = true
        demoTask = Task { @MainActor in
            var t: Float = 0
            while !Task.isCancelled {
                t += 0.06
                // A phrase of syllables, a pause, another phrase.
                let phrase = sin(t * 0.55) > -0.2
                let syllables = phrase ? abs(sin(t * 5.0)) * (0.6 + 0.4 * sin(t * 1.3)) : 0
                let target = Float(min(1, 0.04 + syllables * 0.92))
                withAnimation(.interactiveSpring(response: 0.14, dampingFraction: 0.7)) {
                    level = VoiceTranscriber.smooth(previous: level, next: target)
                }
                try? await Task.sleep(for: .milliseconds(25))
            }
        }
    }
    #endif
}

/// Five rounded bars whose heights follow the microphone level. Each bar has
/// its own weight so a syllable reads as a wave moving through the glyph
/// rather than five identical sticks. In silence the bars breathe slowly
/// (off under Reduce Motion) so the listening state never looks frozen.
struct VoiceWaveform: View {
    let level: Float
    let color: Color
    let animated: Bool

    private static let weights: [Float] = [0.55, 0.85, 1.0, 0.85, 0.55]
    private static let phases: [Double] = [0.0, 0.9, 1.8, 2.7, 3.6]
    private static let minHeight: CGFloat = 3
    private static let maxHeight: CGFloat = 16

    var body: some View {
        Group {
            if animated {
                TimelineView(.animation(minimumInterval: 1.0 / 30.0)) { context in
                    bars(time: context.date.timeIntervalSinceReferenceDate)
                }
            } else {
                bars(time: 0)
            }
        }
        .accessibilityHidden(true)
    }

    private func bars(time: TimeInterval) -> some View {
        HStack(alignment: .center, spacing: 2.2) {
            ForEach(Array(Self.weights.enumerated()), id: \.offset) { idx, weight in
                Capsule(style: .continuous)
                    .fill(color)
                    .frame(width: 2.4, height: height(for: idx, weight: weight, time: time))
            }
        }
    }

    private func height(for index: Int, weight: Float, time: TimeInterval) -> CGFloat {
        // Breathing: a slow, low wave that travels across the bars, fading
        // out as real level takes over so speech never fights the idle motion.
        let breath: Float = animated
            ? Float(0.5 + 0.5 * sin(time * 2.2 + Self.phases[index])) * 0.16 * (1 - min(1, level * 2))
            : 0
        let shaped = min(1, max(0, level * weight * 1.15 + breath))
        return Self.minHeight + (Self.maxHeight - Self.minHeight) * CGFloat(shaped)
    }
}
