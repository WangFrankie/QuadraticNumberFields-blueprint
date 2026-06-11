# Comet Design Handoff

- Change: standardize-agents-blueprint-workflow
- Phase: design
- Mode: compact
- Context hash: 13035fffb964dfa937cea214d8ddd231bd3feb8c1c078c57e721a3344ebd8bde

Generated-by: comet-handoff.sh

OpenSpec remains the canonical capability spec. This handoff is a deterministic, source-traceable context pack, not an agent-authored summary.

## openspec/changes/standardize-agents-blueprint-workflow/proposal.md

- Source: openspec/changes/standardize-agents-blueprint-workflow/proposal.md
- Lines: 1-34
- SHA256: 543fb000b17f7e916a27bf2cd85e2771089adf3c415501efe34178860911e223

```md
## Why

当前仓库还没有根级 `AGENTS.md`，后续代理进入仓库时缺少明确的蓝图开发约束。蓝图仓库同时包含 Verso 源文件、已跟踪的 `_out/` 静态输出、OpenSpec/Comet 流程和发布脚本；如果没有统一流程，容易出现只改源文件不渲染、误处理生成文件、跳过检查或提交范围混乱的问题。

本变更用于把“代理如何在 QuadraticNumberFields blueprint 仓库中工作”规范化为仓库内可发现、可执行、可检查的流程。

## What Changes

- 新增或更新根级 `AGENTS.md`，作为本仓库代理开发流程的主入口。
- 明确蓝图开发前的上下文读取顺序，包括仓库 README、`blueprint-verso/README.md`、相关章节文件和现有脚本。
- 规定常见工作流：蓝图内容修改、只改流程文档、渲染输出更新、预览、验证、提交。
- 明确 `_out/` 是有意跟踪的渲染备份，并规定何时必须同步提交渲染结果。
- 明确 OpenSpec/Comet 的使用边界：较大流程或行为变化先走 change；小型文档修正可按仓库流程直接完成。
- 明确提交前检查和提交信息风格，延续现有 `docs(blueprint): ...` / `render: ...` 风格。
- 新增本地验证脚本，用于检查 `AGENTS.md` 是否保留关键流程约束。
- 将该验证脚本接入 GitHub Actions，使 AGENTS 流程规范成为 CI 中的强制检查。

## Capabilities

### New Capabilities

- `agents-blueprint-workflow`: 规范代理在本 blueprint 仓库中进行开发、渲染、验证和提交的流程。

### Modified Capabilities

- 无。

## Impact

- 影响根级代理指令入口，预计新增 `AGENTS.md`。
- 影响仓库级验证入口，预计新增根级 `scripts/check-agents-workflow.sh`。
- 影响 GitHub Actions blueprint workflow，新增 AGENTS workflow gate。
- 影响后续所有代理在本仓库内修改 `blueprint-verso/`、`openspec/`、README、脚本和渲染输出时的默认流程。
- 不改变 Lean/Verso 构建逻辑或 VPS 发布配置。
```

## openspec/changes/standardize-agents-blueprint-workflow/design.md

- Source: openspec/changes/standardize-agents-blueprint-workflow/design.md
- Lines: 1-87
- SHA256: 5a335c794129e457edbc957b999b5cfb26463036e38440b00dd8afb14a7898d5

[TRUNCATED]

```md
## Context

本仓库是 `QuadraticNumberFields` 项目的独立 Verso blueprint 仓库。根级 README 说明了依赖模型、本地渲染和 CI 渲染；`blueprint-verso/README.md` 进一步说明 Lake/Verso 包结构、`ci-pages.sh`、`serve.sh`、`publish.sh` 和 review checklist。当前仓库没有根级 `AGENTS.md`，因此代理缺少进入仓库后的统一操作面。

本变更的利益相关者是后续在本仓库中工作的代理和维护者。核心约束是：流程文档必须和现有仓库事实一致，不能把 upstream Lean 项目的证明开发流程、VPS 私密配置或 Verso/Lake 构建重构混入本次变更。用户已选择 C-full，因此本变更包含轻量本地 gate 和 GitHub Actions 强制检查。

## Goals / Non-Goals

**Goals:**

- 提供根级 `AGENTS.md`，覆盖整个仓库。
- 规范代理修改 blueprint 源文件、渲染 `_out/`、验证输出和提交变更的默认流程。
- 明确 OpenSpec/Comet 适用场景，避免大型流程或行为变化绕过 change 流程。
- 明确生成文件和手写源文件的处理方式。
- 新增本地验证脚本，检查 `AGENTS.md` 是否包含关键流程约束。
- 将本地验证脚本接入现有 GitHub Actions blueprint workflow。

**Non-Goals:**

- 不修改数学蓝图内容。
- 不修改 Lake、Verso 或 VPS 发布脚本行为。
- 不规定 upstream `QuadraticNumberFields` 主仓库的 Lean 证明开发流程。
- 不要求所有小型文档修正都创建 OpenSpec change。

## Decisions

### Decision: 用根级 `AGENTS.md` 作为主控制面

选择在仓库根目录新增 `AGENTS.md`，而不是只更新 README。`AGENTS.md` 是代理优先读取的指令入口，可以直接约束后续自动化开发行为；README 面向人类读者，不能稳定地充当代理流程 guard。

备选方案是把流程写进 `README.md` 或 `blueprint-verso/README.md`。这种方案更容易被人类看到，但代理入口不够明确，且会把操作指令和项目说明混在一起。

### Decision: 流程按工作类型分支

`AGENTS.md` 应区分至少三类工作：

- blueprint 内容变更：修改 `blueprint-verso/QNFBlueprint/...` 后运行渲染并同步 `_out/`。
- 流程或文档变更：只影响 `AGENTS.md`、README、OpenSpec artifacts 等文件时，不强制重渲染 blueprint。
- 发布或脚本变更：必须阅读对应脚本和 workflow，并选择相应验证命令。

这样可以避免把所有变更都套进最慢的渲染流程，同时保留内容变更的输出一致性。

### Decision: 明确 `_out/` 是跟踪产物

流程必须说明 `blueprint-verso/_out/` 是有意跟踪的渲染备份。内容变更完成后应提交源文件和重新渲染的 `_out/`；只改流程文档时不应无理由触碰 `_out/`。

备选方案是把 `_out/` 当作普通生成目录忽略，但这与当前 README 和历史提交不一致。

### Decision: OpenSpec/Comet 是流程变化的默认入口

较大的流程、行为或仓库协作约定变化应先走 OpenSpec/Comet；小型错别字、链接修正或明显局部文档修补可直接修改。这样保留规范化变更的审查轨迹，也避免对微小修正过度流程化。

### Decision: 用轻量脚本实现 AGENTS workflow gate

新增根级 `scripts/check-agents-workflow.sh`，用 POSIX shell / Bash 和基础文件检查实现 gate。脚本应检查：

- 根级 `AGENTS.md` 存在且非空。
- `AGENTS.md` 提到 `blueprint-verso/README.md`、`./scripts/ci-pages.sh`、`blueprint-verso/_out/`、`openspec validate` 或等价 OpenSpec 校验规则。
- `.github/workflows/blueprint.yml` 调用了该 gate 脚本。

备选方案是依赖人工 review 或引入专门文档 lint 工具。人工 review 不满足 C-full 的自动化要求；外部 lint 工具会扩大依赖面，不适合当前仓库。

### Decision: 将 gate 接入现有 blueprint workflow

在 `.github/workflows/blueprint.yml` 中新增一个早期步骤运行 `bash scripts/check-agents-workflow.sh`。该步骤应在 Lean setup 和耗时渲染之前执行，以便流程文档破坏时快速失败。它不改变现有 render/deploy 逻辑，只增加一个前置一致性检查。

## Risks / Trade-offs

- [Risk] 流程太重，代理为小修正付出过多成本。→ Mitigation: 在 `AGENTS.md` 中明确小型文档修正的例外路径。
- [Risk] 流程太松，内容变更漏掉 `_out/`。→ Mitigation: 把内容变更的渲染和输出检查写成 MUST。
- [Risk] AGENTS 指令与 README 漂移。→ Mitigation: 要求修改流程时同步核对根级 README、`blueprint-verso/README.md` 和相关脚本。
- [Risk] 后续代理误把 upstream Lean 开发流程套到 blueprint 仓库。→ Mitigation: 明确本流程只覆盖当前 blueprint 仓库。
- [Risk] CI gate 过度脆弱，文档措辞调整导致误报。→ Mitigation: gate 只检查稳定的关键路径和命令，不检查大段自然语言。
- [Risk] CI gate 引入额外维护成本。→ Mitigation: 使用无外部依赖的短脚本，并在 `AGENTS.md` 中要求流程变更同步更新 gate。

## Migration Plan

1. 新增根级 `AGENTS.md`。
2. 新增根级 `scripts/check-agents-workflow.sh`。
3. 将 gate 脚本接入 `.github/workflows/blueprint.yml`。
```

Full source: openspec/changes/standardize-agents-blueprint-workflow/design.md

## openspec/changes/standardize-agents-blueprint-workflow/tasks.md

- Source: openspec/changes/standardize-agents-blueprint-workflow/tasks.md
- Lines: 1-22
- SHA256: af5b59813b4e7f665a476d07764c7681ba4367fa2a5cf54de6140089f9552592

```md
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
```

## openspec/changes/standardize-agents-blueprint-workflow/specs/agents-blueprint-workflow/spec.md

- Source: openspec/changes/standardize-agents-blueprint-workflow/specs/agents-blueprint-workflow/spec.md
- Lines: 1-118
- SHA256: f76cb6040e2ed649f9aee0c9daa92cf4cd63d4a132e576aad30ca17d60583688

[TRUNCATED]

```md
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
```

Full source: openspec/changes/standardize-agents-blueprint-workflow/specs/agents-blueprint-workflow/spec.md

