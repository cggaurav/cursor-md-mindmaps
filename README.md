<p align="center">
  <img src="assets/logo.svg" alt="cursor-md-mindmaps" width="160" height="160"/>
</p>

# cursor-md-mindmaps

## How it works in Cursor

After you install the plugin, Cursor loads its **skill** and **slash command** for your workspace.

- **Skill** `cursor-md-mindmaps` — When you ask for a mindmap, architecture map, or markmap from Markdown, the agent follows the skill: it writes a structured `.md` file (headings become the tree), then runs `npx markmap-cli … --offline` so you get a **self-contained HTML** file you can open locally. No server is required to view the HTML after it is generated.
- **Command** `/mindmap` — Same workflow from Chat or Agent (for example `/mindmap high-level architecture for this repo`). You can also ask in natural language to use the skill and put output under `mindmaps/`.

Default outputs are `mindmaps/<topic-slug>.md` and `mindmaps/<topic-slug>.html` at the project root. You need **Node.js** (LTS) so `npx` can run `markmap-cli`.

## Install in Cursor

1. Open **Cursor Settings** (`Cmd+,` on macOS, `Ctrl+,` on Windows/Linux), or **Cursor → Settings**.
2. Open the **Plugins** section (you can search settings for “Plugins” or “Skills” depending on your Cursor version).
3. Use **Import plugin**, **Install from URL**, or **Add marketplace** (the exact label varies) and paste the repository URL:

   `https://github.com/cggaurav/cursor-md-mindmaps`

4. Confirm the install and **restart Cursor** if prompted. If your build has per-skill toggles, enable the **cursor-md-mindmaps** skill for Agent or Chat as you prefer.

## Example mindmap

Source Markdown: [`mindmaps/example-plugin-overview.md`](mindmaps/example-plugin-overview.md).  
Built offline HTML (checked in for demo): [`examples/example-plugin-overview.html`](examples/example-plugin-overview.html).

<p align="center">
  <a href="https://htmlpreview.github.io/?https://raw.githubusercontent.com/cggaurav/cursor-md-mindmaps/main/examples/example-plugin-overview.html">
    Open interactive example mindmap
  </a>
</p>

GitHub and many markdown renderers strip `<iframe>` for security, so inline embeds usually do not render. Use the link above, or open the local file in your browser:

`open examples/example-plugin-overview.html`

## License

MIT — see [LICENSE](LICENSE).
