# cursor-md-mindmaps (Cursor plugin)

<p align="center">
  <img src="assets/logo.svg" alt="cursor-md-mindmaps logo: mindmap tree with Markdown hash" width="160" height="160"/>
</p>

Square **512×512** PNG for GitHub’s **Settings → General → Social preview** (and similar): [`assets/repo-avatar.png`](assets/repo-avatar.png).

**Repository:** [github.com/cggaurav/cursor-md-mindmaps](https://github.com/cggaurav/cursor-md-mindmaps)

```bash
git clone git@github.com:cggaurav/cursor-md-mindmaps.git
```

Create **Markdown** mindmaps and render **offline interactive HTML** using [markmap](https://markmap.js.org/docs/markmap) and [`markmap-cli`](https://www.npmjs.com/package/markmap-cli). No server is required to view the generated HTML after it is built.

## What you get

- **Skill** `cursor-md-mindmaps`: write structured `.md`, then run `npx markmap-cli … --offline`
- **Command** `/mindmap`: entry point for the same workflow (see [`commands/mindmap.md`](commands/mindmap.md))

Default paths in a project: `mindmaps/<topic-slug>.md` and `mindmaps/<topic-slug>.html`. This repo gitignores `mindmaps/*.html` so generated previews are not committed by default.

## Example Markdown

[markmap](https://markmap.js.org/docs/markmap) maps **heading levels** (`#`, `##`, `###`) into a tree. Keep labels short; add bullets under a heading if you need extra detail.

Example: `mindmaps/payment-architecture.md`

```markdown
# Payment architecture

## Clients
- Web app
- Mobile SDK

## Edge
## API gateway
### REST
### Webhooks

## Core services
### Ledger
### Fraud checks

## Data
### Postgres
### Redis cache

## Operations
### Metrics
### Alerts
```

The agent writes this kind of file first, then runs `npx markmap-cli` to produce `mindmaps/payment-architecture.html` for the browser.

## How to invoke in Cursor

Install the plugin under `~/.cursor/plugins/local/cursor-md-mindmaps` and **restart Cursor**. Open your project folder, then:

**Slash command** — in **Chat** or **Agent**, run:

```text
/mindmap high-level architecture for this repo
```

Use your own topic, for example `/mindmap OAuth2 flow for our B2B API`. If `/mindmap` does not show up in the command list yet, use a plain-language prompt instead.

**Chat or Composer (natural language)** — for example:

- “Create a markmap for the deployment pipeline. Put Markdown in `mindmaps/` and run `npx markmap-cli` with `--offline`.”
- “Using the **cursor-md-mindmaps** skill, build an architecture mindmap for this codebase and render the HTML.”

**After the run** — open the generated `mindmaps/<slug>.html` in a browser (double-click, or `open mindmaps/<slug>.html` on macOS) to pan and zoom the mindmap.

## Prerequisites

- **Node.js** (LTS recommended) for `npx`
- Network the first time you run `npx markmap-cli` (it downloads the package). HTML built with `--offline` works without the network afterward.

## Install (every Cursor project)

**Option A — from a git clone**

```bash
mkdir -p ~/.cursor/plugins/local
ln -sf /absolute/path/to/cursor-md-mindmaps-repo ~/.cursor/plugins/local/cursor-md-mindmaps
```

Or copy the folder instead of symlinking:

```bash
cp -R /path/to/cursor-md-mindmaps-repo ~/.cursor/plugins/local/cursor-md-mindmaps
```

**Option B — from the release zip**

1. Run `./scripts/package-plugin.sh` (or use a prebuilt `dist/cursor-md-mindmaps-v*.zip` from a release).
2. Unzip so you have a folder named `cursor-md-mindmaps` containing `.cursor-plugin/`, `skills/`, etc.
3. Move or link it into place:

   ```bash
   mkdir -p ~/.cursor/plugins/local
   mv cursor-md-mindmaps ~/.cursor/plugins/local/
   ```

Restart **Cursor** after installing or upgrading the plugin.

## Package for upload

To produce a single archive (for releases, manual sharing, or some marketplace flows):

```bash
./scripts/package-plugin.sh
```

Output: `dist/cursor-md-mindmaps-v<version>.zip` (see `.cursor-plugin/plugin.json` for `version`). The zip root contains one folder, `cursor-md-mindmaps/`, ready to unzip into `~/.cursor/plugins/local/` as above.

Bump the version in `.cursor-plugin/plugin.json` when you cut a new release.

## Test on a repository (quick)

1. Install the plugin and restart Cursor (see **Install** above).
2. Open any repo as the workspace (**File → Open Folder**).
3. Invoke with **`/mindmap …`** or a prompt from **How to invoke in Cursor** above.
4. Confirm `mindmaps/<slug>.md` exists, then open `mindmaps/<slug>.html` in a browser.

**Sanity check without the agent:** from the repo root,

```bash
npx markmap-cli "mindmaps/sample-verification.md" -o "mindmaps/sample-verification.html" --offline --no-open
open mindmaps/sample-verification.html   # macOS
```

## Demo easily

- **Record a short demo:** show Chat requesting an architecture mindmap → show the `.md` file → run or show the generated `.html` in the browser.
- **Optional:** add a screenshot of the opened HTML to your GitHub README after you generate a nice example mindmap.

## Configuration before publishing

Optional: add a `logo` path in `.cursor-plugin/plugin.json`.

## Publishing

- **GitHub**: push to `git@github.com:cggaurav/cursor-md-mindmaps.git` (or open a PR from a fork).
- **Cursor Marketplace**: [Publish a plugin](https://cursor.com/marketplace/publish) (follow the current submission steps; attach or link your repo or release asset as required).

### cursor.directory (community listing)

Submit the **public HTTPS** repo URL (not the SSH clone URL) on [cursor.directory — new plugin](https://cursor.directory/plugins/new):

`https://github.com/cggaurav/cursor-md-mindmaps`

The site auto-detects plugin metadata from the repository; keep this repo public so discovery and validation work.

## License

MIT — see [LICENSE](LICENSE).
