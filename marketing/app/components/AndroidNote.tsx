export function AndroidNote() {
  return (
    <section
      id="android"
      className="border-t border-[color:var(--color-hairline)] bg-[color:var(--color-bg-deep)]/40"
    >
      <div className="container-wide py-20 md:py-28">
        <div className="max-w-[40rem] mx-auto text-center">
          <div className="eyebrow">Android</div>
          <h2 className="mt-5 text-[32px] md:text-[44px] leading-[1.05] tracking-[-0.02em]">
            Coming to Android,{" "}
            <span className="accent-italic">soon.</span>
          </h2>
          <p className="mt-6 text-[15.5px] md:text-[16.5px] leading-[1.6] text-[color:var(--color-ink-muted)]">
            We're shipping iOS first to get the experience right — typography,
            haptics, latency, citation discipline. Android joins this year.{" "}
            <span className="italic font-[family-name:var(--font-serif)]">
              Same library, same calculators, same posture.
            </span>
          </p>
        </div>
      </div>
    </section>
  );
}
