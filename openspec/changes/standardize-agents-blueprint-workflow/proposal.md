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
