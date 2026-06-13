# B-002 aide-memoire 7/7 — VPS layout and forum email

*(Host specifics — provider, addresses, ports — are deliberately omitted from
this public record; they live in the coordinator's private memory.)*

## Operator's concerns

1. The spare VPS (6 cores / 16 GB / 100 GB NVMe / 400 Mbit/s, Ubuntu 22.04,
   2 snapshots) should run not just Discourse + the MCP connector API but
   also the full Grafana suite and the Cytoscape topology, with WireGuard
   tunneling into VMs on his three home machines.
2. The founding tenant's ERPNext already sends email from the same hosting
   provider via Google SMTP relay — isn't that also an option for Discourse?

## Roger's responses and receptions

1. **Capacity: comfortably yes** (~6–9 GB projected of 16; disk is the only
   erosion point — set Prometheus/Loki retention from day one). **The real
   decision is public/private segmentation**: the box is simultaneously a
   public service host and a trusted node inside the home mesh — the pivot an
   attacker would want. Layout: Discourse + MCP endpoint public behind one
   reverse proxy; Grafana/Prometheus/Loki/Cytoscape reachable only over
   WireGuard; firewall denies public containers any route to the wg
   interface. Plus: snapshots are not backups (pull backups to home machines
   over the same tunnels); consider reimaging to Ubuntu 24.04 while the box
   is empty (22.04 standard support ends 2027-04); sequence Discourse →
   MCP connector → observability migration. **Status: ignored so far (no
   reaction to segmentation, backups, reimage, or sequencing — operator
   engaged only on email; all four carried to the open-questions list).**
2. **Google SMTP relay: a legitimate bootstrap, already proven in the
   tenant's stack** — relaying via Google sidesteps the provider's IP
   reputation entirely. Two constraints: Gmail's ~500-recipients/day cap
   (free tier) fails silently as a forum's digest fan-out grows, and Gmail
   rewrites the From address (bare gmail.com sender = a small trust tax for
   a due-diligence audience) unless the domain goes onto Workspace.
   Recommendation: **start with the proven Google relay; graduate to a
   transactional provider** when digests flirt with the cap or when sending
   as the project domain matters — a config change, not a migration.
   **Status: open — answered in the session's final exchange; no operator
   reaction yet.**
