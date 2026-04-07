---
name: cursor-md-mindmaps
description: Create markmap mindmaps from Markdown and render offline HTML. Use when the user asks for a mindmap, architecture map, concept map, or structured diagram from Markdown using markmap.
---

# Mindmap (Markdown + markmap)

Turn a use case into a **Markdown file first**, then render an **offline interactive HTML** mindmap with [markmap](https://markmap.js.org/docs/markmap). Everything runs locally; the HTML file works without a network after generation.

## When to use

- User asks for a mindmap, concept map, or architecture diagram as markmap / Markdown
- Phrases like: "mindmap for …", "architecture map", "visualize this hierarchy", "markmap of …"

## Prerequisites

- **Node.js** (LTS) so `npx` can run the CLI
- Package: `markmap-cli` (invoked via `npx`, no need to add it to the project)

Pin for reproducibility: `markmap-cli@^0.18` (or current `--version` if newer).

## Output locations (defaults)

- Workspace root folder: **`mindmaps/`**
- Files: `mindmaps/<topic-slug>.md` and `mindmaps/<topic-slug>.html`
- If the user specifies another path, follow their preference

Use a **slug**: lowercase, hyphens, no spaces (e.g. `auth-service-architecture`).

## Workflow

1. **Clarify** (only if needed): scope, depth, or audience. If the request is already specific, skip extra questions.

2. **Write the Markdown file** before rendering. Structure for markmap:
   - One root title: `# Title`
   - Sections: `##`, `###` for hierarchy
   - Optionally nested bullet lists under headings for extra nodes
   - Keep node labels short; use sub-bullets for details
   - Optional links on nodes: `[label](url)` where helpful

3. **Render offline HTML** from the project root (or the directory containing the `.md` file—use absolute or correct relative paths):

```bash
npx markmap-cli "mindmaps/<topic-slug>.md" -o "mindmaps/<topic-slug>.html" --offline --no-open
```

Adjust paths if the Markdown lives elsewhere.

4. **Confirm** the `.html` file exists. Tell the user to open it in a browser (e.g. double-click, or `open mindmaps/<topic-slug>.html` on macOS).

5. **Edits**: When the user asks to expand or change branches, update the `.md` only, then re-run the same `npx markmap-cli` command.

## Example Markdown shape

```markdown
# Service architecture

## Edge
## Application
### API
### Workers
## Data
### Primary DB
### Cache
## Cross-cutting
### Auth
### Observability
```

## Failure handling

- If `npx` or `markmap-cli` fails, show the error. Suggest installing Node LTS and retrying.
- Do not claim the HTML was generated until the command succeeds and the file is present.

## Security

- Generated HTML is for local review. Treat links in mindmaps like any untrusted content.
- Prefer offline rendering (`--offline`) so the snapshot does not depend on CDNs.
