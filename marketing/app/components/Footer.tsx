import Link from "next/link";
import { Wordmark } from "./Wordmark";

export function Footer() {
  return (
    <footer className="border-t border-[color:var(--color-hairline)]">
      <div className="container-wide py-12 md:py-16">
        <div className="grid grid-cols-2 md:grid-cols-12 gap-10">
          <div className="col-span-2 md:col-span-5">
            <Wordmark size="lg" />
            <p className="mt-5 max-w-[30rem] text-[13.5px] leading-[1.65] text-[color:var(--color-ink-muted)]">
              NurseMind is a clinical reference and education tool for nursing
              students and licensed nurses, intended for study, NCLEX
              preparation, and self-directed learning. It is not clinical
              decision support, it is not intended for use during patient care
              or to inform any treatment decision, and it is not designed for
              patient-identifying information.{" "}
              <span className="italic font-[family-name:var(--font-serif)] text-[color:var(--color-ink)]">
                Always defer to facility protocols, physician orders, and your
                own licensed clinical judgment.
              </span>
            </p>
          </div>

          <FooterCol
            title="Product"
            links={[
              ["What's inside", "#bundle"],
              ["Safety", "#safety"],
              ["Pricing", "#pricing"],
              ["Download", "#download"],
            ]}
          />
          <FooterCol
            title="Company"
            links={[
              ["About", "/about"],
              ["Press", "/press"],
              ["Contact", "mailto:hello@nursemind.app"],
            ]}
          />
          <FooterCol
            title="Legal"
            links={[
              ["Privacy", "/privacy"],
              ["Terms", "/terms"],
              ["Sources", "/sources"],
              ["Report an error", "/report"],
            ]}
          />
        </div>

        <div className="mt-12 md:mt-16 pt-6 border-t border-[color:var(--color-hairline)] flex flex-wrap items-center justify-between gap-3 text-[12px] text-[color:var(--color-ink-faint)]">
          <span>
            © {new Date().getFullYear()} NurseMind, Inc. All rights reserved.
          </span>
          <span className="italic font-[family-name:var(--font-serif)]">
            Built for nurses, in the United States.
          </span>
        </div>
      </div>
    </footer>
  );
}

function FooterCol({
  title,
  links,
}: {
  title: string;
  links: [string, string][];
}) {
  return (
    <div className="col-span-1 md:col-span-2">
      <div className="text-[10.5px] uppercase tracking-[0.16em] text-[color:var(--color-ink-faint)] num">
        {title}
      </div>
      <ul className="mt-4 space-y-2.5 text-[13.5px]">
        {links.map(([label, href]) => (
          <li key={label}>
            <Link
              href={href}
              className="text-[color:var(--color-ink-muted)] hover:text-[color:var(--color-ink)] transition-colors"
            >
              {label}
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
