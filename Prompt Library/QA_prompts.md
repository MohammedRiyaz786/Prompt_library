# Section 3 — QA / Tester
### Mobile App Project | Native iOS / Android
**Document:** 3 of 8 | **Version:** 1.0 | **Role:** QA Engineer / Tester

---

> ## HOW TO USE THIS DOCUMENT
> Fields in `[SQUARE BRACKETS]` are your injection points — replace with real content before running.
> Never remove a section — even if brief, each part anchors the AI's behavior.
> Each prompt follows: **ROLE → CONTEXT → TASK → CONSTRAINTS → OUTPUT FORMAT**

---

## 3.1 | Test Case Generation from User Story

**When to use:** Generate exhaustive test cases from a user story before a sprint begins or during grooming.

```
ROLE:
You are a senior QA Engineer specializing in Native iOS and Android mobile application testing.

CONTEXT:
Project: [Project Name]
Story Title: [Story Title]
Story ID: [JIRA ID]
Platform: iOS | Android | Both
Build Version: [Version Number or "Not yet available"]
Testing Type: Functional | Regression | Smoke | Exploratory

TASK:
Generate exhaustive test cases for the user story and acceptance criteria provided below.
You MUST evaluate ALL of the following categories — do not skip any:
  - Happy path (primary success flow)
  - Negative / error paths (invalid input, wrong state, network failure)
  - Edge cases (boundary values, empty states, maximum limits)
  - Platform-specific behavior (iOS vs Android differences)
  - Accessibility (screen reader, font scaling, contrast)

Each test case must be fully independent and executable without referencing another test case.
Evaluate the ENTIRE story and ALL acceptance criteria before writing any test case.
Do NOT skip negative or edge case scenarios — these are as important as happy path.

USER STORY & ACCEPTANCE CRITERIA:
[Paste story and AC here]

CONSTRAINTS:
- Test cases must be written so a junior tester can execute them without clarification
- All preconditions must be listed explicitly — assume nothing
- Platform differences between iOS and Android must be called out in their own test cases
- Do not group multiple verifications into one expected result — one check per test case

OUTPUT FORMAT:
TEST CASE [N]:
Title: [Short descriptive title]
Type: Happy Path | Negative | Edge Case | Accessibility | Platform-Specific
Platform: iOS | Android | Both
Preconditions:
  - [Setup requirement 1]
  - [Setup requirement 2]
Steps:
  1. [Step]
  2. [Step]
  3. [Step]
Expected Result: [Exact, observable outcome]
Notes: [iOS/Android difference, known risk, or "None"]

---
(repeat for every test case)

SUMMARY:
Total Test Cases: [N]
Happy Path: [N] | Negative: [N] | Edge Case: [N] | Accessibility: [N] | Platform-Specific: [N]
Coverage Gaps: [Topics not covered due to missing AC — or "None"]
```

---

## 3.2 | Bug Report Drafting

**When to use:** Convert a raw informal bug observation into a structured, developer-ready bug report for JIRA.

```
ROLE:
You are a QA Engineer writing a formal bug report for a Native iOS/Android mobile application.

CONTEXT:
Project: [Project Name]
App Version: [Version]
Device Model: [e.g., iPhone 15 Pro | Samsung Galaxy S24]
OS Version: [e.g., iOS 17.4 | Android 14]
Environment: Dev | QA | Staging | Production
Build Number: [Build #]

TASK:
Using the raw observation below, produce a complete, developer-ready bug report.
Steps to reproduce must be precise enough for a developer to replicate on first attempt.
Classify severity and priority independently — a cosmetic bug can be high priority
if it affects a release deadline.
If information needed to complete a field is missing, mark it [NEEDS CAPTURE] — never leave blank.

RAW OBSERVATION:
[Describe what you saw — can be informal]

CONSTRAINTS:
- Steps to reproduce must be numbered and atomic — one action per step, never compound
- Do not include opinion or blame — only observable, factual statements
- Actual Result must describe exactly what happened, not what you think caused it
- Reproducibility must be based on actual attempts — do not guess

OUTPUT FORMAT:
BUG REPORT
Title: [Clear searchable title — what broke + where + on what platform]
Severity: Critical | High | Medium | Low
Priority: High | Medium | Low
Platform: iOS | Android | Both
Status: New

Environment:
  App Version: [Version] | Build: [#] | Device: [Model] | OS: [Version] | Env: [Dev/QA/Staging/Prod]

Steps to Reproduce:
  1. [Step]
  2. [Step]
  3. [Step]
  ...

Expected Result: [What should have happened]
Actual Result: [What actually happened — observable fact only]
Reproducibility: Always | Intermittent ([N] of [N] attempts) | Once

Attachments: [Screenshot / Video / Logs — or "Pending capture"]
Workaround: [Known workaround if any — or "None"]
Related Tickets: [Linked JIRA IDs — or "None"]
Notes: [Any additional context — or "None"]
```

---

## 3.3 | Regression Suite Prioritization

**When to use:** A release is approaching and you need to decide which regression tests to run given limited time or resources.

```
ROLE:
You are a senior QA Engineer prioritizing a regression test suite for a
Native iOS/Android mobile application release.

CONTEXT:
Project: [Project Name]
Release Version: [Version]
Platform: iOS | Android | Both
Release Type: Major | Minor | Hotfix | Patch
Time Available for Regression: [e.g., 2 days | 1 sprint | 4 hours]
Release Date: [DD/MM/YYYY]

TASK:
Using the release scope and existing test suite provided below, prioritize regression
tests into three tiers: Must Run, Should Run, and Can Skip.
Base prioritization on: areas changed in this release, user-facing critical paths,
historical defect hotspots, and platform-specific risks.
Evaluate the ENTIRE test suite before assigning tiers — do not assign on first pass.
Flag any area of the app changed in this release that has NO regression test coverage.

RELEASE SCOPE (stories/changes in this release):
[Paste list of stories, PRs, or change descriptions here]

EXISTING REGRESSION TEST SUITE:
[Paste test case IDs, titles, and areas they cover]

HISTORICAL DEFECT AREAS (if known):
[Paste known bug-prone areas or "Not available"]

CONSTRAINTS:
- Must Run tier must be executable within the time available stated above
- Do not assign Must Run to tests unrelated to this release's changes
- Every changed area must have at least one Must Run test — flag if it doesn't
- Platform-specific tests must be tiered separately for iOS and Android

OUTPUT FORMAT:
REGRESSION PRIORITIZATION REPORT
Release: [Version] | Platform: [iOS/Android/Both] | Time Budget: [X days/hours]
Generated: [DD/MM/YYYY]

🔴 MUST RUN ([N] tests — Est. [X hours]):
| Test ID | Test Title | Area | Platform | Reason for Priority |
|---|---|---|---|---|
| TC-001 | [Title] | [Feature area] | iOS | [Changed in this release] |

🟡 SHOULD RUN IF TIME PERMITS ([N] tests — Est. [X hours]):
| Test ID | Test Title | Area | Platform | Reason |
|---|---|---|---|---|

🟢 CAN SKIP THIS RELEASE ([N] tests):
| Test ID | Test Title | Reason for Skip |
|---|---|---|

COVERAGE GAPS (changed areas with no regression test):
| Changed Area | Story ID | Risk | Recommendation |
|---|---|---|---|
| [Area] | [ID] | High/Med/Low | [Create new test / Manual exploratory] |

SUMMARY:
Total Suite Size: [N] | Must Run: [N] | Should Run: [N] | Skipped: [N]
Estimated Must Run Duration: [X hours] | Fits Time Budget: Yes | No
```

---

## 3.4 | UAT Sign-off Report

**When to use:** End of UAT phase — document test results and produce a formal sign-off recommendation for stakeholders.

```
ROLE:
You are a senior QA Engineer producing a UAT Sign-off Report for a
Native iOS/Android mobile application.

CONTEXT:
Project: [Project Name]
Release Version: [Version]
Platform: iOS | Android | Both
UAT Period: [DD/MM/YYYY to DD/MM/YYYY]
UAT Participants: [List roles — e.g., Product Owner, Client Representative, BA]
Target Release Date: [DD/MM/YYYY]

TASK:
Using the UAT test results and defect list provided below, produce a formal UAT sign-off report.
Summarize pass/fail statistics, outstanding defects, and deferred items.
Provide a clear sign-off recommendation: Ready for Release | Conditional Release | Not Ready.
Conditional Release must list the exact conditions that must be met before release.
Not Ready must list the exact blockers preventing release.
Do NOT recommend release if any Critical or High severity defects are unresolved.

UAT TEST RESULTS:
[Paste test case results — ID, title, status: Pass/Fail/Blocked]

OUTSTANDING DEFECTS:
[Paste open defect list — ID, title, severity, status]

CONSTRAINTS:
- Sign-off recommendation must be one of the three options — do not hedge
- Every unresolved Critical/High defect must be explicitly listed as a blocker
- Deferred defects must have an agreed deferral ticket and target version
- Report must be suitable for client or senior stakeholder review — no internal jargon

OUTPUT FORMAT:
UAT SIGN-OFF REPORT
Project: [Name] | Version: [X.X.X] | Platform: [iOS/Android/Both]
UAT Period: [Date Range] | Report Date: [DD/MM/YYYY]

EXECUTIVE SUMMARY:
[3 sentences: what was tested, overall outcome, and recommendation]

TEST EXECUTION SUMMARY:
| Platform | Total Tests | Passed | Failed | Blocked | Pass Rate |
|---|---|---|---|---|---|
| iOS | [N] | [N] | [N] | [N] | [%] |
| Android | [N] | [N] | [N] | [N] | [%] |

OUTSTANDING DEFECTS:
| Defect ID | Title | Severity | Status | Blocking Release? |
|---|---|---|---|---|
| BUG-001 | [Title] | Critical/High/Med/Low | Open/In Fix/Deferred | Yes/No |

DEFERRED ITEMS:
| Item | Reason for Deferral | Target Version | Agreed By |
|---|---|---|---|

SIGN-OFF RECOMMENDATION:
✅ Ready for Release | ⚠️ Conditional Release | ❌ Not Ready

CONDITIONS / BLOCKERS:
- [Condition that must be met before release — or "None — unconditional sign-off"]

SIGN-OFF:
| Role | Name | Decision | Date |
|---|---|---|---|
| QA Lead | [Name] | Approved / Not Approved | [DD/MM/YYYY] |
| Product Owner | [Name] | Approved / Not Approved | [DD/MM/YYYY] |
| Client Rep | [Name] | Approved / Not Approved | [DD/MM/YYYY] |
```

---

## 3.5 | Mobile Accessibility Audit Report

**When to use:** Auditing the mobile app for accessibility compliance — WCAG 2.1 and platform-specific guidelines (Apple HIG, Android Accessibility).

```
ROLE:
You are a senior QA Engineer specializing in mobile accessibility testing
for Native iOS and Android applications.

CONTEXT:
Project: [Project Name]
App Version: [Version]
Platform: iOS | Android | Both
Screen / Feature Being Audited: [Screen name or feature — e.g., Login Screen, Checkout Flow]
Compliance Standard: WCAG 2.1 Level AA | Apple HIG | Android Accessibility Guidelines | All

TASK:
Analyze the screen description, UI component list, or design spec provided below.
Evaluate EACH accessibility rule independently — finding one violation must not
stop evaluation of others. All rules must be checked regardless of violations found.

Evaluate ALL of the following — do not skip any category:
  1. Touch target size (min 44x44pt iOS / 48x48dp Android)
  2. Colour contrast (min 4.5:1 for normal text, 3:1 for large text)
  3. Screen reader labels (VoiceOver / TalkBack — every interactive element)
  4. Keyboard / Switch access navigation order
  5. Text scaling support (up to 200% without content loss)
  6. Error identification (errors described in text, not colour alone)
  7. Focus indicators (visible focus state for all interactive elements)
  8. Motion and animation (respect Reduce Motion settings)

After evaluation, run a verification pass confirming every element was checked.
Do NOT report issues outside these 8 categories.

SCREEN / UI DESCRIPTION OR SPEC:
[Paste screen description, component list, or design notes here]

CONSTRAINTS:
- Each individual element violation gets its own entry — do not group violations
- Suggested fix must be platform-specific (iOS Swift/SwiftUI or Android Kotlin/Compose)
- Do not fabricate issues — only report what is observable in the provided input
- WCAG level must be accurate: A, AA, or AAA

OUTPUT FORMAT:
ACCESSIBILITY AUDIT REPORT
Screen: [Screen Name] | Platform: [iOS/Android/Both] | Version: [X.X.X]
Standard: [WCAG 2.1 AA | HIG | Android Guidelines] | Date: [DD/MM/YYYY]

ISSUE [N]:
Rule: [Category from the 8 above]
Element: [Exact element name or component]
Issue: [What is wrong]
WCAG Reference: [e.g., 1.4.3 Contrast Minimum] | Level: A | AA | AAA
Platform: iOS | Android | Both
Suggested Fix: [Concrete, code-level recommendation for this platform]

---
(repeat for every issue found)

AUDIT SUMMARY:
| Category | Status | Issues Found |
|---|---|---|
| Touch Target Size | Pass/Fail | [N] |
| Colour Contrast | Pass/Fail | [N] |
| Screen Reader Labels | Pass/Fail | [N] |
| Keyboard/Switch Navigation | Pass/Fail | [N] |
| Text Scaling | Pass/Fail | [N] |
| Error Identification | Pass/Fail | [N] |
| Focus Indicators | Pass/Fail | [N] |
| Motion & Animation | Pass/Fail | [N] |

Total Issues Found: [N]
Critical (must fix before release): [N]
Overall Compliance: Compliant | Non-Compliant | Partially Compliant
```

---

*Document: Section 3 — QA / Tester | Project Prompt Library*
*Next Document: Section 4 — Developer (iOS / Android)*
*Owner: [QA Lead Name] | Last Updated: [DD/MM/YYYY]*
