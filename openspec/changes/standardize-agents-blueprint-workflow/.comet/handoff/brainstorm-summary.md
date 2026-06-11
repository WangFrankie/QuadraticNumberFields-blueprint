# Brainstorm Summary

- Change: standardize-agents-blueprint-workflow
- Date: 2026-06-12

## Confirmed Technical Approach

Implement C-full: create a root-level `AGENTS.md`, add a root-level local gate script, and wire that gate into the existing GitHub Actions blueprint workflow before expensive Lean setup/render steps. The gate should validate stable critical references in `AGENTS.md` and verify that the CI workflow calls the gate. OpenSpec artifacts have been updated to include script and CI gate scope.

## Key Trade-offs and Risks

- Keep the AGENTS document concise enough to be usable, while explicit enough to prevent missed renders and confused `_out/` handling.
- Risk: over-requiring full renders for process-only changes. Mitigation: explicitly exempt process-only documentation/OpenSpec changes from render requirements.
- Risk: AGENTS instructions may drift from README/scripts. Mitigation: include a rule to re-check README/scripts when changing workflow documentation and add a lightweight gate for stable critical references.
- Risk: CI gate can become brittle if it checks prose too tightly. Mitigation: check stable paths/commands only, not paragraphs.

## Testing Strategy

Validate by reading AGENTS against existing README/scripts, run `bash scripts/check-agents-workflow.sh`, run `openspec validate standardize-agents-blueprint-workflow`, and document that no blueprint render is required because this is process-and-CI-only.

## Spec Patches

Applied to OpenSpec artifacts: proposal/design/spec/tasks now include the local gate script and GitHub Actions gate scope. No further spec patches are pending.
