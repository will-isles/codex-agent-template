# Codex Agent Repo Template

Self-contained template for projects using the Codex CLI. Works for coding and non-coding tasks, with simple make targets and guidance for fast, repeatable workflows.

## Quickstart

- Prerequisites: `codex` CLI, `rg` (ripgrep), `fd`, `jq`.
- Commands:
  - `make run [profile]` — start Codex in this repo (default profile: `default`).
  - `make resume` — resume the last session using the same `CODEX_HOME`.
  - `make setup` — optional; installs `ripgrep`, `fd`, `jq` via Homebrew and runs a setup prompt.
  - `make doctor` — checks required tools and template files.

The repo uses a local workspace directory at `.codex/` as `CODEX_HOME` for session state. Sessions persist across runs and are isolated per clone of this template.

## How It Works

- `CODEX_HOME` is set to `.codex/` by the Makefile; environment variables from `.codex/.env` are auto-loaded if present.
- See `AGENTS.md` for execution norms (use `rg` over `grep`, file read limits, and JSON handling with `jq`).

## Add Prompts

Create prompt files under `.codex/prompts/` (e.g., `triage.md`, `write-docs.md`). You can:

- Paste a prompt’s contents into an interactive `make run` session, or
- Execute a prompt in one shot with Codex CLI:

  ```sh
  CODEX_HOME="$(pwd)/.codex" codex exec --profile default -C . "$(cat .codex/prompts/your-prompt.md)"
  ```

Prompts are ignored by default via `.gitignore`, but paths under `.codex/prompts/**` are allowlisted for commit.

Included prompts:
- `.codex/prompts/setup-fast-tools.md` — primes the agent to use `rg`, `fd`, `jq`, and concise reads.
- `.codex/prompts/triage.md` — scopes a task and proposes a plan.
- `.codex/prompts/write-docs.md` — improves onboarding/docs with minimal changes.
## Troubleshooting

- “codex CLI not found”: Install `codex` and ensure it’s on your `PATH`.
- Missing `rg`/`fd`/`jq`: Install via your OS package manager or use `make setup` on macOS with Homebrew.
- Environment variables: Create `.codex/.env` (or `.codex/.env.example` for sharing) and re-run `make run`.

## Contributing & Governance

- Guidelines: see `CONTRIBUTING.md` and `AGENTS.md`.

## License

This template is available under the MIT License — see `LICENSE`.
