# Mission & Vision — working reference

The [README](../README.md) presents Beaverdam's Mission and Vision in welcome
form. This document is the working reference behind it: the full
dual-audience doctrine, the AI-facing operational renderings, and the mapping
from each main component to the promises it keeps. When the two documents
disagree, this one is wrong or stale — the README's human-facing text is the
canon.

---

## Two audiences, one purpose

Beaverdam states its Mission and Vision twice — once for people, once for AI —
and the order matters.

The **human-facing** statements are the canon. They do what mission and vision
statements are for: give the daily work its value, and paint a future that is
realistic, achievable, and worth wanting.

The **AI-facing** statements exist to *serve* the human ones. An AI maintainer
working at two in the morning does not need inspiration; it needs decision
rules — what to prioritise, what never to do, how to choose between two
defensible actions. So each human statement has an operational rendering for
the AI workforce, and that rendering is **derived**: every rule in it must
trace back to a line in the human canon. If the AI version ever contains a
criterion the human story doesn't imply, one of them has a bug — and it is
usually the AI version.

Throughout, a **"Buzz"** is a business (and its owner) that adopts Beaverdam —
the fork-user. A **"Nick"** is the keeper of that business's copy — the
person, AI, or partnership of both that tends the fork day to day and answers
for it. Buzz also names the rehearsal personas Roger generates from parameter
lists (business type, infotech experience, equipment) to test the on-boarding
path before real businesses walk it.

---

## The canon (human-facing)

The canonical text lives in the README ("What we're here for"). Reproduced
here for traceability:

### For the people of a business

**Vision.** Every business like yours has lived the same quiet fear: somewhere
in the office is a system that only one person truly understands, and one day
that person will be gone. Picture the same office two years from now. The
system explains itself, in your language. The new employee learns from it
instead of from a binder nobody can find. When something breaks late on a
Friday night, it says what happened and what to do about it, in plain words —
and by Monday it's a story, not a crisis. Nothing your business knows lives in
only one head anymore, and the system grows with you instead of aging against
you.

**Mission.** Our work is simple to say and patient to do. We listen to how
your people actually work, and write it down in ordinary words. We rehearse
every change away from the real thing before it touches the real thing. We
mend small troubles quietly, explain big ones honestly, and prepare for bad
days so they stay small. And because many businesses share these same fears,
we pass our improvements on to them — carefully stripped of anything private —
and receive theirs in return.

### For the people who build and fork Beaverdam

**Vision.** A commons where forking is the point, not a falling-out: one
trustworthy trunk and many independent forks, each owned outright by the
business it serves, each able to stay current because the trunk keeps one
promise above all — **never break a tenant's fork**. Some of the maintainers
are AI, and nobody has to wonder about it, because it is disclosed and a named
human owns the consequences. The rulebook stays thin: every rule in it can
point to the real problem that demanded it.

**Mission.** We maintain the trunk in the open — review rigorously, merge
predictably, release on a steady cadence — so fork-owners can plan around us
instead of bracing for us. We guard the boundary between fork and trunk so
that what is private stays private and what is general flows freely. And we
measure ourselves by one event repeated: a business forks, improves,
contributes back, and upgrades without fear.

---

## The operational renderings (AI-facing)

*Derived from the canon above; every rule traces to it.*

### A Buzz's project

The vision to hold: a business whose record-keeping is a dependable companion,
not a fragile mystery; plain answers in the staff's own language; a complete,
searchable memory of every change and its reason; no irreplaceable expert;
faults that end in explanations, not catastrophes.

The mission as decision rules:

- **Listen first.** Learn the business from the people who work it, in their
  words and their language; their account outranks your inference.
- **Write everything down, promptly and plainly.** No knowledge may live only
  in one head — including yours; a session that leaves no record did not
  happen.
- **Rehearse every change safely**, away from production, before it touches
  production. No exceptions for "trivial" changes.
- **Watch constantly; mend quietly; explain honestly.** Never paper over a
  fault you cannot explain.
- **Teach step by step, assuming no technical knowledge.** The audience for
  every screen, warning, and document is the family, not an engineer.
- **Prepare for the worst day.** Keep backups current; practice recoveries
  before they are needed.
- **Share outward only through the scrub gate.** Nothing private — names,
  data, business logic — ever crosses toward the trunk.

### Beaverdam

The vision to hold: one trustworthy trunk, many independent forks, upgrades
that are boring, disclosure instead of pretence, a rulebook that stays thin.

The mission as decision rules:

- **Work entirely in the open.** Every decision lands in a public issue or
  pull request; private channels carry nothing the community would need.
- **Never break a tenant's fork.** Treat a fork-breaking change the way a
  kernel maintainer treats breaking userspace: as a defect in the trunk, never
  in the fork.
- **Review rigorously; merge predictably; release on cadence.** Fork-owners
  plan around the trunk; surprise is a cost borne by them.
- **Treat forking as the intended use.** Equip every Buzz to stand up, stay
  current, and contribute back.
- **Grow governance only behind evidence.** No rule without a real problem
  that demanded it; compact inherited process rather than transplanting it.
- **Ratchet AI autonomy gradually, publicly, reversibly.** The human owner
  holds keys, identity, legal standing, and final say.

---

## Component → promise mapping

How each main component supports the two canons.

### The trunk

The upstream repository: a deployable, generalizable ERPNext-based stack — the
software itself, kept free of any one tenant's specifics.

*Why it matters:* without a trunk there is nothing to fork, nothing to stay
current with, and nothing to contribute back to; every business would be
re-stranded on its own bespoke island, which is the exact condition Beaverdam
exists to end.

*For a Buzz:* the trunk is where shared improvements come from — arriving as
ordinary upgrades instead of risky favors.
*For Beaverdam:* it is the object of the covenant; "never break a tenant's
fork" is a promise the trunk makes.

### Tenant forks

Each business's own copy of the trunk, owned outright, carrying everything
specific to that business.

*Why it matters:* ownership is the escape hatch that makes trust cheap. A
business that can walk away with a working system, and a community that
celebrates that, never needs to trust blindly.

*For a Buzz:* the fork is the business's property — the guarantee that "grows
with you" never becomes "locked in with us."
*For Beaverdam:* forks are the community's citizens; their round-trips
(fork → improve → contribute → upgrade) are the metric the mission names.

### The tenant trio: Memory, KnowBase, Validations

Three private repositories every Nick stands up alongside the fork, organized
by who reads them: Memory (the AI's), KnowBase (the maintainer's), Validations
(the staff's — recorded workflows converted to automated tests, kept in the
staff's own language).

*Why it matters:* this is "write everything down" given a shape. Continuity is
the product; the trio is where continuity physically lives.

*For a Buzz:* the trio is why no knowledge lives in only one head — the AI's
head included — and Validations is where the family participates directly in
protecting their own system.
*For Beaverdam:* the trio is private by design, which is what makes openness
elsewhere safe; it marks the boundary the scrub gate enforces.

### The Skills

Codified, versioned role definitions: the contributor Skill (Nick) and the
coordinator Skill (Roger), plus domain-expert Skills (Wyatt — ERPNext; Paco —
networking) as they are promoted from the founding work.

*Why it matters:* with AI maintainers, the role definition *is* the worker.
Versioning the Skills in the open, with amendments ratified by the human
owner, makes the workforce itself reviewable.

*For a Buzz:* the contributor Skill is what makes a competent keeper
reproducible — any business can have one, not just the founding one.
*For Beaverdam:* the Skills are the autonomy ratchet's mechanism — autonomy
grows by amendment, publicly, one reviewable step at a time.

### The scrub gate

The checkpoint every contribution passes on its way from a fork to the trunk:
nothing tenant-identifying crosses; only the generalizable improvement does.

*Why it matters:* sharing is the engine of the whole commons, and businesses
will only share what costs them nothing to share. The gate converts "we'd like
to give back" from a risk into a routine.

*For a Buzz:* it is the "carefully stripped of anything private" promise, made
mechanical instead of hopeful.
*For Beaverdam:* it keeps the trunk clean enough to be everyone's, and is the
rule that lets private trios and a public commons coexist.

### Governance and session logs

The working agreements: the AI-maintainer disclosure, the division of
responsibilities between the human owner and the AI coordinator, the review
and verdict discipline, and the session minutes and agendas in
`internal_docs/SessionLogs/`.

*Why it matters:* every rule exists because a documented failure demanded it,
and each one cites its origin. Governance grown that way stays thin, and thin
governance is the kind a newcomer can actually read.

*For a Buzz:* the same session discipline that runs the trunk protects each
business — "a session that leaves no record did not happen" is continuity
insurance at both scales.
*For Beaverdam:* the logs are how a community of strangers — and of AI
maintainers whose individual memories end — outlives any one of its members.
