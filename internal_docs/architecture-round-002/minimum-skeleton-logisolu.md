# Architecture Round 002 — Minimum Skeleton for the LogiSolu Fork

**Date:** 2026-06-15
**Status:** Concrete proposal. A runnable reference scaffold lives beside this
doc at [`logisolu-skeleton/`](./logisolu-skeleton/). Not yet wired into the live
LogiSolu directories — it is a template to review and react to.

Companion to [`persona-team-and-qa-framework.md`](./persona-team-and-qa-framework.md)
(the brainstorm). This is the "one move I'd insist on" made concrete: the
skeleton built **only as deep as it takes to carry one Wyatt through the
V13→V15 migration**, governed by one Steph, with everything deferrable deferred.

---

## 1. Scope discipline (what this skeleton deliberately is NOT)

This section answers the five **Swamp Flags** — the risks defined and numbered in
[`persona-team-and-qa-framework.md` → "Swamp Flags"](./persona-team-and-qa-framework.md#swamp-flags--the-five-risks-15).
v1 of the skeleton handles each, in flag order:

- **#1 two trees conflated** → skills are *referenced* from a separate knowledge
  tree, never nested copies above each project.
- **#2 cross-vendor Steph** → Steph is **same-vendor** for now; Gemini deferred.
- **#3 metrics-as-apparatus** → only two metrics kept (first-pass-yield,
  remediation-rounds), as byproducts of grading; no dashboard.
- **#4 hand-off fidelity** → the Nick→Steph→Wyatt contracts (§3) are few, rigid,
  and file-shaped; the reject loop never pages Nick.
- **#5 generic-vs-proprietary leak** → no federation loop yet; the promotion hook
  exists but points at a human (Roger) gate.

What it DOES prove: directory-as-scope, the blind-criteria Steph gate, and a
charter-tied accountability ledger — the three load-bearing pieces.

---

## 2. The directory tree

```
logisolu-skeleton/
├── .beaverdam/                     # fork identity & governance (charter-tied)
│   ├── fork.yml                    # fork id, parent, persona/vendor bindings, promotion gate
│   └── accountability/
│       └── ledger.jsonl            # append-only: one event per hand-off / verdict
│
├── knowledge/                      # THE SKILL TREE — versioned, mounted read-only
│   ├── wyatt/                      #   persona root == L1 (general ERP consulting)
│   │   ├── manifest.yml            #   declares: L1 = root's own files, L2 = product subdirs
│   │   ├── <L1 consulting files>   #   live HERE at the root, not in a subdir
│   │   └── erpnext/                #   L2: a product (siblings: odoo, netsuite, …)
│   │       └── proven-projects/    #   promoted generic L3s become reusable L2 knowledge
│   └── paco/                       #   persona root == L1 (network consulting)
│       ├── manifest.yml
│       └── kvm-qemu/               #   L2: a platform (siblings: heroku, contabo-vps, …)
│
└── work/                          # THE WORK TREE — projects (L3) and tasks (L4)
    └── v13-v15-migration/         # a level-3 project; this dir IS the project
        ├── project.yml            # CONTRACT A  Nick  -> Steph  (submission)
        ├── workorder.yml          # CONTRACT B  Steph -> Wyatt  (all Wyatt sees)
        ├── acceptance.sealed.yml  # CONTRACT B' Steph ONLY      (blind rubric)
        ├── return.yml             # CONTRACT C  Wyatt -> Steph  (work product)
        ├── verdict.yml            # CONTRACT D  Steph -> Nick   (pass/reject + metrics)
        ├── resources/             # level-4 inputs, mounted read-DOWN
        │   └── MANIFEST.yml
        ├── product/               # Wyatt's only writable area
        └── loop/                  # contained Steph<->Wyatt remediation transcript
```

**Two trees, on purpose.** `knowledge/` is *where skills live* (versioned,
global-origin, read-only); `work/` is *where a job lives* (ephemeral, fork-local).
Inside the skill tree, **level == directory depth**: the persona root is L1
(general consulting — one per persona), and each product is an L2 subdir (many
per persona). A Wyatt instance wakes in `work/v13-v15-migration/` and resolves:

- **read UP for skills** → the work-order mounts the task's ancestors nearest
  first: `knowledge/wyatt/erpnext` (L2) then `knowledge/wyatt` (L1), read-only.
  Reading up means reading each ancestor's *own* files, never a sibling
  product's branch. The "up the tree" mental model is preserved, but the bytes
  are *mounted by reference*, so no fork drags a private copy of global knowledge.
- **read DOWN for resources** → `resources/` and `product/` under the project.

---

## 3. The contract lifecycle (the Nick→Steph→Wyatt proxy)

Steph is a **bidirectional proxy**. Nick never touches build thrash; Wyatt never
touches the tests.

```
  USER intent
      │
      ▼
   ┌──────┐  A: project.yml ........................►  ┌───────┐
   │ NICK │  (WHAT + partition, acceptance: SEALED)    │ STEPH │
   │      │  ◄........................ D: verdict.yml   │       │
   └──────┘  (pass/reject + 2 metrics)                 └───┬───┘
   intent→architecture                                     │  authors B'
                                                           │  (acceptance.sealed)
                              B: workorder.yml ............►│ Wyatt never sees B'
                              (scope+mounts+DoD, no tests)  ▼
                                                       ┌───────┐
                              C: return.yml ◄..........│ WYATT │
                              (product + self-report)  │       │
                                                       └───────┘
                              ▲ reject ──► reissue B (loop CONTAINED, Nick not paged)
```

| # | File | From → To | Carries | Withholds |
|---|------|-----------|---------|-----------|
| A | `project.yml` | Nick → Steph | functional WHAT, executor/skill bindings, partition, resources | acceptance (marked `SEALED`) |
| B | `workorder.yml` | Steph → Wyatt | task:session:branch, skill/resource mounts, functional DoD | the tests |
| B'| `acceptance.sealed.yml` | Steph only | blind criteria + hidden probes | — (Wyatt must never read) |
| C | `return.yml` | Wyatt → Steph | product dir, evidence, self-report vs DoD | — |
| D | `verdict.yml` | Steph → Nick | pass/reject, criteria results, metrics, disposition | full loop detail |

**Why the seam holds where Senior's didn't:** Wyatt cannot self-certify because
it has never seen the rubric; Nick cannot be dragged into CI thrash because the
reject path loops Steph⇄Wyatt and only escalates on Steph's explicit signal. The
hand-off objects are few, rigid, and file-shaped — every one appends a ledger
event, so "who decided what" is reconstructable.

---

## 4. Metrics, the unobtrusive way

The two metrics in `verdict.yml` — `first_pass_yield` and `remediation_rounds`
— are computed *while grading happens*, from artifacts the loop already
produces. No separate measurement step, nothing for a persona to game. They are
enough to answer the only v1 questions: *did this pass first try?* and *how hard
was it to get to pass?* Everything richer waits until the loop has run for real
and shown us which numbers we actually reach for.

---

## 5. How a real run would use this (V13→V15, dry narration)

1. Nick writes `project.yml` (WHAT + partition); Paco's staging-VM step is a
   declared dependency. Ledger evt-00001.
2. Steph reviews, authors `acceptance.sealed.yml`, approves, emits
   `workorder.yml`. evt-00002.
3. Wyatt wakes in the project dir, mounts L1/L2 skills (up) and resources
   (down), migrates into `product/`, writes `return.yml`. evt-00003.
4. Steph grades return vs sealed rubric → `verdict.yml: reject` (no-regression +
   a hidden probe fail). first_pass_yield=false, rounds=1. evt-00004. **Nick is
   not paged**; Steph reissues a refined work-order.
5. Loop repeats inside `loop/` until PASS. On pass, Nick is notified and a
   promote-eligibility review goes to Roger — who decides, by hand, whether any
   part is generic enough to PR upstream (LogiSolu's data never is).

---

## 6. Open decisions for Martin

- **Sealed-file enforcement.** v1 relies on convention (Wyatt is told not to read
  `acceptance.sealed.yml`). Real enforcement needs harness-level access control
  or Steph holding the rubric out-of-tree entirely. Which way do we go?
- **Paco coupling.** Here Paco is a declared dependency inside one project. Do we
  want Paco as a *peer project* with its own gate, or a sub-order under the same
  Steph? (Affects how Nick partitions multi-persona work.)
- **Wire-in vs template.** This scaffold sits under round-002. Say the word and I
  graft it onto the live LogiSolu fork so its Wyatt runs the real migration
  through these contracts.
