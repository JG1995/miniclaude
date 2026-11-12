# Product Requirements Document: [Product Name]

> Authority: This document owns product-level requirements — goals, success metrics, user journeys, functional and non-functional requirements, and release criteria. It does not own product purpose or scope boundaries, feature-level design, the delivery schedule, or current architecture.

This document translates the vision in [CONCEPT.md](./CONCEPT.md) into testable requirements for **[Product Name]**. It answers: what must the product do, how well must it do it, and how do we know it is ready to ship?

For why the product exists and who it serves, see [CONCEPT.md](./CONCEPT.md). For detailed requirements of an individual feature, see its feature spec in [features/](features/README.md). For when work is scheduled, see [TODO.md](./TODO.md).

---

## 1. Overview

**Release target:** [MVP / v1.0 / named milestone this PRD describes]

**Status:** [Draft / In review / Accepted]

[1-2 paragraphs summarising what this release delivers and for whom. Link to the pillars in CONCEPT.md rather than restating them.]

---

## 2. Goals and Non-Goals

### 2.1 Goals

[Outcomes this release must achieve. Each goal maps to one or more success metrics in section 3.]

1. **[Goal]:** [What changes for the user or the business when this is achieved.]
2. **[Goal]:** [What changes for the user or the business when this is achieved.]
3. **[Goal]:** [What changes for the user or the business when this is achieved.]

### 2.2 Non-Goals

[Outcomes this release deliberately does not pursue, even if related. Product-wide scope boundaries live in CONCEPT.md — list only release-specific exclusions here.]

- [Non-goal and why it is excluded from this release]
- [Non-goal and why it is excluded from this release]

---

## 3. Success Metrics

[How we measure whether the goals were met. Every metric needs a baseline, a target, and a way to measure it. If the product has no telemetry, name the manual or qualitative method instead.]

| Metric     | Goal      | Baseline           | Target         | Measurement method          |
| ---------- | --------- | ------------------ | -------------- | --------------------------- |
| [Metric]   | [Goal #]  | [Current value]    | [Target value] | [Where and how it's measured] |
| [Metric]   | [Goal #]  | [Current value]    | [Target value] | [Where and how it's measured] |
| [Metric]   | [Goal #]  | [Current value]    | [Target value] | [Where and how it's measured] |

---

## 4. Users and Use Cases

[Reference the segments defined in CONCEPT.md's Target Audience. Do not redefine them — add only what requirements need: the context, the trigger, and the job to be done.]

| ID     | Segment         | Use case                                       | Priority          |
| ------ | --------------- | ---------------------------------------------- | ----------------- |
| UC-01  | [Segment]       | As a [user], I want to [action] so that [outcome]. | [Must/Should/Could] |
| UC-02  | [Segment]       | As a [user], I want to [action] so that [outcome]. | [Must/Should/Could] |
| UC-03  | [Segment]       | As a [user], I want to [action] so that [outcome]. | [Must/Should/Could] |

---

## 5. User Journeys

[Walk through the critical end-to-end flows step by step. These are the flows that must work for the release to succeed. Each step should be observable — something a tester could verify.]

### 5.1 [Journey Name]

**Covers:** [UC-01, UC-02]

1. [User action or system event]
2. [System response the user sees]
3. [User action or system event]
4. [Outcome — the end state that proves the journey succeeded]

**Failure paths:** [What happens when a step fails — validation errors, network loss, missing data — and what the user sees.]

### 5.2 [Journey Name]

**Covers:** [UC-03]

1. [User action or system event]
2. [System response the user sees]
3. [Outcome]

**Failure paths:** [What the user sees when it goes wrong.]

---

## 6. Functional Requirements

[Group requirements by product area. Each requirement is a single, testable statement of behaviour — "the system shall …" — with a stable ID so feature specs, tests, and PRs can reference it. Use MoSCoW priority: Must / Should / Could / Won't (this release). Link the feature spec once one exists.]

### 6.1 [Product Area]

| ID      | Requirement                                     | Priority | Use case | Feature spec                           |
| ------- | ----------------------------------------------- | -------- | -------- | -------------------------------------- |
| FR-001  | [The system shall …]                            | [Must]   | [UC-01]  | [features/<FEATURE-NAME>.md or —]         |
| FR-002  | [The system shall …]                            | [Should] | [UC-01]  | [features/<FEATURE-NAME>.md or —]         |

### 6.2 [Product Area]

| ID      | Requirement                                     | Priority | Use case | Feature spec                           |
| ------- | ----------------------------------------------- | -------- | -------- | -------------------------------------- |
| FR-010  | [The system shall …]                            | [Must]   | [UC-02]  | [features/<FEATURE-NAME>.md or —]         |
| FR-011  | [The system shall …]                            | [Could]  | [UC-03]  | [features/<FEATURE-NAME>.md or —]         |

---

## 7. Non-Functional Requirements

[Quality attributes the whole product must meet. State each as a measurable threshold, not an aspiration — "p95 load under 200 ms", not "fast". Remove categories that do not apply; add any that do.]

| ID      | Category          | Requirement                                        | Verification             |
| ------- | ----------------- | -------------------------------------------------- | ------------------------ |
| NFR-01  | Performance       | [Latency, throughput, startup time, bundle size]   | [Benchmark, test, tool]  |
| NFR-02  | Reliability       | [Uptime, data durability, crash recovery]          | [Benchmark, test, tool]  |
| NFR-03  | Security          | [Auth, data protection, secrets handling]          | [Benchmark, test, tool]  |
| NFR-04  | Privacy           | [Data collected, retention, telemetry policy]      | [Benchmark, test, tool]  |
| NFR-05  | Accessibility     | [Standard and level — see DESIGN.md]               | [Benchmark, test, tool]  |
| NFR-06  | Compatibility     | [Platforms, browsers, OS versions, screen sizes]   | [Benchmark, test, tool]  |
| NFR-07  | Localisation      | [Supported languages, formats, time zones]         | [Benchmark, test, tool]  |

---

## 8. Constraints and Dependencies

### 8.1 Constraints

[Fixed conditions the solution must work within — budget, deadline, platform, regulation, licensing, team size. Note the source of each constraint.]

- **[Constraint]:** [What it limits and where it comes from.]
- **[Constraint]:** [What it limits and where it comes from.]

### 8.2 Dependencies

[External services, APIs, data sources, or other teams the release relies on. State what happens if the dependency is unavailable.]

| Dependency     | Used for              | Risk if unavailable          | Mitigation              |
| -------------- | --------------------- | ---------------------------- | ----------------------- |
| [Dependency]   | [Requirement IDs]     | [Impact on the user]         | [Fallback or plan]      |
| [Dependency]   | [Requirement IDs]     | [Impact on the user]         | [Fallback or plan]      |

---

## 9. Release Criteria

[The conditions that must all be true before this release ships. Each item is a checkbox that can be verified objectively.]

- [ ] All **Must** functional requirements implemented and covered by passing tests
- [ ] All critical user journeys in section 5 verified end to end, including failure paths
- [ ] All non-functional requirements in section 7 measured and met
- [ ] Pre-delivery checklist in [DESIGN.md](./DESIGN.md) passes for all shipped UI
- [ ] [ARCHITECTURE.md](./ARCHITECTURE.md) lists every known gap between the shipped system and the intended architecture
- [ ] [Product-specific criterion]

---

## 10. Open Questions

[Unresolved decisions that block or shape requirements. Each needs an owner. When resolved, update the affected requirements and remove the question.]

| #  | Question         | Affects            | Owner     | Status             |
| -- | ---------------- | ------------------ | --------- | ------------------ |
| 1  | [Question]       | [Requirement IDs]  | [Owner]   | [Open / Resolved]  |
| 2  | [Question]       | [Requirement IDs]  | [Owner]   | [Open / Resolved]  |

---

## Maintenance

- **Keep IDs stable.** Never renumber a requirement; retire it with a strikethrough and a note so references in specs, tests, and PRs stay valid.
- **Push detail down.** When a requirement grows beyond one testable sentence, move the detail into the feature spec and link to it.
- **Push purpose up.** If a change alters why the product exists or who it serves, update [CONCEPT.md](./CONCEPT.md) first, then reconcile this document.
- **Reconcile on ship.** When a release ships, mark its requirements as delivered and start the next release's goals from section 2.
