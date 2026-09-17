# Compiled library review snapshot

Generated from a successful simulator test run. These are structural review signals, not clinical accuracy scores or publication approval. Word count measures size, not usefulness. Optional sections may legitimately be absent.

- Registered entries: **2,089**.
- Entries with unresolved attached citation IDs: **0**.
- Entries with at least one block lacking attached citation IDs: **752**.
- Entries citing a search URL or site root: **1,059**.
- Entries flagged for clinical-review triage: **248**.
- Entries reachable through selected topic collections: **641**.

Quick-reference/table rows currently cannot carry citation IDs in the data model. A missing attached ID is not proof that a claim has no supporting source. Conversely, a resolved citation ID is not proof that the source supports the claim. The review signals do not detect every pediatric or emergency topic.

| Section | Entries | Median body words | Under 150 words | Entries with absent sections |
|---|---:|---:|---:|---:|
| communication | 27 | 223 | 0 | 0 |
| diagnosis | 575 | 386 | 0 | 5 |
| drip | 32 | 365 | 0 | 7 |
| drug | 481 | 367 | 1 | 0 |
| lab | 156 | 282.5 | 0 | 6 |
| procedure | 150 | 464.5 | 0 | 10 |
| reference | 629 | 494 | 29 | 0 |
| scenario | 39 | 374 | 0 | 0 |

## Absent-section review

- diagnosis: Pathophysiology (5).
- drip: Contraindications (4); Patient teaching (7).
- lab: Nursing considerations (1); Watch for (5).
- procedure: Contraindications (10); Documentation (2).

## Changes from baseline

New registered entries: 24. This is the shared workspace total and can include concurrent work.

| Existing entry | Before words | After words |
|---|---:|---:|
| diagnosis:als | 339 | 370 |
| diagnosis:gout | 449 | 444 |
| diagnosis:osteoarthritis | 350 | 355 |
| reference:blood-transfusion-administration | 480 | 579 |
| reference:cauti-bundle | 275 | 595 |
| reference:central-venous-catheter | 539 | 576 |
| reference:chest-tube-drainage | 580 | 599 |
| reference:clabsi-bundle | 222 | 552 |
| reference:wound-care-fundamentals | 439 | 555 |

## Review order

1. Credentialed review of high-alert, pediatric, emergency and treatment instructions. Source-fidelity checks do not waive the project brief’s clinical-review gates.
2. Replace generic/search citations with the actual source supporting each claim; verify numeric values against that source and the applicable population.
3. Review missing sections for clinical relevance, then improve concise entries where bedside questions remain unanswered.
4. Extend topic navigation after content checks; consolidate overlapping titles without breaking stable entry IDs.

See `entries.json` for every section and source URL, and `review-queue.csv` for a sortable queue. No entry receives clinical approval from this script.
