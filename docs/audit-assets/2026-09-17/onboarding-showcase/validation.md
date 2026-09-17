# Onboarding showcase layout — September 17, 2026

## Issue and change

The fixed 260 × 540-point demo illustration exceeded the height available inside the page view. The outer stack extended upward, hiding the eyebrow and clipping the headline beneath the status bar on iPhone 17 Pro.

PhoneFrame now measures the space proposed by its parent and scales the complete illustration uniformly, capped at its original size. The page headline retains its intrinsic height and the preview occupies the remaining space. Typography, copy, animation and onboarding navigation are unchanged.

## Verification

- Debug simulator build passed.
- iPhone 17 Pro, iOS 26.3: Ask, Library and NCLEX titles, subtitles, complete phone outline and bottom controls are visible without overlap.
- iPhone SE (3rd generation), iOS 26.2: the same three pages fit the smaller screen with the illustration scaled down.
- Continue moves through Ask → Library → NCLEX.
- Get started advances to personalization on iPhone SE.
- Skip advances to personalization on iPhone 17 Pro.
- Before and after screenshots are retained alongside this record.

No new unit tests were added for this layout-only change; validation used the running app on both screen sizes.
