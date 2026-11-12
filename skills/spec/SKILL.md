---
name: spec
description: Shape one feature's spec and write it to .wiki/features/, asking the user only the questions that have no safe default. Use when the user wants to specify, define, or plan a feature, or before building a feature that has no spec. Not for product-level requirements (PRD.md) or for implementing the feature.
argument-hint: "[feature name or idea]"
---

# Write a feature spec

Turn a feature idea into a spec that a later session can build from without asking the user anything.

`.wiki/features/README.md` owns the spec format and its validation rules. This skill covers how to reach a spec that passes them while asking the user as little as the feature allows.

Feature to specify: $ARGUMENTS

## Steps

1. Check that the wiki is writable.
   - If `.wiki/features/README.md` does not exist, stop and tell the user to run `/miniclaude:init-project` first.
   - If `.wiki` is a symbolic link (`test -L .wiki`), this session runs in a worktree and cannot edit the wiki. Stop and tell the user to run the skill from the main checkout.
   - If no feature is named above, ask which feature to specify.

2. Gather what is already decided. Read `.wiki/features/README.md`, `.wiki/CONCEPT.md`, `.wiki/PRD.md`, any spec in `.wiki/features/` that this feature touches, and the code it will build on. Read `.wiki/DESIGN.md` when the feature has UI. Placeholder text left in a wiki template is not a decision. If a spec for this feature already exists, revise it instead of writing a second one.

3. Draft the spec internally and settle every uncertainty you can without the user. See [Settle before asking](#settle-before-asking).

4. Ask the user about what is left. See [Ask](#ask). Ask nothing when step 3 already gives a coherent spec.

5. Write the spec to `.wiki/features/<FEATURE-NAME>.md` from the README template. Record a decision the user chose to defer under Open Questions. Otherwise that section reads `None.`

6. Reread the written spec against each item of the Validation list in the README and fix what fails. Link the spec from each `PRD.md` requirement it covers. Do not add or change requirements in `PRD.md`. When no requirement covers the feature, the template says how to record that.

7. Report the spec path, the decisions the user made, the defaults you chose that materially shape the feature, and any open question that still blocks delivery planning. Leave obvious mechanics out of the report.

Do not start implementing. Suggest building the feature in a fresh session, so the build starts from the spec and not from this interview.

## Settle before asking

Resolve each uncertainty with the first of these that gives a safe answer:

1. What the user said and what the wiki has accepted.
2. The closest existing behavior in the application or design system. Inspect the repository instead of asking.
3. Accessibility, security, and platform conventions. Do not offer an option that breaks one.
4. The simplest behavior that is cheap to change later.

Do not ask a question because the template has a field for it. The template checks coverage. It does not ask for product complexity.

## Ask

Ask the user a question only when all of these hold:

- At least two answers are credible for this product. A conventional answer beside a strawman is not a question.
- The answers lead to different requirements, scope, journeys, or acceptance criteria. If you cannot name the spec section that changes, drop the question.
- A wrong default would be unsafe, costly, hard to reverse, or would defeat what the user wants from the feature.

Such questions usually concern scope, destructive or irreversible behavior, persistence and recovery, permissions and privacy, money, external contracts, partial success, and deliberate departures from how the product already behaves. Control mechanics, visual details, exact copy, file formats, and test mechanics are yours to decide unless this feature makes them contractual.

| Situation | Handling |
| --- | --- |
| Closing an ordinary dialog | Use the standard behavior. Do not ask. |
| Closing a form with unsaved edits | Look for the existing policy. Ask only when the product has none. |
| Permanent deletion or recoverable trash | Ask when the product has no deletion policy. |
| A routine button label | Follow existing copy. Ask only when the wording changes consent or an irreversible action. |
| A one-page or multi-step flow, judged by feel | Ask for a prototype or a concrete comparison instead of more questions. |

Run the interview in rounds:

- Ask at most three questions in a round, and ask a decision before the decisions that depend on it.
- For each question, say what it changes, give the credible options, and recommend one.
- Work out what is still open after each round. Do not work through a prepared list.
- When the user says to use the default, apply it to every equivalent choice.
- When the user does not know, default a reversible choice and record a consequential one under Open Questions.
- When many questions remain, propose a narrower feature instead of asking them all.
