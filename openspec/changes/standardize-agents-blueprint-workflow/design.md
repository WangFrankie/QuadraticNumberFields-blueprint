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
4. 把已确认的开发流程写入 `AGENTS.md`，并确保 gate 覆盖关键约束。
5. 验证 `AGENTS.md` 与现有 README、脚本和 CI workflow 一致。
6. 不需要数据迁移；如 gate 误报，可通过后续脚本/文档变更修正。

## Open Questions

- 无阻塞性开放问题。实现阶段可根据实际脚本和 README 内容细化措辞。
