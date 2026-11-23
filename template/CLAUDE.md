# Core Guidelines
You are building [describe product].

Always build code cleanly, modularly, and with proper architecture and separation of concerns, so the codebase reads as if one developer wrote all of it: the same kind of problem is solved with the same pattern everywhere. Never simply bolt on a feature just because I asked for it; the Architecture section below says what to do when a feature does not fit. Always keep `.wiki/ARCHITECTURE.md` updated: it states the intended architecture and lists where the code does not match it yet.

Aside from this requirement, this codebase is yours: the product is decided by the user, but how it's built is your call, including refactors and changes to the architecture, and you'll be the one to keep on building on it. Do not stop to ask how to build something. Stop and ask the user only when a feature cannot be built cleanly as specified, or when building it would change existing core functionality or behaviour. There is no obligation to maintain legacy functionality or code - If code is no longer used, remove it.

## Architecture
Each part of a feature belongs where `.wiki/ARCHITECTURE.md` puts that responsibility, built the way the codebase already solves that kind of problem. When a feature does not fit, ask whether it would fit if the code matched the document. If it would, the code has drifted: refactor it toward the document. If it would not, the document may be wrong. Change a rule only when its "Why it exists" no longer holds, and then for the whole codebase, never as an exception for one feature, because exceptions are how a codebase stops reading as one developer's work. Record the change under Decisions and Trade-offs, and list the code that still follows the old rule under Where the Code Differs.

Put refactors in their own commits, before the feature, without changing behaviour, so the tests confirm each step. `.wiki/` is not in git, so also record each architecture change, and each rule that made a feature awkward, in the body of the commit that needed it.

Where the stack allows it, enforce each rule with a check in the lint or test command, and change the check in the same commit as the rule, so a rule change shows in the diff. Turn on the linter's file-size and complexity rules as warnings, with limits high enough that only outliers trigger them.

## Workflow
* The `.wiki/` folder contains relevant project information, maintained by both you and the user. Start with `.wiki/INDEX.md`, which maps each document to what it owns; product requirements live in `.wiki/PRD.md`. When your work changes something a wiki document owns, update that document as part of the work: `ARCHITECTURE.md`, `DESIGN.md` and `TODO.md` are yours to keep current. `CONCEPT.md` and `PRD.md` record the user's product decisions, so when your work shows they are wrong or incomplete, propose the edit instead of making it. The folder is intentionally excluded from git tracking via `.gitignore`. In a worktree it is a link to the main checkout's copy that you can read but not edit, so report the wiki updates you would have made instead.
* Features are implemented in feature-branches, never `main`. Before starting one, check the latest CI run on `main`; if it failed, fix that first.
* When implementing a feature, always follow the relevant feature spec in `.wiki/features`.
* When creating UI, take screenshots to verify the outcome. Present outcome to user with select screenshots included.
* Before reporting work as done, run the checks that cover it and include the commands and their output in the report.
* Set up CI as soon as the project has tests. On every PR and every push to `main`, it runs the whole test suite, the typecheck and the linter with the commands recorded below, because branches that each pass can still break `main` together.
* Before opening a PR, run `/code-review` on the branch, and have the `miniclaude:architecture-checker` agent check the branch against `.wiki/ARCHITECTURE.md`; give it the base branch. If the branch implements a spec in `.wiki/features/`, also have the `miniclaude:spec-checker` agent check the branch against it; give it the spec path, the changed files and, for UI, the paths of your screenshots. Give neither agent your account of the work. Fix the `/code-review` and spec-checker findings that affect correctness and skip style findings. Weigh each architecture-checker finding: where it holds, change the code or `ARCHITECTURE.md` as it says; where it does not, say why in the PR description.
* When a PR is approved and its CI passes, it is rebase-merged onto `main`.
* When a PR has been merged, always clean up local git branches that are completed.
* Releases follow SemVer, starting at `0.1.0`. Bump the version in a PR of its own, from a commit on `main` whose CI passed; `1.0.0` is the first release that meets the release criteria in `.wiki/PRD.md`. Before bumping, have the `miniclaude:architecture-checker` agent check the whole codebase, update `ARCHITECTURE.md` from its findings, and schedule the refactors they call for in `.wiki/TODO.md` or `.wiki/BACKLOG.md`. Also group the `Mistake:` trailers since the previous version bump. For each kind of mistake seen three or more times, turn on the linter rule that catches it as an error, or, when the mistake is about how a kind of problem is solved, add the right pattern to the rules in `ARCHITECTURE.md`. Leave the rest to review, which caught them in the first place.

## Commands
Record the exact commands here as soon as they exist, and correct them when the toolchain changes: install, run, test (the whole suite and a single file), typecheck, and lint.

[insert repo-specific commands]

## Conventions
* Always follow TDD.
* Git history is memory, and rebase-merging keeps commit messages on `main` but not PR descriptions. In the commit body, say why the change was made and what you ruled out.
* When a commit fixes a mistake, whether review caught it or it reached `main`, end the message with a `Mistake:` trailer that names the kind of mistake in a few words, such as `Mistake: swallowed exception`. The version bump counts these to find mistakes that keep coming back.
* Follow KISS, DRY, YAGNI - Don't overengineer a simple change.
