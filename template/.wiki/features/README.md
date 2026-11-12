# Feature Specs

> Authority: Feature specs own the detailed requirements of a single feature — its data, journeys, rules, edge cases, interface behavior, and acceptance criteria. They do not own product-level requirements, the delivery schedule, visual design tokens, or current architecture.

Feature specs live at `.wiki/features/<FEATURE-NAME>.md`.

Create a feature spec file only when the feature is about to be planned. Copy the Markdown block below into the feature spec file, and link it from the requirements it covers in [PRD.md](../PRD.md).

## Template

```markdown
# Feature: [Feature Name]

## Open Questions

[Only consequential choices that remain unresolved after repository inspection and conventional defaults. For each question, name the affected section and what its answer unblocks. Do not list routine component mechanics, implementation details, or choices settled by existing product, accessibility, security, or platform conventions. Write `None.` when no consequential question remains. Any other entry marks this feature spec provisional and blocks delivery planning.]

## 1. Executive Summary

**High-Level Goal:** [One sentence: what does this feature do and why does it exist?]

**Context:** [Where does this feature sit in the product? What does it consume? What consumes it? What other features does it depend on or interact with?]

**Non-Goals:** [Name behavior deliberately outside this feature. Do not invent exclusions solely to fill the field.]

**Requirements Covered:** [The PRD requirement and use-case IDs this feature delivers, e.g. `FR-001`, `FR-002`, `UC-01`. Write `None — not in PRD.` and flag it as an open question if the feature has no PRD requirement.]

## 2. Information Architecture (The "Memory Bank")

### User Inputs

- **[Input name]:** [Description, type, constraints, default value if any]

### Displayed Data

- **[Data name]:** [Description, when it is visible, what it depends on]

### Persistent Data

[Persistence location and mechanism:]

- **[Data name]:** [What is stored, when, and why]
- **The system must NOT persist** [anything explicitly ephemeral with rationale]

## 3. The User Journey (Step-by-Step)

### [Journey Name]

1. **Entry Point:** [How does the user arrive here?]
2. **Action 1:** [What the user does]
3. **System Response 1:** [What the system does in return]
4. ...
N. **Success State:** [What does "done" look like?]

## 4. Logical Constraints (The "Rules of the Road")

### [Constraint Group Name]

- **IF** [condition], **THEN** [consequence].
- ...

## 5. Negative Paths & Edge Cases (The "What-Ifs")

### Error Handling

- **[Error scenario]:** [System response; include exact copy only when wording is contractual]

### Empty States

- **[Empty scenario]:** [System response; include exact copy only when wording is contractual]

### Boundary Cases

- **[Boundary scenario]:** [System behavior]

### Interruptions

- **[Interruption scenario]:** [System behavior — is state preserved? rolled back? How?]

## 6. Interface & Interaction (The "Look and Feel")

[Specify feature-specific behavior and deliberate deviations. Routine control mechanics inherit established components, accessibility requirements, and platform conventions.]

### Visual Style

[Follows [DESIGN.md](../DESIGN.md). Name only the components and tokens this feature relies on, and any deliberate deviation from the design system with its rationale.]

### Layout

[High-level component structure and spatial arrangement]

### Copywriting

[Require exact text only when wording is contractually significant. Otherwise state the intended meaning, tone, or established component label.]

- **[UI element]:** [Exact text or semantic intent]

## 7. Acceptance Criteria (The "Mission Accomplished" Checklist)

- [ ] [Single verifiable criterion] ([FR-xxx] where it verifies a PRD requirement)
- [ ] ...
```

## When to write

Always. A feature without a spec is undefined behavior. After repository facts, conventional defaults, and consequential developer decisions produce a coherent contract, write the spec to `.wiki/features/<FEATURE-NAME>.md`.

## Validation

Before finalizing, verify:

- Every feature-specific or consequential user action has a corresponding system response — no orphaned actions.
- Every IF has a THEN — no partial logical constraints.
- Relevant empty, error, boundary, and interruption states have an observable outcome. Exact copy is required only when wording is contractual.
- Routine interaction mechanics inherit established product, accessibility, and platform conventions instead of becoming open questions.
- Every open question changes a requirement, scope boundary, invariant, journey, or acceptance criterion and names what its answer unblocks.
- A section that does not apply says why instead of inventing feature behavior.
- No section is blank or contains only "TBD" without being flagged as an open question at the top.
- Every requirement listed under Requirements Covered is verified by at least one acceptance criterion, and the matching PRD rows link back to this feature spec.
