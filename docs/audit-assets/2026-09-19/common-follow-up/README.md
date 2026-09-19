# Common-condition follow-up simulator evidence

Device: NurseMind Content QA Sep17, iOS 26.3 (`90838B4B-690A-4B72-8016-3219105865A9`). Local Debug app with COMMON_CONDITIONS_REVIEW and fake-Pro access; other review flags absent. No production publication.

Six screenshots show the dyslipidemia, constipation, IBS, insomnia, smoking-cessation and MASLD readers. Their text, section headings, citation buttons and related links were also inspected through the simulator accessibility tree. IBS was reached through the constipation related link; smoking cessation through the insomnia link. Both readers opened at the top. `masld-evidence.png` shows the full ESSENCE paragraph, outcome values, limitations and source marker. `cholesterol-source-url.png` records the Safari address after opening the ACC/AHA citation from the dyslipidemia reader; the exact URL was verified through the address field. This confirms navigation, not remote page rendering or clinical approval.

The built application used `/tmp/nursemind-bedside-evidence-build`; its build log is `/tmp/nursemind-common-followup-app-build.log`. All entries remain pending independent Tier A clinical review.
