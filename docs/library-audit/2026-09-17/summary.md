# Compiled library review snapshot

Generated from a successful simulator test run. These are structural review signals, not clinical accuracy scores or publication approval. Word count measures size, not usefulness. Optional sections may legitimately be absent.

- Registered entries: **1,744**.
- Entries with unresolved attached citation IDs: **0**.
- Entries with at least one block lacking attached citation IDs: **756**.
- Entries citing a search URL or site root: **1,063**.
- Entries flagged for clinical-review triage: **249**.
- Entries reachable through selected topic collections: **278**.

Quick-reference/table rows currently cannot carry citation IDs in the data model. A missing attached ID is not proof that a claim has no supporting source. Conversely, a resolved citation ID is not proof that the source supports the claim. The review signals do not detect every pediatric or emergency topic.

| Section | Entries | Median body words | Under 150 words | Entries with absent sections |
|---|---:|---:|---:|---:|
| communication | 27 | 223 | 0 | 0 |
| diagnosis | 575 | 386 | 0 | 5 |
| drip | 32 | 365 | 0 | 7 |
| drug | 481 | 367 | 1 | 0 |
| lab | 156 | 282.5 | 0 | 6 |
| procedure | 150 | 464.5 | 0 | 10 |
| reference | 284 | 394.5 | 12 | 0 |
| scenario | 39 | 374 | 0 | 0 |

## Absent-section review

- diagnosis: Pathophysiology (5).
- drip: Contraindications (4); Patient teaching (7).
- lab: Nursing considerations (1); Watch for (5).
- procedure: Contraindications (10); Documentation (2).

## Changes from baseline

New registered entries: 26. This is the shared workspace total and can include concurrent work.

| Existing entry | Before words | After words |
|---|---:|---:|
| diagnosis:aspiration-pneumonia | 327 | 339 |
| diagnosis:frailty-syndrome | 291 | 289 |
| diagnosis:pneumonia | 234 | 239 |
| diagnosis:pressure-injury | 506 | 504 |
| diagnosis:pressure-injury-treatment | 626 | 625 |
| diagnosis:ventilator-associated-pneumonia | 623 | 575 |
| lab:albumin | 132 | 203 |
| lab:bnp | 142 | 172 |
| lab:bun | 126 | 164 |
| lab:ck-mb | 141 | 183 |
| lab:inr | 119 | 167 |
| lab:lipase | 128 | 168 |
| lab:platelets | 120 | 192 |
| lab:prealbumin | 446 | 205 |
| lab:procalcitonin | 135 | 175 |
| lab:pt | 149 | 166 |
| procedure:central-line-insertion | 776 | 773 |
| procedure:comprehensive-geriatric-assessment | 465 | 462 |
| procedure:tpn-administration | 474 | 473 |
| reference:mechanical-ventilation-basics | 448 | 453 |
| reference:npiap-pressure-injury-staging | 438 | 436 |

## Review order

1. Credentialed review of high-alert, pediatric, emergency and treatment instructions. Source-fidelity checks do not waive the project brief’s clinical-review gates.
2. Replace generic/search citations with the actual source supporting each claim; verify numeric values against that source and the applicable population.
3. Review missing sections for clinical relevance, then improve concise entries where bedside questions remain unanswered.
4. Extend topic navigation after content checks; consolidate overlapping titles without breaking stable entry IDs.

See `entries.json` for every section and source URL, and `review-queue.csv` for a sortable queue. No entry receives clinical approval from this script.
