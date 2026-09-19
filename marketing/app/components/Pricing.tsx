"use client";

import { useState } from "react";
import { AppStoreLink, APP_STORE_URL } from "./AppStoreLink";
import { ArrowUpRight, Check } from "./icons";

const freeFeatures = [
  "Clinical reference library",
  "3 AI questions a day",
  "Local bookmarks",
  "Sources to explore",
];
const proFeatures = [
  "Everything in Free",
  "50 AI questions a day",
  "Full clinical scenario collection",
  "Offline reference access",
];

export function Pricing() {
  const [annual, setAnnual] = useState(true);
  return (
    <section
      id="pricing"
      className="pricing-section container-wide section-space"
      aria-labelledby="pricing-title"
    >
      <div className="pricing-heading" data-reveal>
        <div>
          <p className="eyebrow">Room to keep growing</p>
          <h2 id="pricing-title">
            Start curious.
            <br />
            <em>Go a little further.</em>
          </h2>
        </div>
        <div className="pricing-intro">
          <p>
            Make NurseMind part of your learning, for free. Choose Pro when
            you'd like more room to explore.
          </p>
          <div
            className="billing-toggle"
            role="group"
            aria-label="Billing frequency"
          >
            <button
              type="button"
              aria-pressed={annual}
              onClick={() => setAnnual(true)}
            >
              Yearly <span>Save 44%</span>
            </button>
            <button
              type="button"
              aria-pressed={!annual}
              onClick={() => setAnnual(false)}
            >
              Monthly
            </button>
          </div>
        </div>
      </div>
      <div className="pricing-plans" data-reveal>
        <article className="plan">
          <div className="plan-top">
            <h3>Free</h3>
            <span className="eyebrow">Your starting point</span>
          </div>
          <div className="plan-price">
            <span className="num">$0</span>
            <span>always</span>
          </div>
          <p className="plan-description">A little clarity, every day.</p>
          <ul>
            {freeFeatures.map((item) => (
              <li key={item}>
                <Check width={16} height={16} />
                {item}
              </li>
            ))}
          </ul>
          <a
            href={APP_STORE_URL}
            target="_blank"
            rel="noopener noreferrer"
            className="plan-secondary"
          >
            Get started free <ArrowUpRight width={16} height={16} />
          </a>
          <p className="plan-note">No subscription needed.</p>
        </article>
        <article className="plan plan-pro">
          <div className="plan-top">
            <h3>
              NurseMind <em>Pro</em>
            </h3>
            <span className="eyebrow">Keep exploring</span>
          </div>
          <div className="plan-price" aria-live="polite" aria-atomic="true">
            <span className="num">{annual ? "$99.99" : "$14.99"}</span>
            <span>/ {annual ? "year" : "month"}</span>
          </div>
          <p className="plan-description">
            {annual
              ? "About $8.33 per month, billed annually."
              : "More room for your everyday questions."}
          </p>
          <ul>
            {proFeatures.map((item) => (
              <li key={item}>
                <Check width={16} height={16} />
                {item}
              </li>
            ))}
          </ul>
          <AppStoreLink>
            {annual ? "Try Pro free for 3 days" : "Get NurseMind Pro"}
          </AppStoreLink>
          <p className="plan-note">
            {annual ? "Then $99.99/year. " : "$14.99/month. "}Auto-renews.
            Cancel through Apple.
          </p>
        </article>
      </div>
    </section>
  );
}
