---
name: mindmap
description: Create a Markdown mindmap for a use case and render offline interactive HTML with markmap-cli
---

# /mindmap

Ask for a structured mindmap: the agent writes **Markdown** under `mindmaps/<slug>.md`, then runs **markmap-cli** to produce **offline HTML** you can open in a browser.

## Usage

```text
/mindmap <topic or use case>
```

Examples:

```text
/mindmap authentication flow for a B2B SaaS app
/mindmap high-level architecture for this repo
/mindmap concepts I need to learn for distributed systems
```

## What happens

1. Markdown is authored with clear heading hierarchy (`#`, `##`, `###`).
2. HTML is generated locally:

```bash
npx markmap-cli "mindmaps/<slug>.md" -o "mindmaps/<slug>.html" --offline --no-open
```

3. Open `mindmaps/<slug>.html` in your browser.

Requires **Node.js** (for `npx`). See `skills/cursor-md-mindmaps/SKILL.md` for full conventions.
