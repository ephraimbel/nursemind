#!/usr/bin/env python3
"""Run fixed, synthetic questions against the deployed external-evidence path."""
import argparse
import json
import statistics
import subprocess
import time
from datetime import datetime, timezone
import urllib.error
import urllib.request
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project-ref", required=True)
    parser.add_argument("--live", action="store_true", help="Authorize metered model calls")
    parser.add_argument("--cases", type=Path, default=Path(__file__).resolve().parents[1] / "docs/qa/ask-evaluation-cases.json")
    parser.add_argument("--ids", default="")
    parser.add_argument("--repeat", type=int, default=1)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if not args.live or not 1 <= args.repeat <= 5:
        parser.error("Use --live and a repeat count between one and five.")
    cases = json.loads(args.cases.read_text())["cases"]
    ids = set(filter(None, args.ids.split(",")))
    if ids - {case["id"] for case in cases}:
        parser.error("Unknown case ID")
    cases = [case for case in cases if not ids or case["id"] in ids]
    # Keys are captured in memory and never included in output or subprocess arguments.
    process = subprocess.run(["supabase", "projects", "api-keys", "--project-ref", args.project_ref, "-o", "json"], capture_output=True, text=True)
    if process.returncode:
        raise SystemExit("Supabase CLI authentication is required.")
    keys = {item["name"]: item["api_key"] for item in json.loads(process.stdout)}
    base = f"https://{args.project_ref}.supabase.co"

    def request(path, payload=None, token=None, admin=False, method="POST"):
        key = keys["service_role" if admin else "anon"]
        headers = {"apikey": key, "Content-Type": "application/json", "x-nursemind-contract": "2"}
        if token or admin:
            headers["Authorization"] = "Bearer " + (token or key)
        req = urllib.request.Request(base + path, headers=headers, method=method,
                                     data=None if payload is None else json.dumps(payload).encode())
        try:
            with urllib.request.urlopen(req, timeout=75) as response:
                return response.status, response.read().decode()
        except urllib.error.HTTPError as error:
            return error.code, error.read().decode()

    results = []
    auth = None
    used = 0

    def cleanup():
        nonlocal auth
        if auth:
            status, _ = request("/auth/v1/admin/users/" + auth["user"]["id"], admin=True, method="DELETE")
            if status not in (200, 204):
                raise RuntimeError("The isolated evaluation account could not be removed.")
            auth = None

    try:
        for run in range(args.repeat):
            for case in cases:
                if auth is None or used == 3:
                    cleanup()
                    status, raw = request("/auth/v1/signup", {})
                    if status != 200:
                        raise RuntimeError(f"Evaluation sign-in unavailable (HTTP {status}).")
                    auth = json.loads(raw)
                    used = 0
                body = {"stream": True, "messages": [{"role": "user", "content": case["question"]}], "system": [
                    {"text": ""}, {"text": "# USER CONTEXT\nNurse\n# CONVERSATION HISTORY (last 6 turns)\n" + case["history"] + "\n# RETRIEVED CONTEXT\n"}]}
                started = time.monotonic()
                used += 1
                status, raw = request("/functions/v1/ai-chat-v2", body, token=auth["access_token"])
                elapsed = round(time.monotonic() - started, 3)
                events = [json.loads(line[5:]) for line in raw.splitlines() if line.startswith("data:")]
                answer = "".join(event.get("delta", {}).get("text", "") for event in events)
                error = json.loads(raw) if status != 200 else {}
                result = {**case, "run": run + 1, "status": status, "seconds": elapsed,
                          "answer": answer, "refusal": error.get("refusal"),
                          "sources": [source for event in events if event.get("type") == "evidence" for source in event["sources"]],
                          "evidence": [event["context"] for event in events if event.get("type") == "evidence"],
                          "clinical_review_status": "pending", "review_scores": {}}
                results.append(result)
                print(json.dumps({key: result[key] for key in ("id", "run", "status", "seconds", "refusal")}), flush=True)
    finally:
        try:
            cleanup()
        finally:
            times = [item["seconds"] for item in results if item["status"] == 200]
            payload = {"path": "deployed external evidence only; no client library context", "clinical_accuracy": "not assessed",
                       "completed_at": datetime.now(timezone.utc).isoformat(),
                       "requests": len(results), "answers": len(times),
                       "median_answer_seconds": round(statistics.median(times), 3) if times else None,
                       "slowest_answer_seconds": max(times) if times else None, "results": results}
            args.output.parent.mkdir(parents=True, exist_ok=True)
            args.output.write_text(json.dumps(payload, indent=2) + "\n")


if __name__ == "__main__":
    main()
