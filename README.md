# QuadraticNumberFields Blueprint (deployment)

This repository hosts the rendered static site for the QNF Verso
blueprint. The actual Lean source — chapters, commands, structure —
lives in the source repository at
[WangFrankie/QuadraticNumberFields](https://github.com/WangFrankie/QuadraticNumberFields),
specifically on its `blueprint-verso` branch.

This repo exists so that:

- the rendered HTML is its own versioned artifact (a real
  git-tracked backup of every published snapshot);
- the public GitHub Pages URL
  (`https://WangFrankie.github.io/QuadraticNumberFields-blueprint/`)
  has a small, dedicated, decoupled repository behind it;
- anyone can `git clone` this repo and serve the site offline with
  no Lean toolchain at all.

## Layout

```text
.
├── .github/workflows/build-and-deploy.yml   # rebuilds the site on push or manual
├── README.md                                # this file
├── .gitignore
└── index.html, book.css, …                  # the rendered site, at the root
```

After the first workflow run, the rendered HTML from
`blueprint-verso/_out/site/html-multi/` is copied to the root of this
repo. Pages serves the latest commit from `main`.

## Rebuilding

Two ways:

- **Push to `main`** — any push fires the rebuild workflow.
- **`workflow_dispatch`** — Actions tab → "Build and deploy blueprint"
  → "Run workflow" for a manual rebuild.

The workflow pulls the latest `blueprint-verso` from
[WangFrankie/QuadraticNumberFields](https://github.com/WangFrankie/QuadraticNumberFields),
runs `blueprint-verso/scripts/ci-pages.sh` to render, and commits the
result back here. Each render commit records the source commit SHA,
so you can trace any snapshot in this repo back to the exact source
revision it was rendered from.

## Serving offline

```bash
git clone https://github.com/WangFrankie/QuadraticNumberFields-blueprint.git
cd QuadraticNumberFields-blueprint
python3 -m http.server 8000
# open http://localhost:8000/
```

The repo is just a static site, no toolchain required.

## Why a separate repo

The source repo's `blueprint-verso` branch carries the Lean source,
build scripts, and the rendered `_out/` as a back-up. Separating the
*publish artifact* into its own repo keeps the source repo focused
on Lean code, isolates Pages deployment from any environment /
branch-protection surprises in the source repo, and gives the
deployed site a real, addressable, versioned home of its own.
