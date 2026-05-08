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

The site is the web expression of the iOS app's design language. Rules from `../CLAUDE.md` apply verbatim:

- Hairlines, not cards
- Single deep forest green accent on primary CTAs only
- Serif display + sans body + mono numerics
- Italic is deliberate
- No emojis, no decorative chrome, no gradients
- Sage-cream background with subtle film grain

Tokens live in `app/globals.css` under `@theme`. Add new ones there before reaching for one-off classes.

## Deploy

Vercel auto-deploys from `marketing/`. Set the project root to `marketing/` in Vercel project settings.
