import { assert, assertEquals } from "jsr:@std/assert@1"
import manifest from "./entry-titles.json" with { type: "json" }
import { containsWord, matchKey, relatedEntryIDs } from "./entry-links.ts"

const entries = [
    { id: "drug:heparin", title: "Heparin (unfractionated)", category: "drug" },
    { id: "drip:heparin", title: "Heparin infusion", category: "drip" },
    { id: "lab:aptt", title: "aPTT", category: "lab" },
    { id: "diagnosis:pain", title: "Pain", category: "diagnosis" },
    { id: "drug:pai", title: "PAI", category: "drug" },
]

Deno.test("normalizes titles like the iOS matcher", () => {
    assertEquals(matchKey("Heparin (unfractionated)"), "heparin")
    assertEquals(matchKey("  Sepsis  "), "sepsis")
})

Deno.test("matches whole words only", () => {
    assert(containsWord("chest pain relief", "pain"))
    assert(!containsWord("painting the wall", "pain"))
    assert(containsWord("dose of heparin.", "heparin"))
    assert(!containsWord("heparinized saline", "heparin"))
})

Deno.test("ranks longest titles first, one per category and key, and skips short keys", () => {
    const ids = relatedEntryIDs({
        headline: "FDA recalls heparin infusion lots",
        why_nurses_care: "Check aPTT monitoring and pain assessment.",
        body: "PAI is not mentioned as a word here: pain is.",
    }, entries)
    assertEquals(ids, ["drip:heparin", "drug:heparin", "lab:aptt", "diagnosis:pain"])
})

Deno.test("respects the limit", () => {
    const ids = relatedEntryIDs({ headline: "heparin infusion aptt pain", why_nurses_care: "", body: "" }, entries, 2)
    assertEquals(ids.length, 2)
})

Deno.test("manifest is well formed and matches a known story", () => {
    assert(manifest.length > 2000)
    const ids = new Set(manifest.map((e) => e.id))
    assertEquals(ids.size, manifest.length)
    for (const e of manifest) assert(/^[a-z]+:.+/.test(e.id), e.id)
    const found = relatedEntryIDs({
        headline: "FDA alerts clinicians to a heparin sodium lot recall",
        why_nurses_care: "Check lots before the next dose.",
        body: "",
    })
    assert(found.some((id) => id.startsWith("drug:heparin")), found.join(","))
})
