// Editorial Standards — public-facing transparency about how NurseMind
// is built. Replaces the "named clinical advisor" credibility surface
// with the curator model: license-correct foundation sources, citations
// on every clinical claim, tiered RN review on high-risk content,
// FDA-CDS-safe-harbor posture by design.
//
// This page is referenced from docs/CONTENT_SOURCING.md §7.3 and is the
// public mirror of the iOS app's EditorialStandardsView.

import type { Metadata } from "next";
import Link from "next/link";
import { Nav } from "../components/Nav";
import { Footer } from "../components/Footer";

export const metadata: Metadata = {
  title: "Editorial Standards",
  description:
    "How NurseMind is built. We curate license-correct primary sources, cite every clinical claim, and submit high-risk content to RN review. Not clinical decision support, by design.",
};

const LAST_REFRESHED = "May 9, 2026";

export default function EditorialStandardsPage() {
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
      <div className="max-w-[44rem]">
        <div className="eyebrow">Transparency</div>
        <h1 className="mt-6 text-[44px] sm:text-[60px] md:text-[76px] leading-[0.98] tracking-[-0.025em]">
          Editorial <span className="accent-italic">standards</span>.
        </h1>
        <p className="mt-8 max-w-[36rem] text-[16.5px] md:text-[18px] leading-[1.55] text-[color:var(--color-ink-muted)]">
          NurseMind does not author original clinical claims. We are a
          curator and an interface — we display, restructure, cite, and
          assemble content that nursing faculty, federal agencies, and
          peer-reviewed open-access publications have already published.{" "}
          <Em>If we can't cite it, we don't show it.</Em>
        </p>
        <div className="mt-8 flex flex-wrap items-center gap-x-6 gap-y-2 text-[12px] text-[color:var(--color-ink-faint)]">
          <span className="num uppercase tracking-[0.16em]">
            Last refreshed {LAST_REFRESHED}
          </span>
        </div>
      </div>
    </section>
  );
}

function Body() {
  return (
    <section className="container-wide pb-24 md:pb-32">
      <div className="max-w-[44rem]">
        <Section title="The model" eyebrow="01">
          <P>
            Most clinical reference apps anchor their credibility on a
            named medical-doctor advisor. NurseMind doesn't. Instead, we
            anchor on three things, in this order:
          </P>
          <ol className="mt-4 space-y-2 text-[15.5px] md:text-[16px] leading-[1.7] text-[color:var(--color-ink-muted)] list-none">
            <Li>
              <strong>License-correct foundation sources.</strong> Every
              clinical statement in the library is sourced from
              public-domain or openly-licensed primary material from
              accredited authors — federal regulators, nursing faculty,
              public health agencies, peer-reviewed open-access journals.
            </Li>
            <Li>
              <strong>Cite-or-refuse enforcement.</strong> Citations on
              every clinical claim, validated server-side. Numerical claims
              without a citation are rejected by our pipeline before they
              reach you.
            </Li>
            <Li>
              <strong>Tiered RN review.</strong> High-risk content is
              reviewed by licensed registered nurses pre-publication. The
              rest is sampled. Every entry has a feedback control.
            </Li>
          </ol>
          <P className="mt-6">
            <Em>
              We are not the originator of clinical knowledge. We are the
              shelf, the index, and the search engine.
            </Em>{" "}
            The decision to apply anything from this product in a clinical
            setting remains with the licensed clinician at the bedside.
          </P>
        </Section>

        <Section title="Sources we use" eyebrow="02">
          <P>
            The library is built only from sources whose license terms
            permit commercial use with attribution. Each entry cites the
            specific source and complies with that source's attribution
            requirements.
          </P>
          <ul className="mt-6 space-y-4">
            <Source
              name="openFDA / DailyMed"
              what="FDA-approved drug labeling — indications, dosing, contraindications, black-box warnings, drug-interaction data"
              license="Public domain"
              url="https://open.fda.gov/"
            />
            <Source
              name="RxNorm"
              what="Standardized drug naming — generic names, brand names, ingredient mappings"
              license="Public domain (NLM)"
              url="https://www.nlm.nih.gov/research/umls/rxnorm/"
            />
            <Source
              name="Open RN"
              what="Wisconsin Technical College System nursing textbooks (Pharmacology, Med-Surg, Mental Health, Nursing Skills, etc.)"
              license="CC BY 4.0"
              url="https://wtcs.pressbooks.pub/"
            />
            <Source
              name="OpenStax Nursing"
              what="Rice University open nursing textbooks (Pharmacology for Nurses, Maternal-Newborn, etc.). Library display only — AI corpus use pending OpenStax permission."
              license="CC BY 4.0"
              url="https://openstax.org/subjects/nursing"
            />
            <Source
              name="VA PBM Monographs"
              what="U.S. Department of Veterans Affairs Pharmacy Benefits Management drug monographs"
              license="Public domain"
              url="https://www.pbm.va.gov/"
            />
            <Source
              name="LiverTox"
              what="NIH National Institute of Diabetes and Digestive and Kidney Diseases — drug-induced liver injury reference"
              license="Public domain"
              url="https://www.ncbi.nlm.nih.gov/books/NBK547852/"
            />
            <Source
              name="CDC"
              what="Centers for Disease Control and Prevention — infection control guidance, vaccination schedules, treatment guidelines"
              license="Public domain (U.S. federal work)"
              url="https://www.cdc.gov/"
            />
            <Source
              name="NIH treatment guidelines"
              what="Disease-specific clinical practice guidelines from NIH-supported workgroups (e.g., COVID-19 Treatment Guidelines)"
              license="Public domain"
              url="https://www.nih.gov/"
            />
            <Source
              name="MedlinePlus (NLM-authored)"
              what="National Library of Medicine consumer health pages — for definitions and patient-education context"
              license="Public domain (NLM-authored sections only)"
              url="https://medlineplus.gov/"
            />
            <Source
              name="PubMed Central Open Access"
              what="Peer-reviewed journal articles licensed CC BY or CC0, used for evidence updates beyond textbook references"
              license="CC BY / CC0 (subset)"
              url="https://pmc.ncbi.nlm.nih.gov/"
            />
          </ul>
        </Section>

        <Section title="Sources we won't use" eyebrow="03">
          <P>
            Some references are well-known in nursing but their licenses
            don't permit the curator model — either because they prohibit
            commercial use, derivative works, or AI ingestion, or because
            they are proprietary works available only by paid subscription.
            We do not republish from any of these:
          </P>
          <ul className="mt-4 grid grid-cols-1 sm:grid-cols-2 gap-x-8 gap-y-2 text-[14px] text-[color:var(--color-ink-muted)]">
            <Disallowed name="StatPearls" reason="NC-ND license" />
            <Disallowed name="AHFS PMI" reason="proprietary" />
            <Disallowed
              name="MedlinePlus drug pages"
              reason="A.D.A.M. third-party content"
            />
            <Disallowed name="Testing.com" reason="proprietary" />
            <Disallowed
              name="DrugBank (full database)"
              reason="commercial license required"
            />
            <Disallowed
              name="Davis's Drug Guide"
              reason="proprietary publisher"
            />
            <Disallowed name="Mosby's" reason="proprietary publisher" />
            <Disallowed name="Lexicomp" reason="proprietary publisher" />
            <Disallowed name="UpToDate" reason="proprietary publisher" />
            <Disallowed
              name="Nursing Central"
              reason="proprietary publisher"
            />
            <Disallowed
              name="ATI / Saunders / Lippincott / Kaplan / UWorld"
              reason="proprietary review-book publishers"
            />
            <Disallowed
              name="Live NCLEX items"
              reason="NCSBN trademark + content protection"
            />
          </ul>
          <P className="mt-6">
            <Em>
              The omission is not a quality judgment.
            </Em>{" "}
            Many of these are excellent references — we just can't
            redistribute them under our model. If you study from them in
            other contexts, that's between you, them, and your school.
          </P>
        </Section>

        <Section title="Citations are not optional" eyebrow="04">
          <P>
            Every clinical assertion in the library is tied to a specific
            source. Every numerical claim in an Ask NurseMind response is
            tied to a specific source. The pipeline enforces this:
          </P>
          <ul className="mt-4 space-y-2 text-[15.5px] md:text-[16px] leading-[1.7] text-[color:var(--color-ink-muted)] list-none">
            <Li>
              <strong>Library entries</strong> are authored as a curated
              assembly of citation-tagged blocks. Each dose, range,
              threshold, contraindication, or monitoring parameter has a
              source attached at the data-model level — there is no
              text-only path that doesn't carry a citation reference.
            </Li>
            <Li>
              <strong>AI co-pilot responses</strong> are validated
              server-side via regex enforcement before being sent back to
              the device. Numerical claims (doses, ranges, thresholds)
              must include a square-bracket citation that resolves to a
              chunk in the retrieved context. Responses that don't comply
              are rejected and re-generated.
            </Li>
            <Li>
              <strong>If we can't cite it,</strong> the entry is not
              shipped or the AI returns a refusal explaining what it
              would have needed to answer.
            </Li>
          </ul>
        </Section>

        <Section title="How the AI co-pilot stays grounded" eyebrow="05">
          <P>
            When you ask a question, NurseMind retrieves the most
            relevant entries from the curated library using keyword and
            semantic matching. The AI is given only those retrieved
            entries plus a tightly-scoped system prompt that instructs it
            to:
          </P>
          <ul className="mt-4 space-y-2 text-[15.5px] md:text-[16px] leading-[1.7] text-[color:var(--color-ink-muted)] list-none">
            <Li>
              Answer using only the supplied retrieved context — never
              external pretraining knowledge — for any clinical claim.
            </Li>
            <Li>
              Include citations on every numerical claim, with the
              citation IDs that appear in the supplied context.
            </Li>
            <Li>
              Refuse to give a diagnosis, prescribe, direct treatment for
              a specific patient, or process patient-identifying
              information.
            </Li>
            <Li>
              Stay within nursing-reference scope (drugs, drips, labs,
              scenarios, communication, pathophysiology, NCLEX content) —
              questions outside that scope receive a polite redirect.
            </Li>
          </ul>
          <P className="mt-6">
            Inputs are passed through a server-side scrubber before
            reaching any third-party model. The scrubber detects and
            removes apparent patient-identifying data (names, MRNs, dates
            of birth, room numbers). Inputs that contain such data are
            rejected, and the user receives a refusal asking them to
            describe the situation in general terms.
          </P>
          <P>
            <Em>
              AI responses can still be wrong.
            </Em>{" "}
            Models hallucinate, retrieval misses relevant evidence, and
            even cited sources can be misread. We don't pretend otherwise.
            Verify against the cited primary source before relying on
            anything in any context where accuracy matters.
          </P>
        </Section>

        <Section title="Tiered review" eyebrow="06">
          <P>
            We don't have a full-time clinical advisor. Instead, we
            engage a pool of paid licensed registered nurses for review
            in three tiers, scaled to risk:
          </P>
          <div className="mt-6 space-y-6">
            <Tier
              name="Tier A — pre-publication review"
              applies="ISMP high-alert drugs, pediatric dosing, emergency protocols, sepsis, ACLS-adjacent content"
              cadence="Every entry reviewed by a named RN before it ships"
            />
            <Tier
              name="Tier B — sampled review"
              applies="The remainder of the clinical library and AI-generated explanations"
              cadence="10% sampled; reviewer notes feed back into the authoring pipeline"
            />
            <Tier
              name="Tier C — reporting loop"
              applies="Live published content"
              cadence="Every entry has a feedback control. High-risk reports (high-alert drugs, peds, emergencies) escalated within 24 hours."
            />
          </div>
        </Section>

        <Section title="What NurseMind isn't" eyebrow="07">
          <P>
            NurseMind is not clinical decision support. It does not
            replace independent verification by a licensed provider. It
            is not FDA-cleared as a clinical-decision-support device — by
            design.
          </P>
          <P>
            We rely on the FDA's clinical-decision-support safe-harbor
            criteria under §520(o)(1)(E) of the Federal Food, Drug, and
            Cosmetic Act: we cite primary sources, never produce
            directive output ("give X mg"), and do not analyze medical
            images or signals. Our output is information that helps a
            healthcare professional's decision-making — not the decision
            itself.
          </P>
          <P>
            <Em>
              The licensed clinician at the bedside is always the
              decision-maker.
            </Em>{" "}
            NurseMind's role ends at the citation.
          </P>
        </Section>

        <Section title="Report a content error" eyebrow="08">
          <P>
            If something in the library or in an AI response looks wrong
            — out of date, misquoted, missing a critical caveat — please
            tell us:
          </P>
          <ul className="mt-4 space-y-2 text-[15.5px] md:text-[16px] leading-[1.7] text-[color:var(--color-ink-muted)] list-none">
            <Li>
              <strong>From the iOS app:</strong> tap the feedback control
              on any entry or AI response. Reports include the entry ID,
              the device's anonymous account, and any optional note you
              add.
            </Li>
            <Li>
              <strong>By email:</strong>{" "}
              <A href="mailto:hello@nursemind.app">hello@nursemind.app</A>{" "}
              with the entry name and a description of the issue.
            </Li>
          </ul>
          <P className="mt-6">
            Reports route into the same review pipeline used for
            pre-publication review of high-risk content. Errors involving
            high-alert drugs, pediatric dosing, or emergency protocols
            are escalated within 24 hours. Other reports are reviewed
            within five business days.
          </P>
        </Section>

        <Section title="Refresh cadence" eyebrow="09">
          <P>
            We re-pull foundation sources on a quarterly cadence to catch
            label updates, withdrawn drugs, new boxed warnings, and
            updated guidelines. Each entry shows a "Last source-fidelity
            review" date. The library overall was last refreshed on{" "}
            <Mono>{LAST_REFRESHED}</Mono>.
          </P>
          <P>
            <Em>
              Clinical evidence is a moving target.
            </Em>{" "}
            We are honest about that. If you find an entry that hasn't
            been refreshed in a long time and the underlying source has
            changed, tell us — that's exactly what the reporting loop is
            for.
          </P>
        </Section>

        <Section title="Contact" eyebrow="10">
          <P>
            Questions about how a specific entry was sourced, requests for
            additional source citations, or concerns about a particular
            claim? Email{" "}
            <A href="mailto:hello@nursemind.app">hello@nursemind.app</A>.
            We answer within five business days.
          </P>
          <P className="mt-8 text-[12.5px] citation">
            NurseMind, Inc. · Curator model · Last refreshed{" "}
            <span className="num">{LAST_REFRESHED}</span>.
          </P>
        </Section>

        <BackToHome />
      </div>
    </section>
  );
}

function Section({
  eyebrow,
  title,
  children,
}: {
  eyebrow: string;
  title: string;
  children: React.ReactNode;
}) {
  return (
    <section className="border-t border-[color:var(--color-hairline)] pt-10 md:pt-12 mt-12 md:mt-16 first:border-t-0 first:pt-0 first:mt-0">
      <div className="flex items-baseline gap-4">
        <span className="num text-[12px] uppercase tracking-[0.16em] text-[color:var(--color-ink-faint)]">
          {eyebrow}
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
      target={href.startsWith("http") ? "_blank" : undefined}
      rel={href.startsWith("http") ? "noopener noreferrer" : undefined}
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

function Source({
  name,
  what,
  license,
  url,
}: {
  name: string;
  what: string;
  license: string;
  url: string;
}) {
  return (
    <li className="border-b border-[color:var(--color-hairline)] pb-4">
      <div className="flex items-baseline justify-between gap-4">
        <A href={url}>
          <span className="text-[15.5px] md:text-[16px] text-[color:var(--color-ink)]">
            {name}
          </span>
        </A>
        <span className="num text-[11px] uppercase tracking-[0.14em] text-[color:var(--color-ink-faint)] shrink-0">
          {license}
        </span>
      </div>
      <div className="mt-1.5 text-[14px] leading-[1.55] text-[color:var(--color-ink-muted)]">
        {what}
      </div>
    </li>
  );
}

function Disallowed({
  name,
  reason,
}: {
  name: string;
  reason: string;
}) {
  return (
    <div className="flex items-baseline gap-2">
      <span className="text-[color:var(--color-ink)]">{name}</span>
      <span className="text-[color:var(--color-ink-faint)] italic font-[family-name:var(--font-serif)] text-[13px]">
        — {reason}
      </span>
    </div>
  );
}

function Tier({
  name,
  applies,
  cadence,
}: {
  name: string;
  applies: string;
  cadence: string;
}) {
  return (
    <div className="border-l border-[color:var(--color-hairline-strong)] pl-5">
      <div className="text-[15.5px] md:text-[16px] text-[color:var(--color-ink)] tracking-[-0.005em]">
        {name}
      </div>
      <div className="mt-2 text-[14px] leading-[1.6] text-[color:var(--color-ink-muted)]">
        <span className="num text-[10.5px] uppercase tracking-[0.16em] text-[color:var(--color-ink-faint)] mr-2">
          Applies
        </span>
        {applies}
      </div>
      <div className="mt-1 text-[14px] leading-[1.6] text-[color:var(--color-ink-muted)]">
        <span className="num text-[10.5px] uppercase tracking-[0.16em] text-[color:var(--color-ink-faint)] mr-2">
          Cadence
        </span>
        {cadence}
      </div>
    </div>
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
