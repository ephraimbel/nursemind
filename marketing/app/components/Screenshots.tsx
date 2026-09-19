"use client";

import Image from "next/image";
import { useRef, useState } from "react";
import { screens, ScreenViewer } from "./ScreenViewer";
import { ArrowRight } from "./icons";

const descriptions = [
  {
    title: (
      <>
        A little more <em>“now I get it.”</em>
      </>
    ),
    body: "Bring the concepts you want to understand. Ask in your own words, use your voice, or start with a suggested question.",
    detail: "Your curiosity sets the direction.",
    note: "ASK · YOUR LEARNING COMPANION",
  },
  {
    title: (
      <>
        Your knowledge.
        <br />
        <em>In good company.</em>
      </>
    ),
    body: "Search directly, follow a topic, or browse the A–Z reference. Drugs, labs, procedures, and scenarios — thoughtfully connected.",
    detail: "Find a starting point. See where it takes you.",
    note: "LIBRARY · A REFERENCE THAT CONNECTS",
  },
  {
    title: (
      <>
        A source behind
        <br />
        <em>every discovery.</em>
      </>
    ),
    body: "Follow a citation back to its reference. Read the supporting passage and open the original source to explore it in context.",
    detail: "The evidence is part of the experience.",
    note: "SOURCES · LOOK A LITTLE DEEPER",
  },
];

export function Screenshots() {
  const [active, setActive] = useState(0);
  const tabs = useRef<Array<HTMLButtonElement | null>>([]);
  const screen = screens[active];
  const description = descriptions[active];
  return (
    <section
      id="inside"
      className="showcase-section section-space"
      aria-labelledby="inside-title"
    >
      <div className="container-wide">
        <div className="showcase-heading" data-reveal>
          <p className="eyebrow">Thoughtfully made. Naturally yours.</p>
          <h2 id="inside-title">
            A calmer space
            <br />
            for a <em>curious mind.</em>
          </h2>
        </div>
        <div
          className="showcase-tabs"
          role="tablist"
          aria-label="Explore the app"
        >
          {screens.map((item, index) => (
            <button
              ref={(node) => {
                tabs.current[index] = node;
              }}
              type="button"
              role="tab"
              key={item.id}
              id={`tour-tab-${index}`}
              aria-controls="tour-panel"
              aria-selected={active === index}
              tabIndex={active === index ? 0 : -1}
              onClick={() => setActive(index)}
              onKeyDown={(event) => {
                let next = index;
                if (event.key === "ArrowRight")
                  next = (index + 1) % screens.length;
                else if (event.key === "ArrowLeft")
                  next = (index + screens.length - 1) % screens.length;
                else if (event.key === "Home") next = 0;
                else if (event.key === "End") next = screens.length - 1;
                else return;
                event.preventDefault();
                setActive(next);
                tabs.current[next]?.focus();
              }}
            >
              <span className="num">0{index + 1}</span>
              {item.label}
              <span className="tab-arrow" aria-hidden="true">
                ↗
              </span>
            </button>
          ))}
        </div>
        <div
          id="tour-panel"
          role="tabpanel"
          aria-labelledby={`tour-tab-${active}`}
          className="showcase-panel"
          tabIndex={0}
        >
          <div className="showcase-copy" key={`copy-${active}`}>
            <p className="eyebrow">{description.note}</p>
            <h3>{description.title}</h3>
            <p>{description.body}</p>
            <span className="showcase-detail">
              <ArrowRight width={17} height={17} />
              {description.detail}
            </span>
            <ScreenViewer initial={active} />
            <p className="showcase-disclaimer">
              For study and reference.
              <br />
              {" "}Not for use during patient care.
            </p>
          </div>
          <div className="showcase-art" data-screen={screen.id}>
            <span className="showcase-watermark" aria-hidden="true">
              {screen.label === "Sources" ? "Cited." : screen.label + "."}
            </span>
            <div className="showcase-device" key={screen.id}>
              <ScreenViewer initial={active} className="showcase-phone">
                <Image
                  src={screen.image}
                  alt={screen.alt}
                  sizes="(max-width: 767px) 280px, 330px"
                />
              </ScreenViewer>
            </div>
            <span className="showcase-art-caption">
              Actual app screen. Tap to take a closer look.
            </span>
          </div>
        </div>
      </div>
    </section>
  );
}
