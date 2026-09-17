# Critical-care library expansion — September 17, 2026

The previous library work was committed and pushed first as `0b472b7` on `calculator-and-retrieval-hardening`. This subsequent batch adds 20 adult references, 113 sections, 122 individually cited blocks and 4,155 body words, backed by 17 source records. It adds 52 related-entry edges and five focused collections with SF Symbol icons.

## Content and navigation

| Collection | Selected entries | New coverage |
|---|---:|---|
| Oxygen & noninvasive support | 12 | Device checks, oxygenation versus ventilation, HFNC, CPAP/bilevel assessment |
| Invasive ventilation & liberation | 17 | Bedside assessment, waveforms, asynchrony, auto-PEEP, breathing-trial observation |
| Artificial airway care | 14 | Secretion assessment, tracheostomy safety checks, post-extubation observation |
| Rhythm monitoring | 16 | Telemetry artifact, rate and intervals, symptom assessment, QT context |
| Resuscitation & post-arrest | 12 | Adult CPR quality, airway/capnography, post-arrest assessment, recovery support |

The existing Airway & ventilation hub expands from 15 to 36 entries and Rhythms & resuscitation from 12 to 27. Previously unassigned relevant procedures and labs are included alongside the new material. The ICU group grows from seven to 12 topics. Across the checked registry: 51 collections, 821 memberships and 614 distinct entries reachable by topic. A–Z remains the full catalog.

Simulator testing also reproduced a related-reader bug: replacing a reference route retained the previous reference's scroll position. Giving the destination its entry ID resets the reader when the entry changes. The same waveform-to-asynchrony navigation was repeated after rebuilding and now opens at the new heading; the newly viewed entry also appears in recents.

## Validation

- Citation resolver: all 20 entries, zero unresolved attached IDs.
- Runtime checks: 21 tests across critical-care content, library topics, content integrity and entry links passed, including two 20-case checks for discoverability and per-block citation resolution.
- Compiled audit: two tests passed; snapshot contains 2,065 entries / 605 general references. All 20 additions have citations on every block, direct source URLs and topic homes; no new duplicate title or ID.
- App build passed before and after the navigation fix. The final simulator build includes eight concurrent additions from the other content task (2,073 entries shown at final UI validation). They are not part of this 20-entry batch or its 2,065-entry audit snapshot.
- Dedicated iPhone 17 Pro simulator: inspected both expanded hubs, all five new section icons, the resuscitation collection, waveform and post-arrest readers, inline citations, the corrected related navigation and normal free-tier Library home. Opened the post-arrest citation and verified its exact AHA Part 11 URL in Safari.
- Screenshots: `docs/audit-assets/2026-09-17/critical-care-depth/`. Audit: `docs/library-audit/2026-09-17-critical-care/`.

## Provenance and publication status

`content/curation/critical-care-depth/manifest.json` records exact draft text, block-to-source mappings, attribution, license classifications and a pending independent clinical-review queue. Its README documents excluded third-party source sections and source-quality issues.

Open RN and the Costa et al. ventilation review are attributed CC BY 4.0 adaptations. Federal NHLBI/FDA prose is adapted with attribution. AHA 2025 and AARC recommendations use brief original factual paraphrases tagged `factCitationOnly`, with no copied algorithms or figures. ECG tables attributed to StatPearls are excluded despite the chapter-level Open RN license.

All 20 drafts are conservatively marked Tier A pending independent clinical review before publication. Source-fidelity dates and passing tests do not confer clinical approval. No production content deployment occurred. Existing linked entries retain their own review status. The whole-library audit still finds 1,063 entries with generic/search source locators and 756 with at least one block lacking directly attached citation IDs; those legacy source-quality gaps remain work to do. Entry count does not establish a complete clinical library.
