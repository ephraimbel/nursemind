#!/usr/bin/env node

// Generates the iOS App Store icon as a fresh 1024×1024 PNG: bright spring
// green four-point sparkle on a flat deep-forest ground. Mirrors the iOS
// app's NMColor.accent (#4ABE7B) on a deeper version of bgPrimary, and
// uses the same SF-Symbols-style four-point-star silhouette the app uses
// in its eyebrow labels and Ask CTAs.
//
// Path-defined (not a recolor of the previous PNG), so anti-aliasing is
// perfect and the colors are exact at every pixel — no gradient artifacts.
// Output is a flat opaque RGB PNG with no pre-rounded corners; Apple
// applies the squircle mask at install time.

const path = require("node:path");
const sharp = require(path.join(
  __dirname,
  "..",
  "marketing",
  "node_modules",
  "sharp"
));

const DST = path.join(
  __dirname,
  "..",
  "Nursemind",
  "Assets.xcassets",
  "AppIcon.appiconset",
  "AppIcon-1024.png"
);

const BG = "#1F3D2A"; // deep forest, flat
const FG = "#4ABE7B"; // bright spring green

// Parametric four-point sparkle. `reach` is how far each cardinal point
// extends from the canvas center; `waist` controls how chunky the body
// is between adjacent points (larger = fatter, closer to a rounded
// diamond; smaller = a pinched star). Control points are placed on the
// diagonals from each cardinal toward the canvas corners so the curves
// bulge into the quadrants between cardinals, giving a substantial
// crystalline silhouette that still tapers to sharp points.
const C = 512;       // center of 1024×1024 canvas
const REACH = 312;   // distance from center to each cardinal tip
const WAIST = 80;    // diagonal offset of control points from the cardinal
                     // axes. The straight-diamond edge midpoints sit at
                     // diagonal distance ≈220px from center; values below
                     // that create concave (sparkle-like) curves, values
                     // above flip to convex (puffy diamond). 80 reads
                     // clearly as a sparkle while keeping a substantial
                     // body that survives App Store grid scale.

const t = C - REACH; // top y / left x
const b = C + REACH; // bottom y / right x
const w = WAIST;
const SVG = `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024" width="1024" height="1024">
  <rect width="1024" height="1024" fill="${BG}"/>
  <path fill="${FG}" d="
    M ${C} ${t}
    C ${C + w} ${C - w * 1.3}, ${C + w * 1.3} ${C - w}, ${b} ${C}
    C ${C + w * 1.3} ${C + w}, ${C + w} ${C + w * 1.3}, ${C} ${b}
    C ${C - w} ${C + w * 1.3}, ${C - w * 1.3} ${C + w}, ${t} ${C}
    C ${C - w * 1.3} ${C - w}, ${C - w} ${C - w * 1.3}, ${C} ${t}
    Z
  "/>
</svg>`;

(async () => {
  await sharp(Buffer.from(SVG))
    .resize(1024, 1024)
    .flatten({ background: BG })
    .png({ compressionLevel: 9 })
    .toFile(DST);

  const meta = await sharp(DST).metadata();
  console.log(`Wrote: ${DST}`);
  console.log(`Size:  ${meta.width}×${meta.height}, ${meta.channels} channels, alpha=${meta.hasAlpha}`);
  console.log(`Bg:    ${BG}`);
  console.log(`Fg:    ${FG}`);
})().catch((err) => {
  console.error(err);
  process.exit(1);
});
