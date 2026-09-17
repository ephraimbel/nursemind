import importlib.util
import unittest
from pathlib import Path

spec = importlib.util.spec_from_file_location("nlm_import", Path(__file__).with_name("import-medlineplus-references.py"))
nlm = importlib.util.module_from_spec(spec)
spec.loader.exec_module(nlm)


def fixture(body):
    return ("<article><h1>Example test</h1><div class='main'>" + body
            + "</div></article><span id='lastupdate'>Last updated September 17, 2026</span>").encode()


def section(title, body):
    return f"<section><div class='mp-content'><h2>{title}</h2>{body}</div></section>"


class NLMImportTests(unittest.TestCase):
    url = "https://medlineplus.gov/lab-tests/example-test/"

    def test_copy_edits_preserve_raw_snapshot_and_fail_on_source_drift(self):
        source = {"sections": [{"title": "Overview", "text": "Repeated. Repeated."}]}
        row = {"slug": "example", "editorialEdits": [{"sectionTitle": "Overview", "original": "Repeated. Repeated.", "replacement": "Repeated."}]}
        self.assertEqual(nlm.displayed_sections(row, source)[0]["text"], "Repeated.")
        self.assertEqual(source["sections"][0]["text"], "Repeated. Repeated.")
        with self.assertRaises(ValueError):
            nlm.displayed_sections(row, {"sections": [{"title": "Overview", "text": "Changed."}]})

    def test_only_approved_nlm_paths(self):
        for url in ["https://medlineplus.gov/ency/article/000001.htm",
                    "https://medlineplus.gov/druginfo/meds/a123.html",
                    "https://example.com/lab-tests/example/",
                    "https://medlineplus.gov.evil.example/lab-tests/example/",
                    "http://medlineplus.gov/lab-tests/example/",
                    "https://medlineplus.gov/lab-tests/example/?redirect=elsewhere"]:
            self.assertFalse(nlm.allowed_url(url))

    def test_nested_lists_and_inline_punctuation_survive(self):
        body = section("Overview", '<p>An <em>example</em>, with café and Müller.</p>')
        body += section("Steps", '<ul><li>Parent<ul><li>Child one</li><li>Child two</li></ul></li><li>Next</li></ul>')
        body += section("Limits", '<p>Do <strong>not</strong> omit this qualifier.</p>')
        result = nlm.extract_page(fixture(body), self.url)
        self.assertEqual(result["sections"][0]["text"], "An example, with café and Müller.")
        self.assertEqual(result["sections"][1]["text"], "• Parent\n  • Child one\n  • Child two\n• Next")
        self.assertEqual(result["sections"][2]["text"], "Do not omit this qualifier.")

    def test_references_navigation_and_empty_placeholders_excluded(self):
        body = ''.join(section(t, '<p>Original prose.</p>') for t in ['Purpose', 'Preparation', 'Limits'])
        body += "<section><div class='mp-content'></div></section>"
        body += "<section><div class='mp-content mp-refs'><h2>References</h2><p>Third-party bibliography.</p></div></section>"
        body += "<aside><h2>Related pages</h2><p>Not clinical prose.</p></aside>"
        result = nlm.extract_page(fixture(body), self.url)
        self.assertEqual(len(result["sections"]), 3)
        self.assertNotIn("Third-party", str(result))
        self.assertNotIn("Related pages", str(result))

    def test_prose_inside_source_list_is_not_silently_dropped(self):
        body = section("Procedure", '<ul><li>First action.</li><p>Keep this risk qualifier.</p><li>Second action.</li></ul>')
        body += section("Preparation", '<p>Preparation detail.</p>')
        body += section("Limits", '<p>Result limitation.</p>')
        result = nlm.extract_page(fixture(body), self.url)
        self.assertEqual(result['sections'][0]['text'], '• First action.\nKeep this risk qualifier.\n• Second action.')

    def test_table_values_keep_their_column_labels(self):
        table = '<table><thead><tr><th>Electrolyte</th><th>Too low</th><th>Too high</th></tr></thead><tbody><tr><td>Example</td><td>Low term</td><td>High term</td></tr></tbody></table>'
        body = section('Table', table) + section('Preparation', '<p>Detail.</p>') + section('Limits', '<p>Limitation.</p>')
        result = nlm.extract_page(fixture(body), 'https://medlineplus.gov/lab-tests/electrolyte-panel/')
        self.assertEqual(result['sections'][0]['text'], 'Electrolyte: Example\nToo low: Low term\nToo high: High term')

    def test_unrecognized_or_missing_source_structure_fails_closed(self):
        for body in [section('Only one section', '<p>Partial body.</p>'),
                     section('Table', '<table><tr><td>Unexpected format</td></tr></table>'),
                     '<section><div class="mp-content"><p>Unheaded content.</p></div></section>']:
            with self.assertRaises(ValueError):
                nlm.extract_page(fixture(body), self.url)

    def test_genetics_external_resources_not_imported(self):
        body = ''.join(f'<div data-bookmark="{key}"><h2>{key}</h2><section><div class="mp-content"><p>Original {key}.</p></div></section></div>'
                       for key in ['description', 'frequency', 'causes', 'inheritance', 'synonyms'])
        body += '<div data-bookmark="resources"><h2>External resources</h2><section>Third-party prose.</section></div>'
        result = nlm.extract_page(fixture(body), "https://medlineplus.gov/genetics/condition/example/")
        self.assertEqual(len(result["sections"]), 5)
        self.assertNotIn('Third-party', str(result))


if __name__ == '__main__':
    unittest.main()
