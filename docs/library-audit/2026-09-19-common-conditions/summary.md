# Compiled common-condition audit

Review-build snapshot: **2,153 entries** (580 diagnoses, 677 references, 483 drugs, 158 labs, 152 procedures, 41 scenarios, 34 drips, 28 communication entries). This includes six opt-in additions; the ordinary registry remains 2,147 entries. Other opt-in evidence flags were absent.

All six compiled models match every editorial field and source record in `content/curation/common-conditions/`. The selected entries have zero uncited blocks, zero unresolved citation IDs and zero generic/source-locator issues. All 16 intended topic memberships resolve. Related-link and global title/source invariants pass.

These checks establish data integrity, not clinical validity. All six entries await independent Tier A review. The existing corpus still has 752 entries with uncited-block signals and 1,059 with source-locator signals; no new instances originate in this batch. These inherited signals are not a clinical adjudication.

Validation: one ordinary-build publication-boundary test; 24 review-build tests across four suites; isolated Swift compile without DEBUG confirms empty arrays even with COMMON_CONDITIONS_REVIEW defined. The compiled export and full registry structural snapshot accompany this summary.
