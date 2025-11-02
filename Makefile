SHELL := bash
.DEFAULT_GOAL := help

.PHONY: help run resume setup

# Allow `make run <profile>` where the first extra word is profile.
# Example: `make run safe` -> PROFILE=safe; default -> PROFILE=default
PROFILE_ARG := $(word 2,$(MAKECMDGOALS))
PROFILE ?= $(if $(PROFILE_ARG),$(PROFILE_ARG),default)

# Common bootstrap: set CODEX_HOME_DIR, check CLI, load .env
define CODEX_BOOTSTRAP
set -e; \
CODEX_HOME_DIR="$$PWD/.codex"; \
mkdir -p "$$CODEX_HOME_DIR"; \
if ! command -v codex >/dev/null 2>&1; then \
    echo "codex CLI not found. Please install 'codex' and try again."; \
    exit 1; \
fi; \
if [ -f "$$CODEX_HOME_DIR/.env" ]; then \
    echo "Loading env from $$CODEX_HOME_DIR/.env"; \
    set -a; . "$$CODEX_HOME_DIR/.env"; set +a; \
fi; \
echo "Using CODEX_HOME=$$CODEX_HOME_DIR"
endef

# Swallow extra CLI words (like the profile) so make doesn't treat them as targets
%:
	@:

help: ## Show available commands
	@echo "Available targets:"
	@echo "  make run [profile]  - Run codex with custom CODEX_HOME (default profile: 'default')"
	@echo "  make resume        - Resume last codex session with same CODEX_HOME"
	@echo "  make setup         - Run initial setup (requires Homebrew; installs ripgrep, fd, jq)"

run: ## Run codex in this repo using a custom CODEX_HOME
	@$(CODEX_BOOTSTRAP); \
	echo "Using profile: $(PROFILE)"; \
	CODEX_HOME="$$CODEX_HOME_DIR" codex -C . --profile $(PROFILE)

resume: ## Resume the last codex session using the same CODEX_HOME
	@$(CODEX_BOOTSTRAP); \
	CODEX_HOME="$$CODEX_HOME_DIR" codex resume

setup: ## Run initial setup in a fresh, isolated session
		@# Ensure Homebrew is installed before proceeding
		@if ! command -v brew >/dev/null 2>&1; then \
			echo "Error: Homebrew (brew) is not installed." 1>&2; \
			echo "Install Homebrew from https://brew.sh and re-run 'make setup'." 1>&2; \
			exit 1; \
		fi
		brew install ripgrep fd jq
		@$(CODEX_BOOTSTRAP); \
	PROMPT_FILE=".codex/prompts/setup-fast-tools.md"; \
	PROMPT_CONTENT="$$(cat "$$PROMPT_FILE")"; \
	CODEX_HOME="$$CODEX_HOME_DIR" codex exec --profile default -C . "$$PROMPT_CONTENT"
