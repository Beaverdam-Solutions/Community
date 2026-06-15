# logisolu-skeleton — reference scaffold (TEMPLATE, not a live fork)

This is the concrete, touchable form of the minimum skeleton designed in
[`../minimum-skeleton-logisolu.md`](../minimum-skeleton-logisolu.md). Read that
doc first — it explains the two-tree layout and the Nick→Steph→Wyatt contract
lifecycle.

**What this is:** a populated example tree for the V13→V15 migration, with all
five contract objects filled in for round 1 (which deliberately ends in a
`reject` to show the contained remediation loop).

**What this is NOT:** wired into the live LogiSolu fork. Values like timestamps,
session ids, and revisions read `SET-ON-*` — they are stamped at init/run time,
not committed in the template.

Files of interest, in lifecycle order:
- `.beaverdam/fork.yml` — identity, persona/vendor bindings, promotion gate
- `work/v13-v15-migration/project.yml` — Contract A (Nick → Steph)
- `work/v13-v15-migration/workorder.yml` — Contract B (Steph → Wyatt)
- `work/v13-v15-migration/acceptance.sealed.yml` — Contract B' (Steph only)
- `work/v13-v15-migration/return.yml` — Contract C (Wyatt → Steph)
- `work/v13-v15-migration/verdict.yml` — Contract D (Steph → Nick)
- `.beaverdam/accountability/ledger.jsonl` — one append per hand-off/verdict
