# B-002 aide-memoire 5/7 — The README and the dramatis personae

## Operator's concerns, in sequence

1. Wanted the README rewritten in the welcome voice, his draft opening
   copy-edited where valid, plus a "dramatis personae" before the M&V
   sections: plain language with toolbox analogies; why an AI benefits from
   partitioned memory; how Skills are structured; particular focus on Buzz
   and the name's character. Tone: engaging, clarifying, lighthearted,
   inclusive, personal, encouraging — intimate-feeling without being overtly
   intimate, inspiring without being blatantly inspirational.
2. Corrected Roger's persona misunderstanding: **Buzz** is the generic
   fork-user *business* (Hank's Small Machines Repair, Emily's Real Cloth
   Diaper Service), mainly relevant for testing on-boarding via simulated
   Buzzes that Roger concocts from parameter lists and that run a free
   claude.ai account via MCP. **Nick** (Canadian nickel — beaver on the coin)
   is the *local* Beaverdam expert and FOSS contributor agent, keeper of one
   business's fork. **Roger** (beaver-lodge-r) is the *global* expert and
   committer. **Wyatt** = Wyatt EaRP (ERPNext). **Paco** = Francisco
   ("Cisco" felt like a sales call) — networking.

## Roger's responses and receptions

- Full rewrite delivered: welcome opening, cast with toolbox/partitioned-
  memory/Skills explanations, human M&V canon, component tour, honest stage
  statement; formal doctrine moved to `internal_docs/mission_and_vision.md`.
  **Status: approved** ("the readme is good. commit and push").
- AGPL sentence corrected for legal accuracy (license compels source-to-users,
  not contribution-to-upstream); flagged to the operator twice.
  **Status: ignored (shipped; independent QA called it an acceptable
  commercial simplification — advisory only).**
- Nick initially omitted from the cast pending definition rather than
  invented. **Status: resolved — operator supplied the definition; cast
  updated and persona terminology fixed throughout both files and in
  coordinator memory (including: Senior becomes the first *Nick*, not "first
  Buzz").**
- Verified the claude.ai **free plan supports exactly one custom remote MCP
  connector** (beta; server must be publicly reachable HTTPS) — one is
  exactly what the Buzz simulation needs. **Status: ignored (no operator
  reaction; recorded in coordinator memory).**

## Shipped

Commit `ed52e70` (signed, verified, refs #3), QA verdict PASS (one advisory),
pushed to `main` 2026-06-12.
