# Architecture — [Product Name]

> Authority: This document owns the intended shape of the system: its boundaries, the rules code must follow, and the reasons behind decisions. It also lists where the code does not match that intent yet. It does not restate what the repository already shows, such as file layout, configuration, or commands.

This document describes how **[Product Name]** is meant to be put together and why. It answers: where does this code belong, and how do the pieces talk to each other?

The code shows what the system is. This document says what it is supposed to be, so that new work moves the code toward the intended shape instead of copying its drift.

For the product purpose and domain model, see [CONCEPT.md](./CONCEPT.md). Commands live in the project's `CLAUDE.md`.

---

## 1. System Shape

[Describe the intended stack, process model, layers, and how they communicate. Where the code does not match this yet, say so in section 3, not here.]

```text
[ASCII diagram or text outline that shows:
 - layers (frontend, backend, data store, third-party services)
 - communication boundaries and protocols (IPC, HTTP, shared memory, message queue)
 - process boundaries (single binary, client-server, edge workers)
 - deployment boundary (desktop, web, mobile, embedded)]
```

---

## 2. Rules

[The constraints that keep the shape intact: dependency direction, interface boundaries, layer separation, and any naming or placement convention that carries architectural meaning. State how each rule is enforced, so reviewers know which rules no tool checks.]

| Rule               | Enforcement                                 | Why it exists                    |
| ------------------ | ------------------------------------------- | -------------------------------- |
| [Rule description] | [Linter, type checker, test, or convention] | [What breaks when it is ignored] |
| [Rule description] | [Linter, type checker, test, or convention] | [What breaks when it is ignored] |

---

## 3. Where the Code Differs

[Every known gap between this document and the code: structure that is decided but not built yet, and existing code that breaks a rule above. New code follows this document, not the pattern it would replace. Describe the gap here, and schedule the work to close it in [TODO.md](./TODO.md) or [BACKLOG.md](./BACKLOG.md). Delete an entry when its gap is closed. Write `None.` when the code matches.]

- **[Gap]:** [What the code does, what this document intends, and what to do when working near it.]

---

## 4. Decisions and Trade-offs

- **[Decision]:** [What was chosen, the trade-off, and the concrete condition that would justify revisiting it.]
- **[Decision]:** [What was chosen, the trade-off, and the concrete condition that would justify revisiting it.]
