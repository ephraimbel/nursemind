import SwiftUI

public struct EditorialStandardsView: View {
    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                EyebrowLabel("EDITORIAL STANDARDS", sparkle: false)
                    .padding(.top, NMSpace.xxl)
                Text("How we know what we say is true")
                    .displayXL()
                    .padding(.top, NMSpace.md)
                Text("Last full content audit · 2026-05-04")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                    .padding(.top, NMSpace.xs)

                Hairline().padding(.vertical, NMSpace.xxl)

                section("THE CURATOR MODEL", body:
                    """
                    NurseMind does not author original clinical claims. We are a curator and an interface — we display, restructure, cite, and assemble content that nursing faculty, federal agencies, and peer-reviewed open-access publications have already published.

                    Every clinical assertion in the Library and every numerical claim in an Ask NurseMind response is tied to a specific source. If we can't cite it, we don't show it.
                    """
                )

                Hairline().padding(.vertical, NMSpace.xxl)

                section("WHERE OUR CONTENT COMES FROM", body:
                    """
                    Foundation tier — used freely with attribution per their licenses:
                    """
                )
                bulletList([
                    "openFDA Drug Label API (FDA Structured Product Labeling) — public domain / CC0",
                    "Open RN Nursing Pharmacology, Health Alterations, Med-Surg, Skills, Mental Health (Chippewa Valley Technical College / NCBI Bookshelf) — CC BY 4.0",
                    "OpenStax Clinical Nursing Skills, Pharmacology for Nurses (Rice University) — CC BY 4.0 with display restriction (we display in the library; AI corpus use of OpenStax pending OpenStax permission)",
                    "VA PBM monographs — public domain",
                    "LiverTox (NIH NIDDK) — public domain",
                    "CDC HICPAC Isolation Precautions, Hand Hygiene, CLABSI / CAUTI / sepsis guidance, ACIP immunization schedules — public domain",
                    "Surviving Sepsis Campaign (PMC OA), ARDS Berlin Definition (PMC OA), CKD-EPI 2021 (PMC OA, NEJM) — CC BY 4.0",
                    "AHRQ TeamSTEPPS, Patient Safety Network, Joint Commission NPSGs (concept citation) — public domain or fact-citation only",
                    "OSHA Bloodborne Pathogens Standard (29 CFR 1910.1030) — public domain"
                ])
                section("", body:
                    """
                    Concept-citation tier — published scoring instruments and clinical guidelines we reference but do not reproduce: TIMI, Killip, HEART, CHA₂DS₂-VASc, HAS-BLED, Wells PE/DVT, Padua, Caprini, MEWS, NEWS2, GCS, Apgar, FLACC, CIWA-Ar, COWS, PHQ-9, GAD-7, Mini-Cog, Centor/McIsaac, Maddrey, Lille, Rockall, Glasgow-Blatchford, MELD, MELD-Na, Bazett & Fridericia QTc, Mosteller BSA, Devine IBW, Mifflin-St Jeor, Adrogue-Madias, Cockcroft-Gault. Each is cited to its original publication; the formula is implemented; the proprietary text of the instrument itself is not reproduced.

                    Off-limits — we do not use: StatPearls (NC-ND license), AHFS PMI, Davis's, Mosby's, Lexicomp, UpToDate, Nursing Central, ATI, Saunders, Lippincott, Kaplan, UWorld, NCLEX item banks, MedlinePlus drug pages and Encyclopedia (A.D.A.M.).
                    """
                )

                Hairline().padding(.vertical, NMSpace.xxl)

                section("ATTRIBUTION PRACTICE", body:
                    """
                    Every Library entry shows its sources at the bottom: full citation, publisher, license, and last-retrieved date. Every clinical bullet within an entry is linked to one or more of those sources.

                    Every Ask NurseMind response that makes a clinical claim must include a citation to a source from the Library. Server-side regex enforcement rejects responses that make numerical claims without citations and asks the model to re-generate.
                    """
                )

                Hairline().padding(.vertical, NMSpace.xxl)

                section("HOW THE AI CO-PILOT WORKS", body:
                    """
                    When you ask a question, NurseMind retrieves the most relevant entries from the curated Library using keyword and semantic matching. The AI is given those entries plus a tightly-scoped system prompt that instructs it to:
                    """
                )
                bulletList([
                    "Answer only from the retrieved sources",
                    "Cite each clinical claim inline",
                    "Refuse to diagnose, prescribe, or interpret medical images",
                    "Refuse to provide patient-specific drug doses",
                    "Refuse to answer non-nursing questions"
                ])
                section("", body:
                    """
                    Responses are validated server-side before being shown. If a response makes a numerical clinical claim without a citation, it is regenerated. If it can't be regenerated cleanly, it falls back to a refusal.
                    """
                )

                Hairline().padding(.vertical, NMSpace.xxl)

                section("WHAT WE DO NOT CLAIM", body:
                    """
                    We do not have a clinical reviewer board. We do not have an in-house clinical advisor. Our content credibility comes from the primary sources we display, not from our editorial judgment of those sources.

                    NurseMind is not clinical decision support. It does not replace independent verification by a licensed provider. It is not FDA-cleared as a clinical decision-support device — by design. We rely on the FDA's CDS safe-harbor criteria: we cite primary sources, never produce directive output ("give X mg"), and do not analyze medical images or signals.
                    """
                )

                Hairline().padding(.vertical, NMSpace.xxl)

                section("REPORTING ISSUES", body:
                    """
                    Found a citation that doesn't match the content? An entry that's drifted from its source? An AI response that violated its own rules? Tell us — every entry has a "Report an issue" link, and Ask responses have a flag button.
                    """
                )
                bulletList([
                    "One report — logged and acknowledged.",
                    "Three reports on the same entry — triggers founder triage within 7 days.",
                    "Triage outcomes: source content drifted (we re-pull and re-publish); wrong source section pulled (we fix the import script); missing context (we omit the section or link out); AI response flagged (we tune the prompt or expand the corpus, never override the citation requirement)."
                ])

                Hairline().padding(.vertical, NMSpace.xxl)

                section("WHEN WE'LL CHANGE THIS POLICY", body:
                    """
                    When we add a clinical reviewer board, we will say so explicitly. When we begin authoring synthesized clinical content, we will name the reviewer of record on each entry. Until then, this page is the truth: we are a curator, and our credibility is the credibility of our sources.
                    """
                )

                Hairline().padding(.vertical, NMSpace.xxl)

                Text("If anything on this page is unclear, email \(LegalLinks.supportEmail). We'll answer.")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                    .padding(.top, NMSpace.lg)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    private func section(_ title: String, body text: String) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            if !title.isEmpty {
                EyebrowLabel(title, sparkle: false)
            }
            Text(text)
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textSecondary)
                .lineSpacing(4)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func bulletList(_ items: [String]) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            ForEach(items, id: \.self) { item in
                HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
                    Text("·")
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textTertiary)
                    Text(item)
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineSpacing(3)
                }
            }
        }
        .padding(.top, NMSpace.sm)
    }
}
