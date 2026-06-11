---
comet_change: standardize-agents-blueprint-workflow
role: technical-design
canonical_spec: openspec
---

# AGENTS Blueprint Workflow Design

## Technical Approach

Implement the confirmed C-full approach:

- Add a root-level `AGENTS.md` that governs the entire repository.
- Add a root-level local gate script at `scripts/check-agents-workflow.sh`.
- Wire the gate into `.github/workflows/blueprint.yml` before Lean setup and render steps.

The root `AGENTS.md` is the primary control surface for agents. It should stay concise, operational, and tied to current repository facts. The gate script should check stable references and commands rather than large prose blocks, so normal wording changes do not cause brittle failures.

## Components

### Root `AGENTS.md`

`AGENTS.md` should define the default workflow for all repository files unless a deeper `AGENTS.md` overrides it. It should cover:

- Initial context reads: root README, `blueprint-verso/README.md`, and task-relevant source, script, workflow, or OpenSpec files.
- Work-type branches:
  - blueprint content changes,
  - process/documentation/OpenSpec-only changes,
  - render, preview, publish, script, or CI changes.
- Render policy for blueprint content changes.
- Tracked output policy for `blueprint-verso/_out/`.
- Verification expectations.
- Commit scope and commit-message conventions.
- OpenSpec/Comet boundaries for future process or behavior changes.

### Local Gate Script

`scripts/check-agents-workflow.sh` should be a short Bash script with no external dependencies. It should fail fast when:

- `AGENTS.md` is missing or empty.
- Required stable references are missing from `AGENTS.md`, including:
  - `blueprint-verso/README.md`,
  - `./scripts/ci-pages.sh`,
  - `blueprint-verso/_out/`,
  - `openspec validate`.
- `.github/workflows/blueprint.yml` does not call `scripts/check-agents-workflow.sh`.

The script should avoid checking paragraph text or exact prose. Its purpose is to keep the workflow contract present, not to lint style.

### GitHub Actions Integration

Add an early step in `.github/workflows/blueprint.yml`:

```yaml
- name: Check AGENTS workflow
  run: bash scripts/check-agents-workflow.sh
```

The step should run after checkout and before Lean setup. This makes workflow drift fail quickly without paying the cost of setup, cache restore, render, upload, or deploy.

## Data Flow

The implemented flow is:

```text
Agent / maintainer changes workflow files
        |
        v
AGENTS.md defines required development rules
        |
        v
scripts/check-agents-workflow.sh checks stable workflow references
        |
        v
GitHub Actions runs the gate before blueprint render/deploy
```

For blueprint content changes, the flow remains:

```text
Edit blueprint source
        |
        v
cd blueprint-verso && ./scripts/ci-pages.sh
        |
        v
Review source + tracked _out changes
        |
        v
Commit with existing docs/render style
```

## Trade-offs and Risks

- The gate is intentionally shallow. It verifies that the important workflow hooks exist, but it does not prove every instruction is semantically correct.
- A strict prose linter would catch more drift, but it would be fragile and expensive to maintain.
- CI will now fail if the AGENTS workflow contract is broken. This is desired for C-full, but the gate must remain stable and easy to update.
- Process-only changes should not trigger blueprint rendering. `AGENTS.md` must make that exception explicit to avoid unnecessary slow work.

## Testing Strategy

Implementation should be verified by:

- Reviewing `AGENTS.md` against root README, `blueprint-verso/README.md`, `blueprint-verso/scripts/ci-pages.sh`, `blueprint-verso/scripts/serve.sh`, `blueprint-verso/scripts/publish.sh`, and `.github/workflows/blueprint.yml`.
- Running `bash scripts/check-agents-workflow.sh`.
- Running `openspec validate standardize-agents-blueprint-workflow`.
- Confirming no blueprint render is required because this change affects process documentation, a gate script, and CI wiring only.

## Spec Patches

OpenSpec proposal, design, delta spec, and tasks were already patched to include:

- local AGENTS workflow gate,
- GitHub Actions gate,
- C-full scope.

No further spec patches are pending.
