import SwiftUI

/// Persistent replacement for `@State private var x: Double? = nil`.
/// Reads the last-saved value from CalculatorStateStore on init; writes
/// every set back to the store.
///
/// Usage:
/// ```
/// @CalcPersistedDouble(calculatorID: "map", key: "sbp") private var sbp
/// ```
@MainActor
@propertyWrapper
public struct CalcPersistedDouble: DynamicProperty {
    @State private var value: Double?
    private let calculatorID: String
    private let key: String

    public init(calculatorID: String, key: String) {
        self.calculatorID = calculatorID
        self.key = key
        let initial = CalculatorStateStore.shared.loadDouble(for: calculatorID, key: key)
        self._value = State(initialValue: initial)
    }

    public var wrappedValue: Double? {
        get { value }
        nonmutating set {
            value = newValue
            CalculatorStateStore.shared.saveDouble(newValue, for: calculatorID, key: key)
        }
    }

    public var projectedValue: Binding<Double?> {
        Binding(
            get: { value },
            set: { newValue in
                value = newValue
                CalculatorStateStore.shared.saveDouble(newValue, for: calculatorID, key: key)
            }
        )
    }
}

/// Persistent replacement for `@State private var x: Bool = false`.
@MainActor
@propertyWrapper
public struct CalcPersistedBool: DynamicProperty {
    @State private var value: Bool
    private let calculatorID: String
    private let key: String

    public init(calculatorID: String, key: String, default defaultValue: Bool = false) {
        self.calculatorID = calculatorID
        self.key = key
        let initial = CalculatorStateStore.shared.loadBool(for: calculatorID, key: key, default: defaultValue)
        self._value = State(initialValue: initial)
    }

    public var wrappedValue: Bool {
        get { value }
        nonmutating set {
            value = newValue
            CalculatorStateStore.shared.saveBool(newValue, for: calculatorID, key: key)
        }
    }

    public var projectedValue: Binding<Bool> {
        Binding(
            get: { value },
            set: { newValue in
                value = newValue
                CalculatorStateStore.shared.saveBool(newValue, for: calculatorID, key: key)
            }
        )
    }
}

/// Persistent replacement for `CalculatorScoreRow.Option?` (Picker scores like
/// GCS, qSOFA, HEART, NIHSS, etc.). Stores only the option's `id` and lets the
/// calc resolve it from its local `options` array via the
/// `Binding<Int?>.option(in:)` helper:
///
/// ```
/// @CalcPersistedOptionID(calculatorID: "qsofa", key: "rr") private var rrID
/// private let rrOpts: [CalculatorScoreRow.Option] = [...]
/// private var rr: CalculatorScoreRow.Option? { rrOpts.first { $0.id == rrID } }
///
/// CalculatorScoreRow(label: "RR", options: rrOpts, selection: $rrID.option(in: rrOpts))
/// ```
///
/// The wrapper itself just persists an Int? — the View handles the option
/// lookup. This keeps the wrapper agnostic to the View's local options arrays
/// (which can't be passed into a property-wrapper init because they live on
/// the View instance, which doesn't exist at init time).
@MainActor
@propertyWrapper
public struct CalcPersistedOptionID: DynamicProperty {
    @State private var value: Int?
    private let calculatorID: String
    private let key: String

    public init(calculatorID: String, key: String) {
        self.calculatorID = calculatorID
        self.key = key
        let initial = CalculatorStateStore.shared.loadInt(for: calculatorID, key: key)
        self._value = State(initialValue: initial)
    }

    public var wrappedValue: Int? {
        get { value }
        nonmutating set {
            value = newValue
            CalculatorStateStore.shared.saveInt(newValue, for: calculatorID, key: key)
        }
    }

    public var projectedValue: Binding<Int?> {
        Binding(
            get: { value },
            set: { newValue in
                value = newValue
                CalculatorStateStore.shared.saveInt(newValue, for: calculatorID, key: key)
            }
        )
    }
}

public extension Binding where Value == Int? {
    /// Bridges a persisted option-id binding to a `Binding<CalculatorScoreRow.Option?>`
    /// for use with `CalculatorScoreRow(selection:)`. Reads look up the option
    /// by id; writes store the new option's id back.
    @MainActor
    func option(in options: [CalculatorScoreRow.Option]) -> Binding<CalculatorScoreRow.Option?> {
        Binding<CalculatorScoreRow.Option?>(
            get: {
                guard let id = self.wrappedValue else { return nil }
                return options.first { $0.id == id }
            },
            set: { newValue in
                self.wrappedValue = newValue?.id
            }
        )
    }
}

/// Persistent replacement for an array of `CalculatorScoreRow.Option?` (used
/// by PHQ-9 / GAD-7 and similar fixed-length item batteries). Each slot is
/// persisted under `<key>.<index>` so adding/removing items in the future
/// remains backward-readable for old data.
@MainActor
@propertyWrapper
public struct CalcPersistedOptionIDArray: DynamicProperty {
    @State private var values: [Int?]
    private let calculatorID: String
    private let key: String

    public init(calculatorID: String, key: String, count: Int) {
        self.calculatorID = calculatorID
        self.key = key
        var initial: [Int?] = []
        for i in 0..<count {
            initial.append(CalculatorStateStore.shared.loadInt(for: calculatorID, key: "\(key).\(i)"))
        }
        self._values = State(initialValue: initial)
    }

    public var wrappedValue: [Int?] {
        get { values }
        nonmutating set {
            values = newValue
            for (i, v) in newValue.enumerated() {
                CalculatorStateStore.shared.saveInt(v, for: calculatorID, key: "\(key).\(i)")
            }
        }
    }

    public var projectedValue: Binding<[Int?]> {
        Binding(
            get: { values },
            set: { newValue in
                values = newValue
                for (i, v) in newValue.enumerated() {
                    CalculatorStateStore.shared.saveInt(v, for: calculatorID, key: "\(key).\(i)")
                }
            }
        )
    }
}

/// Persistent replacement for a Picker selection of an enum (`@State private
/// var sex: SexOption?`). The enum must be RawRepresentable with a Codable
/// raw value (String or Int).
@MainActor
@propertyWrapper
public struct CalcPersistedRawValue<Value: RawRepresentable>: DynamicProperty
where Value.RawValue: Codable {
    @State private var value: Value?
    private let calculatorID: String
    private let key: String

    public init(calculatorID: String, key: String) {
        self.calculatorID = calculatorID
        self.key = key
        let initial = CalculatorStateStore.shared.loadRaw(Value.self, for: calculatorID, key: key)
        self._value = State(initialValue: initial)
    }

    public var wrappedValue: Value? {
        get { value }
        nonmutating set {
            value = newValue
            CalculatorStateStore.shared.saveRaw(newValue, for: calculatorID, key: key)
        }
    }

    public var projectedValue: Binding<Value?> {
        Binding(
            get: { value },
            set: { newValue in
                value = newValue
                CalculatorStateStore.shared.saveRaw(newValue, for: calculatorID, key: key)
            }
        )
    }
}
