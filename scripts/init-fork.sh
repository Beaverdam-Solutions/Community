#!/usr/bin/env bash
# init-fork.sh — Initialize a freshly-cloned Beaverdam fork.
#
# This is the script a generic Buzz runs once, immediately after cloning the
# fork, to bring the machine up to the baseline Beaverdam expects. It is
# IDEMPOTENT and SAFE TO RE-RUN: every step checks before it acts, so running it
# twice changes nothing the second time.
#
# v0 scope — system prerequisites only. Later phases (git-hook installation for
# the pre-push reference-hygiene trap; fork-identity stamping of .beaverdam/
# fork.yml) are stubbed below with TODO markers so the shape is visible without
# pretending to be done.
#
# Usage:   ./scripts/init-fork.sh
# Re-run:  safe, any time.

set -euo pipefail

# ---------------------------------------------------------------------------
# Output helpers
# ---------------------------------------------------------------------------
log()  { printf '  %s\n' "$*"; }
step() { printf '\n==> %s\n' "$*"; }
warn() { printf '  ! %s\n' "$*" >&2; }
die()  { printf '\nFATAL: %s\n' "$*" >&2; exit 1; }

# ---------------------------------------------------------------------------
# Privilege helper — use sudo only when needed, fail clearly if unavailable
# ---------------------------------------------------------------------------
SUDO=""
need_root() {
  if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
    SUDO=""
  elif command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
  else
    die "need root to install packages, but this user is not root and sudo is absent"
  fi
}

# ---------------------------------------------------------------------------
# Prerequisite tools
#
# Map of "command -> apt package" (the two differ: the binary is `rg`, the
# package is `ripgrep`). Add a line here to require another tool; the install
# loop below handles the rest. Kept as a function so the data lives in one place.
# ---------------------------------------------------------------------------
required_tools() {
  # command   apt-package
  cat <<'EOF'
rg ripgrep
EOF
}

ensure_prerequisites() {
  step "Checking prerequisite tools"

  local missing_pkgs=() cmd pkg
  while read -r cmd pkg; do
    [[ -z "$cmd" ]] && continue
    if command -v "$cmd" >/dev/null 2>&1; then
      log "ok: $cmd ($("$cmd" --version 2>/dev/null | head -1))"
    else
      log "missing: $cmd  -> will install '$pkg'"
      missing_pkgs+=("$pkg")
    fi
  done < <(required_tools)

  if [[ ${#missing_pkgs[@]} -eq 0 ]]; then
    log "all prerequisites already present — nothing to install"
    return 0
  fi

  if ! command -v apt-get >/dev/null 2>&1; then
    warn "auto-install needs apt-get, which is absent on this OS."
    warn "install these manually, then re-run: ${missing_pkgs[*]}"
    die  "unmet prerequisites: ${missing_pkgs[*]}"
  fi

  need_root
  log "installing: ${missing_pkgs[*]}"
  $SUDO apt-get update -qq
  DEBIAN_FRONTEND=noninteractive $SUDO apt-get install -y "${missing_pkgs[@]}"
}

# ---------------------------------------------------------------------------
# TODO (later phases) — stubbed deliberately, not half-implemented
# ---------------------------------------------------------------------------
install_git_hooks() {
  step "Git hooks (pre-push reference-hygiene trap)"
  # TODO: point git at a version-controlled hooks dir so the trap travels with
  # the fork (hooks under .git/hooks are NOT cloned):
  #     git config core.hooksPath scripts/hooks
  # Pending the Tier-1 linter (see internal_docs/standards/documentation-standard.md §6).
  log "skipped — not yet implemented (awaiting Tier-1 linter)"
}

stamp_fork_identity() {
  step "Fork identity (.beaverdam/fork.yml)"
  # TODO: instantiate .beaverdam/fork.yml from template, filling SET-ON-INIT
  # values (fork id, created date). See
  # internal_docs/architecture-round-002/logisolu-skeleton/.beaverdam/fork.yml
  log "skipped — not yet implemented"
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
main() {
  printf 'Beaverdam fork initialization (v0)\n'
  ensure_prerequisites
  install_git_hooks
  stamp_fork_identity
  step "Done"
  log "baseline prerequisites satisfied. Re-run any time; it is idempotent."
}

main "$@"
