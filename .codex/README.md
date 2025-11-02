 # .codex/ (CODEX_HOME)

 This directory is the local workspace for Codex sessions. The Makefile sets `CODEX_HOME` to `.codex/` so every clone has isolated state.

 - Contents you may see:
   - `.env` — session environment variables (auto‑loaded). Do not commit.
   - `.env.example` — shareable example env vars. Safe to commit.
   - `prompts/` — reusable prompt files. Safe to commit.
   - `sessions/` — session metadata/state. Do not commit.
   - `log/`, `history.jsonl` — run logs and history. Do not commit.
   - `auth.json`, `config.*` — local CLI auth/config. Do not commit.

 - Git behavior in this template:
   - The root `.gitignore` ignores sensitive state files under `.codex/` (e.g., `sessions/`, `log/`, `.env`, `auth.json`, `history.jsonl`, `internal_storage.json`, `version.json`).
   - Prompt files and `.env.example` remain tracked by default.

 - Notes:
   - The Makefile automatically sources `.codex/.env` if present.
   - Keep secrets and tokens out of version control; use `.env` locally and `.env.example` for collaborators.
