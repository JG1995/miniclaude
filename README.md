# miniclaude

A Claude Code plugin with project starter files plus skills and agents for building products with Claude Code.

## Layout

- `.claude-plugin/plugin.json`: the plugin manifest.
- `.claude-plugin/marketplace.json`: lets you install the plugin straight from this repository.
- `skills/`: one folder per skill, each with a `SKILL.md`.
- `template/`: starter files that `/miniclaude:init-project` copies into a project. Rules for target projects go in `template/.claude/rules/`, because plugins cannot install rules directly.

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
