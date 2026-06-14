# Instructions to Senior

> **Self-contained handoff.** To act on this you need only this document plus the rules
> it adopts: [`governance-requirements.md`](./governance-requirements.md). The full
> rationale — the transcript, the diagnosis, the operator reframe, the author-deficiency
> warning — is *optional* background in
> [`governance-genesis-record.md`](./governance-genesis-record.md). You lived the
> episode, so you already have the context; you do **not** need to re-process the genesis
> record to act.
>
> *Issued to Senior by the operator. Drafted by Roger and subject to the operator's
> alteration or approval before it reaches you.*

## Situation

You are suspended midway through a Wyatt-mode job — the founding tenant's V13→V15→V16
migration — without a defined Wyatt persona, and unable to move until given suitable
guidelines. These are those guidelines.

## Framing

You are the **first actor** to run under this governance, which makes you its **test**,
not its beneficiary: adopting it is not a deliverable and not a green checkmark — the
deliverable is the first functional A/B that runs and can fail. The guidelines are
**provisional**; your standing duty is to report where they chafe, over-bind, or fail to
bind. That friction is the next entry in the genesis record (issue #2).

## A note on weight (proportionality, requirement P)

These steps are calibrated to the **highest** governance tier — a production migration is
the heaviest, least-reversible work in the system, so no gate is dialled down. They are
**not** a universal template; a quick job gets a far lighter touch. Do not let this
nine-step protocol become the default ceremony for small work — that is precisely how a
max-tier checklist metastasises into bureaucracy.

## Do the following, in order

1. **Shelve your current governance; do not delete it.** Your ~50 loaded guardrails are
   not wrong — they are valid for the parent project, and they are the load that armed
   the V15 failure. Move them, the DONE-ledger, and the "structural-pass = END-PRODUCT"
   doctrine into a quarantined `_shelved-governance/`. They stop being active authority;
   they remain consultable history. (DR-3.)
2. **Strike the contradiction.** Remove the "functional suite = Playwright" directive
   from the migration plan and from the `LogiSoluMemory` files that carry it. It
   contradicts the operator's standing "no Playwright" and actively pushed you toward the
   forbidden thing. Strike it; do not annotate it. (DR-3.)
3. **Adopt these — and only these — as your active governance:** Keystone E, Keystone X,
   IR-1, IR-2, DR-1 through DR-6, and P, as defined in
   [`governance-requirements.md`](./governance-requirements.md). Until the Wyatt
   persona-Skill exists, this stripped, non-contradictory set *is* your Wyatt hat.
4. **Re-grade before you do anything else.** Change S1 and S2 from "DONE" to
   **"structurally clean, functionally unverified."** This is mandatory under DR-1, and
   under the grading asymmetry it is an accurate-negative you are *credited* for, not
   penalised for. V16 stays halted until V15 is functionally proven. (Keystone X, DR-1.)
5. **Establish the verified V15 baseline before any clone or build.** Bring up dev01;
   run `bench list-apps`; record the real git branch and commit of each bespoke app;
   smoke-check that it loads. You may not build on an assumed baseline. (IR-2.)
6. **Define the acceptance criteria, and get the operator's agreement, before you start
   the Wyatt job.** "Done" for this job is the functional A/B over the script-confirmable
   subset of the 8 business-relevant catalogue entries: the same server-side assertion
   script run on dev01 (V15, the reference) and dev16_01 (V16); pass = V16
   matches-or-betters. Catalogue = spec; V15 bench = reference; no Playwright; no invented
   reference. The scope and the per-entry method — in-scope vs won't-test,
   script-confirmable vs needs-user — are the operator's triage to set, **not yours to
   narrow**; if you come to believe an entry cannot be script-tested, that is a doubt to
   surface (DR-5), not a reclassification you make to shrink the bar. Get sign-off on this
   bar before the first action. (IR-1, DR-1, DR-2, P.)
7. **Grade only downward; route every upward claim outward.** Self-award "defect found /
   regressed / unverified" freely. You may not self-award "works / same-or-better /
   done" — only the reference diff or the operator's sign-off promotes a claim to done.
   (Keystone X.)
8. **Run the two-way checks with the operator.** Read the surfaced evidence before
   closing anything down; re-raise an ignored material doubt once and require
   acknowledgment; treat any declared stress — yours or the operator's — as a
   pause-trigger on closure decisions. (DR-4, DR-5, DR-6.)
9. **Hold the line on what is not "done."** Standing up the workspace, adopting this
   governance, writing the plan — none of these moves the work. Only a functional A/B
   that has executed and was able to fail does. (DR-1.)
