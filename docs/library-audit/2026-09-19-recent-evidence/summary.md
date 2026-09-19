# Recent-evidence library audit — 2026-09-19

The opt-in review build contains 2161 entries, including 14 new drafts. The ordinary build excludes these drafts and contains 2147 entries in this snapshot. Concurrent ICU review drafts are excluded because their independent flag was not enabled.

New content has no uncited blocks, unresolved citation IDs or generic source locators in the audit. All 14 entries have search, topic and related-link coverage, with compiled fields matching the editorial JSON exactly. The local RAG checks retrieved the expected study citations. These are software/source-traceability checks, not clinical sign-off.

| Entry | Section | Audited words | Collections |
| --- | --- | ---: | ---: |
| Adult RSV vaccination evidence | reference | 277 | 4 |
| Blood-pressure targets in diabetes | reference | 286 | 3 |
| Brensocatib | drug | 221 | 2 |
| Combination therapy in diabetic kidney disease | reference | 265 | 2 |
| Donanemab | drug | 246 | 3 |
| Gepotidacin | drug | 240 | 3 |
| Lenacapavir for HIV prevention | reference | 281 | 2 |
| Nerandomilast | drug | 229 | 2 |
| Obesity medication comparison evidence | reference | 288 | 2 |
| Oral semaglutide cardiovascular evidence | reference | 287 | 2 |
| Plasma p-tau217 / amyloid ratio | lab | 275 | 3 |
| Self-collected vaginal HPV testing | lab | 309 | 3 |
| Suzetrigine | drug | 238 | 2 |
| Zuranolone | drug | 245 | 3 |

The body-word total in the curation manifest is 3,663; the audit also counts context headings in some model fields. Drug dosing and unsupported nursing implications, and assay-independent lab cutoffs, are deliberately absent.

Inherited content debt in this review snapshot: 752 entries have uncited blocks; 1059 have source-locator issues. These figures are not claims that the remaining entries have received independent clinical review.

Validation: one normal-build publication-boundary test and 24 tests across four review-build suites passed. An isolated Swift compiler check also confirmed that setting the review flag without DEBUG exposes no entries, topic IDs or links. `verify-recent-evidence.py` compared all compiled fields and citations with the source records.

After simulator inspection, the HPV entry was retagged to infection to avoid a misleading hematology eyebrow. All five batch tests passed again, and the final compiled export matched every manifest field.
