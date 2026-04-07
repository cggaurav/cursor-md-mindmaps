#!/usr/bin/env bash
# Build a distributable zip of the Cursor plugin (for marketplace upload or manual install).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NAME="cursor-md-mindmaps"
if command -v node >/dev/null 2>&1; then
  VERSION="$(node -p "require('$ROOT/.cursor-plugin/plugin.json').version")"
else
  VERSION="$(grep '"version"' "$ROOT/.cursor-plugin/plugin.json" | head -1 | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')"
fi
DIST="$ROOT/dist"
OUT="$DIST/${NAME}-v${VERSION}.zip"

mkdir -p "$DIST"
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT

mkdir -p "$STAGE/$NAME/scripts"
cp -R "$ROOT/.cursor-plugin" "$STAGE/$NAME/"
cp -R "$ROOT/skills" "$STAGE/$NAME/"
cp -R "$ROOT/commands" "$STAGE/$NAME/"
if [[ -d "$ROOT/assets" ]]; then
  cp -R "$ROOT/assets" "$STAGE/$NAME/"
fi
cp "$ROOT/AGENTS.md" "$ROOT/README.md" "$ROOT/LICENSE" "$STAGE/$NAME/"
[[ -f "$ROOT/.gitignore" ]] && cp "$ROOT/.gitignore" "$STAGE/$NAME/"
cp "$ROOT/scripts/package-plugin.sh" "$STAGE/$NAME/scripts/"
if compgen -G "$ROOT/mindmaps/*.md" > /dev/null; then
  mkdir -p "$STAGE/$NAME/mindmaps"
  cp "$ROOT/mindmaps"/*.md "$STAGE/$NAME/mindmaps/"
fi

( cd "$STAGE" && zip -r -q "$OUT" "$NAME" )
echo "Packaged: $OUT"
ls -la "$OUT"
