## ADDED Requirements

### Requirement: Root agent workflow entrypoint

The repository MUST provide a root-level `AGENTS.md` that governs agent work throughout the repository.

#### Scenario: Agent enters the repository

- **WHEN** an agent starts work in the repository root
- **THEN** the agent can read `AGENTS.md` to find the required blueprint development workflow

#### Scenario: Agent edits a covered file

- **WHEN** an agent edits any file under the repository root
- **THEN** the instructions from the root `AGENTS.md` apply unless a deeper `AGENTS.md` overrides them

### Requirement: Context gathering workflow

The agent workflow MUST require agents to ground changes in the existing repository structure before editing.

#### Scenario: Blueprint source change begins

- **WHEN** an agent is asked to change blueprint content
- **THEN** the workflow directs the agent to read the relevant README files, relevant `blueprint-verso/QNFBlueprint/` chapters, and applicable scripts before editing

#### Scenario: Script or CI change begins

- **WHEN** an agent is asked to change render, preview, publish, or CI behavior
- **THEN** the workflow directs the agent to read the corresponding script or workflow before editing

### Requirement: Rendered output policy

The agent workflow MUST define how tracked rendered output under `blueprint-verso/_out/` is handled.

#### Scenario: Blueprint content changes

- **WHEN** an agent changes files that affect rendered blueprint content
- **THEN** the workflow requires a render using the repository's existing render path and inclusion of the resulting tracked `_out/` changes

#### Scenario: Process-only change

- **WHEN** an agent changes only process documentation or OpenSpec artifacts
- **THEN** the workflow does not require touching rendered `_out/` files

### Requirement: Verification workflow

The agent workflow MUST define expected verification before completion.

#### Scenario: Render is required

- **WHEN** a change affects rendered blueprint content
- **THEN** the workflow requires running `cd blueprint-verso && ./scripts/ci-pages.sh` or documenting why it could not be run

#### Scenario: Render completes

- **WHEN** the render command completes
- **THEN** the workflow requires checking that the expected static site outputs exist

### Requirement: Commit workflow

The agent workflow MUST define how agents prepare commits in this repository.

#### Scenario: Commit is requested

- **WHEN** the user asks an agent to commit current work
- **THEN** the workflow requires reviewing the staged scope and using commit messages consistent with the repository's existing style

#### Scenario: Generated output is present

- **WHEN** generated `_out/` changes are part of a blueprint content update
- **THEN** the workflow requires those generated changes to be considered part of the same deliverable unless the user explicitly asks otherwise

### Requirement: OpenSpec and Comet usage

The agent workflow MUST state when OpenSpec/Comet should be used for future changes.

#### Scenario: Process or behavior change is substantial

- **WHEN** a requested change affects development process, repository behavior, or multi-step workflow conventions
- **THEN** the workflow directs the agent to use OpenSpec/Comet before implementation

#### Scenario: Local documentation correction is small

- **WHEN** a requested change is a small typo, link, or wording correction
- **THEN** the workflow allows the agent to make the correction directly without creating a new OpenSpec change

### Requirement: Local agent workflow gate

The repository MUST provide a local gate script that validates the presence of the root agent workflow and its critical constraints.

#### Scenario: Gate script is run locally

- **WHEN** a maintainer runs the local AGENTS workflow gate
- **THEN** the script verifies that root `AGENTS.md` exists and includes the critical blueprint workflow references

#### Scenario: AGENTS workflow omits render policy

- **WHEN** root `AGENTS.md` omits the tracked render output or render command policy
- **THEN** the local gate fails

#### Scenario: AGENTS workflow omits OpenSpec validation policy

- **WHEN** root `AGENTS.md` omits the OpenSpec validation expectation for process changes
- **THEN** the local gate fails

### Requirement: CI agent workflow gate

The existing GitHub Actions blueprint workflow MUST run the local AGENTS workflow gate.

#### Scenario: Blueprint workflow runs

- **WHEN** `.github/workflows/blueprint.yml` runs on push or manual dispatch
- **THEN** the workflow executes the local AGENTS workflow gate before expensive Lean setup and render steps

#### Scenario: Gate fails in CI

- **WHEN** the local AGENTS workflow gate fails in GitHub Actions
- **THEN** the blueprint workflow fails before deploying Pages
