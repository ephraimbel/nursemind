import Foundation

/// Persists per-calculator input state in UserDefaults so a nurse who opens
/// MAP, enters values, navigates away, and comes back later sees their
/// previous inputs still in place.
///
/// All state is the user's own — no PHI, no patient context, no clinical
/// workflow integration. This is reference-tool memory: the same way the
/// system Calculator app remembers your last expression.
///
/// Storage layout: each input is keyed `nm.calc.state.<calculatorID>.<key>`.
/// A separate `nm.calc.touched.<calculatorID>` records the last-write timestamp
/// for the "Last entered Xmin ago" affordance.
@MainActor
@Observable
public final class CalculatorStateStore {
    public static let shared = CalculatorStateStore()

    private let defaults: UserDefaults
    private let statePrefix     = "nm.calc.state."
    private let timestampPrefix = "nm.calc.touched."

    /// Bumps when any calculator's state changes. Views that depend on the
    /// store can read this to know they should re-evaluate (used by the
    /// "Last entered" pill in CalculatorScaffold).
    public private(set) var version: Int = 0

    private init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    // MARK: - Doubles

    public func saveDouble(_ value: Double?, for calculatorID: String, key: String) {
        let composed = composedKey(calculatorID, key)
        if let value, value.isFinite {
            defaults.set(value, forKey: composed)
            touch(calculatorID)
        } else {
            defaults.removeObject(forKey: composed)
            touchOrClear(calculatorID)
        }
    }

    public func loadDouble(for calculatorID: String, key: String) -> Double? {
        let composed = composedKey(calculatorID, key)
        guard defaults.object(forKey: composed) != nil else { return nil }
        return defaults.double(forKey: composed)
    }

    // MARK: - Bools

    public func saveBool(_ value: Bool, for calculatorID: String, key: String) {
        let composed = composedKey(calculatorID, key)
        defaults.set(value, forKey: composed)
        touch(calculatorID)
    }

    public func loadBool(for calculatorID: String, key: String, default defaultValue: Bool = false) -> Bool {
        let composed = composedKey(calculatorID, key)
        guard defaults.object(forKey: composed) != nil else { return defaultValue }
        return defaults.bool(forKey: composed)
    }

    // MARK: - Ints

    public func saveInt(_ value: Int?, for calculatorID: String, key: String) {
        let composed = composedKey(calculatorID, key)
        if let value {
            defaults.set(value, forKey: composed)
            touch(calculatorID)
        } else {
            defaults.removeObject(forKey: composed)
            touchOrClear(calculatorID)
        }
    }

    public func loadInt(for calculatorID: String, key: String) -> Int? {
        let composed = composedKey(calculatorID, key)
        guard defaults.object(forKey: composed) != nil else { return nil }
        return defaults.integer(forKey: composed)
    }

    // MARK: - RawRepresentable (enums backed by String, Int, etc.)

    public func saveRaw<R: RawRepresentable>(_ value: R?, for calculatorID: String, key: String)
    where R.RawValue: Codable {
        let composed = composedKey(calculatorID, key)
        if let value {
            if let s = value.rawValue as? String {
                defaults.set(s, forKey: composed)
            } else if let i = value.rawValue as? Int {
                defaults.set(i, forKey: composed)
            }
            touch(calculatorID)
        } else {
            defaults.removeObject(forKey: composed)
            touchOrClear(calculatorID)
        }
    }

    public func loadRaw<R: RawRepresentable>(_ type: R.Type, for calculatorID: String, key: String) -> R?
    where R.RawValue: Codable {
        let composed = composedKey(calculatorID, key)
        guard defaults.object(forKey: composed) != nil else { return nil }
        if R.RawValue.self == String.self,
           let s = defaults.string(forKey: composed),
           let v = R(rawValue: s as! R.RawValue) {
            return v
        }
        if R.RawValue.self == Int.self {
            let i = defaults.integer(forKey: composed)
            return R(rawValue: i as! R.RawValue)
        }
        return nil
    }

    // MARK: - Last-touched + clear

    public func lastTouched(_ calculatorID: String) -> Date? {
        defaults.object(forKey: timestampPrefix + calculatorID) as? Date
    }

    public func hasState(_ calculatorID: String) -> Bool {
        let prefix = statePrefix + calculatorID + "."
        for key in defaults.dictionaryRepresentation().keys where key.hasPrefix(prefix) {
            return true
        }
        return false
    }

    /// Wipe everything stored for this calculator and emit a version bump so
    /// any view bound to the store re-renders.
    public func clear(_ calculatorID: String) {
        let prefix = statePrefix + calculatorID + "."
        for key in defaults.dictionaryRepresentation().keys where key.hasPrefix(prefix) {
            defaults.removeObject(forKey: key)
        }
        defaults.removeObject(forKey: timestampPrefix + calculatorID)
        version &+= 1
    }

    /// Format `lastTouched` as "12 min ago" / "3 h ago" / "yesterday" / "Apr 4".
    public func formattedLastTouched(_ calculatorID: String, now: Date = Date()) -> String? {
        guard let date = lastTouched(calculatorID) else { return nil }
        let secondsAgo = now.timeIntervalSince(date)
        if secondsAgo < 60 { return "just now" }
        if secondsAgo < 3600 {
            let m = Int(secondsAgo / 60)
            return "\(m) min ago"
        }
        if secondsAgo < 86_400 {
            let h = Int(secondsAgo / 3600)
            return "\(h) h ago"
        }
        if secondsAgo < 172_800 {
            return "yesterday"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: date)
    }

    // MARK: - Internals

    private func composedKey(_ calculatorID: String, _ key: String) -> String {
        statePrefix + calculatorID + "." + key
    }

    private func touch(_ calculatorID: String) {
        defaults.set(Date(), forKey: timestampPrefix + calculatorID)
        version &+= 1
    }

    private func touchOrClear(_ calculatorID: String) {
        // If clearing the last input, also remove the timestamp so the pill hides.
        if !hasState(calculatorID) {
            defaults.removeObject(forKey: timestampPrefix + calculatorID)
        }
        version &+= 1
    }
}
