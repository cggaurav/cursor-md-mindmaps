# cursor-md-mindmaps (Cursor plugin)

**Repository:** [github.com/cggaurav/cursor-md-mindmaps](https://github.com/cggaurav/cursor-md-mindmaps)

```bash
git clone git@github.com:cggaurav/cursor-md-mindmaps.git
```

Create **Markdown** mindmaps and render **offline interactive HTML** using [markmap](https://markmap.js.org/docs/markmap) and [`markmap-cli`](https://www.npmjs.com/package/markmap-cli). No server is required to view the generated HTML after it is built.

## What you get

- **Skill** `cursor-md-mindmaps`: write structured `.md`, then run `npx markmap-cli … --offline`
- **Command** `/mindmap`: entry point for the same workflow (see [`commands/mindmap.md`](commands/mindmap.md))

Default paths in a project: `mindmaps/<topic-slug>.md` and `mindmaps/<topic-slug>.html`. This repo gitignores `mindmaps/*.html` so generated previews are not committed by default.

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

1. Install the plugin (clone or zip) under `~/.cursor/plugins/local/cursor-md-mindmaps` and restart Cursor.
2. Open **any** git repo as the workspace (File → Open Folder), e.g. a small project or this repo.
3. In **Chat** or **Composer**, ask explicitly for a mindmap, for example:
   - “Using the cursor-md-mindmaps skill, create a mindmap for the high-level architecture of this codebase. Put Markdown under `mindmaps/` and run markmap-cli with `--offline`.”
4. Confirm `mindmaps/<something>.md` appears, then open `mindmaps/<something>.html` in a browser (double-click or `open mindmaps/<something>.html` on macOS). You should be able to pan and zoom the SVG.

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
