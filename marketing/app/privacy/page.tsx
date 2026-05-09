// DRAFT for attorney review — do not treat as final legal text.
// This file is a thoughtful starting point reflecting NurseMind's actual
// architecture (anonymous-by-default Supabase auth, Apple-managed
// subscriptions via RevenueCat, scoped AI calls to Anthropic with PHI
// scrubbing, Sentry/PostHog telemetry, US-only at v1 launch). It needs
// review by counsel familiar with consumer health-adjacent products
// before public launch.

import type { Metadata } from "next";
import Link from "next/link";
import { Nav } from "../components/Nav";
import { Footer } from "../components/Footer";

export const metadata: Metadata = {
  title: "Privacy Policy",
  description:
    "How NurseMind collects, uses, and protects your information. Architecturally PHI-free, US-only at launch, no data sold or rented.",
};

const EFFECTIVE_DATE = "May 9, 2026";
const LAST_UPDATED = "May 9, 2026";

export default function PrivacyPage() {
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
          Privacy <span className="accent-italic">Policy</span>.
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
        <Section number="1" title="Scope">
          <P>
            This Privacy Policy explains how NurseMind, Inc. ("we," "us,"
            "NurseMind") collects, uses, and protects information when you
            use the NurseMind iOS app (Bundle ID{" "}
            <Mono>app.nursemind.ios</Mono>) and the website at{" "}
            <Mono>nursemind.app</Mono> (together, the "Service").
          </P>
          <P>
            NurseMind is a clinical reference and self-directed learning tool
            for nursing students and licensed nurses.{" "}
            <Em>
              It is not a clinical decision support system, not a medical
              device, and not designed to receive or process Protected Health
              Information.
            </Em>
          </P>
        </Section>

        <Section number="2" title="What we collect">
          <H3>Account and identity</H3>
          <P>
            By default, NurseMind creates an{" "}
            <Em>anonymous</Em> account on first launch — a randomly generated
            UUID with no name, email, or other identifier attached. You may
            optionally upgrade this anonymous account by signing in with
            Apple, which links the account to the Apple-supplied identifier
            and (if you choose to share it) your email address. We never see
            or store your Apple ID password.
          </P>
          <H3>Profile preferences</H3>
          <P>
            Optional, user-entered: display name, nursing role (RN, LPN, CNA,
            student), unit specialty, and years of experience. Used only to
            personalize content and the AI co-pilot's specialty awareness.
            Stored in your account on our backend so it syncs across signed-in
            devices.
          </P>
          <H3>Usage and content</H3>
          <P>
            Library bookmarks, calculator preferences, saved AI answers, and
            conversation history. Stored locally on your device and, when
            you're signed in, synced to your account.
          </P>
          <H3>AI co-pilot inputs and responses</H3>
          <P>
            Questions you submit to the AI co-pilot, the cited evidence
            chunks retrieved to ground the answer, and the AI's response.
            Used to deliver the answer, enforce daily quotas, and
            (anonymized, aggregated) improve the system prompt and retrieval.{" "}
            <Em>
              Inputs pass through a server-side scrubbing step that detects
              and removes apparent patient-identifying data (names, MRNs,
              dates, room numbers) before reaching any third-party model.
            </Em>
          </P>
          <H3>Subscription and billing</H3>
          <P>
            Subscription status (free, monthly, yearly) and the entitlement
            timestamp. Billing itself is handled by Apple through StoreKit;
            we do not see your payment card or Apple ID. We use RevenueCat
            to manage entitlement state — RevenueCat receives a hashed
            account identifier, the product purchased, and standard purchase
            metadata from Apple.
          </P>
          <H3>Device and diagnostic</H3>
          <P>
            Device model, iOS version, app version, locale, and crash reports
            (via Sentry). Used to triage bugs and prioritize fixes. We do not
            collect precise location, the contents of your photo library,
            your contacts, or any other on-device data.
          </P>
          <H3>Product analytics</H3>
          <P>
            Anonymous, aggregated usage events (e.g., "user opened Library
            tab," "user submitted an AI question") via PostHog. We use the
            minimum analytics necessary to understand which features matter.
            We do not link analytics to your identity beyond an anonymous
            installation ID, and we never sell analytics data.
          </P>
        </Section>

        <Section number="3" title="What we don't collect">
          <P>
            <Em>NurseMind is architecturally prevented from collecting
            Protected Health Information.</Em> The product has no patient
            name, date of birth, MRN, room number, or chart fields anywhere
            in its UI. We ask that you never enter patient-identifying
            information in any input — including AI questions and saved
            content. If our server-side scrubber detects apparent PHI in a
            submitted question, we reject the request and surface a refusal
            instead of forwarding the input to any model.
          </P>
          <P>
            We do not collect or process: precise location, contacts,
            calendars, photos, microphone audio (other than transient,
            on-device speech recognition you initiate by tapping the
            microphone — that audio never leaves your device), health data
            from HealthKit, or biometric identifiers.
          </P>
        </Section>

        <Section number="4" title="How we use information">
          <P>To provide the Service: render the library, answer your AI
            questions with grounded citations, sync your bookmarks and saved
            content across signed-in devices, enforce daily AI quotas, manage
            your subscription state.</P>
          <P>To improve the Service: triage crashes, identify failing
            calculators, evaluate which library entries get the most use,
            tune the AI co-pilot's retrieval and refusal behaviors. All
            improvement work uses anonymized, aggregated data.</P>
          <P>To communicate with you: respond to support emails and (only
            if you opt in via your iOS notification permission) send a small
            number of useful product notifications.</P>
          <P>
            <Em>
              We do not use your information for advertising, sell it,
              license it to data brokers, or share it for cross-context
              behavioral advertising.
            </Em>
          </P>
        </Section>

        <Section number="5" title="Subprocessors">
          <P>We share information only with the third-party services listed
            below, each used for a specific purpose disclosed here:</P>
          <ul className="mt-4 space-y-3">
            <Subprocessor
              name="Apple"
              purpose="App distribution, Sign in with Apple, StoreKit billing"
              region="United States"
            />
            <Subprocessor
              name="Supabase, Inc."
              purpose="Authentication and Postgres database (account record, profile preferences, saved content)"
              region="United States"
            />
            <Subprocessor
              name="RevenueCat, Inc."
              purpose="Subscription entitlement management"
              region="United States"
            />
            <Subprocessor
              name="Anthropic PBC"
              purpose="AI co-pilot generation (Claude Sonnet); receives scrubbed AI inputs and returns responses"
              region="United States"
            />
            <Subprocessor
              name="OpenAI, L.L.C."
              purpose="Text embeddings used to retrieve relevant library evidence for AI grounding"
              region="United States"
            />
            <Subprocessor
              name="Sentry"
              purpose="Crash reporting and error monitoring"
              region="United States"
            />
            <Subprocessor
              name="PostHog, Inc."
              purpose="Anonymous, aggregated product analytics"
              region="United States"
            />
            <Subprocessor
              name="Vercel, Inc."
              purpose="Web hosting for nursemind.app"
              region="United States"
            />
          </ul>
          <P className="mt-6">
            We have signed data processing terms with each of these vendors
            requiring them to use your information only on our instructions
            and to maintain reasonable security practices. None of these
            vendors are HIPAA Business Associates because the Service does
            not handle PHI.
          </P>
        </Section>

        <Section number="6" title="Where information is stored">
          <P>
            Your account data, profile preferences, saved bookmarks, and
            saved AI answers are stored in our Supabase Postgres database
            hosted in the United States. AI conversation logs (used briefly
            for quota enforcement and abuse prevention) are stored in the
            same region. Crash and analytics data is stored by Sentry and
            PostHog, both in the United States.
          </P>
          <P>
            The Service is intended for users in the United States at v1
            launch. If you access the Service from outside the United
            States, you understand that your information will be transferred
            to and processed in the United States.
          </P>
        </Section>

        <Section number="7" title="How long we keep it">
          <P>
            Account, profile, and saved content: retained while your account
            is active. If you delete your account from the Profile tab, we
            permanently delete the associated records within 30 days,
            excepting backups, which roll over within 90 days.
          </P>
          <P>
            AI conversation logs: retained for up to 90 days for quota
            enforcement and abuse review, then deleted.
          </P>
          <P>
            Crash and analytics data: retained for up to 12 months in
            anonymized aggregate form.
          </P>
        </Section>

        <Section number="8" title="Your choices and controls">
          <P>
            <strong>Delete your account.</strong> In the iOS app, go to
            Profile → Manage subscription → Delete account. This removes all
            account data from our backend within 30 days.
          </P>
          <P>
            <strong>Cancel your subscription.</strong> Subscriptions are
            managed by Apple. Open Settings → your name → Subscriptions →
            NurseMind to cancel. Cancellation takes effect at the end of the
            current billing period. Refunds are handled by Apple.
          </P>
          <P>
            <strong>Opt out of analytics.</strong> Toggle off product
            analytics in Profile → Notifications and privacy. (Coming in a
            future release; for now, write to{" "}
            <A href="mailto:hello@nursemind.app">hello@nursemind.app</A> and
            we'll honor your opt-out request.)
          </P>
          <P>
            <strong>Disable notifications.</strong> Profile → Notifications,
            or in the iOS Settings app under NurseMind.
          </P>
          <P>
            <strong>Export your data.</strong> Email{" "}
            <A href="mailto:hello@nursemind.app">hello@nursemind.app</A> and
            we'll send a JSON copy of your saved bookmarks, profile, and
            saved AI answers within 30 days.
          </P>
        </Section>

        <Section number="9" title="California privacy rights">
          <P>
            If you reside in California, the California Consumer Privacy Act
            (as amended by the CPRA) gives you the right to (1) know what
            personal information we have about you, (2) delete your personal
            information, (3) correct inaccurate personal information, and
            (4) opt out of "sale" or "sharing" of your personal information.
          </P>
          <P>
            <Em>
              We do not sell or share your personal information for
              cross-context behavioral advertising as those terms are
              defined under California law.
            </Em>{" "}
            To exercise any of the other rights, email{" "}
            <A href="mailto:hello@nursemind.app">hello@nursemind.app</A> from
            the email address associated with your account. We will respond
            within 45 days.
          </P>
        </Section>

        <Section number="10" title="Children's privacy">
          <P>
            The Service is not directed to children under 13. We do not
            knowingly collect personal information from children under 13.
            If we learn that we have collected such information, we will
            delete it promptly. If you believe a child under 13 has provided
            us with personal information, contact{" "}
            <A href="mailto:hello@nursemind.app">hello@nursemind.app</A>.
          </P>
          <P>
            The App Store age rating for NurseMind reflects content
            appropriate for users 12 and up; however, the Service is
            functionally designed for nursing students (typically 18+) and
            licensed nurses.
          </P>
        </Section>

        <Section number="11" title="Security">
          <P>
            All connections between the iOS app and our backend use TLS
            1.2+. Authentication tokens are stored in the iOS Keychain.
            Database access is gated by row-level security policies that
            scope every read and write to the authenticated user's UUID. We
            review access and infrastructure regularly and maintain a
            written security policy.
          </P>
          <P>
            <Em>
              No system is perfectly secure.
            </Em>{" "}
            If you believe your account has been compromised, email{" "}
            <A href="mailto:hello@nursemind.app">hello@nursemind.app</A>{" "}
            immediately.
          </P>
        </Section>

        <Section number="12" title="Changes to this policy">
          <P>
            We may update this Privacy Policy from time to time. When we
            make material changes, we will update the "Effective" date at
            the top of this page and, for significant changes, surface an
            in-app notice. Continued use of the Service after a change
            constitutes acceptance of the updated policy.
          </P>
        </Section>

        <Section number="13" title="Contact">
          <P>
            Questions about this policy? Email{" "}
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
        NurseMind is a study and self-directed learning tool for nursing
        students and licensed nurses.{" "}
        <span className="text-[color:var(--color-ink)] italic font-[family-name:var(--font-serif)]">
          We collect the minimum necessary to deliver the Service, store
          nothing we don't need, and never sell your data.
        </span>{" "}
        The product is architecturally prevented from receiving Protected
        Health Information. This page explains the rest in plain language.
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

function H3({ children }: { children: React.ReactNode }) {
  return (
    <h3 className="mt-8 text-[16px] md:text-[17px] font-medium tracking-[-0.005em] text-[color:var(--color-ink)]">
      {children}
    </h3>
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

function Subprocessor({
  name,
  purpose,
  region,
}: {
  name: string;
  purpose: string;
  region: string;
}) {
  return (
    <li className="border-b border-[color:var(--color-hairline)] pb-3">
      <div className="flex items-baseline justify-between gap-4">
        <span className="text-[15px] md:text-[15.5px] text-[color:var(--color-ink)]">
          {name}
        </span>
        <span className="num text-[11px] uppercase tracking-[0.14em] text-[color:var(--color-ink-faint)] shrink-0">
          {region}
        </span>
      </div>
      <div className="mt-1 text-[14px] text-[color:var(--color-ink-muted)] italic font-[family-name:var(--font-serif)]">
        {purpose}
      </div>
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
