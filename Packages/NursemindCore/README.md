# NursemindCore

The reusable core of the Nursemind iOS app: design system, content models, and entry rendering. Builds independently with `swift build`; tests run with `swift test`.

## Why a separate package

- **Testable without Xcode.** `swift build` + `swift test` run in CI without a simulator.
- **SwiftUI previews work in isolation.** Open `Package.swift` in Xcode and preview any component without spinning up the full app.
- **The iOS app is a thin shell.** It depends on this package as a local SPM dependency; almost all logic lives here.

## Curator-model invariants (enforced by tests)

The Nursemind v1 build is a curator over accredited public-domain and CC BY 4.0 nursing content. The data model and tests enforce this:

- Every `AttributedProse` and `AttributedBullet` carries `citationIDs` referencing a known `CitationSource`
- Every cited ID must resolve in the entry's `citations` list (broken references fail tests)
- Every `CitationSource` declares a `SourceLicense` and `lastRetrieved` date
- High-alert entries must cite ISMP

If the model drifts toward original synthesis (a section with no citation), tests fail. This is intentional and not negotiable.

## Layout

```
Sources/NursemindCore/
├── DesignSystem/
│   ├── Colors.swift              ← NMColor tokens (spec §5.1)
│   ├── Typography.swift          ← NMFont tokens + Text extensions
│   ├── Spacing.swift             ← NMSpace scale
│   └── Components/
│       ├── EyebrowLabel.swift
│       ├── Hairline.swift
│       ├── SectionHeader.swift
│       └── HighAlertPill.swift
├── Content/
│   ├── CitationSource.swift      ← source + license model
│   ├── DrugEntry.swift           ← drug entry data shape
│   └── Samples/
│       └── Norepinephrine.swift  ← curator-assembled sample
└── Rendering/
    ├── DrugEntryView.swift       ← top-level entry view
    └── Sections/
        ├── QuickReferenceTable.swift
        ├── AttributedProseView.swift
        ├── AttributedBulletList.swift
        ├── DosingBlockView.swift
        └── CitationsList.swift
```

## Known gaps (tracked for next session)

- Typography uses system serif/sans/mono fallbacks; Instrument Serif + Inter + SF Mono need to be bundled
- No grain texture overlay (spec §5.2)
- Dark mode tokens exist in spec but aren't yet implemented in `NMColor`
- Citation superscripts are rendered but not tappable to source
- No accessibility (Dynamic Type, VoiceOver labels) yet
