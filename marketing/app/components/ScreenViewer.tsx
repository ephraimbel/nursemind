"use client";

import Image, { type StaticImageData } from "next/image";
import { useEffect, useRef, useState } from "react";
import library from "../../public/screenshots/library.png";
import ask from "../../public/screenshots/ask.png";
import sources from "../../public/screenshots/sources.png";
import { ArrowUpRight } from "./icons";

export const screens: {
  id: string;
  label: string;
  image: StaticImageData;
  alt: string;
}[] = [
  {
    id: "ask",
    label: "Ask",
    image: ask,
    alt: "NurseMind Ask: a personalized greeting, suggested questions, and voice input",
  },
  {
    id: "library",
    label: "Library",
    image: library,
    alt: "NurseMind Library: search, topic collections, and the A–Z reference",
  },
  {
    id: "sources",
    label: "Sources",
    image: sources,
    alt: "NurseMind source details: AHRQ TeamSTEPPS reference and supporting library passages",
  },
];

export function ScreenViewer({
  initial,
  children,
  className = "",
}: {
  initial: number;
  children?: React.ReactNode;
  className?: string;
}) {
  const dialog = useRef<HTMLDialogElement>(null);
  const trigger = useRef<HTMLButtonElement>(null);
  const [active, setActive] = useState(initial);
  const [open, setOpen] = useState(false);
  useEffect(() => {
    if (!open) return;
    const previous = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    dialog.current?.showModal();
    return () => {
      document.body.style.overflow = previous;
    };
  }, [open]);
  const close = () => {
    dialog.current?.close();
    setOpen(false);
    trigger.current?.focus();
  };
  const change = (next: number) =>
    setActive((next + screens.length) % screens.length);
  return (
    <>
      <button
        ref={trigger}
        type="button"
        className={`screen-expand ${className}`}
        aria-label={`View ${screens[initial].label} screen full size`}
        onClick={() => {
          setActive(initial);
          setOpen(true);
        }}
      >
        {children ?? (
          <>
            View full screen <ArrowUpRight width={15} height={15} />
          </>
        )}
      </button>
      <dialog
        ref={dialog}
        className="screen-dialog"
        aria-label="NurseMind screenshot viewer"
        onCancel={(event) => {
          event.preventDefault();
          close();
        }}
        onClick={(event) => {
          if (event.target === dialog.current) close();
        }}
        onKeyDown={(event) => {
          if (event.key === "ArrowRight") {
            event.preventDefault();
            change(active + 1);
          }
          if (event.key === "ArrowLeft") {
            event.preventDefault();
            change(active - 1);
          }
        }}
      >
        {open && (
          <>
            <div className="viewer-bar">
              <span className="eyebrow">
                Inside NurseMind <span className="num">/ 0{active + 1}</span>
              </span>
              <button
                type="button"
                className="viewer-close"
                onClick={close}
                autoFocus
              >
                Close <span aria-hidden="true">×</span>
              </button>
            </div>
            <div className="viewer-content">
              <button
                type="button"
                className="viewer-arrow"
                aria-label="Previous screenshot"
                onClick={() => change(active - 1)}
              >
                ←
              </button>
              <figure>
                <Image
                  src={screens[active].image}
                  alt={screens[active].alt}
                  sizes="(max-width: 600px) 80vw, 440px"
                  className="viewer-image"
                />
                <figcaption>
                  {screens[active].label} <span>Actual app screen</span>
                </figcaption>
              </figure>
              <button
                type="button"
                className="viewer-arrow"
                aria-label="Next screenshot"
                onClick={() => change(active + 1)}
              >
                →
              </button>
            </div>
          </>
        )}
      </dialog>
    </>
  );
}
