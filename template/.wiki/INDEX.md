# Project Wiki

This directory holds durable project knowledge. Keep one document as the owner of each fact and link to it instead of maintaining competing copies. Temporary investigation notes belong outside the wiki and should not be treated as project truth.

## Document map

- [Ideas](IDEAS.md) holds exploratory directions, possible features, questions, and loose plans. Its contents are not accepted scope or commitments.
- [Product concept](CONCEPT.md) owns accepted product purpose, intended users, principles, and boundaries.
- [Product requirements](PRD.md) owns product-level goals, success metrics, user journeys, functional and non-functional requirements, and release criteria.
- [Architecture](ARCHITECTURE.md) describes the currently implemented system and its constraints.
- [Design system](DESIGN.md) owns visual language, tokens, and UI conventions.
- [Planned work](TODO.md) owns committed or imminent work.
- [Backlog](BACKLOG.md) owns deferred, aspirational, or unscheduled work.
- [Feature specs](features/README.md) own the detailed requirements of individual features.

## Documentation lifecycle

1. Explore unformed direction in `IDEAS.md`. Distill accepted product purpose and boundaries into `CONCEPT.md`; move only deferred or committed work to `BACKLOG.md` or `TODO.md`.
2. Translate the concept into testable requirements in `PRD.md` before planning a release.
3. Create a feature spec in `features/` (see [the format](features/README.md)) before planning substantial feature delivery, and link it from the requirements it covers in `PRD.md`.
4. Reconcile current-state documents when implementation changes externally meaningful behavior, architecture, or operations.

## Source of truth

Code, tests, and configuration describe executable behavior. Reconcile documentation when it disagrees with implementation. Treat proposals and plans as intent, not as proof that a behavior has shipped.
