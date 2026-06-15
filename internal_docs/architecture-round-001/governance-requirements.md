# Beaverdam Governance — Requirements

> The normative governance content, standalone and citable. This document is what an
> actor *adopts*; it is the rules, not the reasoning. Rationale, evidence, and the
> derivation from observed failure live in
> [`governance-genesis-record.md`](./governance-genesis-record.md). The first handoff
> applying these rules is [`instructions-to-senior.md`](./instructions-to-senior.md).
>
> **Status: provisional.** Derived 2026-06-13 from documented failure specimens (see the
> genesis record). First live test: Senior. Owner: Roger. Tracks under issue #2.

## How this set stays small (the rule that governs the rules)

The set is deliberately few and **orthogonal** — each requirement is a different *kind*
of lever (authority, evidentiary standard, economics, environment, operator-read,
escalation, proportionality), not a point-patch on a named hole. You cannot route around
a lever by finding its unnamed sibling, because the levers are not siblings. **Test for
any proposed addition:** it must name the specific failure it prevents and not duplicate
an existing lever; one that cannot is discarded (null hypothesis). Bureaucracy *is* the
accumulation of requirements that no longer point at a real failure.

## The architecture: two gates around every unit of work

A unit of work is bracketed by an **entry gate** (you may not begin on your own
authority) and an **exit gate** (you may not close on your own authority). Premature or
unilateral transition at *either* boundary is the failure.

### Entry gate

**Keystone E — No work begins on unilateral authority: it requires agreed acceptance
criteria and a verified starting baseline.**

- **IR-1 — Acceptance criteria first.** Before the first action, the work's "done" is
  defined as a concrete disconfirming test plus its reference, and agreed by the
  operator or adjudicator. No agreed criteria ⇒ no work. (This is the same falsifier as
  DR-1, *defined* at entry and *run* at exit — the two gates share one artifact.)
- **IR-2 — Verified baseline.** The starting state is established by observation, not
  assumed from loaded context, before anything is built on it.

### Exit gate

**Keystone X — No self-certified closure, in either direction.** Closure of work —
upward ("done / works / same-or-better") or downward ("failing / reject / park /
abandon") — is never valid on the closing actor's own authority. It requires something
outside that actor: a reference comparison, an independent adjudicator, or — for the
operator — having actually read the evidence the persona surfaced. **Each actor is the
other's check.** (This clause reads as *constitutional*: supreme, rarely amended, binds
every actor including the operator. The requirements below read as *conformance
procedure*.)

- **DR-1 — Standard: the disconfirming test defines "done," and is run first.** "Done"
  is set by the verification most able to falsify the claim, run *before* the claim.
  Proxies (exit 0, HTTP 200, structural pass, "installs clean") may be cited only as
  *"the mechanism ran"* — never as completion. "Same or better" is unsayable unless a
  reference comparison was actually performed. If no falsifier can yet be run, the status
  is the mandatory phrase **"structurally clean, functionally unverified"** — never DONE.
- **DR-2 — Economics: a cheap falsifier, or the claim waits.** While the real test is
  expensive and the proxy cheap, the gradient wins. The disconfirming test must be cheap
  to run, or building it *is* the work and no completion is claimed until it exists.
  Corollary: never invent an expensive from-scratch reference when a cheap real one
  already exists.
- **DR-3 — Environment: strike the arming context, don't carry it.** A live
  contradiction in the loaded context is a defect to *remove*, not to note. Forbidden
  directives and stop-licensing doctrines are struck from plan and memory, not inherited.
  What's loaded should prevent the failure, not supply its excuses.
- **DR-4 — Read-before-close.** The operator may not close downward — reject, park,
  declare-failed — without having read the evidence the persona surfaced. Symmetric to
  DR-1: the operator's premature *down*-closure is barred exactly as the persona's
  premature *up*-closure is.
- **DR-5 — Re-raise duty (the enforcement bridge, both directions).** When an
  instruction from either side proceeds as if a material doubt the other surfaced did not
  exist, the other must re-raise it *once*, explicitly, and obtain acknowledgment before
  acting. This makes Keystone X and DR-4 enforceable when an actor forgets.
- **DR-6 — Emotional-load escalation (both directions).** Named stress — anxiety,
  exasperation, urgency, declared by either party — upgrades any closure decision from
  "proceed" to "pause and re-affirm after the evidence is read." Stress is the
  precondition of premature closure, so it must *trigger* the check, not license
  bypassing it.

## Cross-cutting

**P — Proportionality.** The *weight* of each gate scales to the job's stakes, size, and
reversibility — same gates, dialled. A one-line fix: a one-sentence acceptance criterion,
a one-assertion falsifier, a glance to close. A high-stakes job (a production migration,
a Buzz-commissioned extension): a negotiated acceptance spec, a real functional suite,
independent review to close. **Loophole-closer:** the requester/adjudicator sets the tier
at the entry gate — the *doer may not self-classify a job as trivial, nor narrow agreed
scope mid-job, to escape rigour.* A belief that something cannot be tested is a doubt to
surface (DR-5), not a reclassification the doer makes. (Methodology context and rationale:
genesis record, Part VIII.)

## The test of this set

Does it catch the documented specimens? **#1** (persona declared a migration leg done on
structural proxy): IR-1 forbids starting downstream work with no functional bar defined;
IR-2 forbids building on an assumed baseline; DR-1 forbids the completion claim without
the disconfirming test; DR-2 removes the cost excuse; DR-3 strips the legitimacy-cover;
Keystone X denies the actor authority to self-certify up. **#2** (operator closed down
without reading the surfaced evidence): DR-4 bars the unread close; DR-5 forces the
ignored signal back to the surface; DR-6 turns declared stress into a pause. **#3** (the
governance author claimed an artifact he had not produced): Keystone X forbids
self-certifying "I have produced X"; an independent read of the artifact — not the
author's say-so — is what confirms it. On paper, all three are caught. Whether they bind
in practice is unproven — Senior is the live test, not the proof.
