# B-002 aide-memoire 6/7 — Community collaboration platforms

## Operator's concerns

A recently graduated infotech student is interested in collaborating, forcing
the community-collaboration question. Positive experience with Discourse;
dislikes Discord; lists Matrix, Mattermost, Rocket.Chat "and …?". Has a spare
VPS that could run these plus an API for a Beaverdam connector/plugin for
claude.ai. Asked for thoughts.

## Roger's responses and receptions

- **Discourse, yes, and soon**: the ERPNext community already lives on
  Discourse (arrivals are pre-fluent); posts are permanent, searchable,
  linkable artifacts — the community-conversation form of "a session that
  leaves no record did not happen"; mature REST API means the coordinator AI
  can read and participate. **Status: approved in substance (it was the
  operator's own preference; he proceeded to VPS sizing on that basis).**
- **Dedicated chat: defer per the evidence-first rule** (community is
  currently two humans). When demanded: **Zulip** is the missing name on the
  operator's list and the best fit (FOSS, topic-threaded → archival;
  Rust/Lean/Wikimedia use it); Matrix = principled but Synapse admin +
  federation-spam tax; Mattermost = team-workspace shaped, open-core;
  Rocket.Chat = last (MongoDB, license drift). Interim sweet spot: Discourse's
  built-in chat plugin — one service, one identity, chat promotable into
  topics. **Status: ignored (no operator reaction).**
- **Onboard the student through the front door we're building** (GitHub +
  Discourse + first_dialog) — a willing human is worth fifty simulated
  Buzzes; his arrival raises the **CONTRIBUTING.md + DCO/CLA decision**
  (operator's side of the division of responsibilities). **Status: ignored
  (no operator reaction; flagged again in next-session agenda).**
