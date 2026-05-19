import Link from "next/link";
import { ArrowUpRight, ArrowRight } from "./icons";

export function Hero() {
  return (
    <section className="container-wide pt-24 md:pt-40 lg:pt-52 pb-20 md:pb-28">
      <div className="max-w-[72rem]">
        <div className="eyebrow lift">
          <span>Now on the App Store</span>
          <span className="mx-2 text-[color:var(--color-ink-faint)]">·</span>
          <span>iPhone</span>
        </div>

        <h1 className="mt-8 md:mt-12 text-[52px] sm:text-[80px] md:text-[104px] lg:text-[120px] leading-[0.94] tracking-[-0.03em] text-balance lift lift-delay-1">
          A clinical reference,
          <br className="hidden md:block" />{" "}
          <span className="accent-italic">redesigned</span> for clarity.
        </h1>

        <p className="mt-9 md:mt-14 max-w-[44rem] text-[19px] md:text-[23px] leading-[1.5] tracking-[-0.005em] text-[color:var(--color-ink-muted)] lift lift-delay-2">
          A cited library, the complete suite of nursing calculators, and an AI
          co-pilot that{" "}
          <span className="text-[color:var(--color-ink)] italic font-[family-name:var(--font-serif)]">
            cites or refuses
          </span>
          {" — "}for studying, NCLEX prep, and self-directed learning.
        </p>

        <div className="mt-10 md:mt-14 flex flex-wrap items-center gap-x-7 gap-y-4 lift lift-delay-3">
          <Link href="#download" className="btn-primary text-[15px] px-6 py-[15px]">
            Download for iPhone
            <ArrowUpRight className="w-[14px] h-[14px]" />
          </Link>
          <Link href="#bundle" className="link-quiet">
            What's inside
            <ArrowRight className="w-[13px] h-[13px]" />
          </Link>
        </div>

        <div className="mt-10 md:mt-14 flex flex-wrap items-center gap-x-6 gap-y-2 text-[13px] text-[color:var(--color-ink-faint)] lift lift-delay-4">
          <span>iPhone</span>
          <span className="hidden sm:inline">·</span>
          <span>Free with optional Pro</span>
          <span className="hidden sm:inline">·</span>
          <span className="italic font-[family-name:var(--font-serif)]">
            For study and reference. Not a clinical decision tool.
          </span>
        </div>
      </div>

      <HeroStats />

      <HeroPreview />
    </section>
  );
}

function HeroStats() {
  const stats: Array<[string, string]> = [
    ["1,200+", "drug entries"],
    ["48", "calculators"],
    ["60", "NCLEX-aligned scenarios"],
    ["100%", "cited"],
  ];
  return (
    <div className="mt-20 md:mt-32 border-y border-[color:var(--color-hairline)] grid grid-cols-2 md:grid-cols-4 lift lift-delay-4">
      {stats.map(([n, label], i) => (
        <div
          key={label}
          className={`py-7 md:py-9 ${
            i > 0 ? "md:border-l border-[color:var(--color-hairline)]" : ""
          } ${
            i % 2 === 1 ? "border-l border-[color:var(--color-hairline)]" : ""
          } ${i >= 2 ? "border-t md:border-t-0" : ""} px-5 md:px-7`}
        >
          <div className="num text-[34px] md:text-[44px] lg:text-[52px] leading-none tracking-[-0.025em] text-[color:var(--color-ink)]">
            {n}
          </div>
          <div className="mt-3 text-[11px] md:text-[12px] uppercase tracking-[0.16em] text-[color:var(--color-ink-muted)] num">
            {label}
          </div>
        </div>
      ))}
    </div>
  );
}

function HeroPreview() {
  return (
    <div className="mt-16 md:mt-24 grid grid-cols-1 md:grid-cols-12 gap-10 md:gap-12 lift lift-delay-4">
      {/* Drug entry */}
      <div className="md:col-span-5">
        <div className="border-t border-[color:var(--color-hairline)] pt-5">
          <div className="flex items-baseline justify-between text-[12px] text-[color:var(--color-ink-muted)]">
            <span className="uppercase tracking-[0.16em] num text-[10.5px]">
              Drug · Cardiovascular
            </span>
            <span className="num text-[10.5px]">01 / 03</span>
          </div>
          <h3 className="mt-3 text-[34px] md:text-[40px] leading-[1.05] tracking-[-0.02em]">
            Metoprolol succinate
          </h3>
          <p className="mt-2 text-[14px] text-[color:var(--color-ink-muted)] italic font-[family-name:var(--font-serif)]">
            Adult · oral · beta-1 selective antagonist
          </p>

          <dl className="mt-7 space-y-3 text-[14.5px]">
            {[
              ["Common dose", "25 – 100 mg PO daily"],
              ["Half-life", "3 – 7 h"],
              ["Renal adjust", "not required"],
              ["Onset", "1 – 2 h"],
            ].map(([k, v]) => (
              <div
                key={k}
                className="grid grid-cols-2 border-b border-[color:var(--color-hairline)] pb-3"
              >
                <dt className="text-[color:var(--color-ink-muted)]">{k}</dt>
                <dd className="num text-right text-[color:var(--color-ink)]">
                  {v}
                </dd>
              </div>
            ))}
          </dl>

          <p className="mt-6 text-[13.5px] leading-[1.6] text-[color:var(--color-ink-muted)]">
            <span className="text-[color:var(--color-ink)]">Black box.</span> Do
            not abruptly discontinue — exacerbation of angina, MI, and
            ventricular arrhythmia have been reported.
          </p>
          <div className="mt-3 text-[12px] citation">
            DailyMed · openFDA Structured Product Labeling
          </div>
        </div>
      </div>

      {/* Calculator + AI stacked */}
      <div className="md:col-span-7 grid grid-cols-1 gap-10 md:gap-12">
        {/* Calculator */}
        <div className="border-t border-[color:var(--color-hairline)] pt-5">
          <div className="flex items-baseline justify-between text-[12px] text-[color:var(--color-ink-muted)]">
            <span className="uppercase tracking-[0.16em] num text-[10.5px]">
              Calculator · Hemodynamics
            </span>
            <span className="num text-[10.5px]">02 / 03</span>
          </div>
          <h3 className="mt-3 text-[28px] md:text-[32px] leading-[1.1] tracking-[-0.02em]">
            Mean arterial pressure
          </h3>

          <div className="mt-6 grid grid-cols-3 gap-3 md:gap-6">
            <Field label="Systolic" value="118" unit="mmHg" />
            <Field label="Diastolic" value="74" unit="mmHg" />
            <Field label="MAP" value="89" unit="mmHg" emphasized />
          </div>

          <p className="mt-5 text-[13px] text-[color:var(--color-ink-muted)]">
            Within target perfusion range. Threshold for sepsis-related concern{" "}
            <span className="num text-[color:var(--color-ink)]">≥ 65</span>{" "}
            mmHg.
          </p>
          <div className="mt-3 text-[12px] citation">
            Surviving Sepsis Campaign · 2021
          </div>
        </div>

        {/* AI exchange */}
        <div className="border-t border-[color:var(--color-hairline)] pt-5">
          <div className="flex items-baseline justify-between text-[12px] text-[color:var(--color-ink-muted)]">
            <span className="uppercase tracking-[0.16em] num text-[10.5px]">
              Co-pilot · Grounded
            </span>
            <span className="num text-[10.5px]">03 / 03</span>
          </div>

          <p className="mt-4 text-[14px] text-[color:var(--color-ink-muted)] italic font-[family-name:var(--font-serif)]">
            Why does my patient on furosemide need potassium monitoring?
          </p>

          <p className="mt-4 text-[15px] leading-[1.6]">
            Furosemide is a loop diuretic. It inhibits the Na⁺/K⁺/2Cl⁻
            transporter in the thick ascending loop of Henle, increasing renal
            potassium loss. Hypokalemia (
            <span className="num">&lt; 3.5 mEq/L</span>) is a known and dose-
            dependent adverse effect, with risk of arrhythmia in patients also
            on digoxin.
          </p>

          <p className="mt-3 text-[12px] citation">
            DailyMed · LiverTox · Open RN <em>Pharmacology</em>, ch. 18
          </p>
        </div>
      </div>
    </div>
  );
}

function Field({
  label,
  value,
  unit,
  emphasized,
}: {
  label: string;
  value: string;
  unit: string;
  emphasized?: boolean;
}) {
  return (
    <div className="flex flex-col">
      <span className="text-[11px] uppercase tracking-[0.14em] text-[color:var(--color-ink-muted)]">
        {label}
      </span>
      <span
        className={`mt-1.5 num ${emphasized ? "text-[34px] md:text-[40px] text-[color:var(--color-ink)]" : "text-[26px] md:text-[30px] text-[color:var(--color-ink-muted)]"} leading-none tracking-[-0.02em]`}
      >
        {value}
      </span>
      <span className="mt-1 text-[11px] text-[color:var(--color-ink-faint)] num">
        {unit}
      </span>
    </div>
  );
}
