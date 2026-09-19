import Link from "next/link";
import { ArrowUpRight } from "./icons";

const principles = [
  {
    title: "Follow the evidence.",
    body: "Citations connect your learning to the reference behind it. Open the source, explore the context, and build your own understanding.",
  },
  {
    title: "Keep it about learning.",
    body: "NurseMind is for study and reference. It doesn't diagnose, prescribe, or make decisions for a patient. Your clinical judgment stays yours.",
  },
  {
    title: "Leave patient details out.",
    body: "There are no patient records or chart connections. Always ask in general terms and never enter information that could identify a patient.",
  },
];

export function Safety() {
  return (
    <section
      id="safety"
      className="safety-section section-space"
      aria-labelledby="safety-title"
    >
      <div className="container-wide">
        <div className="safety-grid">
          <div className="safety-intro" data-reveal>
            <p className="eyebrow">Our approach</p>
            <h2 id="safety-title">
              Your trust.
              <br />
              <em>Thoughtfully earned.</em>
            </h2>
            <p>
              When it comes to nursing knowledge, where an answer comes from
              matters as much as the answer itself.
            </p>
            <Link href="/editorial-standards" className="link-quiet">
              Our editorial standards <ArrowUpRight width={15} height={15} />
            </Link>
          </div>
          <div className="principles" data-reveal>
            {principles.map((item, index) => (
              <article key={item.title}>
                <span className="num">0{index + 1}</span>
                <div>
                  <h3>{item.title}</h3>
                  <p>{item.body}</p>
                </div>
              </article>
            ))}
          </div>
        </div>
        <div className="source-strip" data-reveal>
          <p className="eyebrow">Our library draws from</p>
          <ul>
            <li>DailyMed</li>
            <li>Open RN</li>
            <li>OpenStax</li>
            <li>CDC</li>
            <li>NIH</li>
          </ul>
          <p className="source-disclosure">
            Source names indicate references, not partnerships or endorsements.
          </p>
        </div>
      </div>
    </section>
  );
}
