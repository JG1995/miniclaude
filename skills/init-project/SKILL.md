---
name: init-project
description: Populate the current repository with the miniclaude starter files (CLAUDE.md, Claude Code project settings, .gitignore and .gitattributes entries, a pre-commit hook, and the .wiki/ project docs). Use when the user asks to initialise, bootstrap, or set up a new project with miniclaude. Not for updating an already initialised project's wiki content.
disable-model-invocation: true
---

# Initialise a project

Copy the starter files from `${CLAUDE_PLUGIN_ROOT}/template/` into the root of the current Git repository, without overwriting anything the project already has.

## Steps

1. Find the target root with `git rev-parse --show-toplevel`.
   - If the current directory is not a Git repository, stop and ask the user whether to run `git init` first. If they decline, stop: the skill needs a Git repository for its ignore patterns and hook.
   - If the target root is not the current directory, the current directory sits inside another repository. Stop and ask the user whether to set up that repository's root, or to run `git init` in the current directory to make it a repository of its own. Continue only with the root they choose.

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

4. Activate the template's ignore patterns. In the template `.gitignore`, every pattern is commented out with a `#~ ` prefix so the miniclaude repo itself still tracks those files, and the file opens with a `# Template note:` comment block that explains this.
   - If `.gitignore` was copied in step 3, delete the template note block (and the blank line after it) and strip the `#~ ` prefix from every line:

     ```bash
     sed -i -e '/^# Template note:/,/^$/d' -e 's/^#~ //' "<target-root>/.gitignore"
     ```

   - If the target already had a `.gitignore`, append each template line it lacks instead of replacing the file: section comments as they are, patterns without the `#~ ` prefix, and never the template note.

5. If the target already had a `.gitattributes`, append each template line it lacks instead of replacing the file. The template stores text files with LF line endings. If the repository already has commits, also run `git -C "<target-root>" add --renormalize .`, so files committed with Windows line endings are stored with LF from the next commit on, and tell the user these files are now staged.

6. If the target already had a `.claude/settings.json`, merge the template's settings into it instead of replacing the file:
   - Append the `permissions.deny` rules it lacks, in the template's order. A `!` rule only exempts paths from the rules listed before it.
   - Add `.wiki` to `worktree.symlinkDirectories`.
   - Set `attribution.commit` and `attribution.pr` to `""`, so commits and pull requests carry no Claude attribution.
   - Leave every other key as it is.

7. Install the pre-commit hook. It blocks a commit on `main` or `master` (except the first commit of a new repository), a commit whose staged changes have whitespace errors or leftover conflict markers, and a commit whose staged changes contain a secret, found by gitleaks. It also blocks while gitleaks is not installed. It ships with this skill rather than the template, so it goes into the clone's own hooks folder and never becomes a project file.
   - If `git -C "<target-root>" config --get core.hooksPath` prints a path, the project uses its own hooks folder, for example through a hook manager such as husky. Do not install the hook; tell the user they can call `${CLAUDE_PLUGIN_ROOT}/skills/init-project/pre-commit` from their own pre-commit hook.
   - Otherwise find the hooks folder with `git -C "<target-root>" rev-parse --path-format=absolute --git-path hooks`. If it already has a `pre-commit` file, leave it as it is. If not, install the hook:

     ```bash
     mkdir -p "<hooks-dir>" && cp "${CLAUDE_PLUGIN_ROOT}/skills/init-project/pre-commit" "<hooks-dir>/pre-commit" && chmod +x "<hooks-dir>/pre-commit"
     ```

   - Check whether gitleaks is installed with `command -v gitleaks`.

8. Fill the placeholders in the target `CLAUDE.md`, only if it was copied in step 3:
   - `[describe product]`: ask the user for a one-sentence product description.
   - `[insert repo-specific commands]`: list the install, run, test, typecheck, and lint commands you can find in the repository (for example in `package.json`, `Makefile`, `pyproject.toml`, or `Cargo.toml`). If there are none yet, replace the placeholder with `None yet.` and say so.

9. Report what was copied, what was merged or skipped because it already existed, and any placeholder left unfilled. Tell the user that `.claude/settings.json` stops Claude from reading or writing `.env` files other than `.env.example` and turns off Claude attribution in commits and pull requests, and that `.env` files other than `.env.example`, `.wiki/` and `.claude/` are git-ignored, and that `.gitattributes` stores text files with LF line endings. Say whether the pre-commit hook was installed, that it keeps commits off `main` so work starts on a feature branch, and whether gitleaks is installed; if it is not, commits are blocked until the user installs it. Tell the user that the hook lives in this clone only, so a fresh clone has no hook until `/miniclaude:init-project` runs there again; files that already exist are skipped. Point the user to `.wiki/INDEX.md` as the starting point.

Do not commit. The `.wiki/` and `.claude/` folders are git-ignored by design.
