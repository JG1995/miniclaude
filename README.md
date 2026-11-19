# miniclaude

A Claude Code plugin with project starter files plus skills and agents for building products with Claude Code.

## Layout

- `.claude-plugin/plugin.json`: the plugin manifest.
- `.claude-plugin/marketplace.json`: lets you install the plugin straight from this repository.
- `skills/`: one folder per skill, each with a `SKILL.md`.
- `agents/`: one file per subagent.
- `template/`: starter files that `/miniclaude:init-project` copies into a project. Rules and settings for target projects go in `template/.claude/rules/` and `template/.claude/settings.json`, because plugins cannot install either directly.

Add hooks in `hooks/hooks.json` when you need them.

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

The copied `.claude/settings.json` does three things:

- It stops Claude from reading or writing `.env` files at any depth. `.env.example` stays readable.
- It turns off Claude attribution in commits and pull requests.
- It links `.wiki/` into every worktree Claude Code creates. The wiki is git-ignored, so a worktree would otherwise start without it. Claude can read the wiki through the link but cannot edit it, so write specs and wiki updates from the main checkout.

The copied `.gitignore` keeps `.env` files other than `.env.example`, `.wiki/` and `.claude/` out of the project's history. In this repository its patterns are commented out with a `#~ ` prefix, so the template's own files stay tracked; `init-project` removes the prefixes when it copies the file.

The copied `.gitattributes` stores text files with LF line endings, so an editor that writes Windows line endings cannot turn a whole file into a diff.

`init-project` also installs a pre-commit hook. It blocks a commit when:

- it would land on `main` or `master`, except the first commit of a new repository, so work happens on feature branches as the copied `CLAUDE.md` asks;
- the staged changes have whitespace errors or leftover conflict markers, found by `git diff --cached --check`; Markdown may keep two trailing spaces for a line break;
- the staged changes contain a secret, such as an API key or token, found by [gitleaks](https://github.com/gitleaks/gitleaks).

The hook ships with the skill, in `skills/init-project/scripts/pre-commit`, and goes into the clone's own `.git/hooks/`, so it never becomes a project file. That also means it lives in one clone only: run `/miniclaude:init-project` again in a fresh clone to install it there. The hook also blocks commits while gitleaks is missing or older than 8.19, which is the first version with the `gitleaks git` command it uses. If the project already sets `core.hooksPath`, for example through husky, the skill leaves the hooks alone.

**`init-project` installs gitleaks without asking** when it is missing or older than 8.19. It runs `skills/init-project/scripts/install-gitleaks.sh`, which:

- does nothing when a usable gitleaks is already on PATH;
- with Homebrew available, runs `brew install gitleaks`, or `brew upgrade gitleaks` when Homebrew installed the old version;
- otherwise downloads the latest release for your OS and CPU from [gitleaks' GitHub releases](https://github.com/gitleaks/gitleaks/releases), checks it against the release's published checksums, and puts the binary in `~/.local/bin`, without `sudo`. If `~/.local/bin` is not on your PATH, it says so and you need to add it.

The script handles Linux and macOS on x64 and arm64. Elsewhere, such as Windows outside WSL, it stops and points you to the [install instructions](https://github.com/gitleaks/gitleaks#installing). It never uses apt or other distribution packages, because they can lag behind and ship a gitleaks older than 8.19.

## Write the design system

First choose a brand identity with the [brand-identity plugin](https://github.com/fatihaydost/brand-identity-skill). It writes its sets and guidelines kit to `brand-identity/` at the project root.

Then run `/miniclaude:design-system`. It turns the set you picked into `.wiki/DESIGN.md`: it maps the identity's colours and typefaces onto the template's tokens, decides layout, shapes, and component rules from the product's requirements, and measures the contrast of every colour pairing it specifies. Before it reports, it reviews its own draft for choices that would suit any product and replaces them with ones that have a source in this identity or this product. It then renders a small specimen from the finished document, looks at the result, and corrects the document. Rendering uses the brand-identity plugin's script and needs a Chromium-based browser. It asks you a question only when it cannot tell which set you chose or what the product needs, such as the target platform.

## Specify a feature

Run `/miniclaude:spec <feature>`. It settles what the repository, the wiki, and convention already answer, asks you only about the decisions that have no safe default, then writes the spec to `.wiki/features/`. Build the feature in a fresh session.

## Keep the architecture coherent

The copied `CLAUDE.md` asks Claude to build the project as if one developer wrote all of it: each responsibility in the module `.wiki/ARCHITECTURE.md` gives it, and the same pattern wherever the same kind of problem comes up.

When a feature does not fit, Claude asks whether it would fit if the code matched `ARCHITECTURE.md`. If so, the code has drifted, and Claude refactors it first, in commits that do not change behaviour. If not, the document may be wrong: Claude changes a rule when its stated reason no longer holds, and then for the whole codebase rather than as an exception for one feature. The architecture checker then tests each such change in more detail. Because `.wiki/` is not in git, Claude also records each architecture change in the commit that needed it.

Claude makes these decisions without asking. It stops and asks you only when a feature cannot be built cleanly as specified, or when building it would change existing core functionality or behaviour.

The Architecture section in `CLAUDE.md` is short on purpose. `CLAUDE.md` loads into every session, and current models know what a bolted-on feature looks like, so it holds only what Claude cannot see in the code: where to escalate, how a rule may change, and where decisions are recorded. The detailed tests live in the architecture checker.

`CLAUDE.md` also has Claude enforce each rule in `ARCHITECTURE.md` with a lint or test check where the stack allows it, and turn on the linter's file-size and complexity rules as warnings. The plugin installs no linter of its own, because the stack is not known when a project starts.

## Review before a pull request

The copied `CLAUDE.md` has Claude run `/code-review` on the branch before it opens a pull request. That review looks for bugs in the changes. Claude also has two of the plugin's agents check the branch:

- `miniclaude:architecture-checker` checks the branch against `.wiki/ARCHITECTURE.md`: where each responsibility went, the document's rules, whether the branch solves each problem the way the codebase already does, and whether it bolts a feature onto unrelated code. For each disagreement it says whether the code or the document should change. Claude weighs each finding, changes that side where the finding holds, and says in the pull request why where it does not.
- `miniclaude:spec-checker` checks the branch against the spec it implements, when there is one: each acceptance criterion, constraint, and listed edge case, and anything the spec rules out. A bug review cannot find a requirement that was never built, because missing code is not in the diff.

Neither agent sees Claude's account of the work. Both report findings and change nothing. The spec checker can only read files. The architecture checker also runs shell commands to read the git history, and its instructions limit it to read-only git commands. Claude fixes the spec gaps that affect correctness. Both agents run on the session's model at high effort.

Before each version bump, Claude has the architecture checker review the whole codebase and the document itself: rules that keep getting in the way, gaps that pile up, decisions whose condition for revisiting has been met, and files that change in most commits and keep growing.

The same step catches mistakes that keep coming back. Each commit that fixes a mistake ends with a `Mistake:` trailer naming the kind of mistake, and at each version bump Claude groups those trailers since the previous bump. For a kind of mistake seen three or more times, Claude turns on the linter rule that catches it, or adds the right pattern to the rules in `ARCHITECTURE.md` when the mistake is about how a kind of problem is solved, so the architecture checker enforces it on every pull request. Anything else stays with review, which caught it in the first place. None of this asks you anything or adds lines to `CLAUDE.md`.

When no effort level is given, `/code-review` reuses the last level you typed, so typing `/code-review high` once sets the depth of later reviews.
