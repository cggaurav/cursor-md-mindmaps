# Agent instructions — cursor-md-mindmaps

## Overview

Cursor plugin that helps create **Markdown mindmaps** and render them with **[markmap](https://markmap.js.org/docs/markmap)** as **offline HTML** via `markmap-cli`.

## Structure

- `.cursor-plugin/plugin.json` — plugin metadata
- `.cursor-plugin/marketplace.json` — marketplace bundle listing
- `skills/cursor-md-mindmaps/SKILL.md` — main workflow (write `.md`, then `npx markmap-cli … --offline`)
- `commands/mindmap.md` — `/mindmap` command reference

## Conventions

- Default output: `mindmaps/<topic-slug>.md` and `mindmaps/<topic-slug>.html` at the workspace root
- Skill frontmatter: `name` and `description` only

## Install (local, all projects)

Copy or symlink this folder to:

`~/.cursor/plugins/local/cursor-md-mindmaps/`

Restart Cursor. The skill should be available when users ask for mindmaps or use `/mindmap`.
