import AVFoundation
import Foundation
import Testing
@testable import NursemindCore

@Suite("Voice level metering")
struct VoiceLevelTests {
    @Test func silenceIsZeroAndLoudSpeechIsOne() {
        #expect(VoiceTranscriber.normalizedLevel(rms: 0) == 0)
        #expect(VoiceTranscriber.normalizedLevel(rms: 0.0001) == 0)       // -80 dB
        #expect(VoiceTranscriber.normalizedLevel(rms: 1.0) == 1)          // 0 dB
        let speech = VoiceTranscriber.normalizedLevel(rms: 0.1)           // -20 dB
        #expect(speech > 0.55 && speech < 0.8, "\(speech)")
        #expect(VoiceTranscriber.normalizedLevel(rms: 0.01) < VoiceTranscriber.speechLevelThreshold + 0.15)
    }

    @Test func smoothingAttacksFasterThanItReleases() {
        let up = VoiceTranscriber.smooth(previous: 0, next: 1)
        let down = VoiceTranscriber.smooth(previous: 1, next: 0)
        #expect(up > 0.5)
        #expect(down > 0.75)
        #expect(VoiceTranscriber.smooth(previous: 0.4, next: 0.4) == 0.4)
    }

    @Test func rmsOfAKnownBufferIsCorrect() throws {
        let format = try #require(AVAudioFormat(standardFormatWithSampleRate: 16_000, channels: 1))
        let buffer = try #require(AVAudioPCMBuffer(pcmFormat: format, frameCapacity: 4))
        buffer.frameLength = 4
        let data = try #require(buffer.floatChannelData?[0])
        data[0] = 0.5; data[1] = -0.5; data[2] = 0.5; data[3] = -0.5
        #expect(abs(VoiceTranscriber.rms(of: buffer) - 0.5) < 0.0001)
        buffer.frameLength = 0
        #expect(VoiceTranscriber.rms(of: buffer) == 0)
    }
}
