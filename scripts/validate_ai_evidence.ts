import { parseInput } from "../supabase/functions/ai-chat-v2/contract.ts"
import { verifyEvidence } from "../supabase/functions/ai-chat-v2/evidence.ts"

const path = Deno.args[0]
if (!path) throw new Error("Usage: deno run --allow-read scripts/validate_ai_evidence.ts EXPORTED_REQUEST_JSON")
const input = parseInput(JSON.parse(await Deno.readTextFile(path)))
if (!await verifyEvidence(input.context)) throw new Error("The Swift request does not match the deployed evidence manifest")
console.log(`Swift/server contract verified: ${input.citationIDs.size} sources, ${input.context.length} context characters`)
