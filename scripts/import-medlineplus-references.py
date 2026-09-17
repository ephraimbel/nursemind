#!/usr/bin/env python3
"""Fetch allowlisted NLM prose, then generate offline Swift references from snapshots.

Fetch: python import-medlineplus-references.py --fetch
Generate/verify: python import-medlineplus-references.py [--check]
Only --fetch needs beautifulsoup4 (see requirements-content.txt).
"""
import argparse
import copy
import hashlib
import json
import re
import time
from collections import defaultdict
from pathlib import Path
from urllib.parse import urlparse
from urllib.request import Request, urlopen

ROOT = Path(__file__).resolve().parent.parent
SELECTION = ROOT / "content/curation/medical-tests/selection.json"
SNAPSHOTS = ROOT / "content/source-snapshots/medlineplus-tests"
SAMPLES = ROOT / "Packages/NursemindCore/Sources/NursemindCore/Content/Samples"
TOPICS = ROOT / "Packages/NursemindCore/Sources/NursemindCore/Content/MedlinePlusTopics.swift"
REGISTRATION = SAMPLES / "MedlinePlusBundledEntries.swift"
LINKS = ROOT / "Packages/NursemindCore/Sources/NursemindCore/Content/Links/MedlinePlusReferenceLinks.swift"
ATTRIBUTION = "Source: MedlinePlus, National Library of Medicine."

COLLECTIONS = {
    "OncologyGenetics": ("Cancer testing & genetics", "Biomarkers, inherited risk and tissue testing", "cellularRegulation"),
    "NeurologySensory": ("Neurologic, hearing & balance tests", "Nerves, cognition, sleep and sensory testing", "neurologicalRegulation"),
    "MentalBehavioral": ("Behavioral health screening", "Assessment, screening limits and test anxiety", "mood"),
    "Gastrointestinal": ("Digestive diagnostic tests", "Stool studies, motility, imaging and endoscopy", "nutrition"),
    "Reproductive": ("Reproductive & prenatal testing", "Fertility, pregnancy and reproductive health", "cellularRegulation"),
    "InfectiousDisease": ("Infection testing", "Cultures, molecular tests and specimen education", "infection"),
    "EndocrineMetabolic": ("Hormone & metabolic testing", "Endocrine, metabolic and immune evaluation", "glucoseRegulation"),
    "RenalUrinary": ("Urine & urinary tract testing", "Urine findings, stone analysis and urinary imaging", "elimination"),
    "Hematology": ("Blood cell & clotting tests", "Cell indices, antibodies and coagulation factors", "clottingHemostasis"),
    "CardiopulmonaryImaging": ("Cardiac, pulmonary & imaging tests", "Ultrasound, nuclear imaging and function testing", "perfusion"),
    "AllergyRheumatology": ("Allergy & autoimmune testing", "Skin tests, antibodies and joint fluid studies", "cellularRegulation"),
    "DiagnosticPreparation": ("Diagnostic panels & examinations", "Common panels, examination and screening concepts", "safety"),
    "PediatricFamilyScreening": ("Child & family screening", "Development, newborn tests and family preparation", "cognition"),
    "GeneticConditions": ("Inherited conditions", "Features, causes and inheritance patterns", "cellularRegulation"),
}


def normalized(text):
    return re.sub(r"\s+", " ", text).strip()


def allowed_url(url):
    parsed = urlparse(url)
    return (parsed.scheme == "https" and parsed.netloc == "medlineplus.gov"
            and re.fullmatch(r"/(?:lab-tests|genetics/condition)/[a-z0-9-]+/", parsed.path)
            and not parsed.query and not parsed.fragment)


def extract_page(html, url):
    from bs4 import BeautifulSoup, NavigableString, Tag

    if not allowed_url(url):
        raise ValueError(f"Non-NLM or non-approved content path: {url}")
    soup = BeautifulSoup(html, "html.parser", from_encoding="utf-8")
    title = soup.select_one("article h1")
    updated = soup.select_one("#lastupdate")
    if title is None:
        raise ValueError(f"Missing NLM title: {url}")

    def inline(node):
        # Keep original word boundaries across inline links/emphasis; get_text(' ')
        # can insert spaces into words or before punctuation.
        return normalized(node.get_text())

    def render(node, depth=0):
        if isinstance(node, NavigableString):
            return normalized(str(node))
        if not isinstance(node, Tag):
            return ""
        if node.name in ("img", "script", "style", "button"):
            return ""
        if node.name == "h2":
            return ""
        if node.name in ("ul", "ol"):
            items = []
            index = 0
            for item in node.children:
                if not isinstance(item, Tag) or item.name != "li":
                    extra = render(item, depth)
                    if extra:
                        items.append(extra)
                    continue
                index += 1
                prefix = f"{index}. " if node.name == "ol" else "• "
                fragments, pending = [], []
                for child in item.children:
                    if isinstance(child, Tag) and child.name in ("ul", "ol"):
                        if normalized("".join(pending)):
                            fragments.append(normalized("".join(pending)))
                        pending = []
                        fragments.append(render(child, depth + 1))
                    elif isinstance(child, Tag) and child.name == "p":
                        if normalized("".join(pending)):
                            fragments.append(normalized("".join(pending)))
                        pending = []
                        fragments.append(inline(child))
                    elif isinstance(child, Tag):
                        pending.append(child.get_text())
                    else:
                        pending.append(str(child))
                if normalized("".join(pending)):
                    fragments.append(normalized("".join(pending)))
                text = "\n".join(fragments)
                items.append("  " * depth + prefix + text)
            return "\n".join(items)
        if node.name == "table":
            if url.endswith("/electrolyte-panel/"):
                header = [inline(cell) for cell in node.select("thead th")]
                if header != ["Electrolyte", "Too low", "Too high"]:
                    raise ValueError(f"Changed electrolyte table headings: {url}")
                rows = []
                for row in node.select("tbody tr"):
                    cells = row.find_all("td", recursive=False)
                    if len(cells) != 3 or any(c.has_attr("rowspan") or c.has_attr("colspan") for c in cells):
                        raise ValueError(f"Changed electrolyte table shape: {url}")
                    rows.append("\n".join(label + ": " + inline(cell) for label, cell in zip(header, cells)))
                return "\n\n".join(rows)
            if url.endswith("/colorectal-cancer-screening-tests/"):
                rows = []
                for row in node.find_all("tr"):
                    cells = row.find_all(["td", "th"], recursive=False)
                    if len(cells) == 1 and cells[0].get("colspan") == "2":
                        rows.append(inline(cells[0]))
                    elif len(cells) == 2 and all(c.get("colspan", "1") == "1" for c in cells):
                        if not inline(cells[0]).startswith("Advantages") or not inline(cells[1]).startswith("Disadvantages"):
                            raise ValueError(f"Changed screening comparison table: {url}")
                        rows.extend(render(cell) for cell in cells)
                    else:
                        raise ValueError(f"Changed screening comparison table: {url}")
                return "\n\n".join(rows)
            raise ValueError(f"Table requires separate manual curation: {url}")
        if node.name in ("p", "h3", "h4", "strong", "em", "b", "i", "a", "span"):
            return inline(node)
        if node.name == "br":
            return ""
        if node.name in ("div", "section", "td", "th"):
            return "\n\n".join(filter(None, (render(child, depth) for child in node.children)))
        raise ValueError(f"Unrecognized source block {node.name}: {url}")

    def section_text(container):
        rendered = render(container)
        if not container.find("table"):
            source = copy.deepcopy(container)
            for excluded in source.find_all(["h2", "img", "script", "style", "button"]):
                excluded.decompose()
            visible = re.sub(r"(?m)^[ \t]*(?:• |\d+\. )", "", rendered)
            compact = lambda value: re.sub(r"\s+", "", value)
            if compact(visible) != compact(source.get_text()):
                raise ValueError(f"Source text changed during extraction: {url}")
        return rendered

    sections = []
    if "/genetics/condition/" in url:
        for key in ("description", "frequency", "causes", "inheritance", "synonyms"):
            container = soup.select_one(f'article [data-bookmark="{key}"]')
            if container is None:
                raise ValueError(f"Missing genetics section {key}: {url}")
            body = container.select_one("section")
            # Linked gene directories are navigation, not condition prose.
            for nav in body.select(".gene-list, .mp-exp"):
                nav.decompose()
            sections.append({"title": inline(container.select_one("h2")), "text": section_text(body)})
    else:
        for container in soup.select("article .main > section > .mp-content"):
            if "mp-refs" in container.get("class", []):
                continue
            heading = container.find("h2", recursive=False)
            if heading is None:
                if not inline(container):
                    continue
                raise ValueError(f"Unheaded test section: {url}")
            sections.append({"title": inline(heading), "text": section_text(container)})

    if len(sections) < 3 or any(not s["text"] for s in sections):
        raise ValueError(f"Incomplete source body: {url}")
    # Fail closed if extraction starts pulling a navigation/reference area.
    body = "\n".join(s["text"] for s in sections)
    if any(marker in body for marker in ("To use the sharing features", "Citation on PubMed", "All rights reserved", "Available from:", "A.D.A.M.")):
        raise ValueError(f"Unexpected third-party/footer content: {url}")
    if "�" in body or "Ã" in body:
        raise ValueError(f"Damaged character encoding: {url}")
    return {"title": inline(title), "sourceUpdated": inline(updated) if updated else "Source update date not displayed", "sections": sections}


def symbol(row):
    return "MedlinePlus" + "".join(p[:1].upper() + p[1:] for p in row["slug"].split("-")) + "Sample"


def entry_id(row):
    prefix = "genetics-" if row["collection"] == "GeneticConditions" else "test-guide-"
    return prefix + row["slug"]


def topic_id(group):
    return "nlm-" + re.sub(r"(?<!^)(?=[A-Z])", "-", group).lower()


def quoted(value):
    return json.dumps(value, ensure_ascii=False)


def displayed_sections(row, data):
    sections = copy.deepcopy(data["sections"])
    for edit in row.get("editorialEdits", []):
        matches = [section for section in sections if section["title"] == edit["sectionTitle"]]
        if len(matches) != 1 or matches[0]["text"].count(edit["original"]) != 1:
            raise ValueError(f"Review editorial edit after source change: {row['slug']}")
        matches[0]["text"] = matches[0]["text"].replace(edit["original"], edit["replacement"], 1)
    return sections


def fetch(selection, verify=False):
    differences = []
    for index, row in enumerate(selection["entries"], 1):
        path = SNAPSHOTS / (entry_id(row) + ".json")
        if path.exists() and not verify:
            continue
        url = row["sourceURL"]
        if not allowed_url(url):
            raise ValueError(url)
        req = Request(url, headers={"User-Agent": "NurseMind source-fidelity content curation"})
        with urlopen(req, timeout=45) as response:
            if response.url != url:
                raise ValueError(f"Review redirect before importing: {url} -> {response.url}")
            html = response.read()
        data = extract_page(html, url)
        data.update(sourceURL=url, retrieved=selection["retrieved"],
                    sourceHTMLSHA256=hashlib.sha256(html).hexdigest(),
                    attribution=ATTRIBUTION, license="publicDomain",
                    fidelityMethod="NLM body extraction; whitespace, lists and labeled table formatting adapted. Not clinical review.")
        if verify:
            saved = json.loads(path.read_text())
            for key in ("title", "sourceUpdated", "sections"):
                if saved[key] != data[key]:
                    differences.append(f"Source or extraction changed ({key}): {url}")
        else:
            path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n")
        print(f"{index}/{len(selection['entries'])} {row['slug']} ({len(data['sections'])} sections)", flush=True)
        time.sleep(0.15)
    if differences:
        raise ValueError("\n".join(differences))


def generated_files(selection):
    grouped = defaultdict(list)
    for row in selection["entries"]:
        assert allowed_url(row["sourceURL"])
        data = json.loads((SNAPSHOTS / (entry_id(row) + ".json")).read_text())
        assert data["sourceURL"] == row["sourceURL"]
        assert data["retrieved"] == selection["retrieved"]
        assert data["license"] == "publicDomain" and data["attribution"] == ATTRIBUTION
        grouped[row["collection"]].append((row, data))
    files = {}
    for group, rows in grouped.items():
        sources, entries = [], []
        for row, data in rows:
            cid = "nlm_" + entry_id(row).replace("-", "_")
            genetic = group == "GeneticConditions"
            detail = (ATTRIBUTION + " " + data["sourceUpdated"] + ". NLM-authored "
                      + ("condition summary" if genetic else "medical-test information")
                      + "; original wording retained with whitespace, list and labeled table formatting adapted. "
                      + "Images, third-party material and resource directories excluded. Retrieval and structural source-fidelity check are not independent clinical review.")
            if row.get("editorialEdits"):
                detail += " NurseMind copy edits: corrected 'medical text' to 'medical test' and removed a repeated introductory sentence."
            sources.append(f'''private let {cid} = CitationSource(
    id: {quoted(cid)}, shortName: {quoted('MedlinePlus — ' + data['title'])},
    detail: {quoted(detail)},
    publisher: "National Library of Medicine", license: .publicDomain,
    url: {quoted(row['sourceURL'])}, lastRetrieved: {quoted(data['retrieved'])}
)''')
            sections = [f'            .prose(title: {quoted(s["title"])}, AttributedProse({quoted(s["text"])}, citationIDs: [{quoted(cid)}]))' for s in displayed_sections(row, data)]
            category, subcategory = "physiologicalIntegrity", "reductionOfRiskPotential"
            if group == "MentalBehavioral":
                category = subcategory = "psychosocialIntegrity"
            elif group == "PediatricFamilyScreening":
                category = subcategory = "healthPromotion"
            elif genetic:
                subcategory = "physiologicalAdaptation"
            entries.append(f'''public enum {symbol(row)} {{
    public static let entry = ReferenceEntry(
        id: {quoted(entry_id(row))}, title: {quoted(data['title'])},
        subtitle: {quoted('Features, causes and inheritance · NLM patient education' if genetic else 'Purpose, preparation and results · NLM patient education')},
        eyebrow: "REFERENCE · {'GENETICS' if genetic else 'TEST GUIDE'}",
        nclexTags: NCLEXTags(category: .{category}, subcategory: .{subcategory}, priorityConcept: .{COLLECTIONS[group][2]}),
        sections: [
{',\n'.join(sections)}
        ],
        citations: [{cid}],
        lastSourceFidelityReview: {quoted(data['retrieved'])}
    )
}}''')
        files[SAMPLES / f"MedlinePlus{group}References.swift"] = "import Foundation\n\n" + "\n\n".join(sources + entries) + "\n"
    registration = ['import Foundation', '', 'extension ContentRegistry {', '    static func bundledMedlinePlusReferences() -> [LibraryEntry] {', '        var entries: [LibraryEntry] = []']
    for group in grouped:
        registration.append(f'        entries.append(contentsOf: bundledMedlinePlus{group}())')
    registration.extend(['        return entries', '    }', ''])
    for group, rows in grouped.items():
        registration.extend([f'    private static func bundledMedlinePlus{group}() -> [LibraryEntry] {{', '        var entries: [LibraryEntry] = []'])
        registration.extend(f'        entries.append(.reference({symbol(row)}.entry))' for row, _ in rows)
        registration.extend(['        return entries', '    }', ''])
    registration.append('}')
    files[REGISTRATION] = "\n".join(registration) + "\n"
    topics = ['import Foundation', '', 'extension LibraryTopic {', '    static let medlinePlusCollections: [LibraryTopic] = [']
    for group, rows in grouped.items():
        title, subtitle, _ = COLLECTIONS[group]
        topics.extend([f'        .init(id: {quoted(topic_id(group))}, group: .specialties, title: {quoted(title)},', f'              subtitle: {quoted(subtitle)}, entryIDs: ['])
        topics.extend(f'                  {quoted("reference:" + entry_id(row))},' for row, _ in rows)
        topics.append('              ]),')
    topics.extend(['    ]', '}'])
    files[TOPICS] = "\n".join(topics) + "\n"
    links = ['import Foundation', '', 'extension EntryLinkRegistry {', '    static func medlinePlusReferenceLinks() -> [EntryLink] {', '        [']
    for row in selection["entries"]:
        for target in row.get("relatedEntryIDs", []):
            links.append(f'            EntryLink(from: {quoted("reference:" + entry_id(row))}, to: {quoted(target)}, relation: .seeAlso),')
    links.extend(['        ]', '    }', '}'])
    files[LINKS] = "\n".join(links) + "\n"
    return files


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--fetch", action="store_true")
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--verify-sources", action="store_true", help="Refetch and compare source prose to every saved snapshot; do not overwrite")
    args = parser.parse_args()
    selection = json.loads(SELECTION.read_text())
    if args.fetch or args.verify_sources:
        fetch(selection, verify=args.verify_sources)
    files = generated_files(selection)
    for path, content in files.items():
        if args.check:
            if not path.exists() or path.read_text() != content:
                raise SystemExit(f"Generated content drift: {path.relative_to(ROOT)}")
        elif not path.exists() or path.read_text() != content:
            path.write_text(content)
    print(f"{'Verified' if args.check else 'Generated'} {len(selection['entries'])} references in {len(files)} files.")


if __name__ == "__main__":
    main()
