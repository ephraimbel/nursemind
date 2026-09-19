# Common-condition simulator verification

Captured from the final Debug app with `COMMON_CONDITIONS_REVIEW`, on the isolated NurseMind Content QA Sep17 simulator (iOS 26.3). All six entries were opened and inspected. No UI renderer changes were required.

- `diabetes-definition.png`: new condition header, definition and source marker.
- `diabetes-criteria.png`: confirmation, assay limitations and classification distinction.
- `sick-day-medication-safety.png`: reached through the diabetes related link; current drug-specific illness context with citations.
- `cdc-source-url.png`: the citation opens `https://www.cdc.gov/diabetes/living-with/managing-sick-days.html`. Safari address verified; this does not claim the remote page rendered successfully.
- `hypertension-escalation.png`: acute injury versus severe hypertension distinction and citations.
- `hypertension-kidney-follow-up.png`: reached through the hypertension related link; CKD-specific monitoring and source markers.
- `obesity-trial-context.png`: population, comparator, outcome and limitations for SURMOUNT-5.
- `obesity-maintenance-evidence.png`: reached through the obesity related link; SURMOUNT-4 initial versus randomized-period weight changes.

The screenshots verify presentation and navigation, not clinical approval. All six entries remain gated review drafts.
