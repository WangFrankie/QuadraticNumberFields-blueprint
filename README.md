# QuadraticNumberFields Blueprint

This repository now contains the `blueprint-verso/` directory moved out of
`WangFrankie/QuadraticNumberFields`.

The blueprint package, build instructions, local preview commands, and rendered
site output live under [`blueprint-verso/`](blueprint-verso/).

## Dependency Model

The blueprint is an independent Lake package. It depends on the upstream Lean
project through `blueprint-verso/lakefile.toml`:

```toml
[[require]]
name = "QuadraticNumberFields"
git = "https://github.com/WangFrankie/QuadraticNumberFields"
rev = "main"
```

`blueprint-verso/lake-manifest.json` records the exact upstream commit used for
the current render.

## Local Render

Use this path when you want to update the committed `_out/` backup locally:

```bash
cd blueprint-verso
lake update QuadraticNumberFields
./scripts/ci-pages.sh
cd ..
git add blueprint-verso/lake-manifest.json blueprint-verso/_out
git commit -m "render: update blueprint output"
```

The `_out/` directory is intentionally tracked.

## CI Render

GitHub Actions provides the same render path when local rendering is too slow.
Run **Actions → Blueprint → Run workflow**.

Inputs:

- `update_upstream`: update the `QuadraticNumberFields` dependency from `main`
  before rendering.
- `skip_render`: reuse the committed `blueprint-verso/_out/site` output and
  only verify/deploy it.
- `commit_out`: commit `blueprint-verso/lake-manifest.json` and
  `blueprint-verso/_out/` back to `main` after rendering.

Default push builds render and deploy the Pages artifact, but do not commit
generated output back to the repository.
