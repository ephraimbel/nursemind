const items = [
  {
    label: "01",
    eyebrow: "Library",
    title: "A reference, fully cited.",
    body: "Drugs, labs, procedures, diagnoses, communication scripts, and clinical scenarios — every claim sourced to a primary citation, written for clarity and self-directed learning.",
    metrics: [
      ["Drug entries", "1,200 +"],
      ["Lab interpretations", "180"],
      ["NGN-aligned scenarios", "60"],
    ],
    sourcedFrom: "openFDA · DailyMed · Open RN · OpenStax · CDC",
  },
  {
    label: "02",
    eyebrow: "Calculators",
    title: "The complete suite.",
    body: "Hemodynamics, renal, respiratory, electrolytes, acid-base, anticoagulation. Show your work — every calculator returns a result, a formula, and an interpretive band.",
    metrics: [
      ["Calculators", "48"],
      ["Always free", "all but six"],
      ["Citations per result", "1+"],
    ],
    sourcedFrom: "Surviving Sepsis · KDIGO · ATS · ACC/AHA",
  },
  {
    label: "03",
    eyebrow: "Co-pilot",
    title: "An AI that cites or refuses.",
    body: "Grounded in the library, scoped to learning. It explains pathophysiology, walks through clinical reasoning, and surfaces guidelines. It does not diagnose. It does not prescribe. It is not for use during patient care.",
    metrics: [
      ["Average response", "< 4 s"],
      ["Citations per answer", "always"],
      ["Refusal patterns", "trained-in"],
    ],
    sourcedFrom: "Claude Sonnet 4.7 · grounded retrieval",
  },
];

export function Bundle() {
  return (
    <section id="bundle" className="container-wide pt-24 md:pt-36 pb-16 md:pb-24">
      <div className="max-w-[44rem]">
        <div className="eyebrow">What's inside</div>
        <h2 className="mt-5 text-[36px] md:text-[56px] leading-[1.02] tracking-[-0.02em]">
          The reference, the calculator,
          <br />
          and the co-pilot —{" "}
          <span className="accent-italic">in one place.</span>
        </h2>
        <p className="mt-6 max-w-[36rem] text-[16.5px] md:text-[18px] leading-[1.55] text-[color:var(--color-ink-muted)]">
          Search once. Citations carry through. The bundle is the point —
          three tools that share a library, share a design, and share a
          posture toward what they will and will not do.
        </p>
      </div>

      <div className="mt-16 md:mt-24 grid grid-cols-1 md:grid-cols-3 gap-y-14 md:gap-y-0 md:gap-x-12 lg:gap-x-16 border-t border-[color:var(--color-hairline)] pt-12 md:pt-16">
        {items.map((it, i) => (
          <article
            key={it.label}
            className={`relative ${i > 0 ? "md:pl-12 lg:pl-16 md:border-l border-[color:var(--color-hairline)]" : ""}`}
          >
            <div className="flex items-baseline justify-between">
              <span className="num text-[11px] uppercase tracking-[0.16em] text-[color:var(--color-ink-faint)]">
                {it.label}
              </span>
              <span className="text-[11px] uppercase tracking-[0.16em] text-[color:var(--color-ink-muted)]">
                {it.eyebrow}
              </span>
            </div>

            <h3 className="mt-5 text-[28px] md:text-[32px] leading-[1.06] tracking-[-0.02em]">
              {it.title}
            </h3>
            <p className="mt-4 text-[15.5px] leading-[1.6] text-[color:var(--color-ink-muted)]">
              {it.body}
            </p>

            <dl className="mt-7 space-y-2.5">
              {it.metrics.map(([k, v]) => (
                <div
                  key={k}
                  className="flex items-baseline justify-between border-b border-[color:var(--color-hairline)] pb-2.5 text-[13.5px]"
                >
                  <dt className="text-[color:var(--color-ink-muted)]">{k}</dt>
                  <dd className="num text-[color:var(--color-ink)]">{v}</dd>
                </div>
              ))}
            </dl>

            <p className="mt-6 text-[12.5px] citation">{it.sourcedFrom}</p>
          </article>
        ))}
      </div>
    </section>
  );
}
