"use client";

import { createContext, useContext, useEffect, useRef, useState } from "react";

const MotionContext = createContext({ enabled: true, toggle: () => {} });
export const useMotion = () => useContext(MotionContext);

export function Motion({ children }: { children: React.ReactNode }) {
  const root = useRef<HTMLDivElement>(null);
  const [paused, setPaused] = useState(false);
  const [reduced, setReduced] = useState(false);
  const enabled = !paused && !reduced;

  useEffect(() => {
    const media = window.matchMedia("(prefers-reduced-motion: reduce)");
    const sync = () => setReduced(media.matches);
    sync();
    media.addEventListener("change", sync);
    return () => media.removeEventListener("change", sync);
  }, []);

  useEffect(() => {
    const element = root.current;
    if (!element) return;
    const targets = element.querySelectorAll<HTMLElement>("[data-reveal]");
    if (!enabled) {
      targets.forEach((target) => (target.dataset.visible = "true"));
      return;
    }
    const observer = new IntersectionObserver(
      (entries) =>
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            (entry.target as HTMLElement).dataset.visible = "true";
            observer.unobserve(entry.target);
          }
        }),
      { threshold: 0.12, rootMargin: "0px 0px -24px 0px" },
    );
    targets.forEach((target) => {
      if (target.getBoundingClientRect().top < window.innerHeight)
        target.dataset.visible = "true";
      observer.observe(target);
    });
    element.dataset.enhanced = "true";
    return () => observer.disconnect();
  }, [enabled]);

  useEffect(() => {
    const scenes = root.current?.querySelectorAll<HTMLElement>(
      "[data-scroll-scene]",
    );
    if (!scenes || !enabled) return;
    let frame = 0;
    const update = () => {
      frame = 0;
      scenes.forEach((scene) => {
        const rect = scene.getBoundingClientRect();
        if (rect.bottom < 0 || rect.top > window.innerHeight) return;
        const progress = Math.min(
          1,
          Math.max(
            0,
            (window.innerHeight - rect.top) /
              (window.innerHeight + rect.height),
          ),
        );
        scene.style.setProperty("--scene", progress.toFixed(4));
      });
    };
    const schedule = () => {
      if (!frame) frame = requestAnimationFrame(update);
    };
    update();
    window.addEventListener("scroll", schedule, { passive: true });
    window.addEventListener("resize", schedule);
    return () => {
      cancelAnimationFrame(frame);
      window.removeEventListener("scroll", schedule);
      window.removeEventListener("resize", schedule);
    };
  }, [enabled]);

  return (
    <MotionContext.Provider
      value={{ enabled, toggle: () => setPaused((value) => !value) }}
    >
      <div
        ref={root}
        className="motion-root"
        data-motion={enabled ? "on" : "off"}
      >
        {children}
      </div>
    </MotionContext.Provider>
  );
}

export function MotionControl() {
  const { enabled, toggle } = useMotion();
  return (
    <button
      type="button"
      className="motion-control"
      onClick={toggle}
      aria-pressed={!enabled}
      aria-label={enabled ? "Pause animations" : "Enable animations"}
    >
      <svg
        width="12"
        height="12"
        viewBox="0 0 12 12"
        fill="none"
        aria-hidden="true"
      >
        {enabled ? (
          <path d="M4 2v8M8 2v8" stroke="currentColor" strokeWidth="1.5" />
        ) : (
          <path d="m4 2 6 4-6 4V2Z" fill="currentColor" />
        )}
      </svg>
      {enabled ? "Motion on" : "Motion off"}
    </button>
  );
}
