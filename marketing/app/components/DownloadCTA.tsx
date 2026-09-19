import { AppStoreLink } from "./AppStoreLink";

export function DownloadCTA() {
  return (
    <section
      id="download"
      className="download-section"
      aria-labelledby="download-title"
    >
      <div className="container-wide" data-reveal>
        <p className="eyebrow">Take your curiosity with you</p>
        <h2 id="download-title">
          There's always
          <br />
          more to <em>understand.</em>
        </h2>
        <p>Your next question has a home.</p>
        <AppStoreLink />
        <span className="download-note">
          Free to start · iPhone · iOS 17 or later
        </span>
      </div>
    </section>
  );
}
