"use client";

import Link from "next/link";
import { useEffect, useRef, useState } from "react";
import { Wordmark } from "./Wordmark";
import { AppStoreLink } from "./AppStoreLink";

const links = [
  ["The app", "/#inside"],
  ["Our approach", "/#safety"],
  ["Pricing", "/#pricing"],
];

export function Nav() {
  const [open, setOpen] = useState(false);
  const menuButton = useRef<HTMLButtonElement>(null);

  useEffect(() => {
    if (!open) return;
    const closeOnEscape = (event: KeyboardEvent) => {
      if (event.key === "Escape") {
        setOpen(false);
        menuButton.current?.focus();
      }
    };
    const desktop = window.matchMedia("(min-width: 768px)");
    const closeOnDesktop = () => {
      if (desktop.matches) setOpen(false);
    };
    document.addEventListener("keydown", closeOnEscape);
    desktop.addEventListener("change", closeOnDesktop);
    return () => {
      document.removeEventListener("keydown", closeOnEscape);
      desktop.removeEventListener("change", closeOnDesktop);
    };
  }, [open]);

  return (
    <header className="site-header">
      <a className="skip-link" href="#main-content">
        Skip to content
      </a>
      <nav className="container-wide nav-inner" aria-label="Main navigation">
        <Link
          href="/"
          aria-label="NurseMind home"
          className="brand-link"
          onClick={() => setOpen(false)}
        >
          <Wordmark />
        </Link>
        <div className="desktop-nav">
          {links.map(([label, href]) => (
            <Link key={href} href={href}>
              {label}
            </Link>
          ))}
        </div>
        <div className="nav-actions">
          <AppStoreLink className="nav-download">Get the app</AppStoreLink>
          <button
            ref={menuButton}
            className="menu-toggle"
            type="button"
            aria-label={open ? "Close menu" : "Open menu"}
            aria-expanded={open}
            aria-controls="mobile-navigation"
            onClick={() => setOpen(!open)}
          >
            <span
              className={open ? "menu-lines is-open" : "menu-lines"}
              aria-hidden="true"
            >
              <span />
              <span />
            </span>
          </button>
        </div>
      </nav>
      <nav
        id="mobile-navigation"
        className="mobile-nav"
        aria-label="Mobile navigation"
        hidden={!open}
      >
        {links.map(([label, href], i) => (
          <Link key={href} href={href} onClick={() => setOpen(false)}>
            <span className="num">0{i + 1}</span>
            {label}
          </Link>
        ))}
        <Link href="/support" onClick={() => setOpen(false)}>
          <span className="num">04</span>Get in touch
        </Link>
      </nav>
    </header>
  );
}
