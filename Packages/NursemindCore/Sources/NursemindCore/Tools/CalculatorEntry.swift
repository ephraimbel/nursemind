import Foundation

/// Metadata describing a calculator. The actual SwiftUI view is dispatched by id
/// in CalculatorDetailRouter — this struct exists for listing, search, and routing.
public struct CalculatorEntry: Identifiable, Hashable, Sendable {
    public let id: String
    public let title: String
    public let subtitle: String
    public let category: CalculatorCategory

    public init(id: String, title: String, subtitle: String, category: CalculatorCategory) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.category = category
    }
}
