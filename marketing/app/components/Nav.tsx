import Link from "next/link";
import { Wordmark } from "./Wordmark";

export function Nav() {
  return (
    <header className="sticky top-0 z-30 backdrop-blur-md bg-[color:var(--color-bg)]/80 border-b border-[color:var(--color-hairline)]">
      <nav className="container-wide flex items-center justify-between h-14 md:h-16">
        <Link
          href="/"
          aria-label="Nursemind home"
          className="flex items-center"
        >
          <Wordmark />
        </Link>

        <div className="flex items-center gap-7 md:gap-9 text-[14px] text-[color:var(--color-ink-muted)]">
          <Link
            href="#bundle"
            className="hidden sm:inline hover:text-[color:var(--color-ink)] transition-colors"
          >
            What's inside
          </Link>
          <Link
            href="#safety"
            className="hidden sm:inline hover:text-[color:var(--color-ink)] transition-colors"
          >
            Safety
          </Link>
          <Link
            href="#pricing"
            className="hover:text-[color:var(--color-ink)] transition-colors"
          >
            Pricing
          </Link>
          <Link
            href="#download"
            className="text-[color:var(--color-ink)] border-b border-[color:var(--color-hairline-strong)] pb-[2px] hover:border-[color:var(--color-ink)] transition-colors"
          >
            Download
          </Link>
        </div>
      </nav>
    </header>
  );
}
