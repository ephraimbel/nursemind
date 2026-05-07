"use client";

import { useState } from "react";
import { Plus, Minus } from "./icons";

const faqs = [
  {
    q: "Who is Nursemind for?",
    a: "Nursing students, licensed registered nurses, licensed practical nurses, and nursing assistants in the United States who want a trustworthy place to study, prepare for the NCLEX, and answer their own clinical questions for personal learning. No NPI is required, and no clinical role is assumed.",
  },
  {
    q: "Can I use Nursemind during patient care?",
    a: "No. Nursemind is a study and self-directed learning tool. It is not a clinical decision support system, it is not a substitute for facility protocols or physician orders, and it is not intended to inform decisions for a real patient. It is designed for use off the clock — for studying, NCLEX prep, and answering your own questions for clarity. For care decisions, defer to your facility, your physician orders, your clinical educators, and your own licensed clinical judgment.",
  },
  {
    q: "How is privacy handled?",
    a: "Nursemind cannot collect Protected Health Information by design. There are no patient name, MRN, DOB, or chart fields anywhere in the product. We ask that you never enter patient-identifying information of any kind. Inputs are scrubbed at the edge before any model receives them. We use the minimum analytics necessary to ship a quality product, and we never sell data.",
  },
  {
    q: "Can the AI co-pilot diagnose or prescribe?",
    a: "No, by construction. The co-pilot is scoped through a system prompt, an intent classifier, and server-side response validation that filter out diagnostic and prescriptive output. It explains pathophysiology, walks through clinical reasoning concepts, and surfaces guideline-based information for educational purposes. It does not tell you what to do for a specific patient.",
  },
  {
    q: "What sources does the library draw from?",
    a: "License-correct primary sources only: openFDA Structured Product Labeling, DailyMed, RxNorm, Open RN textbooks, OpenStax Nursing, the VA PBM monographs, LiverTox, the CDC, and the NIH treatment guidelines. We do not republish proprietary commercial references.",
  },
  {
    q: "Is there an Android version?",
    a: "Not at launch. Android, web, and EHR integrations are explicitly v2. The first 90 days of work are aimed at a single platform done well.",
  },
  {
    q: "Why two SKUs and no student discount?",
    a: "Simpler pricing converts better, and at $89.99 a year Pro is already less than one nursing textbook. The library and forty-plus calculators are free, forever, for everyone.",
  },
  {
    q: "Where do I report a content error?",
    a: "Every entry has a feedback control. Reports route into the same review pipeline used for pre-publication review of high-risk content. Errors involving high-alert drugs, pediatric dosing, or emergency protocols are escalated within twenty-four hours.",
  },
];

export function FAQ() {
  const [open, setOpen] = useState<number | null>(0);

  return (
    <section className="border-t border-[color:var(--color-hairline)]">
      <div className="container-wide pt-24 md:pt-32 pb-20 md:pb-28">
        <div className="grid grid-cols-1 md:grid-cols-12 gap-10 md:gap-16">
          <div className="md:col-span-4">
            <div className="eyebrow">Frequently asked</div>
            <h2 className="mt-5 text-[36px] md:text-[48px] leading-[1.05] tracking-[-0.02em]">
              Plain answers,
              <br />
              <span className="accent-italic">first.</span>
            </h2>
          </div>

          <div className="md:col-span-8">
            <ul>
              {faqs.map((f, i) => {
                const isOpen = open === i;
                return (
                  <li
                    key={f.q}
                    className="border-t border-[color:var(--color-hairline)] last:border-b"
                  >
                    <button
                      type="button"
                      onClick={() => setOpen(isOpen ? null : i)}
                      className="w-full flex items-start justify-between gap-6 py-5 md:py-6 text-left group"
                      aria-expanded={isOpen}
                    >
                      <span className="text-[17px] md:text-[19px] tracking-[-0.01em] font-[family-name:var(--font-serif)] leading-[1.25] pt-[2px]">
                        {f.q}
                      </span>
                      <span className="shrink-0 mt-[6px] text-[color:var(--color-ink-muted)] group-hover:text-[color:var(--color-ink)] transition-colors">
                        {isOpen ? (
                          <Minus className="w-[14px] h-[14px]" />
                        ) : (
                          <Plus className="w-[14px] h-[14px]" />
                        )}
                      </span>
                    </button>
                    <div
                      className={`grid transition-[grid-template-rows] duration-300 ease-out ${
                        isOpen ? "grid-rows-[1fr]" : "grid-rows-[0fr]"
                      }`}
                    >
                      <div className="overflow-hidden">
                        <p className="pb-6 md:pb-7 max-w-[44rem] text-[15px] md:text-[15.5px] leading-[1.65] text-[color:var(--color-ink-muted)]">
                          {f.a}
                        </p>
                      </div>
                    </div>
                  </li>
                );
              })}
            </ul>
          </div>
        </div>
      </div>
    </section>
  );
}
