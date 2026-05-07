import Link from "next/link";
import { ArrowUpRight } from "./icons";

export function DownloadCTA() {
  return (
    <section
      id="download"
      className="border-t border-[color:var(--color-hairline)] bg-[color:var(--color-bg-deep)]/40"
    >
      <div className="container-wide pt-24 md:pt-36 pb-24 md:pb-36">
        <div className="max-w-[44rem]">
          <div className="eyebrow">Now in beta</div>
          <h2 className="mt-5 text-[44px] md:text-[72px] lg:text-[88px] leading-[0.98] tracking-[-0.025em]">
            For when you want
            <br />
            to <span className="accent-italic">understand.</span>
          </h2>
          <p className="mt-7 max-w-[34rem] text-[16.5px] md:text-[18px] leading-[1.55] text-[color:var(--color-ink-muted)]">
            Free to start, with the full library and the calculator suite from
            the first launch. Pro joins the AI co-pilot, the full scenario set,
            and cross-device sync when you're ready.
          </p>

          <div className="mt-10 flex flex-wrap items-center gap-x-7 gap-y-4">
            <Link
              href="https://apps.apple.com/app/nursemind"
              className="btn-primary"
            >
              Download for iPhone
              <ArrowUpRight className="w-[14px] h-[14px]" />
            </Link>
            <Link href="#pricing" className="link-quiet">
              See pricing
            </Link>
          </div>

          <p className="mt-10 text-[12.5px] citation">
            Requires iOS 17 or later · iPhone and iPad · Android coming this
            year · For study and reference. Not a clinical decision tool, not
            for use during patient care.
          </p>
        </div>
      </div>
    </section>
  );
}
