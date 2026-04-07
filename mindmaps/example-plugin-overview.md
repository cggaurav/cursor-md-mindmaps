# cursor-md-mindmaps

## What it is
- Markdown mindmaps with [markmap](https://markmap.js.org/docs/markmap)
- Offline HTML via `markmap-cli` (`--offline`)

## In your repo
- Skill `cursor-md-mindmaps`
- Command `/mindmap` (see `commands/mindmap.md`)

## Default outputs
- `mindmaps/<topic-slug>.md`
- `mindmaps/<topic-slug>.html` (generated; local preview)

## Workflow
- Write structured `.md` (`#` → `##` → `###`)
- Run `npx markmap-cli` with `--offline`
- Open `.html` in a browser

## How to invoke
### Slash command
- `/mindmap …` in Chat or Agent

### Natural language
- Ask for a markmap and `mindmaps/` paths

## Prerequisites
- Node.js (LTS) for `npx`
- First `npx` run may download the CLI

## This file
- Example mindmap shipped with the repo
- Render: `npx markmap-cli "mindmaps/example-plugin-overview.md" -o "mindmaps/example-plugin-overview.html" --offline --no-open`
