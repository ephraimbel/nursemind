# Compiled library review snapshot

Generated from a successful simulator test run. These are structural review signals, not clinical accuracy scores or publication approval. Word count measures size, not usefulness. Optional sections may legitimately be absent.

- Registered entries: **2,147**.
- Entries with unresolved attached citation IDs: **0**.
- Entries with at least one block lacking attached citation IDs: **752**.
- Entries citing a search URL or site root: **1,059**.
- Entries flagged for clinical-review triage: **252**.
- Entries reachable through selected topic collections: **701**.

Quick-reference/table rows currently cannot carry citation IDs in the data model. A missing attached ID is not proof that a claim has no supporting source. Conversely, a resolved citation ID is not proof that the source supports the claim. The review signals do not detect every pediatric or emergency topic.

| Section | Entries | Median body words | Under 150 words | Entries with absent sections |
|---|---:|---:|---:|---:|
| communication | 28 | 220.5 | 0 | 0 |
| diagnosis | 577 | 386 | 0 | 5 |
| drip | 34 | 367.5 | 0 | 9 |
| drug | 483 | 368 | 1 | 2 |
| lab | 158 | 282 | 0 | 8 |
| procedure | 152 | 462.5 | 0 | 12 |
| reference | 674 | 458 | 28 | 0 |
| scenario | 41 | 372 | 0 | 0 |

## Absent-section review

- diagnosis: Pathophysiology (5).
- drip: Contraindications (4); Nursing considerations (2); Patient teaching (9).
- drug: Nursing considerations (2); Patient teaching (2).
- lab: Common causes (2); Nursing considerations (1); Watch for (5).
- procedure: Contraindications (12); Documentation (2).

## Changes from baseline

New registered entries: 8. This is the shared workspace total and can include concurrent work.

| Existing entry | Before words | After words |
|---|---:|---:|
| reference:bedside-mobility-assessment | 142 | 306 |
| reference:bedside-nutrition-assessment | 159 | 318 |
| reference:hospital-oral-care | 164 | 328 |
| reference:hospital-sleep-support | 153 | 309 |

## Review order

1. Credentialed review of high-alert, pediatric, emergency and treatment instructions. Source-fidelity checks do not waive the project brief’s clinical-review gates.
2. Replace generic/search citations with the actual source supporting each claim; verify numeric values against that source and the applicable population.
3. Review missing sections for clinical relevance, then improve concise entries where bedside questions remain unanswered.
4. Extend topic navigation after content checks; consolidate overlapping titles without breaking stable entry IDs.

See `entries.json` for every section and source URL, and `review-queue.csv` for a sortable queue. No entry receives clinical approval from this script.
