// =============================================================================
// _shared/safety.ts — Server-side enforcement of CLAUDE.md safety rules.
//
// Two layers of regex checking on Feed content:
//
//   1. citationRegex — Every numerical claim must have a nearby [N] citation
//      marker. Enforces the "cite or refuse" rule for the auto-generated
//      Feed content.
//
//   2. clinicalSafetyRegex — Patterns that indicate the AI drifted into
//      forbidden territory (directive dosing, patient-specific advice,
//      image analysis claims). Per FDA CDS safe-harbor + Apple 1.4.2.
//
// Anything that fails either layer is held in `pending_review` for manual
// review; the auto-publish path requires both flags to be true.
// =============================================================================

// Numerical claim detector. Matches numbers (with optional units) that look
// like a clinical fact. We require an inline citation marker [1]...[N] within
// the same sentence for every match.
const NUMERIC_CLAIM = /\b\d+(?:[.,]\d+)?\s*(?:%|mg(?:\/kg)?|mcg(?:\/kg)?|g|kg|mL|L|mmol\/L|mEq\/L|units?|cells?\/mm3|bpm|mmHg|hours?|hrs?|minutes?|mins?|seconds?|secs?|days?|weeks?|months?|years?|patients?|cases?|deaths?)\b/gi

const CITATION_MARKER = /\[\d+\]/

export type CitationCheckResult = {
    passed: boolean
    uncitedClaims: string[]
}

/**
 * Pass criterion: every sentence containing a numerical claim must also
 * contain at least one [N] citation marker.
 *
 * False-positive philosophy: it is better to flag a legitimate claim for
 * manual review (which lands the item in `pending_review` instead of
 * `auto_published`) than to let an uncited claim ship. The pipeline is
 * tuned to be conservative on this gate.
 */
export function checkCitations(body: string): CitationCheckResult {
    const sentences = splitSentences(body)
    const uncitedClaims: string[] = []

    for (const sentence of sentences) {
        // Reset global regex state for each sentence
        NUMERIC_CLAIM.lastIndex = 0
        if (NUMERIC_CLAIM.test(sentence) && !CITATION_MARKER.test(sentence)) {
            uncitedClaims.push(sentence.trim().slice(0, 200))
        }
    }

    return {
        passed: uncitedClaims.length === 0,
        uncitedClaims,
    }
}

// -----------------------------------------------------------------------------
// Clinical safety regex
// -----------------------------------------------------------------------------

type ForbiddenPattern = {
    id: string
    regex: RegExp
    rationale: string
}

const FORBIDDEN_PATTERNS: ForbiddenPattern[] = [
    {
        id: "directive_dosing",
        regex: /\b(give|administer|push|inject|infuse|titrate to)\s+\d+(?:\.\d+)?\s*(?:mg|mcg|g|mL|L|units?)\b/i,
        rationale: "Directive dosing language. Feed content describes evidence; it never prescribes. FDA CDS safe-harbor.",
    },
    {
        id: "patient_specific_advice",
        regex: /\b(your patient|for your patient|the patient should|tell the patient to)\b/i,
        rationale: "Patient-specific recommendation. Apple 1.4.2 + FDA CDS - must not appear to give per-patient guidance.",
    },
    {
        id: "diagnostic_claim",
        regex: /\b(is diagnosed with|diagnose the patient|the diagnosis is)\b/i,
        rationale: "Diagnostic claim. NurseMind is reference + study only, never diagnostic.",
    },
    {
        id: "image_analysis",
        regex: /\b(this (ECG|EKG|X-?ray|CT|MRI|image) shows|interpretation of (this|the) (ECG|EKG|X-?ray|CT|MRI|image))\b/i,
        rationale: "Image/signal analysis. FDA CDS safe-harbor explicitly excludes image/signal interpretation.",
    },
    {
        id: "emergency_self_help",
        regex: /\b(if you are having|if you experience|seek emergency care if|call 911 if)\b/i,
        rationale: "Self-directed emergency advice. Feed is content for licensed users; it never speaks to the patient.",
    },
]

export type ClinicalSafetyResult = {
    passed: boolean
    violations: Array<{ id: string; rationale: string; matched: string }>
}

export function checkClinicalSafety(content: string): ClinicalSafetyResult {
    const violations: ClinicalSafetyResult["violations"] = []
    for (const pattern of FORBIDDEN_PATTERNS) {
        const match = content.match(pattern.regex)
        if (match) {
            violations.push({
                id: pattern.id,
                rationale: pattern.rationale,
                matched: match[0].slice(0, 100),
            })
        }
    }
    return { passed: violations.length === 0, violations }
}

// -----------------------------------------------------------------------------
// Helpers
// -----------------------------------------------------------------------------

function splitSentences(s: string): string[] {
    // Coarse sentence splitter. Splits AFTER sentence-ending punctuation and
    // BEFORE the next capital or `[` (citations sometimes start a sentence).
    return s
        .split(/(?<=[.!?])\s+(?=[A-Z\[])/g)
        .map((x) => x.trim())
        .filter(Boolean)
}
