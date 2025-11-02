# Contributing

Thanks for your interest in improving this Codex repo template! This document explains how to propose changes and work locally.

## Before You Start

- Read `AGENTS.md` for operational guidelines (use `rg`, read limits, JSON with `jq`).
- Keep changes minimal, focused, and template-friendly.

## Local Workflow

- Run `make run [profile]` to start Codex in this repo.
- Run `make resume` to continue your last session.
- Optional: `make setup` (macOS/Homebrew) installs `ripgrep`, `fd`, `jq` and runs a setup prompt.

## Prompts

- Add prompts under `.codex/prompts/`. Files in this directory are allowlisted in `.gitignore`.
- Example one-shot exec:

  ```sh
  CODEX_HOME="$(pwd)/.codex" codex exec --profile default -C . "$(cat .codex/prompts/your-prompt.md)"
  ```

## Commit Style

- Use Conventional Commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`.
- Present tense, small PRs. Include rationale when non-obvious.

## Pull Requests

- Describe the change, why it’s needed, and how it was validated.
- Include CLI output or screenshots for UX/CLI-facing adjustments.

## Scope

- Avoid project-specific opinions that don’t generalize to most users.
- Keep optional integrations (CI, cross-platform install, language tooling) out of scope unless explicitly requested.

