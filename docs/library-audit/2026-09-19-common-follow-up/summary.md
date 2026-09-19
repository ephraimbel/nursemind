# Compiled common-condition follow-up audit

Review-build snapshot: **2,159 entries**: 582 diagnoses, 681 references, 483 drugs, 158 labs, 152 procedures, 41 scenarios, 34 drips and 28 communication entries. This includes twelve common-condition drafts, six added in this expansion; the ordinary registry remains 2,147 entries. Other opt-in evidence flags were absent.

All twelve compiled models match every editorial field and source record in `content/curation/common-conditions/`. They have zero uncited blocks, zero unresolved citation IDs and zero generic/source-locator issues. All 34 topic memberships resolve. The six additions contribute 2,780 body words, 57 cited blocks, 30 sources, 19 related pairs and 18 memberships. The previous six entries retain all their clinical text and block citations.

One ordinary-build exclusion test, 24 review-build tests across four suites and exact compiled-data comparison passed. An isolated Swift compilation with COMMON_CONDITIONS_REVIEW defined and DEBUG absent confirmed empty entry/link/topic arrays for all eight topic IDs. These checks establish data integrity, not clinical validity or publication approval; the Tier A reviewer and approval fields remain blank.

The inherited whole-library signals remain 752 entries with uncited blocks and 1,059 with source-locator issues. No new instances originate in the twelve-entry collection. Existing MASLD diagnosis wording that calls weight loss the only proven fibrosis intervention needs separate clinical/source reconciliation against the new treatment evidence; this expansion does not validate or silently replace that legacy guide.
