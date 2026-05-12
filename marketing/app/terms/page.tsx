// DRAFT for attorney review — do not treat as final legal text.
// This file reflects NurseMind's actual architecture and the four locked
// regulatory constraints (FDA CDS safe-harbor posture, Apple 1.4.2 scope,
// FTC marketing-must-match-disclaimer, COPPA). It needs review by counsel
// familiar with consumer health-adjacent products before public launch.
// Governing law is set to Delaware as a placeholder — change if NurseMind
// is incorporated elsewhere or if your attorney prefers another forum.

import type { Metadata } from "next";
import Link from "next/link";
import { Nav } from "../components/Nav";
import { Footer } from "../components/Footer";

export const metadata: Metadata = {
  title: "Terms of Service",
  description:
    "Terms governing your use of NurseMind. Reference and self-directed learning only — not a clinical decision tool, not for use during patient care.",
};

const EFFECTIVE_DATE = "May 9, 2026";
const LAST_UPDATED = "May 9, 2026";

export default function TermsPage() {
  return (
    <>
      <Nav />
      <main>
        <Header />
        <Body />
      </main>
      <Footer />
    </>
  );
}

function Header() {
  return (
    <section className="container-wide pt-20 md:pt-32 pb-10 md:pb-12">
      <div className="max-w-[40rem]">
        <div className="eyebrow">Legal</div>
        <h1 className="mt-6 text-[44px] sm:text-[60px] md:text-[76px] leading-[0.98] tracking-[-0.025em]">
          Terms of <span className="accent-italic">Service</span>.
        </h1>
        <div className="mt-8 flex flex-wrap items-center gap-x-6 gap-y-2 text-[12px] text-[color:var(--color-ink-faint)]">
          <span className="num uppercase tracking-[0.16em]">
            Effective {EFFECTIVE_DATE}
          </span>
          <span className="hidden sm:inline">·</span>
          <span className="num uppercase tracking-[0.16em]">
            Last updated {LAST_UPDATED}
          </span>
        </div>
      </div>
    </section>
  );
}

function Body() {
  return (
    <section className="container-wide pb-24 md:pb-32">
      <div className="max-w-[40rem]">
        <Intro />
        <CriticalNotice />

        <Section number="1" title="Acceptance of these terms">
          <P>
            By downloading, installing, accessing, or using the NurseMind
            iOS app or the website at <Mono>nursemind.app</Mono> (together,
            the "Service"), you agree to these Terms of Service ("Terms")
            and to our{" "}
            <A href="/privacy">Privacy Policy</A>. If you don't agree, don't
            use the Service.
          </P>
          <P>
            These Terms form a binding agreement between you and NurseMind,
            Inc. ("NurseMind," "we," "us," "our").
          </P>
        </Section>

        <Section number="2" title="What the Service is">
          <P>
            NurseMind is a clinical reference and self-directed learning
            tool for nursing students, licensed registered nurses, licensed
            practical nurses, and nursing assistants. It includes:
          </P>
          <ul className="mt-4 space-y-2 text-[15.5px] md:text-[16px] leading-[1.7] text-[color:var(--color-ink-muted)] list-none">
            <Li>
              A curated library of drug, drip, lab, procedure, diagnosis,
              scenario, and reference content sourced from public-domain
              and openly-licensed primary sources, with citations on every
              clinical claim;
            </Li>
            <Li>
              A suite of nursing calculators that return both a result and
              the underlying formula;
            </Li>
            <Li>
              An AI co-pilot ("Ask NurseMind") that responds to nursing
              reference questions using retrieval-grounded answers with
              source citations;
            </Li>
            <Li>
              Account features for signed-in users (cross-device sync,
              saved answers, conversation history, bookmarks).
            </Li>
          </ul>
        </Section>

        <Section number="3" title="Not for clinical use">
          <P>
            <Em>
              NurseMind is not clinical decision support, not a medical
              device, not FDA-cleared, and not for use during patient care.
            </Em>{" "}
            It does not diagnose. It does not prescribe. It does not direct
            treatment for a specific patient. It is not a substitute for
            facility protocols, physician orders, your clinical educators,
            or your own licensed clinical judgment.
          </P>
          <P>
            The Service is designed for use{" "}
            <Em>off the clock</Em> — for studying, NCLEX preparation,
            answering your own questions for personal clarity, and
            self-directed learning between shifts.
          </P>
          <P>
            By using the Service, you acknowledge that any clinical action
            you take in your professional capacity is your own judgment and
            responsibility, governed by your facility's protocols and your
            licensure. You agree not to rely on the Service as the sole
            basis for any decision involving an actual patient.
          </P>
        </Section>

        <Section number="4" title="The AI co-pilot">
          <P>
            The AI co-pilot generates responses by retrieving relevant
            entries from the curated library and asking a third-party
            language model (Anthropic Claude) to summarize or explain them
            in context. Every numerical clinical claim in a response is
            tied to a specific source citation, and the model is
            constrained by a system prompt and refusal templates to:
          </P>
          <ul className="mt-4 space-y-2 text-[15.5px] md:text-[16px] leading-[1.7] text-[color:var(--color-ink-muted)] list-none">
            <Li>
              Refuse to give a diagnosis or directive treatment plan for a
              specific patient;
            </Li>
            <Li>
              Refuse to answer questions that include patient-identifying
              information;
            </Li>
            <Li>
              Stay within nursing-reference scope (drugs, drips, labs,
              scenarios, pathophysiology, communication, NCLEX content);
            </Li>
            <Li>
              Cite or refuse: numerical claims must include a citation, or
              the response is rejected and regenerated.
            </Li>
          </ul>
          <P className="mt-6">
            <Em>
              AI responses can still be wrong.
            </Em>{" "}
            Models hallucinate, retrieval misses relevant evidence, and
            even cited sources can be misread. Always verify against the
            cited primary source before applying anything from a response
            in any context where accuracy matters.
          </P>
          <P>
            Daily AI quotas (free: 3 questions/day, Pro: 50 questions/day)
            are enforced to keep operating costs sustainable and prevent
            abuse. Quotas reset at local midnight.
          </P>
        </Section>

        <Section number="5" title="Eligibility">
          <P>
            You must be at least 13 years old to use the Service. If you
            are under 18, you must have permission from a parent or legal
            guardian. The Service is intended for users in the United
            States; we do not offer it for sale or use in other
            jurisdictions at this time.
          </P>
          <P>
            We do not require nursing licensure or NPI verification to
            create an account. The Service is openly accessible to nursing
            students, licensed nurses, nursing assistants, and other
            healthcare workers; you represent that you are using it for
            study or personal clinical learning, not for direct patient
            care decisions.
          </P>
        </Section>

        <Section number="6" title="Your account">
          <P>
            On first launch, the Service creates an anonymous account. You
            may optionally upgrade this account by signing in with Apple,
            which links it to a stable identifier supplied by Apple. You
            are responsible for any activity under your account. If you
            believe your account has been compromised, email{" "}
            <A href="mailto:hello@nursemind.app">hello@nursemind.app</A>{" "}
            immediately.
          </P>
          <P>
            You may delete your account at any time from Profile → Manage
            subscription → Delete account. Deletion permanently removes
            your saved bookmarks, conversation history, and profile from
            our backend within 30 days.
          </P>
        </Section>

        <Section number="7" title="Subscriptions and billing">
          <P>
            Some features ("Pro") require an auto-renewing subscription:
          </P>
          <ul className="mt-4 space-y-2 text-[15.5px] md:text-[16px] leading-[1.7] text-[color:var(--color-ink-muted)] list-none">
            <Li>
              <strong>Pro Monthly</strong> —{" "}
              <Mono>$14.99</Mono> per month, no free trial.
            </Li>
            <Li>
              <strong>Pro Yearly</strong> —{" "}
              <Mono>$99.99</Mono> per year with a 3-day free trial. Equivalent
              to <Mono>$8.33</Mono> per month, billed yearly.
            </Li>
          </ul>
          <P className="mt-6">
            All subscriptions are sold and billed by Apple through the App
            Store. Payment is charged to your Apple ID at confirmation of
            purchase. Subscriptions auto-renew at the same price unless
            cancelled at least 24 hours before the end of the current
            period. You can manage or cancel your subscription in iOS
            Settings → your name → Subscriptions → NurseMind.
          </P>
          <P>
            <strong>Refunds.</strong> We do not process refunds directly.
            All refund requests are handled by Apple under their{" "}
            <A href="https://www.apple.com/legal/internet-services/itunes/dev/stdeula/">
              Standard EULA
            </A>{" "}
            and refund policy. To request a refund, visit{" "}
            <A href="https://reportaproblem.apple.com">reportaproblem.apple.com</A>.
          </P>
          <P>
            <strong>Free trial.</strong> If you start the Pro Yearly free
            trial, you will not be charged during the 3-day trial period.
            At the end of the trial, your Apple ID will be charged the
            yearly price unless you cancel at least 24 hours before the
            trial ends. The trial is offered once per Apple ID; if your
            Apple ID has previously taken a trial of NurseMind Pro, the
            trial period will not apply on a subsequent purchase.
          </P>
          <P>
            <strong>Price changes.</strong> Apple will notify you of any
            price increase before it takes effect, in line with App Store
            policy. You can cancel at any time before the change applies.
          </P>
        </Section>

        <Section number="8" title="Acceptable use">
          <P>You agree that you will not:</P>
          <ul className="mt-4 space-y-2 text-[15.5px] md:text-[16px] leading-[1.7] text-[color:var(--color-ink-muted)] list-none">
            <Li>
              Enter or upload Protected Health Information (PHI) — including
              patient names, dates of birth, MRNs, room numbers, addresses,
              or any combination that could identify a specific patient.
              The Service is architecturally not designed to receive PHI,
              and entering it would put both you and your facility at risk.
            </Li>
            <Li>
              Use the Service to make a diagnosis or treatment decision for
              an actual patient.
            </Li>
            <Li>
              Reverse engineer, decompile, or attempt to extract the source
              code, AI prompts, retrieval logic, or system prompts of the
              Service, except as expressly allowed by law.
            </Li>
            <Li>
              Scrape, batch-extract, or republish the library content
              outside of personal in-app use. The library is licensed for
              personal study and reference, not for redistribution.
            </Li>
            <Li>
              Resell, sublicense, or otherwise commercially exploit the
              Service or any content in it.
            </Li>
            <Li>
              Bypass or attempt to bypass the daily AI quotas, the AI
              refusal patterns, or the PHI scrubber.
            </Li>
            <Li>
              Use the Service to harass, threaten, defame, or harm any
              person, or in violation of any applicable law.
            </Li>
          </ul>
        </Section>

        <Section number="9" title="Intellectual property">
          <P>
            The Service — including the design, the curated library
            structure, the calculators, the AI prompts and refusal
            patterns, and the NurseMind name and logo — is owned by
            NurseMind, Inc. We grant you a personal, non-exclusive,
            non-transferable, revocable license to use the Service for your
            own study, learning, and reference, subject to these Terms.
          </P>
          <P>
            <strong>Underlying clinical content.</strong> NurseMind does not
            originate clinical claims. The library is curated from
            public-domain and openly-licensed primary sources, including
            the U.S. Food and Drug Administration's Structured Product
            Labels (openFDA / DailyMed), Open RN textbooks (CC BY 4.0),
            OpenStax Nursing (CC BY 4.0), the U.S. Department of Veterans
            Affairs PBM monographs, the Centers for Disease Control and
            Prevention, and other accredited sources. Each entry cites its
            sources and complies with the applicable license's attribution
            requirements.
          </P>
          <P>
            <strong>Trademarks.</strong> "NCLEX®" and "NCLEX-RN®" are
            registered trademarks of the National Council of State Boards
            of Nursing, Inc. (NCSBN). NurseMind is not affiliated with,
            endorsed by, or sponsored by NCSBN. References to NCLEX content
            in the Service are made under nominative fair use and reflect
            publicly available test-plan structure.
          </P>
        </Section>

        <Section number="10" title="Your content">
          <P>
            You retain all rights in any content you create within the
            Service — your saved bookmarks, your AI conversation history,
            your collections, your profile preferences. We use this content
            only to operate the Service for you (sync across devices,
            display in your Profile, enforce quotas) as described in our{" "}
            <A href="/privacy">Privacy Policy</A>.
          </P>
          <P>
            <strong>Feedback.</strong> If you send us feedback,
            suggestions, or bug reports, you grant us a perpetual,
            irrevocable, royalty-free license to use that feedback to
            improve the Service. We won't attribute it to you publicly
            without your permission.
          </P>
        </Section>

        <Section number="11" title="Termination">
          <P>
            You may stop using the Service and delete your account at any
            time. We may suspend or terminate your access if we reasonably
            believe you have violated these Terms (in particular, the PHI
            prohibition or the no-clinical-use prohibition), or if doing so
            is necessary to comply with law or protect users.
          </P>
          <P>
            On termination: your subscription ends at the close of the
            current billing period (Apple-handled), your data is deleted
            within 30 days, and the sections of these Terms that by their
            nature should survive will survive (intellectual property,
            disclaimers, limitation of liability, governing law, the
            no-clinical-use acknowledgement).
          </P>
        </Section>

        <Section number="12" title="Disclaimers">
          <P>
            The Service is provided <Em>as is</Em> and <Em>as available</Em>,
            without warranties of any kind, whether express, implied, or
            statutory. To the maximum extent permitted by law, we disclaim
            all warranties, including warranties of merchantability,
            fitness for a particular purpose, non-infringement, accuracy
            of content, uninterrupted access, and freedom from errors.
          </P>
          <P>
            We do not warrant that any AI response is accurate, current, or
            applicable to any specific clinical situation. The cited
            sources may themselves contain errors or be superseded by
            newer evidence; verify against the most current primary source
            before relying on anything in any context where accuracy
            matters.
          </P>
        </Section>

        <Section number="13" title="Limitation of liability">
          <P>
            To the maximum extent permitted by law, in no event will
            NurseMind, its officers, employees, agents, or affiliates be
            liable for any indirect, incidental, special, consequential,
            or punitive damages, or any loss of profits, revenue, data, or
            goodwill, arising out of or related to your use of (or
            inability to use) the Service — even if we have been advised
            of the possibility of such damages.
          </P>
          <P>
            Our total cumulative liability for any claim arising out of or
            related to the Service is limited to the greater of
            <Mono> $100</Mono> or the amount you paid us for the Service in
            the 12 months immediately preceding the event giving rise to
            the claim.
          </P>
          <P>
            Some jurisdictions do not allow the exclusion of certain
            warranties or the limitation of liability for incidental or
            consequential damages, so some of the above limitations may
            not apply to you.
          </P>
        </Section>

        <Section number="14" title="Indemnification">
          <P>
            You agree to defend, indemnify, and hold harmless NurseMind and
            its officers, employees, and agents from any claims, damages,
            losses, liabilities, costs, and expenses (including reasonable
            attorneys' fees) arising out of or related to (a) your use of
            the Service, (b) your violation of these Terms, (c) your
            entry of PHI or other prohibited content, or (d) any clinical
            decision you make in reliance on the Service.
          </P>
        </Section>

        <Section number="15" title="Governing law and disputes">
          <P>
            These Terms are governed by the laws of the State of Delaware,
            without regard to conflict-of-laws principles. Any dispute
            arising out of or related to these Terms or the Service will
            be brought exclusively in the state or federal courts located
            in Delaware, and you and we consent to personal jurisdiction
            there.
          </P>
          <P>
            <strong>Individual claims only.</strong> You agree that any
            claim will be brought solely in your individual capacity and
            not as a plaintiff or class member in any class, collective, or
            representative action.
          </P>
        </Section>

        <Section number="16" title="Apple's role">
          <P>
            The iOS app is licensed to you, not sold. The license is
            granted by NurseMind, not by Apple. Apple has no obligation to
            provide maintenance or support for the app and is not
            responsible for any product warranty claims, product liability
            claims, or third-party intellectual property claims related to
            the app — those are NurseMind's responsibility, subject to the
            limitations in these Terms. Apple and Apple's subsidiaries are
            third-party beneficiaries of these Terms with respect to the
            iOS app, and upon your acceptance of these Terms, will have
            the right (and will be deemed to have accepted the right) to
            enforce them against you.
          </P>
        </Section>

        <Section number="17" title="Changes to these terms">
          <P>
            We may update these Terms from time to time. When we make
            material changes, we will update the "Effective" date at the
            top of this page and, for significant changes, surface an
            in-app notice. Continued use of the Service after a change
            constitutes acceptance of the updated Terms.
          </P>
        </Section>

        <Section number="18" title="Contact">
          <P>
            Questions, support, or formal notices? Email{" "}
            <A href="mailto:hello@nursemind.app">hello@nursemind.app</A>. We
            answer within five business days.
          </P>
          <P className="mt-8 text-[12.5px] citation">
            NurseMind, Inc. · United States · Last updated{" "}
            <span className="num">{LAST_UPDATED}</span>.
          </P>
        </Section>

        <BackToHome />
      </div>
    </section>
  );
}

function Intro() {
  return (
    <div className="border-t border-[color:var(--color-hairline)] pt-10 mb-12 md:mb-16">
      <p className="text-[16px] md:text-[17px] leading-[1.7] text-[color:var(--color-ink-muted)]">
        These Terms govern your use of the NurseMind iOS app and the
        website at <Mono>nursemind.app</Mono>.{" "}
        <span className="text-[color:var(--color-ink)] italic font-[family-name:var(--font-serif)]">
          Read Section 3 carefully — it sets the boundary that makes the
          rest of the product safe to use.
        </span>
      </p>
    </div>
  );
}

function CriticalNotice() {
  return (
    <div className="mt-12 md:mt-16 border-y-2 border-[color:var(--color-hairline-strong)] py-8 md:py-10">
      <div className="num text-[11px] uppercase tracking-[0.18em] text-[color:var(--color-ink-faint)]">
        Important
      </div>
      <p className="mt-4 text-[17px] md:text-[19px] leading-[1.55] tracking-[-0.005em] font-[family-name:var(--font-serif)] italic">
        NurseMind is a study and self-directed learning tool. It is not
        clinical decision support, not a medical device, and not for use
        during patient care. It does not diagnose, prescribe, or direct
        treatment. Always defer to facility protocols, physician orders,
        and your own licensed clinical judgment.
      </p>
    </div>
  );
}

function Section({
  number,
  title,
  children,
}: {
  number: string;
  title: string;
  children: React.ReactNode;
}) {
  return (
    <section className="border-t border-[color:var(--color-hairline)] pt-10 md:pt-12 mt-12 md:mt-16">
      <div className="flex items-baseline gap-4">
        <span className="num text-[12px] uppercase tracking-[0.16em] text-[color:var(--color-ink-faint)]">
          {number}
        </span>
        <h2 className="text-[26px] md:text-[34px] leading-[1.1] tracking-[-0.02em]">
          {title}
        </h2>
      </div>
      <div className="mt-6 space-y-4">{children}</div>
    </section>
  );
}

function P({
  children,
  className = "",
}: {
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <p
      className={`text-[15.5px] md:text-[16px] leading-[1.7] text-[color:var(--color-ink-muted)] ${className}`}
    >
      {children}
    </p>
  );
}

function Em({ children }: { children: React.ReactNode }) {
  return (
    <span className="text-[color:var(--color-ink)] italic font-[family-name:var(--font-serif)]">
      {children}
    </span>
  );
}

function Mono({ children }: { children: React.ReactNode }) {
  return (
    <span className="num text-[14px] text-[color:var(--color-ink)]">
      {children}
    </span>
  );
}

function A({
  href,
  children,
}: {
  href: string;
  children: React.ReactNode;
}) {
  return (
    <a
      href={href}
      className="text-[color:var(--color-ink)] border-b border-[color:var(--color-hairline-strong)] pb-[1px] hover:border-[color:var(--color-ink)] transition-colors"
    >
      {children}
    </a>
  );
}

function Li({ children }: { children: React.ReactNode }) {
  return (
    <li className="pl-5 relative">
      <span className="absolute left-0 top-[10px] w-[8px] h-[1px] bg-[color:var(--color-hairline-strong)]" />
      {children}
    </li>
  );
}

function BackToHome() {
  return (
    <div className="border-t border-[color:var(--color-hairline)] pt-10 mt-16">
      <Link
        href="/"
        className="inline-flex items-center gap-2 text-[14px] text-[color:var(--color-ink)] border-b border-[color:var(--color-hairline-strong)] pb-[2px] hover:border-[color:var(--color-ink)] transition-colors"
      >
        ← Back to NurseMind
      </Link>
    </div>
  );
}
