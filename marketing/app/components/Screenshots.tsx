import Image from "next/image";

type Shot = {
  index: string;
  eyebrow: string;
  title: string;
  body: string;
  detail: string;
  src: string;
  alt: string;
  reverse: boolean;
};

const shots: Shot[] = [
  {
    index: "01 / 04",
    eyebrow: "Ask · Entry",
    title: "Ask, scoped to nursing.",
    body: "The co-pilot opens to a single editorial input. It tells you what it knows — your specialty, the 2026 NCLEX-RN test plan — and how many questions you have left today before you ever type one.",
    detail: "3 of 3 questions left today · Specialty-aware · NCLEX-aligned",
    src: "/screenshots/ask.png",
    alt: "NurseMind Ask home screen — italic display headline 'Ask anything' with quota, NCLEX alignment, and suggested questions",
    reverse: false,
  },
  {
    index: "02 / 04",
    eyebrow: "Library · Reference",
    title: "A library that knows your specialty.",
    body: "Drugs, drips, labs, procedures, diagnoses, scenarios — every category opens to entries written and cited for clinical learning. The count next to each row is what's in your specialty alone, not the global catalogue.",
    detail: "965 entries in Med-Surg · cited to primary sources",
    src: "/screenshots/library.png",
    alt: "NurseMind Library tab — Med-Surg specialty showing browse categories Drugs, Drips, Labs, Procedures, Diagnoses with entry counts",
    reverse: true,
  },
  {
    index: "03 / 04",
    eyebrow: "Tools · Calculators",
    title: "Calculators, organized clinically.",
    body: "Hemodynamics, renal, respiratory, hepatic, hematology, burns — calculators grouped the way nurses think about systems, not the way alphabetical lists pretend they do. Every result returns the formula and an interpretive band.",
    detail: "149 calculators · 9 categories · formula + band on every result",
    src: "/screenshots/tools.png",
    alt: "NurseMind Tools tab — 149 calculators in 9 categories: Cardiovascular, Respiratory, Renal, Hepatic, Hematology, Burns",
    reverse: false,
  },
  {
    index: "04 / 04",
    eyebrow: "Answer · In practice",
    title: "Cited, or refused.",
    body: "Every answer surfaces the entries it pulled from before the prose begins. Numerical claims carry a citation chip. Critical findings — like a potassium of 6.5 — are flagged with the relevant guideline source, not buried in a paragraph.",
    detail: "Source chips · guideline citations · grounded retrieval",
    src: "/screenshots/answer.png",
    alt: "NurseMind AI answer in action — interpreting a potassium of 6.5, with reference entries surfaced first and an AHA citation chip on the critical finding",
    reverse: true,
  },
];

export function Screenshots() {
  return (
    <section
      id="inside"
      className="border-t border-[color:var(--color-hairline)]"
    >
      <div className="container-wide pt-24 md:pt-36 pb-16 md:pb-24">
        <div className="max-w-[44rem]">
          <div className="eyebrow">Inside the app</div>
          <h2 className="mt-5 text-[36px] md:text-[56px] leading-[1.02] tracking-[-0.02em]">
            What it{" "}
            <span className="accent-italic">actually</span> looks like.
          </h2>
          <p className="mt-6 max-w-[36rem] text-[16.5px] md:text-[18px] leading-[1.55] text-[color:var(--color-ink-muted)]">
            Real screens, no mockups. Same typeface, same hairlines, same
            citation discipline as the rest of the product.
          </p>
        </div>

        <div className="mt-16 md:mt-24">
          {shots.map((shot, i) => (
            <ShotRow key={shot.index} shot={shot} priority={i === 0} />
          ))}
        </div>
      </div>
    </section>
  );
}

function ShotRow({ shot, priority }: { shot: Shot; priority: boolean }) {
  return (
    <article
      className="grid grid-cols-1 md:grid-cols-12 gap-10 md:gap-16 items-center border-t border-[color:var(--color-hairline)] py-14 md:py-24 first:border-t-0 first:pt-0"
    >
      <div
        className={`md:col-span-5 ${shot.reverse ? "md:order-2" : "md:order-1"}`}
      >
        <div className="relative mx-auto md:mx-0 w-full max-w-[320px] md:max-w-[360px]">
          <Image
            src={shot.src}
            alt={shot.alt}
            width={1206}
            height={2622}
            priority={priority}
            sizes="(min-width: 768px) 360px, 320px"
            className="w-full h-auto block ring-1 ring-[color:var(--color-hairline)] rounded-[28px] md:rounded-[36px]"
          />
        </div>
      </div>

      <div
        className={`md:col-span-7 ${shot.reverse ? "md:order-1 md:pr-10" : "md:order-2 md:pl-10"}`}
      >
        <div className="flex items-baseline justify-between max-w-[34rem]">
          <span className="num text-[11px] uppercase tracking-[0.16em] text-[color:var(--color-ink-faint)]">
            {shot.index}
          </span>
          <span className="text-[11px] uppercase tracking-[0.16em] text-[color:var(--color-ink-muted)]">
            {shot.eyebrow}
          </span>
        </div>
        <h3 className="mt-5 text-[28px] md:text-[40px] leading-[1.06] tracking-[-0.02em] max-w-[28rem]">
          {shot.title}
        </h3>
        <p className="mt-5 text-[15.5px] md:text-[16.5px] leading-[1.62] text-[color:var(--color-ink-muted)] max-w-[32rem]">
          {shot.body}
        </p>
        <p className="mt-6 citation text-[12.5px] md:text-[13px]">
          {shot.detail}
        </p>
      </div>
    </article>
  );
}
