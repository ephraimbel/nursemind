import Foundation

/// Wire-format mirror of the `public.profiles` Postgres table. Field names use
/// snake_case to match Postgres column names; the custom CodingKeys map them
/// to camelCase Swift properties so the rest of the codebase reads idiomatically.
///
/// All scalars are non-optional with safe defaults (mirrors the SQL DEFAULTs)
/// so a freshly-INSERTed row decodes cleanly even if the server side ever
/// drops a column. Arrays default to empty.
public struct ProfileRecord: Codable, Sendable, Equatable {
    public var id: UUID

    public var displayName: String
    public var role: String
    public var unit: String
    public var icuSubspecialty: String?
    public var yearsExperience: Int?
    public var preferredAppearance: String
    public var notificationsEnabled: Bool
    public var weeklyTipEnabled: Bool
    public var safetyContractAgreedAt: Date?

    public var pinnedEntryIDs: [String]
    public var recentEntryIDs: [String]
    public var pinnedCalculatorIDs: [String]
    public var recentCalculatorIDs: [String]

    /// Server-authoritative subscription tier. Written exclusively by the
    /// `revenuecat-events` Edge Function — iOS only PULLS this and never
    /// pushes it (a `BEFORE UPDATE` trigger silently reverts client writes).
    /// Default `"free"` so existing rows decode cleanly during migration.
    public var subscriptionTier: String

    public var createdAt: Date
    public var updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case displayName             = "display_name"
        case role
        case unit
        case icuSubspecialty         = "icu_subspecialty"
        case yearsExperience         = "years_experience"
        case preferredAppearance     = "preferred_appearance"
        case notificationsEnabled    = "notifications_enabled"
        case weeklyTipEnabled        = "weekly_tip_enabled"
        case safetyContractAgreedAt  = "safety_contract_agreed_at"
        case pinnedEntryIDs          = "pinned_entry_ids"
        case recentEntryIDs          = "recent_entry_ids"
        case pinnedCalculatorIDs     = "pinned_calculator_ids"
        case recentCalculatorIDs     = "recent_calculator_ids"
        case subscriptionTier        = "subscription_tier"
        case createdAt               = "created_at"
        case updatedAt               = "updated_at"
    }

    public init(
        id: UUID,
        displayName: String = "",
        role: String = "rn",
        unit: String = "medSurg",
        icuSubspecialty: String? = nil,
        yearsExperience: Int? = nil,
        preferredAppearance: String = "system",
        notificationsEnabled: Bool = true,
        weeklyTipEnabled: Bool = true,
        safetyContractAgreedAt: Date? = nil,
        pinnedEntryIDs: [String] = [],
        recentEntryIDs: [String] = [],
        pinnedCalculatorIDs: [String] = [],
        recentCalculatorIDs: [String] = [],
        subscriptionTier: String = "free",
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.displayName = displayName
        self.role = role
        self.unit = unit
        self.icuSubspecialty = icuSubspecialty
        self.yearsExperience = yearsExperience
        self.preferredAppearance = preferredAppearance
        self.notificationsEnabled = notificationsEnabled
        self.weeklyTipEnabled = weeklyTipEnabled
        self.safetyContractAgreedAt = safetyContractAgreedAt
        self.pinnedEntryIDs = pinnedEntryIDs
        self.recentEntryIDs = recentEntryIDs
        self.pinnedCalculatorIDs = pinnedCalculatorIDs
        self.recentCalculatorIDs = recentCalculatorIDs
        self.subscriptionTier = subscriptionTier
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    /// Custom decoder so a server row predating slice-#1's migration (i.e.,
    /// `subscription_tier` column not yet added) decodes cleanly with a
    /// `"free"` default rather than throwing.
    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        self.id                     = try c.decode(UUID.self,    forKey: .id)
        self.displayName            = try c.decodeIfPresent(String.self, forKey: .displayName) ?? ""
        self.role                   = try c.decodeIfPresent(String.self, forKey: .role) ?? "rn"
        self.unit                   = try c.decodeIfPresent(String.self, forKey: .unit) ?? "medSurg"
        self.icuSubspecialty        = try c.decodeIfPresent(String.self, forKey: .icuSubspecialty)
        self.yearsExperience        = try c.decodeIfPresent(Int.self,    forKey: .yearsExperience)
        self.preferredAppearance    = try c.decodeIfPresent(String.self, forKey: .preferredAppearance) ?? "system"
        self.notificationsEnabled   = try c.decodeIfPresent(Bool.self,   forKey: .notificationsEnabled) ?? true
        self.weeklyTipEnabled       = try c.decodeIfPresent(Bool.self,   forKey: .weeklyTipEnabled) ?? true
        self.safetyContractAgreedAt = try c.decodeIfPresent(Date.self,   forKey: .safetyContractAgreedAt)
        self.pinnedEntryIDs         = try c.decodeIfPresent([String].self, forKey: .pinnedEntryIDs) ?? []
        self.recentEntryIDs         = try c.decodeIfPresent([String].self, forKey: .recentEntryIDs) ?? []
        self.pinnedCalculatorIDs    = try c.decodeIfPresent([String].self, forKey: .pinnedCalculatorIDs) ?? []
        self.recentCalculatorIDs    = try c.decodeIfPresent([String].self, forKey: .recentCalculatorIDs) ?? []
        self.subscriptionTier       = try c.decodeIfPresent(String.self, forKey: .subscriptionTier) ?? "free"
        self.createdAt              = try c.decode(Date.self, forKey: .createdAt)
        self.updatedAt              = try c.decode(Date.self, forKey: .updatedAt)
    }
}

/// Subset of `ProfileRecord` used for INSERT/UPDATE — omits the server-managed
/// timestamps. Letting Postgres own `created_at` (default now()) and the
/// trigger own `updated_at` keeps the client from accidentally overwriting
/// them with stale device-clock values.
public struct ProfileUpsert: Codable, Sendable {
    public var id: UUID
    public var displayName: String
    public var role: String
    public var unit: String
    public var icuSubspecialty: String?
    public var yearsExperience: Int?
    public var preferredAppearance: String
    public var notificationsEnabled: Bool
    public var weeklyTipEnabled: Bool
    public var safetyContractAgreedAt: Date?
    public var pinnedEntryIDs: [String]
    public var recentEntryIDs: [String]
    public var pinnedCalculatorIDs: [String]
    public var recentCalculatorIDs: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case displayName             = "display_name"
        case role
        case unit
        case icuSubspecialty         = "icu_subspecialty"
        case yearsExperience         = "years_experience"
        case preferredAppearance     = "preferred_appearance"
        case notificationsEnabled    = "notifications_enabled"
        case weeklyTipEnabled        = "weekly_tip_enabled"
        case safetyContractAgreedAt  = "safety_contract_agreed_at"
        case pinnedEntryIDs          = "pinned_entry_ids"
        case recentEntryIDs          = "recent_entry_ids"
        case pinnedCalculatorIDs     = "pinned_calculator_ids"
        case recentCalculatorIDs     = "recent_calculator_ids"
    }
}
