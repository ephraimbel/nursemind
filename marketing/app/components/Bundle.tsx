"use client";

import { useEffect, useRef, useState } from "react";
import { useMotion } from "./Motion";
import { ArrowRight } from "./icons";

const steps = [
  {
    name: "Start with a question",
    title: "Make room for the why.",
    body: "Revisit a concept. Connect a few dots. Ask the question you didn't get to ask. A thoughtful learning companion is right here.",
  },
  {
    name: "Follow the evidence",
    title: "Understanding has a source.",
    body: "Go beyond the answer. Open a citation, read the supporting passage, and follow it back to the original reference.",
  },
  {
    name: "Keep discovering",
    title: "One thing leads to another.",
    body: "Move from a question to a reference, then into a clinical scenario. Build on what you know, one connection at a time.",
  },
];

export function Bundle() {
  const { enabled } = useMotion();
  const [active, setActive] = useState(0);
  const [inView, setInView] = useState(false);
  const [manual, setManual] = useState(false);
  const section = useRef<HTMLElement>(null);
  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => setInView(entry.isIntersecting),
      { threshold: 0.3 },
    );
    if (section.current) observer.observe(section.current);
    return () => observer.disconnect();
  }, []);
  useEffect(() => {
    if (!enabled || !inView || manual) return;
    const timer = setInterval(
      () => setActive((value) => (value + 1) % steps.length),
      4800,
    );
    return () => clearInterval(timer);
  }, [enabled, inView, manual]);

  return (
    <section
      ref={section}
      id="bundle"
      className="connections-section section-space"
      aria-labelledby="bundle-title"
    >
      <div className="container-wide">
        <div className="connections-heading" data-reveal>
          <p className="eyebrow">Less scattered. More connected.</p>
          <h2 id="bundle-title">
            Follow your curiosity.
            <br />
            <em>Find your clarity.</em>
          </h2>
          <p>
            Good learning doesn't happen in isolation.
            <br />
            Neither should your tools.
          </p>
        </div>
        <div className="connections-grid">
          <div className="connection-steps" data-reveal>
            {steps.map((step, index) => (
              <button
                type="button"
                key={step.name}
                className="connection-step"
                aria-pressed={active === index}
                aria-controls="connection-graphic"
                onClick={() => {
                  setActive(index);
                  setManual(true);
                }}
              >
                <span className="step-number num">0{index + 1}</span>
                <span>
                  <span className="eyebrow">{step.name}</span>
                  <strong>{step.title}</strong>
                  <span className="step-body">{step.body}</span>
                </span>
                <ArrowRight width={18} height={18} />
              </button>
            ))}
          </div>
          <div
            className="connection-graphic"
            id="connection-graphic"
            data-step={active}
            data-playing={enabled && inView && !manual}
            data-reveal
            aria-label={`How NurseMind connects your learning: ${steps[active].name}`}
          >
            <div className="graphic-heading">
              <span className="eyebrow">
                A small question. A bigger picture.
              </span>
              <span className="num">0{active + 1} / 03</span>
            </div>
            <div className="connection-map" aria-hidden="true">
              <svg className="map-lines" viewBox="0 0 500 480" fill="none">
                <path
                  className="map-path map-path-one"
                  d="M250 94V145C250 172 114 142 114 189V216"
                />
                <path
                  className="map-path map-path-two"
                  d="M114 274V304C114 344 340 308 340 361V393"
                />
                <path
                  className="map-path map-path-three"
                  d="M340 393C460 386 450 132 321 77"
                />
              </svg>
              <div className="map-question">
                <span className="eyebrow">Your curiosity</span>
                <span>“Help me understand SBAR.”</span>
                <span className="map-send">↑</span>
              </div>
              <div className="map-reference">
                <span className="eyebrow">Follow the source</span>
                <strong>AHRQ</strong>
                <em>TeamSTEPPS · SBAR</em>
                <span className="map-citation">
                  Reference <span>↗</span>
                </span>
              </div>
              <div className="map-library">
                <span className="eyebrow">Keep exploring</span>
                <span>
                  Communication <ArrowRight width={15} height={15} />
                </span>
                <span>
                  Clinical scenarios <ArrowRight width={15} height={15} />
                </span>
              </div>
              <span className="map-spark">✦</span>
            </div>
            <div className="graphic-footer">
              <span>Questions become connections.</span>
              <button
                disabled={!enabled}
                type="button"
                onClick={() => setManual((value) => !value)}
                aria-label={
                  manual
                    ? "Play learning animation"
                    : "Pause learning animation"
                }
              >
                {!enabled ? "Motion off" : manual ? "Play" : "Pause"}
                <span aria-hidden="true">{manual || !enabled ? "▷" : "Ⅱ"}</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
