# B-002 aide-memoire 4/7 — Mission & Vision architecture and voice

## Operator's concerns, in sequence

1. Wanted the M&V for a generic Buzz's project in entirely non-tech language —
   Vision (nouns and adjectives) painting the working experience after a year
   or two; Mission (verbs and adverbs) laying out how the Vision is realized.
   Beaverdam's own M&V may carry some tech language about how FOSS communities
   operate.
2. On seeing the first drafts: noticed their audience was unconsciously the
   AI in each case. Proposed **four** M&V sets, not two — the human-targeted
   set must be shorter, narrative not declarative, no bullets, an appealing
   story; per classical M&V doctrine: engaging, realistic, achievable,
   meaningful. Asked whether Roger held a different concept of M&V.
3. On seeing the README draft: the style was "technically correct but stiff
   and intimidating." Target reader: a small operator/owner, smart enough to
   do due diligence, knowingly entering very new territory.

## Roger's responses

1. First drafts delivered (operator's verdict: right content, wrong implicit
   audience — superseded by 2). **Status: rejected as written, recycled into
   the AI-facing renderings.**
2. Validated the operator's concept fully (it matches the classical doctrine —
   Collins & Porras) and observed the parent project had repurposed M&V as
   alignment infrastructure for an AI workforce. Added one structural rule:
   **the human-facing pair is canon; the AI-facing pair is derived and must
   trace to it line by line** — divergence is a bug, usually in the AI
   version. **Status: approved** (the doctrine shipped in the README the
   operator approved).
3. Articulated the style spec: answer due-diligence questions in order of the
   reader's anxiety; reader as actor in second person; defuse jargon at first
   touch in passing; reassure with checkable facts, not imagery; demystify
   rather than romanticize; "I wrote a constitution; you're writing a
   welcome." **Status: approved** ("Yes I'd like you to rewrite in that
   spirit").

## Where the artifacts live

- Human-facing canon + welcome voice: `README.md` (public).
- Full doctrine, AI-facing renderings, component→promise mapping:
  `internal_docs/mission_and_vision.md`.
