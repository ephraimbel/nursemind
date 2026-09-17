import { FOOTER, validateAnswer } from "./contract.ts"
import { ExternalEvidence } from "./external-evidence.ts"

export function abgQuickReference(question: string, evidence: ExternalEvidence): string | null {
  if (!/\b(?:abgs?|arterial blood gas(?:es)?)\b/i.test(question) ||
    !/\b(?:read|interpret|interpretation|quickly|quick)\b/i.test(question) || /\d/.test(question)) return null
  const generalTerms = new Set("how do can should i we you read interpret an a the abg abgs arterial blood gas gases quickly quick interpretation of explain to me please review teach basic basics".split(" "))
  if ((question.toLowerCase().match(/[a-z]+/g) ?? []).some((term) => !generalTerms.has(term))) return null
  const table = evidence.sources.find((source) => new URL(source.url).pathname === "/books/NBK610839/table/ptxv.tab3/")
  const chapter = evidence.sources.find((source) => new URL(source.url).pathname === "/books/NBK610839/")
  if (!table || !chapter) return null
  const t = `[${table.id}]`, c = `[${chapter.id}]`
  // A source-checked teaching sequence prevents a model from swapping ROME directions or critical cutoffs.
  const answer = `For a quick adult ABG review, use **pH → PaCO2 → HCO3**, then review oxygenation ${t} ${c}.

- **pH:** the adult reference range is 7.35–7.45; below 7.35 is acidic and above 7.45 is alkaline ${t}.
- **PaCO2:** the adult reference range is 35–45 mmHg; when the primary problem is respiratory, PaCO2 moves in the **opposite direction** to pH ${t} ${c}.
- **HCO3:** the adult reference range is 22–26 mEq/L; when the primary problem is metabolic, HCO3 moves in the **same direction** as pH ${t} ${c}.
- **Remember ROME:** Respiratory Opposite, Metabolic Equal ${c}.
- **Oxygenation:** PaO2 measures oxygen pressure and SaO2 measures oxygen saturation ${t}.

${FOOTER}`
  return validateAnswer(answer, new Set(evidence.sources.map((source) => source.id)), evidence.context).length ? null : answer
}
