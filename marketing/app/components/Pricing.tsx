"use client";

import { useState } from "react";
import Link from "next/link";
import { Check, ArrowUpRight } from "./icons";

const free = {
  name: "Free",
  price: "0",
  cadence: "always",
  blurb: "Genuinely useful, not a teaser.",
  features: [
    "Full clinical reference library",
    "All non-dosing calculators",
    "5 AI co-pilot queries / day",
    "Local bookmarks",
    "Citations on every claim",
  ],
};

const pro = {
  name: "Pro",
  blurb: "Daily-use unlock.",
  features: [
    "50 AI co-pilot queries / day",
    "All clinical scenarios",
    "Advanced specialty calculators",
    "Cross-device sync",
    "Offline pack",
    "Priority response time",
  ],
};

export function Pricing() {
  const [annual, setAnnual] = useState(true);

  return (
    <section id="pricing" className="container-wide pt-24 md:pt-36 pb-16 md:pb-24">
      <div className="grid grid-cols-1 md:grid-cols-12 gap-10 md:gap-16">
        <div className="md:col-span-5">
          <div className="eyebrow">Pricing</div>
          <h2 className="mt-5 text-[36px] md:text-[52px] leading-[1.02] tracking-[-0.02em]">
            Two plans.
            <br />
            <span className="accent-italic">No</span> tricks.
          </h2>
          <p className="mt-6 max-w-[28rem] text-[16px] leading-[1.6] text-[color:var(--color-ink-muted)]">
            The library and the calculators are free, forever. Pro unlocks the
            AI co-pilot for daily work, the full scenario set, and patient-
            specific dosing tools.
          </p>

          <div
            role="tablist"
            aria-label="Billing cadence"
            className="mt-10 inline-flex border border-[color:var(--color-hairline-strong)] rounded-full p-1 text-[13px]"
          >
            <button
              type="button"
              role="tab"
              aria-selected={annual}
              onClick={() => setAnnual(true)}
              className={`px-4 py-1.5 rounded-full transition-colors ${
                annual
                  ? "bg-[color:var(--color-ink)] text-[color:var(--color-bg)]"
                  : "text-[color:var(--color-ink-muted)]"
              }`}
            >
              Annual
            </button>
            <button
              type="button"
              role="tab"
              aria-selected={!annual}
              onClick={() => setAnnual(false)}
              className={`px-4 py-1.5 rounded-full transition-colors ${
                !annual
                  ? "bg-[color:var(--color-ink)] text-[color:var(--color-bg)]"
                  : "text-[color:var(--color-ink-muted)]"
              }`}
            >
              Monthly
            </button>
          </div>
          <p className="mt-3 text-[12.5px] citation">
            Annual saves 50% vs. monthly.
          </p>
        </div>

        <div className="md:col-span-7 grid grid-cols-1 md:grid-cols-2 border-t border-[color:var(--color-hairline)] pt-12">
          {/* Free */}
          <div className="md:pr-10 md:border-r border-[color:var(--color-hairline)]">
            <div className="flex items-baseline justify-between">
              <h3 className="text-[22px] tracking-[-0.01em]">{free.name}</h3>
              <span className="text-[11px] uppercase tracking-[0.14em] text-[color:var(--color-ink-faint)] num">
                {free.cadence}
              </span>
            </div>
            <div className="mt-5 flex items-baseline gap-1">
              <span className="num text-[56px] leading-none tracking-[-0.03em]">
                $0
              </span>
            </div>
            <p className="mt-3 text-[14px] italic font-[family-name:var(--font-serif)] text-[color:var(--color-ink-muted)]">
              {free.blurb}
            </p>

            <ul className="mt-8 space-y-3 text-[14.5px]">
              {free.features.map((f) => (
                <li key={f} className="flex items-start gap-3">
                  <Check className="w-[14px] h-[14px] mt-[5px] text-[color:var(--color-ink-muted)] shrink-0" />
                  <span>{f}</span>
                </li>
              ))}
            </ul>

            <Link
              href="#download"
              className="mt-9 inline-flex items-center gap-1.5 text-[14px] border-b border-[color:var(--color-hairline-strong)] pb-[2px] hover:border-[color:var(--color-ink)] transition-colors"
            >
              Get the app
              <ArrowUpRight className="w-[12px] h-[12px]" />
            </Link>
          </div>

          {/* Pro */}
          <div className="mt-14 md:mt-0 md:pl-10">
            <div className="flex items-baseline justify-between">
              <h3 className="text-[22px] tracking-[-0.01em]">{pro.name}</h3>
              <span className="text-[11px] uppercase tracking-[0.14em] text-[color:var(--color-ink-faint)] num">
                {annual ? "billed yearly" : "billed monthly"}
              </span>
            </div>
            <div className="mt-5 flex items-baseline gap-2">
              <span className="num text-[56px] leading-none tracking-[-0.03em]">
                {annual ? "$89.99" : "$14.99"}
              </span>
              <span className="text-[14px] text-[color:var(--color-ink-muted)] num">
                / {annual ? "yr" : "mo"}
              </span>
            </div>
            <p className="mt-3 text-[14px] italic font-[family-name:var(--font-serif)] text-[color:var(--color-ink-muted)]">
              {annual ? "Equivalent to $7.50 / mo." : pro.blurb}
            </p>

            <ul className="mt-8 space-y-3 text-[14.5px]">
              <li className="flex items-start gap-3 text-[color:var(--color-ink-muted)]">
                <Check className="w-[14px] h-[14px] mt-[5px] shrink-0" />
                <span>
                  Everything in <span className="text-[color:var(--color-ink)]">Free</span>
                </span>
              </li>
              {pro.features.map((f) => (
                <li key={f} className="flex items-start gap-3">
                  <Check className="w-[14px] h-[14px] mt-[5px] text-[color:var(--color-accent)] shrink-0" />
                  <span>{f}</span>
                </li>
              ))}
            </ul>

            <Link href="#download" className="btn-primary mt-9">
              Start with Pro
              <ArrowUpRight className="w-[14px] h-[14px]" />
            </Link>
            <p className="mt-3 text-[12px] citation">
              Cancel anytime. Subscriptions managed by Apple.
            </p>
          </div>
        </div>
      </div>
    </section>
  );
}
