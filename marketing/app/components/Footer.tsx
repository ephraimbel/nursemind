import Link from "next/link";
import { Wordmark } from "./Wordmark";

export function Footer() {
  return (
    <footer className="site-footer">
      <div className="container-wide">
        <div className="footer-top" data-reveal>
          <div className="footer-brand">
            <Link href="/" aria-label="NurseMind home">
              <Wordmark size="lg" />
            </Link>
            <p>
              A little clarity.
              <br />
              For every chapter.
            </p>
          </div>
          <FooterCol
            title="Explore"
            links={[
              ["The app", "/#inside"],
              ["Our approach", "/#safety"],
              ["Pricing", "/#pricing"],
              ["Download", "/#download"],
            ]}
          />
          <FooterCol
            title="A little more"
            links={[
              ["Editorial standards", "/editorial-standards"],
              ["Get in touch", "/support"],
              ["Privacy", "/privacy"],
              ["Terms", "/terms"],
            ]}
          />
        </div>
        <p className="footer-disclaimer">
          NurseMind is for nursing study, NCLEX preparation, and self-directed
          learning. It is not clinical decision support, is not intended for use
          during patient care, and must not be used to inform treatment
          decisions. Never enter patient-identifying information. Always follow
          facility protocols, physician orders, and your own licensed clinical
          judgment.
        </p>
        <div className="footer-bottom">
          <span>© {new Date().getFullYear()} NurseMind, Inc.</span>
          <span>Made with care. For the people who care.</span>
          <Link href="#main-content">Back to top ↑</Link>
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
    <div className="footer-column">
      <p className="eyebrow">{title}</p>
      <ul>
        {links.map(([label, href]) => (
          <li key={href}>
            <Link href={href}>{label}</Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
