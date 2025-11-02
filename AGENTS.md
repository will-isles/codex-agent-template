# Repository Guidelines

## Build, Test, and Development Commands

- `make run [profile]` — run Codex in this repo with a named profile (default: `default`).
- `make resume` — resume the last Codex session using the same `CODEX_HOME`.
- `make setup` — initial setup for fast tools; requires Homebrew (`brew`) and installs `ripgrep`, `fd`, and `jq` before running the setup prompt.

## Coding Style & Naming Conventions

- Indentation: 4 spaces (Python); Prettier defaults (JS/TS).
- Names: `snake_case` for Python, `camelCase` for vars/functions (JS/TS), `PascalCase` for classes, `kebab-case` for filenames/CLIs.
- Keep functions small; prefer pure utilities; document public APIs with short docstrings/JSDoc.
- Use absolute import roots or clear package paths; avoid deep relative chains (`../../..`).

## Commit & Pull Request Guidelines

- Use Conventional Commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`.
- Commits: small, focused, present tense; include rationale if non-obvious.
- PRs: clear description, linked issues, screenshots/CLI output for UX/CLI changes, checklist of tests/lint passing.

## Security & Configuration

- Never commit secrets; use `.env` and provide `.env.example`.
- Principle of least privilege for keys/tokens; rotate when shared.

<!-- FAST-TOOLS PROMPT v1 | codex-mastery | watermark:do-not-alter -->

## CRITICAL: Use ripgrep, not grep

NEVER use grep for project-wide searches (slow, ignores .gitignore). ALWAYS use rg.

- `rg "pattern"` — search content
- `rg --files | rg "name"` — find files
- `rg -t python "def"` — language filters

## File finding

- Prefer `fd` (or `fdfind` on Debian/Ubuntu). Respects .gitignore.

## JSON

- Use `jq` for parsing and transformations.

## Agent Instructions

- Replace commands: grep→rg, find→rg --files/fd, ls -R→rg --files, cat|grep→rg pattern file
- Cap reads at 250 lines; prefer `rg -n -A 3 -B 3` for context
- Use `jq` for JSON instead of regex

<!-- END FAST-TOOLS PROMPT v1 | codex-mastery -->
