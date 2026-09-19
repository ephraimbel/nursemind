import Link from "next/link";
import { Plus } from "./icons";

const faqs = [
  {
    q: "Who is NurseMind for?",
    a: "Nursing students, registered nurses, practical nurses, and nursing assistants who want a thoughtful place to study, prepare for the NCLEX, and explore nursing concepts. No NPI is required.",
  },
  {
    q: "Is NurseMind free?",
    a: "Yes. You can start with the clinical reference library, local bookmarks, and three AI questions a day. Pro offers more AI questions, the full clinical scenario collection, and offline reference access. Choose monthly or yearly in the app.",
  },
  {
    q: "Can I use it during patient care?",
    a: "No. NurseMind is for study and self-directed learning. It is not clinical decision support and should not inform decisions for a real patient. Always follow facility protocols, physician orders, and your own licensed clinical judgment.",
  },
  {
    q: "Where does the information come from?",
    a: "The library draws on sources including DailyMed, openFDA, Open RN, OpenStax Nursing, CDC, and NIH. Citations let you follow information back to its reference and read it in context. AI can make mistakes; always verify information against its original source.",
  },
  {
    q: "How do I protect patient privacy?",
    a: "Never enter patient names, dates of birth, medical record numbers, or other identifying details. Ask questions in general terms. NurseMind has no patient records or EHR connections. See our privacy policy for details about data handling.",
  },
  {
    q: "Can I cancel Pro anytime?",
    a: "Yes. Manage or cancel your subscription in iPhone Settings → your name → Subscriptions. The yearly plan includes a three-day trial for eligible subscribers, then renews at $99.99 a year. Monthly Pro is $14.99 a month. Apple handles billing and refund requests.",
  },
  {
    q: "Is NurseMind available on Android?",
    a: "NurseMind is currently available on iPhone. We don't have an Android release date to share yet.",
  },
  {
    q: "How do I report a content error?",
    a: "Use the feedback control in the app, or email hello@nursemind.app. Include the entry title or topic and what needs attention, without sharing any patient information.",
  },
];

export function FAQ() {
  return (
    <section
      id="faq"
      className="faq-section container-wide section-space"
      aria-labelledby="faq-title"
    >
      <div className="faq-intro" data-reveal>
        <p className="eyebrow">A few good questions</p>
        <h2 id="faq-title">
          Glad
          <br /> you <em>asked.</em>
        </h2>
        <p>Still curious about something?</p>
        <Link href="/support" className="link-quiet">
          We're here to help
        </Link>
      </div>
      <div className="faq-list" data-reveal>
        {faqs.map((faq, index) => (
          <details key={faq.q} name="questions">
            <summary>
              <span className="faq-number num">0{index + 1}</span>
              <span>{faq.q}</span>
              <Plus width={18} height={18} />
            </summary>
            <p>{faq.a}</p>
          </details>
        ))}
      </div>
    </section>
  );
}
