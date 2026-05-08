const pillars = [
  {
    title: "Cite or refuse.",
    body: "Every clinical claim links to a primary source. Citations are validated server-side. Responses that make a numerical claim without a citation are rejected and regenerated — not shown.",
    detail: "Validation: regex + structural enforcement on every AI response.",
  },
  {
    title: "No patient data, ever.",
    body: "NurseMind is architecturally prevented from collecting Protected Health Information. There is no patient record, no chart, no name field. The product cannot store what it cannot accept.",
    detail: "Inputs scrubbed at the edge before reaching any model.",
  },
  {
    title: "Reviewed by licensed RNs.",
    body: "High-risk content — ISMP high-alert drugs, pediatric dosing, emergency protocols — is reviewed by licensed registered nurses pre-publication. The remainder is sampled.",
    detail: "Tier A: pre-publication. Tier B: 10% sampled. Tier C: reporting loop.",
  },
];

export function Safety() {
  return (
    <section
      id="safety"
      className="border-t border-[color:var(--color-hairline)] bg-[color:var(--color-bg-deep)]/40"
    >
      <div className="container-wide pt-24 md:pt-36 pb-20 md:pb-32">
        <div className="grid grid-cols-1 md:grid-cols-12 gap-10 md:gap-16">
          <div className="md:col-span-5">
            <div className="eyebrow">Safety, by design</div>
            <h2 className="mt-5 text-[36px] md:text-[52px] leading-[1.02] tracking-[-0.02em]">
              Trust,
              <br />
              <span className="accent-italic">by construction.</span>
            </h2>
            <p className="mt-6 max-w-[28rem] text-[16px] leading-[1.6] text-[color:var(--color-ink-muted)]">
              A reference used for clinical learning has to be trustworthy by
              construction, not by good intentions. The safety posture is
              wired into the product before any clinical content is written.
            </p>
          </div>

          <div className="md:col-span-7 md:pl-8 lg:pl-12 md:border-l border-[color:var(--color-hairline)]">
            <div className="space-y-12 md:space-y-14">
              {pillars.map((p, i) => (
                <div
                  key={p.title}
                  className={i > 0 ? "border-t border-[color:var(--color-hairline)] pt-10 md:pt-12" : ""}
                >
                  <h3 className="text-[24px] md:text-[28px] leading-[1.1] tracking-[-0.02em]">
                    {p.title}
                  </h3>
                  <p className="mt-4 text-[15.5px] leading-[1.65] text-[color:var(--color-ink-muted)] max-w-[34rem]">
                    {p.body}
                  </p>
                  <p className="mt-3 text-[13px] citation">{p.detail}</p>
                </div>
              ))}
            </div>
          </div>
        </div>

        <div className="mt-20 md:mt-28 border-t border-[color:var(--color-hairline)] pt-8 grid grid-cols-1 sm:grid-cols-3 gap-6 text-[13px] text-[color:var(--color-ink-muted)]">
          <div>
            <span className="num uppercase tracking-[0.14em] text-[10.5px] text-[color:var(--color-ink-faint)] block mb-2">
              Sourcing
            </span>
            License-correct foundation: openFDA, DailyMed, RxNorm, Open RN,
            OpenStax, VA PBM, CDC, NIH.
          </div>
          <div>
            <span className="num uppercase tracking-[0.14em] text-[10.5px] text-[color:var(--color-ink-faint)] block mb-2">
              Scope
            </span>
            <span className="italic font-[family-name:var(--font-serif)]">
              Study and self-directed learning.
            </span>{" "}
            Not clinical decision support, not for use during patient care, not
            a substitute for facility protocol or licensed clinical judgment.
          </div>
          <div>
            <span className="num uppercase tracking-[0.14em] text-[10.5px] text-[color:var(--color-ink-faint)] block mb-2">
              Posture
            </span>
            Never directive. No diagnoses, no prescriptions, no patient-specific
            decisions. Educational explanations only.
          </div>
        </div>
      </div>
    </section>
  );
}
