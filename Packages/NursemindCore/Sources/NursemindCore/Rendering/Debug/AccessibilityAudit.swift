#if DEBUG
import OSLog
import UIKit

private let a11yLog = Logger(subsystem: "app.nursemind.ios", category: "A11yAudit")

/// Debug-only VoiceOver stand-in for simulator runs: walks the key window's
/// accessibility elements (what VoiceOver would step through) and logs one
/// line per element with its traits, label, value and hint.
///
///   SIMCTL_CHILD_NM_A11Y_DUMP=1 xcrun simctl launch <sim> app.nursemind.ios
///   log stream --predicate 'category == "A11yAudit"'
@MainActor
public enum AccessibilityAudit {
    nonisolated public static var isEnabled: Bool {
        ProcessInfo.processInfo.environment["NM_A11Y_DUMP"] == "1"
    }

    private static var poll: Task<Void, Never>?
    private static var lastSignature = ""

    /// Starts a poll that dumps whenever the element list changes.
    public static func startIfEnabled() {
        guard isEnabled, poll == nil else { return }
        a11yLog.notice("audit armed")
        poll = Task { @MainActor in
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(2))
                dumpIfChanged()
            }
        }
    }

    private static func dumpIfChanged() {
        a11yLog.notice("tick")
        let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
        guard let window = scenes.compactMap({ $0.keyWindow ?? $0.windows.first }).first else {
            a11yLog.notice("no window yet")
            return
        }
        var lines: [String] = []
        var visited = Set<ObjectIdentifier>()
        collect(window, into: &lines, depth: 0, visited: &visited)
        let signature = lines.joined(separator: "\n")
        guard signature != lastSignature || lastSignature.isEmpty else { return }
        lastSignature = signature.isEmpty ? "-" : signature
        a11yLog.notice("BEGIN \(lines.count, privacy: .public) elements (root \(String(describing: type(of: window.rootViewController?.view)), privacy: .public))")
        for (i, line) in lines.enumerated() {
            a11yLog.notice("\(i, privacy: .public) \(line, privacy: .public)")
        }
        a11yLog.notice("END")
    }

    /// Mirrors VoiceOver's traversal: an object that is an accessibility
    /// element is a leaf; otherwise its `accessibilityElements` (SwiftUI's
    /// hosting view populates these) or its subviews are walked in order.
    private static func collect(_ object: NSObject, into lines: inout [String], depth: Int, visited: inout Set<ObjectIdentifier>) {
        if depth > 24 || lines.count > 400 { return }
        guard visited.insert(ObjectIdentifier(object)).inserted else { return }
        if let view = object as? UIView, view.isHidden || view.alpha == 0 { return }
        if object.isAccessibilityElement {
            lines.append(describe(object))
            return
        }
        if let elements = object.accessibilityElements as? [NSObject], !elements.isEmpty {
            for e in elements { collect(e, into: &lines, depth: depth + 1, visited: &visited) }
            return
        }
        if let view = object as? UIView {
            for sub in view.subviews { collect(sub, into: &lines, depth: depth + 1, visited: &visited) }
        }
    }

    private static func describe(_ e: NSObject) -> String {
        let t = e.accessibilityTraits
        var traits: [String] = []
        if t.contains(.button) { traits.append("button") }
        if t.contains(.header) { traits.append("header") }
        if t.contains(.selected) { traits.append("selected") }
        if t.contains(.notEnabled) { traits.append("dimmed") }
        if t.contains(.link) { traits.append("link") }
        if t.contains(.staticText) { traits.append("text") }
        if t.contains(.image) { traits.append("image") }
        if t.contains(.adjustable) { traits.append("adjustable") }
        let label = e.accessibilityLabel ?? ""
        let value = e.accessibilityValue ?? ""
        let hint = e.accessibilityHint ?? ""
        return "[\(traits.joined(separator: ","))] \(label)" + (value.isEmpty ? "" : " | value: \(value)") + (hint.isEmpty ? "" : " | hint: \(hint)")
    }
}
#endif
