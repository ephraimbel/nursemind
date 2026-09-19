import UIKit
import Foundation
import Testing
@testable import NursemindCore

@Suite("Answer rendering: tables, lede, numerics")
struct AnswerRenderingTests {
    let sources = [
        CitationSource(id: "c001", shortName: "Open RN", license: .ccBy4, url: "https://x/1", lastRetrieved: "2026-09-19"),
        CitationSource(id: "c002", shortName: "CDC", license: .publicDomain, url: "https://x/2", lastRetrieved: "2026-09-19"),
    ]

    @Test func parsesCitedTableRowsIntoOneBlock() {
        let text = """
        Potassium is monitored during correction [c001].

        ## Potassium reference values
        | Normal range | 3.5–5.0 mEq/L [c001] |
        | Critical high | above 6.0 mEq/L [c001] [c002] |

        Reference only.
        """
        let blocks = ContentBlockParser.parse(content: text, citations: sources)
        #expect(blocks.count == 4)
        guard case .table(let rows) = blocks[2] else { Issue.record("expected table"); return }
        #expect(rows.count == 2)
        #expect(rows[0].key == "Normal range")
        #expect(rows[1].value.contains { if case .citation = $0 { return true } else { return false } })
    }

    @Test func dropsGFMHeaderAndSeparatorLines() {
        let text = "| Parameter | Value |\n|---|---|\n| Sodium | 135–145 mEq/L [c001] |"
        let blocks = ContentBlockParser.parse(content: text, citations: sources)
        guard blocks.count == 1, case .table(let rows) = blocks[0] else { Issue.record("expected one table"); return }
        #expect(rows.map(\.key) == ["Parameter", "Sodium"])
        #expect(ContentBlockParser.parseTableRow("|---|---|", citations: sources) == nil)
        #expect(ContentBlockParser.parseTableRow("not a row", citations: sources) == nil)
    }

    @Test func spaceSeparatedMarkersFoldIntoOnePill() {
        let sources = (1...3).map { CitationSource(id: "s\($0)", shortName: "Open RN \($0)", license: .ccBy4, url: "https://example.org/\($0)", lastRetrieved: "2026-09-19") }
        let blocks = ContentBlockParser.parse(content: "Normal is 3.5 [c001] [c002] [c003].", citations: sources)
        guard case .paragraph(let spans)? = blocks.first else { Issue.record("expected a paragraph"); return }
        let pills = spans.compactMap { span -> Int? in if case .citation(_, let extras) = span { return extras } else { return nil } }
        #expect(pills == [2])
        #expect(spans.count == 3)
    }

    @Test func numericTokensNeverBreakAcrossLines() {
        #expect(NumericTokens.unbreakable("2.5 mEq/L") == "2.5\u{00A0}mEq/\u{2060}L")
        #expect(NumericTokens.unbreakable("3.5–5.0") == "3.5\u{2060}–\u{2060}5.0")
        let text = NSMutableAttributedString(string: "Critical low is less than 2.5 mEq/L today.", attributes: [.font: UIFont.systemFont(ofSize: 17)])
        NumericTokens.applyMono(to: text, bodyFont: UIFont.systemFont(ofSize: 17))
        #expect(text.string == "Critical low is less than 2.5\u{00A0}mEq/\u{2060}L today.")
        let monoRange = (text.string as NSString).range(of: "2.5\u{00A0}mEq/\u{2060}L")
        let font = text.attribute(.font, at: monoRange.location, effectiveRange: nil) as? UIFont
        #expect(font?.fontDescriptor.symbolicTraits.contains(.traitMonoSpace) == true)
    }

    @Test func numericCellsAreFiguresNotPhrases() {
        for cell in [">1.30", "3.5 – 5.0 mEq/L", "< 2.5 mEq/L", "0.91-1.30", "≥ 60 mL/min/1.73 m²"] {
            #expect(NumericTokens.isNumericCell(cell), Comment(rawValue: cell))
        }
        for cell in ["Non-compressible / calcified vessels (DM, CKD) — ABI invalid; use TBI", "Normal", "Every 4 hours after the 2nd dose", "3.5 – 5.0 mEq/L unless the sample is hemolyzed"] {
            #expect(!NumericTokens.isNumericCell(cell), Comment(rawValue: cell))
        }
    }

    @Test func numericTokensCoverValuesRangesRatiosAndUnits() {
        func found(_ s: String) -> [String] {
            NumericTokens.ranges(in: s).map { (s as NSString).substring(with: $0) }
        }
        #expect(found("Potassium 3.5–5.0 mEq/L is normal; above 6.0 mEq/L is critical.") == ["3.5–5.0 mEq/L", "6.0 mEq/L"])
        #expect(found("BP 120/80 mmHg and SpO2 94% after 2 hours.") == ["120/80 mmHg", "94%", "2 hours"])
        #expect(found("Recheck in 15 minutes, then every 4 hrs for 3 days.") == ["15 minutes", "4 hrs", "3 days"])
        #expect(found("Vitamin B12 and CO2 are words, not values.").isEmpty)
        #expect(found("[c001] stays a marker").isEmpty)
    }
}

@Suite("Table row columns")
struct TableRowColumnTests {
    @Test func rowSplitsFigureFromFoldedSources() {
        let sources = (1...3).map { CitationSource(id: "s\($0)", shortName: "Open RN \($0)", license: .ccBy4, url: "https://example.org/\($0)", lastRetrieved: "2026-09-19") }
        let blocks = ContentBlockParser.parse(content: "## Ranges\n| Normal | 3.5 – 5.0 mEq/L [c001] [c002] |\n| Low | < 3.5 mEq/L [c003] |", citations: sources)
        guard case .table(let rows)? = blocks.last else { Issue.record("expected a table"); return }
        #expect(rows.count == 2)
        #expect(rows[0].valueText.trimmingCharacters(in: .whitespaces) == "3.5 – 5.0 mEq/L")
        if case .text(let t)? = rows[0].textSpans.last { #expect(t == "3.5 – 5.0 mEq/L") } else { Issue.record("no text span") }
        #expect(rows[0].citation?.0.id == "s1")
        #expect(rows[0].citation?.1 == 1)
        #expect(rows[1].citation?.1 == 0)
    }
}
