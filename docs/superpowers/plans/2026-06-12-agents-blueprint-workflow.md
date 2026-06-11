---
change: standardize-agents-blueprint-workflow
design-doc: docs/superpowers/specs/2026-06-12-agents-blueprint-workflow-design.md
base-ref: a389f4a060d8ee61c8cdece9e35cfad91d0165a2
---

# AGENTS Blueprint Workflow Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a root AGENTS workflow, a local gate script, and a GitHub Actions gate so blueprint development rules are discoverable and enforced.

**Architecture:** `AGENTS.md` is the human-readable and agent-readable workflow contract. `scripts/check-agents-workflow.sh` validates stable critical references in that contract and ensures CI calls the gate. `.github/workflows/blueprint.yml` runs the gate immediately after checkout and before Lean setup/render.

**Tech Stack:** Markdown, Bash, GitHub Actions YAML, OpenSpec/Comet.

---

## File Structure

- Create `AGENTS.md`: repository-wide agent workflow instructions.
- Create `scripts/check-agents-workflow.sh`: no-dependency Bash gate for critical workflow references.
- Modify `.github/workflows/blueprint.yml`: add early AGENTS gate step.
- Modify `openspec/changes/standardize-agents-blueprint-workflow/tasks.md`: check off completed OpenSpec tasks as implementation proceeds.
- Modify this plan file: check off completed implementation steps as they are done.

### Task 1: Root AGENTS Workflow

**Files:**
- Create: `AGENTS.md`
- Modify: `docs/superpowers/plans/2026-06-12-agents-blueprint-workflow.md`
- Modify: `openspec/changes/standardize-agents-blueprint-workflow/tasks.md`

- [ ] **Step 1: Create root AGENTS.md**

Create `AGENTS.md` with this content:

```markdown
# Repository Agent Instructions

This `AGENTS.md` governs the entire repository unless a deeper `AGENTS.md` overrides it.

## Repository Shape

- The root repository is a standalone blueprint repository for `QuadraticNumberFields`.
- The Verso/Lake blueprint package lives in `blueprint-verso/`.
- The rendered static site under `blueprint-verso/_out/` is intentionally tracked.
- The upstream Lean project is consumed through `blueprint-verso/lakefile.toml` and `blueprint-verso/lake-manifest.json`; do not treat this repository as the upstream proof-development workspace.

## Context First

Before editing, read the files that define the current workflow:

- Root README for repository-level dependency, render, and CI expectations.
- `blueprint-verso/README.md` for the Verso package layout, build commands, review checklist, and publishing notes.
- Relevant files under `blueprint-verso/QNFBlueprint/` before changing blueprint content.
- Relevant scripts under `blueprint-verso/scripts/` before changing render, preview, or publish behavior.
- `.github/workflows/blueprint.yml` before changing CI behavior.
- Relevant OpenSpec artifacts under `openspec/changes/` before changing an active OpenSpec/Comet change.

## Blueprint Content Changes

When changing files that affect rendered blueprint content:

1. Edit the source files under `blueprint-verso/QNFBlueprint/`.
2. Run the render from the package directory:

   ```bash
   cd blueprint-verso
   ./scripts/ci-pages.sh
   ```

3. Verify at least these files exist after rendering:

   ```bash
   test -f _out/site/html-multi/index.html
   test -f _out/site/html-multi/-verso-data/blueprint-manifest.json
   test -f _out/site/html-multi/-verso-data/blueprint-html-cache.json
   ```

4. Review and commit the source changes and the tracked `blueprint-verso/_out/` changes as one deliverable unless the user explicitly asks otherwise.

If the render cannot be run, report the exact command attempted and the failure reason.

## Process, Documentation, and OpenSpec Changes

Changes that only affect process documentation, `AGENTS.md`, README files, or OpenSpec/Comet artifacts do not require a blueprint render unless they also change rendered blueprint content.

For substantial process, repository-behavior, or multi-step workflow changes, use OpenSpec/Comet before implementation. Small typo, link, or wording corrections may be made directly.

For active OpenSpec changes, run:

```bash
openspec validate <change-name>
```

## Scripts, CI, and Publishing

- Before changing `blueprint-verso/scripts/ci-pages.sh`, `serve.sh`, or `publish.sh`, read the corresponding script and the publishing section of `blueprint-verso/README.md`.
- Before changing `.github/workflows/blueprint.yml`, read the current workflow and preserve the existing render/deploy behavior unless the user asks to change it.
- Do not commit real hosts, keys, tokens, or local secret values from `.env.local`.

## AGENTS Workflow Gate

The local AGENTS workflow gate is:

```bash
bash scripts/check-agents-workflow.sh
```

Run it after changing `AGENTS.md`, this gate script, or `.github/workflows/blueprint.yml`.

## Commits

- Check `git status --short` before staging.
- Stage only the intended files.
- Keep commit messages consistent with existing history, for example `docs(blueprint): ...`, `render: ...`, or `chore(ci): ...`.
- When the user asks to commit the current workspace, review the staged scope before committing.
```

- [ ] **Step 2: Review AGENTS.md against existing docs**

Run:

```bash
rg -n "blueprint-verso/README.md|./scripts/ci-pages.sh|blueprint-verso/_out/|openspec validate|scripts/check-agents-workflow.sh" AGENTS.md
```

Expected: each pattern appears at least once.

- [ ] **Step 3: Mark OpenSpec documentation tasks complete**

Update `openspec/changes/standardize-agents-blueprint-workflow/tasks.md`:

```text
- [x] 1.1 Review the root README, `blueprint-verso/README.md`, render scripts, publish script, serve script, and GitHub Actions workflow for current behavior.
- [x] 1.2 Identify the exact workflow rules that must be captured in root `AGENTS.md`.
- [x] 2.1 Create root `AGENTS.md` covering the whole repository.
- [x] 2.2 Document context-gathering rules for blueprint source, scripts, CI, generated output, and OpenSpec artifacts.
- [x] 2.3 Document the blueprint content change workflow, including when to run `cd blueprint-verso && ./scripts/ci-pages.sh`.
- [x] 2.4 Document the policy for tracked rendered output under `blueprint-verso/_out/`.
- [x] 2.5 Document verification expectations and commit-message conventions.
- [x] 2.6 Document OpenSpec/Comet usage boundaries for future process or behavior changes.
```

- [ ] **Step 4: Commit Task 1**

Run:

```bash
git add AGENTS.md docs/superpowers/plans/2026-06-12-agents-blueprint-workflow.md openspec/changes/standardize-agents-blueprint-workflow/tasks.md
git commit -m "docs: add blueprint agent workflow"
```

Expected: commit succeeds.

### Task 2: Local AGENTS Workflow Gate

**Files:**
- Create: `scripts/check-agents-workflow.sh`
- Modify: `docs/superpowers/plans/2026-06-12-agents-blueprint-workflow.md`
- Modify: `openspec/changes/standardize-agents-blueprint-workflow/tasks.md`

- [ ] **Step 1: Verify the gate is currently absent**

Run:

```bash
test ! -f scripts/check-agents-workflow.sh
```

Expected: command exits with status 0 before the script is created.

- [ ] **Step 2: Create scripts/check-agents-workflow.sh**

Create `scripts/check-agents-workflow.sh` with this content:

```bash
#!/usr/bin/env bash

set -euo pipefail

failures=0

fail() {
  printf '[agents-workflow] FAIL: %s\n' "$*" >&2
  failures=$((failures + 1))
}

require_file() {
  local path="$1"
  if [ ! -s "$path" ]; then
    fail "$path is missing or empty"
  fi
}

require_text() {
  local path="$1"
  local needle="$2"
  if ! grep -Fq "$needle" "$path"; then
    fail "$path must mention: $needle"
  fi
}

require_file "AGENTS.md"
require_file ".github/workflows/blueprint.yml"

require_text "AGENTS.md" "blueprint-verso/README.md"
require_text "AGENTS.md" "./scripts/ci-pages.sh"
require_text "AGENTS.md" "blueprint-verso/_out/"
require_text "AGENTS.md" "openspec validate"
require_text "AGENTS.md" "bash scripts/check-agents-workflow.sh"

require_text ".github/workflows/blueprint.yml" "bash scripts/check-agents-workflow.sh"

if [ "$failures" -ne 0 ]; then
  printf '[agents-workflow] %d check(s) failed\n' "$failures" >&2
  exit 1
fi

printf '[agents-workflow] all checks passed\n'
```

- [ ] **Step 3: Make the gate executable**

Run:

```bash
chmod +x scripts/check-agents-workflow.sh
```

Expected: command succeeds.

- [ ] **Step 4: Run the gate before CI wiring**

Run:

```bash
bash scripts/check-agents-workflow.sh
```

Expected: FAIL because `.github/workflows/blueprint.yml` does not yet call the gate. The failure should include:

```text
.github/workflows/blueprint.yml must mention: bash scripts/check-agents-workflow.sh
```

- [ ] **Step 5: Mark OpenSpec gate script task complete**

Update `openspec/changes/standardize-agents-blueprint-workflow/tasks.md`:

```text
- [x] 2.7 Create root `scripts/check-agents-workflow.sh` to validate the required `AGENTS.md` workflow references.
```

- [ ] **Step 6: Commit Task 2**

Run:

```bash
git add scripts/check-agents-workflow.sh docs/superpowers/plans/2026-06-12-agents-blueprint-workflow.md openspec/changes/standardize-agents-blueprint-workflow/tasks.md
git commit -m "chore: add agents workflow gate"
```

Expected: commit succeeds.

### Task 3: GitHub Actions Gate Wiring

**Files:**
- Modify: `.github/workflows/blueprint.yml`
- Modify: `docs/superpowers/plans/2026-06-12-agents-blueprint-workflow.md`
- Modify: `openspec/changes/standardize-agents-blueprint-workflow/tasks.md`

- [ ] **Step 1: Add the workflow step**

In `.github/workflows/blueprint.yml`, add this step immediately after the `Checkout` step and before `Setup Lean`:

```yaml
      - name: Check AGENTS workflow
        run: bash scripts/check-agents-workflow.sh
```

- [ ] **Step 2: Verify the gate passes**

Run:

```bash
bash scripts/check-agents-workflow.sh
```

Expected:

```text
[agents-workflow] all checks passed
```

- [ ] **Step 3: Mark OpenSpec CI task complete**

Update `openspec/changes/standardize-agents-blueprint-workflow/tasks.md`:

```text
- [x] 2.8 Add the AGENTS workflow gate to `.github/workflows/blueprint.yml` before Lean setup and render steps.
```

- [ ] **Step 4: Commit Task 3**

Run:

```bash
git add .github/workflows/blueprint.yml docs/superpowers/plans/2026-06-12-agents-blueprint-workflow.md openspec/changes/standardize-agents-blueprint-workflow/tasks.md
git commit -m "ci: enforce agents workflow gate"
```

Expected: commit succeeds.

### Task 4: Final Verification

**Files:**
- Modify: `docs/superpowers/plans/2026-06-12-agents-blueprint-workflow.md`
- Modify: `openspec/changes/standardize-agents-blueprint-workflow/tasks.md`

- [ ] **Step 1: Check AGENTS consistency manually**

Read these files and verify the commands and paths in `AGENTS.md` match them:

```bash
sed -n '1,220p' README.md
sed -n '1,260p' blueprint-verso/README.md
sed -n '1,220p' blueprint-verso/scripts/ci-pages.sh
sed -n '1,220p' blueprint-verso/scripts/serve.sh
sed -n '1,260p' blueprint-verso/scripts/publish.sh
sed -n '1,220p' .github/workflows/blueprint.yml
```

Expected: no mismatches that require edits.

- [ ] **Step 2: Run local gate**

Run:

```bash
bash scripts/check-agents-workflow.sh
```

Expected:

```text
[agents-workflow] all checks passed
```

- [ ] **Step 3: Run OpenSpec validation**

Run:

```bash
openspec validate standardize-agents-blueprint-workflow
```

Expected:

```text
Change 'standardize-agents-blueprint-workflow' is valid
```

- [ ] **Step 4: Record render decision**

Do not run `cd blueprint-verso && ./scripts/ci-pages.sh` for this change unless files affecting rendered blueprint content were edited. This implementation changes AGENTS/process docs, a root gate script, and CI wiring only, so no blueprint render is required.

- [ ] **Step 5: Mark OpenSpec verification tasks complete**

Update `openspec/changes/standardize-agents-blueprint-workflow/tasks.md`:

```text
- [x] 3.1 Check `AGENTS.md` for consistency with the root README, `blueprint-verso/README.md`, and existing scripts.
- [x] 3.2 Run `bash scripts/check-agents-workflow.sh` locally.
- [x] 3.3 Run OpenSpec validation for `standardize-agents-blueprint-workflow`.
- [x] 3.4 Confirm no blueprint render is required for this process-and-CI-only change, or document any reason a render was run.
```

- [ ] **Step 6: Commit final verification checkoffs**

Run:

```bash
git add docs/superpowers/plans/2026-06-12-agents-blueprint-workflow.md openspec/changes/standardize-agents-blueprint-workflow/tasks.md
git commit -m "chore: record agents workflow verification"
```

Expected: commit succeeds, unless the task checkoffs were already included in prior commits.

## Self-Review

- Spec coverage: root AGENTS entrypoint is implemented in Task 1; context gathering, render policy, verification, commit workflow, and OpenSpec/Comet usage are implemented in Task 1; local gate is implemented in Task 2; CI gate is implemented in Task 3; final verification is implemented in Task 4.
- Placeholder scan: no unresolved implementation placeholders are present.
- Type/path consistency: all referenced paths match the current repository layout and the OpenSpec change name.
