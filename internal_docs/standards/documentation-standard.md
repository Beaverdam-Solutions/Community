# Beaverdam Documentation Standard — Reference & Terminology Hygiene

**Status:** Foundational standard. Orthogonal to the architecture rounds — it
governs every document, including onboarding material a Buzz reads before trust
is established. Lives outside `architecture-round-NNN/` on purpose.

**Origin:** distilled from a Round-002 review in which a single cross-reference
— `(swamp flag #1)` — failed three ways at once (see §5). The rules here exist to
make that class of failure mechanically catchable.

---

## 0. Contents
1. [Who this is for](#1-who-this-is-for)
2. [The six placements](#2-the-six-placements)
3. [Two meta-rules](#3-two-meta-rules)
4. [The decision procedure](#4-the-decision-procedure)
5. [Worked example: the swamp-flag defect](#5-worked-example-the-swamp-flag-defect)
6. [Enforcement: the pre-push trap and the Steph gate](#6-enforcement-the-pre-push-trap-and-the-steph-gate)
7. [Not yet built](#7-not-yet-built)

---

## 1. Who this is for

The target reader is a **small-operator Buzz doing due diligence** — competent,
busy, not yet bought in, and unwilling to chase a reference four hops to learn
what a term means. Every rule below serves one goal: a reader resolves any
reference in **one hop**, or needs no hop at all. The opposite evil — pulling
every link of every chain forward into every document — is equally banned.

---

## 2. The six placements

Choose where a reference lives by the question the reader is asking the instant
they hit it.

| Device | Reader's question | Inclusion test | Prevents |
|---|---|---|---|
| **Table of Contents** | "Where, *inside this doc*, is X?" | Is it a heading in this file? | Scrolling to navigate one document |
| **Index** | "*Across the corpus*, where is X discussed?" | Concept in ≥2 docs and a reader might want all of them? | Discussing one concept in several docs with no way to find the canonical one |
| **Glossary** | "What does this *term* mean?" | A coined / non-obvious noun used more than once? | The reader guessing meaning from context and getting it wrong |
| **Footnote / endnote** | "Where's this *from* / what's the caveat?" | Needed for trust or traceability, but would derail the sentence? | Inline citation clutter; orphan claims (e.g. "the brainstorm's") |
| **Parenthetical** | "Give me a one-breath gloss *right here*." | Fits in ≤ ~6 words **and** needs no further lookup itself? | Forcing a lookup for a trivial clarification |
| **No reference** | (none) | Common knowledge, OR defined in this same paragraph, OR a true one-off? | Pulling every link forward into every doc |

**Parenthetical sub-rule (the one most often broken):** if a parenthetical needs
its *own* lookup, it has failed — promote it to a glossary entry, footnote, or
index reference. A parenthetical must be self-contained.

---

## 3. Two meta-rules

These bind the table together; both were violated by the defect in §5.

1. **Canonical home.** Every coined term has exactly *one* defining location,
   registered in the glossary (its meaning) and the index (its locations).
   References point to that home and use its exact name. A reference may **not**
   silently rename its referent.
2. **One hop, stable numbers.** A reference resolves to its answer in a single
   hop. If you cite an item by number ("#1"), the number comes from the
   canonical numbered list at the term's home — never from incidental list order
   in prose. Numbered canonical lists carry a "do not renumber" notice.

---

## 4. The decision procedure

When you write any reference, ask in order and **stop at the first yes**:

1. A heading in *this* document? → **Table of Contents**.
2. Reader needs a term's *meaning*? → **Glossary** (link on first use only).
3. Reader needs to *find it elsewhere* in the corpus? → **Index**.
4. *Provenance or a caveat* that would derail the sentence? → **Footnote**.
5. Settle it in ≤ ~6 words with *no further lookup*? → **Parenthetical**.
6. Obvious, locally defined, or a one-off? → **No reference**.

---

## 5. Worked example: the swamp-flag defect

In `architecture-round-002/minimum-skeleton-logisolu.md`, the phrase
`(swamp flag #1)` failed three ways at once — which is why it was disorienting:

- **Renamed referent** — the target section was titled "Scope discipline," not
  "swamp flag." (Violates meta-rule 1.)
- **Unregistered term** — "swamp flag" had no canonical home; its origin was
  given only as "the brainstorm's," with no link. (Violates meta-rule 1.)
- **Multi-hop resolution** — to verify "#1" the reader had to go to the other
  doc, find an unordered list, count items, and notice the number didn't match
  the prose order. Four hops. (Violates meta-rule 2.)

**The fix applied:** the term was given a canonical, numbered home —
`persona-team-and-qa-framework.md → "Swamp Flags — the five risks (#1–#5)"` with
a "do not renumber" notice — and every citing document now points there by exact
name and number, in canonical order. One hop, no rename, stable numbers.

---

## 6. Enforcement: the pre-push trap and the Steph gate

Enforcement splits by **checkability** — the same principle that keeps a written
standard separate from the persona who applies it. Do not put a language model in
a git hook's hot path: it makes every push slow, nondeterministic, and costly,
and a flaky gate erodes trust faster than no gate.

### Tier 1 — the pre-push trap (deterministic linter)
A fast, offline script run from a `pre-push` hook. It **blocks** the push only on
*mechanically decidable* failures, with a precise message. It catches exactly the
§5 defect class:

- a reference to `#N` that does not resolve to a canonical numbered list;
- an intra-corpus link whose anchor / file target does not exist;
- a **renamed referent** — a cited section title that no longer matches the
  heading it points at;
- a coined Term (capitalised multi-word, or persona/level name) used but absent
  from the glossary;
- numbering drift — a canonical "do not renumber" list whose item count changed.

Block conditions are strictly deterministic, so the trap never flakes. Anything
the linter cannot decide it **warns** (does not block) and tags for Tier 2.

### Tier 2 — the Steph gate (judgment review)
Steph **owns this standard** and performs the reading-comprehension checks a
linter cannot, as an **acceptance criterion** when a document is part of a work
product (not on every push):

- is this parenthetical genuinely self-contained, or does it need a lookup?
- does this recurring term deserve a glossary entry it lacks?
- is this footnote real provenance, or content that should be inline?
- is the placement (§2) right for the reader's question?

Steph's verdict on docs uses the same contract shape as any other work product:
pass / reject with the failing rule cited. Tier-1 warnings arrive as her input.

### Distribution note (fork model)
Hooks under `.git/hooks` are **not** cloned, so for hundreds of forks the linter
and hook must be version-controlled (a committed `hooks/` dir with `core.hooksPath`
set by the fork-init script the onboarding Buzz runs). The trap travels with the
fork; it is not a local courtesy.

---

## 7. Not yet built

This standard *prescribes* a glossary and an index; the corpus does not have them
yet, and the Tier-1 linter is specified here but not written. Both are follow-on
work, to be scoped once the document structure settles.
