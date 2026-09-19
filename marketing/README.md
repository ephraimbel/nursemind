# NurseMind — Marketing Site

The public site at nursemind.app.

## Stack

- Next.js 15 (App Router) · React 19 · TypeScript
- Tailwind CSS v4 (CSS-first `@theme` configuration)
- Fonts via `next/font/google` — Instrument Serif, Inter, JetBrains Mono

## Develop

```bash
cd marketing
npm install
npm run dev
```

Visit http://localhost:3000.

## Design system

The site is the web expression of the iOS app's design language. Design direction follows `../AGENTS.md`:

- Hairlines, not cards
- Vivid green (#0BDA51) on primary CTAs only; deep emerald for source links
- Serif display + sans body + mono numerics
- Italic is deliberate
- No emojis, no decorative chrome, no gradients
- Sage-cream background with subtle film grain

Tokens live in `app/globals.css` under `@theme`. Add new ones there before reaching for one-off classes.

## Deploy

Vercel auto-deploys from `marketing/`. Set the project root to `marketing/` in Vercel project settings.

## Landing page

The homepage pairs an oversized editorial opening with three scroll-responsive app screens, an animated question/source/library sequence, a keyboard-accessible app tour, the sourcing approach, pricing, native FAQ disclosures, and an App Store CTA. Every app preview opens a full-size screenshot viewer with arrow navigation, Escape dismissal, and restored focus. The real iOS wordmark artwork lives in `public/brand/`; `app/experience.css` defines the homepage composition and motion. The navigation becomes a dismissible menu on phones. Shared navigation uses homepage-qualified section links so it also works from legal and support pages.

App Store links share `app/components/AppStoreLink.tsx`. The tour uses local screenshots, served through Next Image. Ask, Library, Sources, and the supplementary answer screenshot were captured from the current app on September 19, 2026, on an isolated iPhone 17 Pro simulator in light appearance (1206 × 2622). The Sources screen shows the AHRQ TeamSTEPPS citation sheet for a general SBAR question. Static image imports give replacement captures content-hashed URLs so older optimized images cannot remain cached.

## Verification

Run `npm run typecheck` and `npm run build`. Start the production preview with `npm run start`, then check the page at 320, 375, 390, 428, 768, 1024, and 1440 pixels. Check the mobile menu (including Escape), app-tour arrow keys/Home/End, both billing options, FAQ disclosure, and links from the support page back to homepage sections. Check the screenshot viewer, its keyboard navigation and focus restoration, and both animation pause controls. Motion respects `prefers-reduced-motion`; the learning sequence only plays while visible, and scroll motion uses requestAnimationFrame.
