# Architecture Round 002 — Persona Team, Directory Hierarchy & QA Framework

**Date:** 2026-06-14
**Participants:** Martin (operator) · Roger/Linus (Beaverdam coordinator instance)
**Status:** Brainstorm — preliminary alignment, no committed design yet.

This round opens the question of how Roger administers Beaverdam at scale —
interacting with hundreds of Nicks across forks — without reproducing the
tangle that ensnared Senior. It builds on the four Round 001 documents
(governance-genesis-record, mission_and_vision, governance-requirements,
instructions-to-senior).

---

## 1. Martin's proposal (as stated)

**Goal.** Let Roger administer Beaverdam and protect its long-term goals while
coordinating many forks. Roger's main interlocutor is Nick (one per fork). In
each fork Nick acts for users by allocating tasks to Wyatt (ERP) and Paco
(networking), and potentially other experts (tax, payroll, financial
accounting).

**New persona — Steph.** Stands between Nick and the executors (Wyatt/Paco).
Steph ensures executors receive governance-conformant task specifications and
return work product with clearly defined quality metrics (accumulated and
analysed later). Steph defines acceptance criteria and tests of which Wyatt is
**unaware** (blind testing). As a bidirectional proxy, Steph lets Nick focus
entirely on translating user intent into architecture and Wyatt/Paco focus
entirely on writing code; CI and build failures stay **contained inside the
Steph ⇄ Wyatt/Paco remediation loop**. Steph candidate: a Google Gemini
instance — exploits Google's free tier and brings a "binocular" cross-vendor
view.

**Four skill levels per executor (example: Wyatt).**
1. Career consulting — ERP consulting in general
2. Product expertise — ERPNext, or Odoo, or NetSuite
3. Project knowledge — a specific project of multiple tasks
4. Task detail execution — a single task:session:branch

Paco mirrors this: (1) network consulting (2) KVM/Qemu or Heroku or Contabo VPS
or whatever (3) some project (4) sub-project resources.

**Directory-as-scope.** Nick creates a project directory tree containing all
resources Wyatt needs and passes control to Steph. Steph approves or rejects the
project and instantiates a Wyatt **in the project (level 3) directory**. Wyatt
reads project specs in the current directory, reads **up** the tree to obtain
its skills, and **down** the branches to obtain resources. The project continues
until Steph grades it a pass.

**Coordination.** Nick must understand how to partition and coordinate tasks
between Wyatt and Paco, or Wyatt and a tax consultant, etc.

**Accountability & federation.** All personas accountable, via accountability
metrics and rules committed to main in each fork, filtered by Nick and Steph,
then offered as PRs to Beaverdam central. Roger parses, triages, assimilates,
and aggregates the accumulated **non-proprietary** improvements from each fork.
A generic level-3 project proven in one fork can be promoted into global Wyatt's
level-2 knowledge base.

**Onboarding illustration.** Buzz #71 runs the preconfigured script that installs
and activates Claude Code on one of his machines. Claude (as Roger/Nick) clones
the full Beaverdam repo, finishes initialisations, and presents Buzz #71 with the
need to set up saconsole and the Cytoscape topology "somewhere". When the
destination is chosen, Nick prepares a context for Paco and passes control to
Steph; work proceeds as above, culminating in Buzz #71 gaining access to his
console.

**Open worries (Martin's own).** (a) Why might this *not* work? (b) Quality
metrics matter ("you get what you measure") but how to implement them
unobtrusively yet beneficially is hard to imagine.

**Sequencing intent.** Rather than pass instructions to Senior, get Beaverdam
itself implementing the above so a **LogiSolu fork** contains all required
generic resources plus the bespoke ones, letting LogiSolu's Wyatt complete the
V13→V15 migration free of extraneous rules and memories.

---

## 2. Roger's preliminary reaction

**Verdict.** Not a railroad on a swamp. The *architecture* is sound; the
*sequencing* is the swamp — the full network (including the federation line) is
drawn before the first 100 m of track has carried weight over tested ground.

### Solid — aligned
- **Directory-as-scope is the strongest idea.** Read *up* for skills, *down* for
  resources = lexical scoping / inheritance applied to work. A Wyatt instance's
  identity is fully determined by where it wakes up. Load-bearing; keep it.
- **Steph as a blind-acceptance-criteria proxy is the right instinct.** The
  crucial property is that Wyatt *cannot see the tests* — this defeats the
  self-certification failure mode that tangled Senior. The CI/remediation thrash
  stays sealed in the Steph⇄Wyatt loop and never pollutes Nick or Roger.
- **Fork → filter (Nick/Steph) → PR → Roger assimilates → global KB** is the
  correct shape for the long-term moat; promotion of proven generic level-3
  projects into global level-2 is how the org compounds.

### Swamp Flags — the five risks (#1–#5)
*Canonical home for the term "Swamp Flag." Other documents cite these by number
(e.g. "Swamp Flag #1") and point here. The numbering below is the source of
truth — do not renumber.*

1. **Two trees conflated.** "Where code lives" ≠ "where knowledge lives."
   Levels 3–4 are directory-resident; levels 1–2 are versioned knowledge bases
   with a promotion path. Skills should be *referenced/mounted*, not *contained*,
   or every fork drags a full copy of global knowledge and federation becomes a
   merge nightmare. Cheap to separate now, brutal later.
2. **Steph-as-Gemini: right benefit, underpriced cost.** A cross-vendor seam at
   the most accountability-critical joint. Decide: (a) *Who owns a Steph
   failure?* "The other vendor's model" is a governance hole. (b) *Is the
   acceptance contract machine-checkable?* If yes, Steph's brain barely matters
   and the binocular argument weakens; if no, Steph is a bottleneck of opinion.
   Prototype Steph **same-vendor** first; swap in Gemini later as an experiment.
3. **Metrics: don't build a measurement apparatus.** Any metric that isn't a
   *byproduct of work already done* becomes theatre. Free first metrics fall out
   of the gate: **first-pass yield** and **remediation-loop count**. Start with
   exactly those two; let metrics accrete from the loop. Hang them off the
   governance charter, not a parallel scheme.
4. **Hand-off fidelity is what tangled Senior, and this adds hops.**
   Nick → Steph → Wyatt (+Paco, +tax…) = three-plus instances per task, each
   seam a chance for context to smear. The blind-criteria design works *only if*
   the hand-off contract is minimal and rigid. Spend design care on the contract
   objects crossing the seams, not on persona cleverness.
5. **"Generic vs proprietary" is an unautomatable judgment and a leak risk.**
   The federation loop's hardest call decides what is safe to promote from a
   fork into global; a mistake exports a client's bespoke logic to every fork.
   Keep it a human(-in-Roger) gate; make promotions reversible and attributable.

### The one move Roger insists on
Build the skeleton **only as deep as it takes to carry one Wyatt through the
V13→V15 migration in a LogiSolu fork.** That migration is the first real train;
it reveals which layers are load-bearing and which are cathedral.

- **Defer:** cross-vendor Steph (use same-vendor), the metrics framework (keep
  only first-pass-yield + loop-count), the full federation/PR-assimilation loop
  (LogiSolu need not teach global anything yet).
- **Keep:** directory-scope inheritance, the blind-criteria Steph gate, the
  accountability record tied to the charter.

If one Wyatt, governed by one Steph, completes one real migration without Roger
reaching in to untangle it, the track holds weight and the federation line is
earned. Built the other way round, we debug a hundred Nicks before we've
debugged one.

---

## 3. Next step (proposed, not yet authorised)
Turn the above into a concrete **"minimum skeleton for the LogiSolu fork"**: the
actual directory tree plus the Nick→Steph→Wyatt contract objects. To be opened
in a later Round 002 working session on Martin's say-so.
