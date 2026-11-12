# miniclaude

A Claude Code plugin with project starter files plus skills and agents for building products with Claude Code.

## Layout

- `.claude-plugin/plugin.json`: the plugin manifest.
- `.claude-plugin/marketplace.json`: lets you install the plugin straight from this repository.
- `skills/`: one folder per skill, each with a `SKILL.md`.
- `template/`: starter files that `/miniclaude:init-project` copies into a project. Rules and settings for target projects go in `template/.claude/rules/` and `template/.claude/settings.json`, because plugins cannot install either directly.

Add agents in `agents/<name>.md` and hooks in `hooks/hooks.json` when you need them.

## Try it locally

```bash
claude --plugin-dir /path/to/miniclaude
```

## Install

```bash
claude plugin marketplace add /path/to/miniclaude
claude plugin install miniclaude@miniclaude
```

## Start a new project

In an empty Git repository, run `/miniclaude:init-project`. It copies `template/` into the repository without overwriting existing files, then fills the placeholders in `CLAUDE.md`.

The copied `.claude/settings.json` does two things:

- It stops Claude from reading or writing `.env` files at any depth. `.env.example` stays readable.
- It links `.wiki/` into every worktree Claude Code creates. The wiki is git-ignored, so a worktree would otherwise start without it. Claude can read the wiki through the link but cannot edit it, so write specs and wiki updates from the main checkout.

## Write the design system

First choose a brand identity with the [brand-identity plugin](https://github.com/fatihaydost/brand-identity-skill). It writes its sets and guidelines kit to `brand-identity/` at the project root.

Then run `/miniclaude:design-system`. It turns the set you picked into `.wiki/DESIGN.md`: it maps the identity's colours and typefaces onto the template's tokens, decides layout, shapes, and component rules from the product's requirements, and measures the contrast of every colour pairing it specifies. Before it reports, it reviews its own draft for choices that would suit any product and replaces them with ones that have a source in this identity or this product. It then renders a small specimen from the finished document, looks at the result, and corrects the document. Rendering uses the brand-identity plugin's script and needs a Chromium-based browser. It asks you a question only when it cannot tell which set you chose or what the product needs, such as the target platform.

## Specify a feature

Run `/miniclaude:spec <feature>`. It settles what the repository, the wiki, and convention already answer, asks you only about the decisions that have no safe default, then writes the spec to `.wiki/features/`. Build the feature in a fresh session.
