import SwiftUI

// MARK: - Registry filter

extension ContentRegistry {
    /// Entries tagged to a given Test Plan subcategory. Drugs and drips are
    /// auto-mapped to Pharmacological & Parenteral, since they don't carry
    /// an explicit subcategory tag (see `LibraryEntry.nclexTags`).
    func entries(inSubcategory subcategory: TestPlanSubcategory) -> [LibraryEntry] {
        all.filter { entry in
            switch entry {
            case .drug, .drip:
                return subcategory == .pharmacologicalAndParenteralTherapies
            default:
                return entry.nclexTags?.subcategory == subcategory
            }
        }
    }

    func count(inSubcategory subcategory: TestPlanSubcategory) -> Int {
        entries(inSubcategory: subcategory).count
    }
}

// MARK: - Browse view (8 subcategories)

public struct NCLEXBrowseView: View {
    private let registry: ContentRegistry

    public init(registry: ContentRegistry = .shared) {
        self.registry = registry
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header
                Hairline().padding(.vertical, NMSpace.xxl)
                subcategoryList
                Hairline().padding(.vertical, NMSpace.xxl)
                disclaimerFooter
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.xxl)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("STUDY BY NCLEX")
            Text("NCLEX-RN Test Plan").displayXL()
            Text("2026 · 8 client needs categories")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
        }
    }

    private var subcategoryList: some View {
        VStack(spacing: 0) {
            let subs = TestPlanSubcategory.inCanonicalOrder
            ForEach(Array(subs.enumerated()), id: \.element) { idx, sub in
                NavigationLink(value: LibraryDestination.nclexSubcategory(sub)) {
                    SubcategoryRow(subcategory: sub)
                }
                .buttonStyle(.plain)
                if idx < subs.count - 1 {
                    Hairline(color: NMColor.borderSubtle)
                }
            }
        }
    }

    /// Required nominative-fair-use trademark disclaimer for the NCLEX/NCSBN marks.
    /// See docs/v1_SCOPE.md §7 and the legal review in CONTENT_SOURCING.md §2.7.
    private var disclaimerFooter: some View {
        Text("NCLEX® and NCLEX-RN® are registered trademarks of the National Council of State Boards of Nursing, Inc. (NCSBN). NurseMind is not affiliated with, endorsed by, or sponsored by NCSBN.")
            .font(NMFont.bodySM)
            .foregroundStyle(NMColor.textTertiary)
            .italic()
            .lineSpacing(2)
    }
}

// MARK: - Subcategory row

private struct SubcategoryRow: View {
    let subcategory: TestPlanSubcategory

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            VStack(alignment: .leading, spacing: 2) {
                Text(subcategory.displayName)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                Text(subcategory.parentCategory.displayName)
                    .font(NMFont.displayItalicSM)
                    .foregroundStyle(NMColor.textTertiary)
            }
            Spacer(minLength: 0)
            Text(subcategory.percentLabel)
                .font(NMFont.monoXL)
                .foregroundStyle(NMColor.textTertiary)
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
                .padding(.leading, NMSpace.sm)
        }
        .padding(.vertical, NMSpace.base)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Subcategory detail (entries in a single subcategory)

public struct NCLEXSubcategoryListView: View {
    let subcategory: TestPlanSubcategory
    let registry: ContentRegistry

    public init(subcategory: TestPlanSubcategory, registry: ContentRegistry = .shared) {
        self.subcategory = subcategory
        self.registry = registry
    }

    public var body: some View {
        let entries = registry.entries(inSubcategory: subcategory)
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header(count: entries.count)
                Hairline().padding(.vertical, NMSpace.xxl)
                if entries.isEmpty {
                    emptyState
                } else {
                    list(entries: entries)
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.xxl)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    private func header(count: Int) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("NCLEX · \(subcategory.percentLabel) OF EXAM")
            Text(subcategory.displayName).displayXL()
            Text(subtitleText(count: count))
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
        }
    }

    private func subtitleText(count: Int) -> String {
        let entryWord = count == 1 ? "entry" : "entries"
        return "\(count) \(entryWord) · \(subcategory.parentCategory.displayName)"
    }

    private var emptyState: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            Text("No entries tagged to this category yet.")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
            Text("Coverage expands as the library grows.")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
        }
    }

    private func list(entries: [LibraryEntry]) -> some View {
        VStack(spacing: 0) {
            ForEach(Array(entries.enumerated()), id: \.element.id) { idx, entry in
                NavigationLink(value: LibraryDestination.entry(entry.id)) {
                    EntryRow(entry: entry)
                }
                .buttonStyle(.plain)
                if idx < entries.count - 1 {
                    Hairline(color: NMColor.borderSubtle)
                }
            }
        }
    }
}
