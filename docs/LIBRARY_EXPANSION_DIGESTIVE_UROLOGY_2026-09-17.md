# Digestive procedures and urology expansion — September 17, 2026

Added **10 adult nursing guides with 70 sections, 139 individually cited blocks and 4,227 body words**, supported by **12 primary NIDDK pages**. The new content covers preparation, observation, complications and follow-up for digestive and urinary procedures, urinary testing, BPH and hematuria. Every guide is registered in search, assigned to existing icon-bearing topics and linked to related care: **26 topic memberships and 26 related-entry edges**.

| Guide | Body words | Sections |
|---|---:|---:|
| Colonoscopy: preparation and recovery | 458 | 7 |
| Upper GI endoscopy: preparation and recovery | 425 | 7 |
| ERCP: preparation and recovery | 403 | 7 |
| Liver biopsy: preparation and recovery | 423 | 7 |
| Flexible sigmoidoscopy: preparation and recovery | 343 | 6 |
| Cystoscopy and ureteroscopy: nursing support | 428 | 7 |
| Urodynamic testing: preparation and interpretation | 436 | 7 |
| Urinary tract imaging: nursing preparation | 431 | 7 |
| BPH: symptom assessment and treatment follow-up | 454 | 8 |
| Hematuria: assessment and diagnostic follow-up | 426 | 7 |

## Sources and review status

The [manifest](../content/curation/digestive-urology-depth/manifest.json) maps all 139 blocks to source snapshots and final Swift file hashes. The [source review](../content/curation/digestive-urology-depth/source-review.md) records supporting source sections, scope, dates and excluded source defects. All twelve retained text snapshots have verified hashes. Source text is original NIDDK federal prose; third-party referenced publications and images are excluded.

The source pass excludes the ERCP page’s inaccurate classification of endoscopic ultrasound, broad older contrast-risk wording, a universal postvoid residual cutoff and a PSA “rule-out” claim. Preparation, medicine changes, fluid plans, invasive treatment and discharge decisions remain with the treating team. Hematuria includes explicit urgent evaluation for inability to urinate or severe abdominal pain, grounded in the separate NIDDK retention source.

All ten guides remain **pending independent Tier A clinical review**. Source fidelity, citation checks and software tests are not clinician approval. The review manifest is metadata, not a runtime publication gate. These changes are local development work; no production release or deployment occurred.

## Verified snapshot

The [compiled audit](library-audit/2026-09-17-digestive-urology/summary.md) contains **2,126 entries / 666 general references**, with **54 collections / 999 memberships / 679 distinct entries**. Exactly the intended ten IDs were added; no baseline entry was removed. All ten compiled body counts and topic assignments match the manifest, with no missing attached citations, unresolved citation IDs or root/search source URLs in these new guides.

Whole-library legacy flags remain: 752 entries have a block without an attached citation ID, 1,059 cite a root/search URL, and 1,447 remain outside curated collections while available through search/A–Z. These are structural review signals, not clinical error judgments. A total count does not establish a complete nursing reference.

## Verification

- Final 21 tests across DigestiveUrologyDepthTests, LibraryTopicTests, ContentIntegrityTests and EntryLinkRegistryTests passed. These exercise actual registry search, topic resolution, related targets and attached citations.
- Two ContentDepthAuditTests passed separately; the resulting export was compared with the previous 2,116-entry snapshot.
- Citation script checked all ten new entries with zero problems. All 139 manifest blocks matched Swift, all final content-file hashes matched and all twelve retained source-text hashes verified.
- Final iOS simulator app build passed. A dedicated content QA device was used for final tests and reader verification to avoid disturbing other work.
- Colonoscopy reader rendered its cited sections; related navigation opened flexible sigmoidoscopy at the new title. Its citation opened the matching NIDDK page. Hematuria rendered both sources and the final acute-retention warning; the urodynamic reader rendered all seven cited sections.
- Restored normal By topic library home with 2,126 entries and no debug Pro override. Git whitespace checks passed.
- [Simulator evidence](audit-assets/2026-09-17/digestive-urology/) is retained with this handoff.

Next: independent clinical review, continued ICU/bedside/specialty depth and corrections to legacy sourcing. Unrelated AI, analytics and other workspace changes were preserved.
