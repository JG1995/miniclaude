---
name: init-project
description: Populate the current repository with the miniclaude starter files (CLAUDE.md, Claude Code project settings and agents, .gitignore entries, and the .wiki/ project docs). Use when the user asks to initialise, bootstrap, or set up a new project with miniclaude. Not for updating an already initialised project's wiki content.
disable-model-invocation: true
---

# Initialise a project

Copy the starter files from `${CLAUDE_PLUGIN_ROOT}/template/` into the root of the current Git repository, without overwriting anything the project already has.

## Steps

1. Find the target root with `git rev-parse --show-toplevel`. If the current directory is not a Git repository, stop and ask the user whether to run `git init` first.

2. List the template files and check which already exist in the target:

   ```bash
   cd "${CLAUDE_PLUGIN_ROOT}/template" && find . -type f | sort
   ```

   For each path, test whether `<target-root>/<path>` exists. Keep two lists: files to copy and files that already exist.

3. Copy only the missing files, preserving directories:

   ```bash
   cp -Rn "${CLAUDE_PLUGIN_ROOT}/template/." "<target-root>/"
   ```

   `-n` never overwrites an existing file.

4. If the target already had a `.gitignore`, append each template `.gitignore` line it lacks (comments included) instead of replacing the file.

5. If the target already had a `.claude/settings.json`, merge the template's settings into it instead of replacing the file:
   - Append the `permissions.deny` rules it lacks, in the template's order. A `!` rule only exempts paths from the rules listed before it.
   - Add `.wiki` to `worktree.symlinkDirectories`.
   - Leave every other key as it is.

6. Fill the placeholders in the target `CLAUDE.md`, only if it was copied in step 3:
   - `[describe product]`: ask the user for a one-sentence product description.
   - `[insert repo-specific commands]`: list the install, run, test, typecheck, and lint commands you can find in the repository (for example in `package.json`, `Makefile`, `pyproject.toml`, or `Cargo.toml`). If there are none yet, replace the placeholder with `None yet.` and say so.

7. Report what was copied, what was merged or skipped because it already existed, and any placeholder left unfilled. Tell the user that `.claude/settings.json` stops Claude from reading or writing `.env` files other than `.env.example`. Point the user to `.wiki/INDEX.md` as the starting point.

Do not commit. The `.wiki/` folder is git-ignored by design.
