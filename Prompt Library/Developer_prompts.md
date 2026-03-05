# Section 4 — Developer (iOS / Android)
### Mobile App Project | Native iOS / Android
**Document:** 4 of 8 | **Version:** 1.0 | **Role:** iOS / Android Developer

---

> ## HOW TO USE THIS DOCUMENT
> Fields in `[SQUARE BRACKETS]` are your injection points — replace with real content before running.
> Never remove a section — even if brief, each part anchors the AI's behavior.
> Each prompt follows: **ROLE → CONTEXT → TASK → CONSTRAINTS → OUTPUT FORMAT**

---

## 4.1 | Code Generation from Acceptance Criteria

**When to use:** Generate production-ready native iOS (Swift) or Android (Kotlin) code directly from a story's acceptance criteria.

```
ROLE:
You are a senior Native Mobile Developer.
For iOS: write Swift using UIKit or SwiftUI as specified.
For Android: write Kotlin using Jetpack Compose or XML layouts as specified.

CONTEXT:
Project: [Project Name]
Platform: iOS (Swift / [UIKit | SwiftUI]) | Android (Kotlin / [Compose | XML])
Story Title: [Story Title]
Story ID: [JIRA ID]
Architecture Pattern: [MVVM | MVC | MVP | Clean Architecture]
Reactive Framework: [Combine | RxSwift | RxJava | Kotlin Coroutines | None]
Existing Conventions:
  - [e.g., "We use Coordinator pattern for navigation"]
  - [e.g., "All network calls go through NetworkManager singleton"]
  - [e.g., "None specified"]

TASK:
Generate production-quality code implementing ALL acceptance criteria below.
Follow the specified architecture pattern strictly — do not deviate.
Cover every AC item — evaluate the full list before writing any code.
Include inline comments for any non-obvious logic.
Handle all error states described or implied in the AC.
Flag any AC that is technically ambiguous or impossible as a "Technical Note."
Do NOT generate placeholder, stub, or TODO code — all logic must be functional.

ACCEPTANCE CRITERIA:
[Paste full AC here]

CONSTRAINTS:
- Do not use deprecated APIs for the platform
- Functions must follow single-responsibility principle
- Use the reactive framework specified — do not mix frameworks
- All user-facing strings must use localization keys, not hardcoded strings
- Network calls must handle: success, failure, timeout, and no-connectivity states

OUTPUT FORMAT:
// FileName.swift | FileName.kt
// Story: [Story Title] | [JIRA ID]
// Platform: [iOS | Android]
// Pattern: [Architecture]

[Complete, functional code block]

---
TECHNICAL NOTES:
- [Ambiguity found in AC — what assumption was made]
- [Any AC item that requires clarification before implementation]
(or "None — all AC items implemented as specified")

INTEGRATION GUIDE:
- [Where this file connects in the existing app structure]
- [Any dependencies that must exist before this can be integrated]
- [Migration or data changes required, if any]
```

---

## 4.2 | Code Review Checklist Generation

**When to use:** Before reviewing a PR — generate a targeted, story-specific code review checklist rather than a generic one.

```
ROLE:
You are a senior Native Mobile Developer conducting a code review
on a Native iOS/Android project.

CONTEXT:
Project: [Project Name]
Platform: iOS | Android | Both
PR Title: [PR Title]
PR Author: [Role — e.g., Mid-level iOS Developer]
Story Being Implemented: [Story Title and JIRA ID]
Architecture: [MVVM | MVC | Clean Architecture]
Reviewer Focus: [Full review | Security focus | Performance focus | Quick sanity check]

TASK:
Generate a targeted code review checklist for this specific PR and story.
Every checklist item must be answerable as Pass / Fail / N/A.
Tailor all items to the story scope — do not generate generic boilerplate
unrelated to what this PR implements.
Evaluate the PR description fully before generating checklist items.
Platform-specific concerns (iOS memory management, Android lifecycle) must
appear in their own dedicated sections.

PR DESCRIPTION / DIFF SUMMARY:
[Paste PR description, changed files list, or diff summary here]

CONSTRAINTS:
- Every item must be specific to this story — remove any item that says "check for X" 
  if X is not relevant to this PR
- Do not include items the author's role would not be expected to handle
- Security and data privacy items are mandatory for any PR touching user data,
  authentication, or network calls
- Accessibility items are mandatory for any PR touching UI components

OUTPUT FORMAT:
CODE REVIEW CHECKLIST
PR: [Title] | Story: [JIRA ID] | Platform: [iOS/Android/Both]
Author: [Role] | Reviewer Focus: [Focus type]

LOGIC & CORRECTNESS:
[ ] [Item] — relevance: [why this matters for this story]

ARCHITECTURE COMPLIANCE ([Pattern]):
[ ] [Item]

iOS SPECIFIC:
[ ] Memory management — check for retain cycles in closures
[ ] [Story-specific iOS item]

ANDROID SPECIFIC:
[ ] Lifecycle awareness — ViewModel/LiveData used correctly
[ ] [Story-specific Android item]

ERROR HANDLING:
[ ] [Item]

SECURITY & DATA PRIVACY:
[ ] [Item — or "N/A — PR does not touch user data or auth"]

ACCESSIBILITY:
[ ] [Item — or "N/A — PR does not touch UI components"]

TEST COVERAGE:
[ ] Unit tests written for all new business logic
[ ] [Story-specific test item]

TOTAL ITEMS: [N] | Mandatory: [N] | Optional: [N]
RECOMMENDED APPROVAL CONDITION: All mandatory items must Pass
```

---

## 4.3 | PR Description Generator

**When to use:** Writing a clear, structured PR description from your commit list or implementation notes — saves time and ensures consistency across the team.

```
ROLE:
You are a senior Native Mobile Developer writing a Pull Request description
for a Native iOS/Android mobile application project.

CONTEXT:
Project: [Project Name]
Platform: iOS | Android | Both
Story ID: [JIRA ID]
Story Title: [Story Title]
PR Type: Feature | Bug Fix | Refactor | Tech Debt | Hotfix
Branch: [feature/branch-name → main/develop]
Breaking Change: Yes | No

TASK:
Using the implementation notes and commit messages below, write a complete PR description.
The description must give reviewers everything they need to understand WHAT was changed,
WHY it was changed, and HOW to test it — without reading the code first.
For bug fixes: include root cause explanation.
For features: include a brief explanation of the approach taken and any alternatives considered.
Do NOT pad the description — every sentence must add information value.

IMPLEMENTATION NOTES / COMMITS:
[Paste commit messages, implementation notes, or bullet points of what you built]

CONSTRAINTS:
- Screenshots or screen recordings must be referenced if UI was changed
- Testing instructions must be precise enough for a QA engineer to follow
- Breaking changes must be listed explicitly with migration steps
- Related tickets must be linked — do not leave this blank if dependencies exist
- Keep language technical but clear — written for a developer audience

OUTPUT FORMAT:
## Summary
[2-3 sentences: what this PR does and why]

## Changes Made
- [Specific change 1 — file or component affected]
- [Specific change 2]
- [Specific change 3]

## Approach & Decisions
[Brief explanation of implementation approach and any significant decisions made.
Include alternatives considered if relevant.]

## Root Cause (Bug Fixes Only)
[What caused the bug and how this PR resolves it — or remove section for features]

## How to Test
1. [Step]
2. [Step]
3. [Expected outcome]

Platform-specific test steps:
- iOS: [Any iOS-specific steps]
- Android: [Any Android-specific steps]

## Screenshots / Recordings
| Before | After |
|---|---|
| [Screenshot or "N/A"] | [Screenshot or "N/A"] |

## Checklist
- [ ] AC verified against implementation
- [ ] Unit tests added / updated
- [ ] No hardcoded strings — localization keys used
- [ ] No deprecated APIs used
- [ ] Breaking changes documented below

## Breaking Changes
[Migration steps required — or "None"]

## Related Tickets
- Implements: [JIRA-ID]
- Depends on: [JIRA-ID or "None"]
- Closes: [JIRA-ID or "None"]
```

---

## 4.4 | Technical Debt Log Entry

**When to use:** During or after a code review, sprint, or refactor — formally log a piece of technical debt so it can be tracked and prioritized.

```
ROLE:
You are a senior Native Mobile Developer documenting a technical debt item
identified in a Native iOS/Android mobile application codebase.

CONTEXT:
Project: [Project Name]
Platform: iOS | Android | Both
Identified During: [Code Review | Sprint Development | Refactor | Bug Fix | Architecture Review]
Identified By: [Role]
Date Identified: [DD/MM/YYYY]
Current Sprint: [Sprint Number]

TASK:
Using the description below, produce a formal technical debt log entry.
Classify the debt type, assess its impact on the codebase, and estimate
the effort required to resolve it.
Provide a concrete remediation plan — not just "refactor this."
Identify whether this debt is actively causing problems now or is a future risk.
Do NOT downplay severity to avoid raising uncomfortable truths.

DEBT DESCRIPTION (informal):
[Describe the technical debt in your own words — can be rough notes]

CONSTRAINTS:
- Impact assessment must be specific — state which features or flows are affected
- Effort estimate must be realistic — not aspirational
- Do not create a debt entry for something that should be fixed immediately in the current sprint
- Priority recommendation must consider both effort and risk, not effort alone

OUTPUT FORMAT:
TECHNICAL DEBT LOG ENTRY
ID: TD-[Number] | Platform: [iOS/Android/Both] | Date: [DD/MM/YYYY]
Identified By: [Role] | Sprint: [N]

DEBT TITLE: [Short, searchable title]

DEBT TYPE:
  [ ] Architecture / Design    [ ] Code Quality / Duplication
  [ ] Test Coverage Gap        [ ] Dependency / Library
  [ ] Performance              [ ] Security
  [ ] Platform API Deprecation [ ] Documentation

DESCRIPTION:
[Clear explanation of what the debt is and where it lives in the codebase]

LOCATION:
  File(s): [Filename(s) or module]
  Component: [Class / ViewModel / Module / Screen]

CURRENT IMPACT:
  Actively Causing Issues: Yes | No
  Affected Features: [List features or flows impacted]
  Risk If Left Unresolved: High | Medium | Low
  Risk Description: [What breaks or degrades if this is not addressed]

REMEDIATION PLAN:
  Approach: [Specific steps to resolve — not just "refactor"]
  Effort Estimate: iOS [S/M/L/XL] | Android [S/M/L/XL]
  Dependencies: [What must be done first — or "None"]
  Can Be Done Incrementally: Yes | No

PRIORITY RECOMMENDATION: High | Medium | Low
SUGGESTED TARGET SPRINT: [Sprint Number or "Backlog"]
JIRA TICKET RAISED: Yes — [ID] | No — [Reason]
```

---

*Document: Section 4 — Developer (iOS / Android) | Project Prompt Library*
*Next Document: Section 5 — Backend Developer*
*Owner: [Tech Lead Name] | Last Updated: [DD/MM/YYYY]*
