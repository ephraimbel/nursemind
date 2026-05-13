#!/usr/bin/env node

// Regenerates the NurseMind wordmark image asset (the bundled PNG that
// NursemindLogo.swift renders as a template image and tints with
// NMColor.accent at runtime).
//
// Reason: the existing PNG was created when the brand was lowercase
// "nursemind". The brand is now camelCase "NurseMind" (matches the
// App Store name and CFBundleDisplayName). Without regenerating, the
// in-app wordmark and the home-screen label disagree.
//
// Renders at 3x (1800×720), 2x (1200×480), and 1x (600×240) — the
// canonical asset-catalog scale set. White-on-transparent so iOS's
// template rendering tints the entire mark with the accent color.

const path = require("node:path");
const fs = require("node:fs");
const sharp = require(path.join(
  __dirname,
  "..",
  "marketing",
  "node_modules",
  "sharp"
));

const REPO_ROOT = path.join(__dirname, "..");
const ASSET_DIR = path.join(
  REPO_ROOT,
  "Packages/NursemindCore/Sources/NursemindCore/Resources/Assets.xcassets/NursemindWordmark.imageset"
);

// Canonical aspect 2.5:1 — preserved so NursemindLogo.swift's measured
// `aspectRatio` constant (1983/793 ≈ 2.50) keeps working without
// recompiling.
const SCALES = [
  { suffix: "@3x", w: 1800, h: 720 },
  { suffix: "@2x", w: 1200, h: 480 },
  { suffix: "",    w:  600, h: 240 },
];

// Build the SVG once at the largest size, then let sharp resize for
// the smaller variants — antialiasing stays clean and we avoid
// drawing-position drift between scales.
const buildSvg = (w, h) => {
  // Text params — italic serif, centered, filling ~75% of canvas width.
  // Georgia is the closest screen-tuned italic serif guaranteed on
  // macOS; it reads similarly to Instrument Serif at small sizes.
  // Order: Instrument Serif (if installed by next/font cache),
  // Georgia, then a generic serif fallback.
  const cx = w / 2;
  const cy = h / 2;
  const fontSize = h * 0.46; // text occupies ~46% of canvas height

  // Sparkle params — small four-point crystal positioned upper-right
  // of the last glyph, like the original wordmark.
  // Approximate the original's location: slightly past the right edge
  // of the centered text, at roughly 0.30 height from top.
  const sparkleScale = h * 0.0009; // tuned to look ~1/5 of cap-height
  const sparkleX = w * 0.745;
  const sparkleY = h * 0.31;
  // 4-point star path in a 200×200 local coord, center (100, 100).
  // Same silhouette as the app icon sparkle, scaled smaller.
  const sparkle = `
    <g transform="translate(${sparkleX}, ${sparkleY}) scale(${sparkleScale}) translate(-100, -100)">
      <path d="M 100 10 C 105 60, 130 80, 190 100 C 130 120, 105 140, 100 190 C 95 140, 70 120, 10 100 C 70 80, 95 60, 100 10 Z"
            fill="#ffffff"/>
    </g>
  `;

  return `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${w} ${h}" width="${w}" height="${h}">
  <text x="${cx}" y="${cy}"
        font-family="Instrument Serif, Georgia, 'Times New Roman', serif"
        font-style="italic"
        font-size="${fontSize}"
        fill="#ffffff"
        text-anchor="middle"
        dominant-baseline="middle">NurseMind</text>
  ${sparkle}
</svg>`;
};

(async () => {
  if (!fs.existsSync(ASSET_DIR)) {
    throw new Error(`Asset directory not found: ${ASSET_DIR}`);
  }

  // Render at 3x first as the master, then resize-down for 2x and 1x.
  const masterSvg = buildSvg(1800, 720);
  const master = await sharp(Buffer.from(masterSvg))
    .resize(1800, 720)
    .png()
    .toBuffer();

  for (const { suffix, w, h } of SCALES) {
    const out = path.join(ASSET_DIR, `wordmark${suffix}.png`);
    await sharp(master).resize(w, h).png({ compressionLevel: 9 }).toFile(out);
    console.log(`✓ ${path.relative(REPO_ROOT, out)} (${w}×${h})`);
  }

  // Drop a visible-on-cream debug copy into /tmp so you can eyeball
  // the result without launching the simulator. Tinted sage-green for
  // visibility against the cream paper background.
  const debugPath = "/tmp/wordmark-preview-on-cream.png";
  const debugSvg = buildSvg(1800, 720).replace(
    /fill="#ffffff"/g,
    'fill="#1F6B3D"' // sage-green like NMColor.link
  );
  await sharp(Buffer.from(debugSvg))
    .resize(1800, 720)
    .flatten({ background: "#F4F2EC" })
    .png()
    .toFile(debugPath);
  console.log(`\nPreview (sage-on-cream): ${debugPath}`);
})().catch((err) => {
  console.error(err);
  process.exit(1);
});
