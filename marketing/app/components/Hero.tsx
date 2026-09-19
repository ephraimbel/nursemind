"use client";

import Image from "next/image";
import Link from "next/link";
import { AppStoreLink } from "./AppStoreLink";
import { MotionControl } from "./Motion";
import { screens, ScreenViewer } from "./ScreenViewer";

export function Hero() {
  return (
    <section className="opening" aria-labelledby="hero-title">
      <div className="opening-copy container-wide">
        <p className="eyebrow opening-enter">For the endlessly curious nurse</p>
        <h1 id="hero-title">
          <span className="opening-line">A little clarity.</span>
          <span className="opening-line">
            A world of <em>possibility.</em>
          </span>
        </h1>
        <p className="opening-description opening-enter">
          Your nursing knowledge, beautifully connected.
          <br className="opening-desktop-break" /> A cited library and an AI
          co-pilot for every <em>“why?”</em>
        </p>
        <div className="opening-actions opening-enter">
          <AppStoreLink />
          <Link href="#inside" className="opening-link">
            Explore NurseMind <span aria-hidden="true">↓</span>
          </Link>
        </div>
        <p className="opening-note opening-enter">
          Free to start. Made for iPhone.
        </p>
      </div>
      <div className="screen-stage" data-scroll-scene>
        <svg
          className="stage-lines"
          viewBox="0 0 1300 780"
          fill="none"
          aria-hidden="true"
        >
          <ellipse cx="650" cy="470" rx="605" ry="226" stroke="currentColor" />
          <ellipse
            cx="650"
            cy="470"
            rx="605"
            ry="226"
            stroke="currentColor"
            transform="rotate(-14 650 470)"
          />
          <path d="M30 720C280 40 1010 42 1270 720" stroke="currentColor" />
        </svg>
        <span className="stage-aside stage-aside-left">
          A question.
          <br />
          <em>A connection.</em>
          <br />A little more clarity.
        </span>
        <span className="stage-aside stage-aside-right">
          <span className="num">01 — 03</span>Designed around
          <br />
          the way you think.
        </span>
        <div className="stage-device stage-device-library">
          <ScreenViewer initial={1} className="stage-phone">
            <Image
              src={screens[1].image}
              alt={screens[1].alt}
              sizes="(max-width: 767px) 174px, 270px"
              priority
            />
          </ScreenViewer>
          <span className="device-caption">
            <span className="num">02</span> A place to explore
          </span>
        </div>
        <div className="stage-device stage-device-sources">
          <ScreenViewer initial={2} className="stage-phone">
            <Image
              src={screens[2].image}
              alt={screens[2].alt}
              sizes="(max-width: 767px) 174px, 270px"
              priority
            />
          </ScreenViewer>
          <span className="device-caption">
            <span className="num">03</span> A source to follow
          </span>
        </div>
        <div className="stage-device stage-device-ask">
          <ScreenViewer initial={0} className="stage-phone">
            <Image
              src={screens[0].image}
              alt={screens[0].alt}
              sizes="(max-width: 767px) 230px, 320px"
              priority
            />
          </ScreenViewer>
          <span className="device-caption">
            <span className="num">01</span> A space for your questions
          </span>
        </div>
      </div>
      <div className="opening-bottom container-wide">
        <p>
          <span className="small-spark" aria-hidden="true">
            ✦
          </span>{" "}
          For nursing school. Your first year. Every chapter after.
        </p>
        <MotionControl />
      </div>
    </section>
  );
}
