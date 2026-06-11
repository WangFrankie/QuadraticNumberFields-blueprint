## 1. Repository Context

- [ ] 1.1 Review the root README, `blueprint-verso/README.md`, render scripts, publish script, serve script, and GitHub Actions workflow for current behavior.
- [ ] 1.2 Identify the exact workflow rules that must be captured in root `AGENTS.md`.

## 2. Agent Workflow Documentation

- [ ] 2.1 Create root `AGENTS.md` covering the whole repository.
- [ ] 2.2 Document context-gathering rules for blueprint source, scripts, CI, generated output, and OpenSpec artifacts.
- [ ] 2.3 Document the blueprint content change workflow, including when to run `cd blueprint-verso && ./scripts/ci-pages.sh`.
- [ ] 2.4 Document the policy for tracked rendered output under `blueprint-verso/_out/`.
- [ ] 2.5 Document verification expectations and commit-message conventions.
- [ ] 2.6 Document OpenSpec/Comet usage boundaries for future process or behavior changes.
- [ ] 2.7 Create root `scripts/check-agents-workflow.sh` to validate the required `AGENTS.md` workflow references.
- [ ] 2.8 Add the AGENTS workflow gate to `.github/workflows/blueprint.yml` before Lean setup and render steps.

## 3. Verification

- [ ] 3.1 Check `AGENTS.md` for consistency with the root README, `blueprint-verso/README.md`, and existing scripts.
- [ ] 3.2 Run `bash scripts/check-agents-workflow.sh` locally.
- [ ] 3.3 Run OpenSpec validation for `standardize-agents-blueprint-workflow`.
- [ ] 3.4 Confirm no blueprint render is required for this process-and-CI-only change, or document any reason a render was run.
