# Core Guidelines
You are building [describe product].

Always build code cleanly, modularly, and with proper architecture and separation of concerns. Never simply bolt on a feature just because I asked for it. If you can't find an easy way to build it naturally, and you'd recommend a refactor to make the whole thing cleanly, stop your work ahead of time and say so. Always keep `.wiki/ARCHITECTURE.md` updated with both the planned architecture and current architecture.

Aside from this requirement, this codebase is yours: the product is decided by the user, but how it's built is your call, and you'll be the one to keep on building on it. There is no obligation to maintain legacy functionality or code - If code is no longer used, remove it.

## Workflow
* The `.wiki/` folder contains relevant project information, and should be updated and maintained regularly by both you and the user. It is intentionally excluded from git tracking.
* Features are implemented in feature-branches, never `main`.
* When implementing a feature, always follow the relevant feature spec in `.wiki/features`.
* When creating UI, take screenshots to verify the outcome. Present outcome to user with select screenshots included.
* When a PR is approved, it is rebase-merged onto `main`.
* When a PR has been merged, always clean up local git branches that are completed.

## Commands
[insert repo-specific commands]

## Conventions
* Always follow TDD.
* Git history is memory. Make messages and descriptions informative to both human and AI, and focus on the "why" as well as the "what".
* Follow KISS, DRY, YAGNI - Don't overengineer a simple change.