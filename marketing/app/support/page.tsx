import type { Metadata } from "next";
import Link from "next/link";
import { Nav } from "../components/Nav";
import { Footer } from "../components/Footer";

export const metadata: Metadata = {
  title: "Support",
  description:
    "Get help with NurseMind. Email hello@nursemind.app — we answer within five business days.",
};

const SUPPORT_EMAIL = "hello@nursemind.app";

export default function SupportPage() {
  return (
    <>
      <Nav />
      <main>
        <section className="container-wide pt-20 md:pt-32 pb-24 md:pb-32">
          <div className="max-w-[40rem]">
            <div className="eyebrow">Support</div>
            <h1 className="mt-6 text-[44px] sm:text-[60px] md:text-[76px] leading-[0.98] tracking-[-0.025em]">
              How <span className="accent-italic">can we</span> help?
            </h1>
            <p className="mt-8 max-w-[36rem] text-[16.5px] md:text-[18px] leading-[1.55] text-[color:var(--color-ink-muted)]">
              The fastest way to reach us is email. One person reads every
              message; we answer within five business days, and within
              twenty-four hours for safety-critical issues like content
              errors involving high-alert drugs, pediatric dosing, or
              emergency protocols.
            </p>

            <div className="mt-10 border-t border-[color:var(--color-hairline)] pt-10">
              <Block
                eyebrow="Email"
                title={SUPPORT_EMAIL}
                href={`mailto:${SUPPORT_EMAIL}`}
                detail="General questions, account help, billing escalations, content corrections."
              />
              <Block
                eyebrow="Subscriptions"
                title="iOS Settings → your name → Subscriptions"
                detail="Manage, pause, or cancel your NurseMind Pro subscription. Refunds are handled by Apple via reportaproblem.apple.com."
              />
              <Block
                eyebrow="Content errors"
                title="Tap the feedback control on any entry or AI response"
                detail="In-app reports route into the same review pipeline used for pre-publication review of high-risk content."
                linkLabel="Read our editorial standards"
                linkHref="/editorial-standards"
              />
              <Block
                eyebrow="Privacy"
                title="See how data is handled"
                linkLabel="Privacy policy"
                linkHref="/privacy"
                detail="We collect the minimum necessary, store nothing we don't need, and never sell your data."
              />
              <Block
                eyebrow="Safety"
                title="Important reminder"
                detail="NurseMind is a study and self-directed learning tool. It is not clinical decision support, not a medical device, and not for use during patient care. Always defer to facility protocols, physician orders, and your own licensed clinical judgment."
                isSafetyCallout
              />
            </div>

            <div className="border-t border-[color:var(--color-hairline)] pt-10 mt-16">
              <Link
                href="/"
                className="inline-flex items-center gap-2 text-[14px] text-[color:var(--color-ink)] border-b border-[color:var(--color-hairline-strong)] pb-[2px] hover:border-[color:var(--color-ink)] transition-colors"
              >
                ← Back to NurseMind
              </Link>
            </div>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}

function Block({
  eyebrow,
  title,
  href,
  detail,
  linkLabel,
  linkHref,
  isSafetyCallout = false,
}: {
  eyebrow: string;
  title: string;
  href?: string;
  detail: string;
  linkLabel?: string;
  linkHref?: string;
  isSafetyCallout?: boolean;
}) {
  return (
    <div className="border-b border-[color:var(--color-hairline)] py-7 md:py-8">
      <div className="num text-[11px] uppercase tracking-[0.16em] text-[color:var(--color-ink-faint)]">
        {eyebrow}
      </div>
      {href ? (
        <a
          href={href}
          className="mt-3 inline-block text-[20px] md:text-[24px] tracking-[-0.01em] font-[family-name:var(--font-serif)] text-[color:var(--color-ink)] border-b border-[color:var(--color-hairline-strong)] pb-[2px] hover:border-[color:var(--color-ink)] transition-colors"
        >
          {title}
        </a>
      ) : (
        <div className="mt-3 text-[20px] md:text-[24px] tracking-[-0.01em] font-[family-name:var(--font-serif)] text-[color:var(--color-ink)]">
          {title}
        </div>
      )}
      <p
        className={`mt-3 text-[15px] md:text-[15.5px] leading-[1.65] ${
          isSafetyCallout
            ? "text-[color:var(--color-ink)] italic font-[family-name:var(--font-serif)]"
            : "text-[color:var(--color-ink-muted)]"
        }`}
      >
        {detail}
      </p>
      {linkLabel && linkHref && (
        <div className="mt-3">
          <Link
            href={linkHref}
            className="text-[14px] text-[color:var(--color-ink)] border-b border-[color:var(--color-hairline-strong)] pb-[1px] hover:border-[color:var(--color-ink)] transition-colors"
          >
            {linkLabel}
          </Link>
        </div>
      )}
    </div>
  );
}
