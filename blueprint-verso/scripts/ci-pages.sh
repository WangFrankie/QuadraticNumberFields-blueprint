#!/usr/bin/env bash

set -euo pipefail

# Skip the slow Verso HTML render when SKIP_RENDER=1. Useful when the
# rendered site already exists on disk and you just want to republish
# it (e.g. rsync to a remote, or run a quick local sanity check). When
# set, the script still runs `lake build` (fast if up to date) and the
# file-existence checks below verify the existing build is intact.

SKIP_RENDER="${SKIP_RENDER:-}"

if [ -n "$SKIP_RENDER" ]; then
  echo "[ci-pages] SKIP_RENDER=1, reusing existing _out/site"
else
  lake build QNFBlueprint
  lake env lean --run QNFBlueprintMain.lean --output _out/site
fi

test -f _out/site/html-multi/index.html
test -f _out/site/html-multi/-verso-data/blueprint-manifest.json
test -f _out/site/html-multi/-verso-data/blueprint-html-cache.json

SOURCE_DIR=".lake/packages/QuadraticNumberFields"
if [ -d "$SOURCE_DIR/.git" ]; then
  source_commit="$(git -C "$SOURCE_DIR" rev-parse HEAD)"
  source_short_commit="$(git -C "$SOURCE_DIR" rev-parse --short HEAD)"
  source_subject="$(git -C "$SOURCE_DIR" log -1 --format=%s)"
  source_subject_html="$(
    printf '%s' "$source_subject" |
      python3 -c 'import html, sys; print(html.escape(sys.stdin.read(), quote=False), end="")'
  )"
  source_url="https://github.com/WangFrankie/QuadraticNumberFields"
  export PROJECT_METADATA_HTML="<span class=\"bp_build_metadata_item\"><a class=\"bp_build_metadata_label bp_build_metadata_link\" href=\"${source_url}\">Project</a><a class=\"bp_build_metadata_commit_link\" href=\"${source_url}/commit/${source_commit}\"><code class=\"bp_build_metadata_commit\">${source_short_commit}</code></a><span class=\"bp_build_metadata_subject\">${source_subject_html}</span></span>"
  perl -0pi -e 's#<span class="bp_build_metadata_item">\s*<a class="bp_build_metadata_label bp_build_metadata_link" href="[^"]*">Project</a><a class="bp_build_metadata_commit_link" href="[^"]*"><code class="bp_build_metadata_commit">[^<]*</code></a><span class="bp_build_metadata_subject">.*?</span></span>#$ENV{PROJECT_METADATA_HTML}#s' \
    _out/site/html-multi/index.html
fi
