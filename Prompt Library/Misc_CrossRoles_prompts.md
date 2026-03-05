# Section 8 — Cross-Role Prompts
### Mobile App Project | Native iOS / Android
**Document:** 8 of 8 | **Version:** 1.0 | **Role:** All Team Members

---

> ## HOW TO USE THIS DOCUMENT
> These prompts are not owned by a single role — any team member can use them.
> Fields in `[SQUARE BRACKETS]` are your injection points — replace with real content before running.
> Never remove a section — even if brief, each part anchors the AI's behavior.
> Each prompt follows: **ROLE → CONTEXT → TASK → CONSTRAINTS → OUTPUT FORMAT**

---

## 8.1 | Dev → QA Handover Document

**When to use:** A developer completes a story and hands it over to QA for testing — gives QA everything they need without a meeting, reduces back-and-forth, and surfaces known risks upfront.

```
ROLE:
You are a Native iOS/Android Developer producing a formal handover document
for the QA team before they begin testing a completed story.

CONTEXT:
Project: [Project Name]
Story ID: [JIRA ID]
Story Title: [Story Title]
Platform: iOS | Android | Both
Build Version: [Version Number]
Build Location: [TestFlight link | Firebase link | Direct download link]
Developer: [Role]
Handover Date: [DD/MM/YYYY]
Sprint: [Sprint Number]

TASK:
Using the implementation notes below, produce a complete Dev → QA handover document.
Cover: what was built, what was NOT built (scope boundaries), how to set up the test environment,
known edge cases the developer is aware of, areas of risk, and anything the developer
would test first if they were the QA engineer.
Be honest about implementation shortcuts or areas of uncertainty —
QA cannot test what they do not know to look for.
Do NOT omit known limitations to make the implementation look cleaner than it is.

IMPLEMENTATION NOTES:
[Paste developer's implementation summary, PR description, or build notes here]

CONSTRAINTS:
- "What Was NOT Built" is mandatory — scope boundaries prevent wasted QA effort
- Known risks must be listed even if the developer believes they are unlikely to trigger
- Test environment setup must be precise enough for a QA engineer to follow independently
- If platform behaviour differs between iOS and Android, call it out explicitly
- Do not use code-level language when describing test scenarios — keep it testable

OUTPUT FORMAT:
DEV → QA HANDOVER DOCUMENT
Story: [JIRA ID] — [Story Title]
Platform: [iOS/Android/Both] | Build: [Version] | Date: [DD/MM/YYYY]
Developer: [Role] | QA Assignee: [Role or "Unassigned"]

WHAT WAS BUILT:
  [Clear plain-English summary of what was implemented — user-facing behaviour focus]

WHAT WAS NOT BUILT (out of scope for this story):
  - [Explicitly excluded item 1]
  - [Explicitly excluded item 2]
  (This is mandatory — "Nothing excluded" is only acceptable if truly nothing was scoped out)

BUILD ACCESS:
  Platform: [iOS/Android/Both]
  Build Link: [TestFlight | Firebase | Direct]
  Test Account Credentials: [Credentials or "See 1Password vault — [vault name]"]

TEST ENVIRONMENT SETUP:
  1. [Setup step]
  2. [Setup step]
  3. [Expected starting state before testing begins]

HAPPY PATH TO VERIFY FIRST:
  1. [Step — the primary flow to confirm the feature works end-to-end]
  2. [Step]
  3. Expected outcome: [What the tester should see]

KNOWN EDGE CASES & RISKS:
  | Scenario | Risk Level | Developer's Note |
  |---|---|---|
  | [Edge case description] | High/Med/Low | [What the developer knows or suspects] |

AREAS I WOULD TEST CAREFULLY (developer recommendation):
  - [Specific area, screen, or flow the developer is less confident about]

iOS SPECIFIC NOTES:
  - [Any iOS-only behaviour, known difference, or concern — or "No iOS-specific notes"]

ANDROID SPECIFIC NOTES:
  - [Any Android-only behaviour, known difference, or concern — or "No Android-specific notes"]

DEPENDENCIES:
  - [Backend API / Feature flag / Other story that must be in place for testing — or "None"]

DEFINITION OF DONE CHECKLIST:
  [ ] Happy path verified on [iOS/Android/Both]
  [ ] All AC items verified
  [ ] Negative paths tested
  [ ] No P1 or P2 bugs open
  [ ] Tested on minimum supported OS version ([iOS min] / [Android min])
```

---

## 8.2 | Go / No-Go Release Checklist

**When to use:** The day before or morning of a release — a structured cross-team checklist ensuring every role has signed off before the app goes to the App Store or Play Store.

```
ROLE:
You are a Project Manager running a Go / No-Go release assessment for a
Native iOS/Android mobile application release. You are consolidating inputs
from QA, Development, DevOps, BA, and the Solution Architect.

CONTEXT:
Project: [Project Name]
Release Version: [X.X.X]
Build Number: [Build #]
Platform: iOS | Android | Both
Target Release Date: [DD/MM/YYYY HH:MM TZ]
Release Type: App Store | Play Store | Internal | All
Release Manager: [Role]

TASK:
Using the team inputs provided below, assess the release readiness across ALL
dimensions listed. Evaluate every dimension independently — a pass in one area
does not compensate for a fail in another.
Produce a final Go / No-Go recommendation.
Go requires ALL mandatory dimensions to Pass.
No-Go must list every blocking item with the owner responsible for resolution.
Conditional Go must list exact conditions that must be met with hard deadlines.
Do NOT recommend Go if any Critical or High severity defect is unresolved.

TEAM INPUTS:
[Paste QA sign-off, DevOps readiness notes, PM confirmation, and any other inputs here]

CONSTRAINTS:
- Every mandatory dimension must be explicitly evaluated — do not skip any
- Conditional Go conditions must have a resolution deadline — open-ended conditions are not acceptable
- No-Go items must be specific — "QA not complete" is not acceptable; state exactly what is incomplete
- The final recommendation must be ONE of three: Go | Conditional Go | No-Go

OUTPUT FORMAT:
GO / NO-GO RELEASE CHECKLIST
Project: [Name] | Version: [X.X.X] | Platform: [iOS/Android/Both]
Release Date: [DD/MM/YYYY] | Release Manager: [Role]

DIMENSION ASSESSMENT:

QUALITY & TESTING:
  [ ] UAT sign-off received — Owner: QA Lead
      Status: Pass | Fail | Pending — [Notes]
  [ ] Zero unresolved Critical / High severity defects
      Status: Pass | Fail — [Open defect IDs if fail]
  [ ] Regression suite executed and passed
      Status: Pass | Fail | Partial — [Coverage %]
  [ ] Performance testing completed (if applicable)
      Status: Pass | Fail | N/A

BUILD & RELEASE PIPELINE:
  [ ] Production build successfully created and signed
      Status: Pass | Fail — [Notes]
  [ ] Build submitted to App Store / Play Store review (if required)
      Status: Pass | Fail | N/A — [Review status]
  [ ] All pipeline stages green on release branch
      Status: Pass | Fail — [Notes]

BACKEND & INFRASTRUCTURE:
  [ ] Backend APIs deployed to production environment
      Status: Pass | Fail | N/A — [Notes]
  [ ] Database migrations executed successfully
      Status: Pass | Fail | N/A
  [ ] Feature flags configured correctly for release
      Status: Pass | Fail | N/A
  [ ] Monitoring and alerting active for new features
      Status: Pass | Fail — [Notes]

ROLLBACK READINESS:
  [ ] Rollback plan documented and tested
      Status: Pass | Fail — [Notes]
  [ ] Previous production build available for hotfix if needed
      Status: Pass | Fail

COMPLIANCE & LEGAL:
  [ ] Privacy policy updated (if new data collection)
      Status: Pass | N/A
  [ ] App Store / Play Store metadata and screenshots updated
      Status: Pass | Fail | N/A
  [ ] Third-party SDK licences reviewed (if new SDKs added)
      Status: Pass | N/A

STAKEHOLDER SIGN-OFF:
  [ ] Product Owner sign-off received
      Status: Pass | Fail | Pending
  [ ] Client / Business sign-off received (if required)
      Status: Pass | Fail | N/A

═══════════════════════════════════════
FINAL RECOMMENDATION
═══════════════════════════════════════
✅ GO — All mandatory dimensions pass. Release approved.

⚠️ CONDITIONAL GO — Release approved ONLY if:
  - [Condition 1] resolved by [DD/MM/YYYY HH:MM] — Owner: [Role]
  - [Condition 2] resolved by [DD/MM/YYYY HH:MM] — Owner: [Role]

❌ NO-GO — Release blocked. Resolve before rescheduling:
  - [Blocker 1] — Owner: [Role] — Est. resolution: [Timeframe]
  - [Blocker 2] — Owner: [Role] — Est. resolution: [Timeframe]

REVISED RELEASE DATE (if No-Go): [DD/MM/YYYY or "TBD pending blocker resolution"]
```

---

## 8.3 | Sprint Planning Preparation

**When to use:** Before sprint planning — consolidate team capacity, story estimates, and dependencies into a structured planning brief so the ceremony runs efficiently.

```
ROLE:
You are a Project Manager and Business Analyst preparing a sprint planning
brief for a Native iOS/Android mobile application team.

CONTEXT:
Project: [Project Name]
Upcoming Sprint: [Sprint Number]
Sprint Duration: [N weeks — DD/MM/YYYY to DD/MM/YYYY]
Sprint Goal (proposed): [What this sprint aims to achieve]
Team Capacity: [List team members and available days — e.g., iOS Dev 1: 8 days, QA: 7 days]
Velocity Reference: [Average story points from last 3 sprints — or "Not tracked"]

TASK:
Using the backlog items and team inputs provided below, produce a sprint planning brief.
Identify which stories are ready to be pulled into the sprint (have AC, are estimated, dependencies met).
Identify which stories are NOT ready and what is blocking them.
Map dependencies between stories — a story with an unmet dependency must not be planned first.
Recommend a sprint scope that fits within the team's stated capacity.
Flag any risk to the sprint goal from the proposed scope.
Do NOT recommend a scope that exceeds capacity — buffer for ceremonies, reviews, and unplanned work.

BACKLOG ITEMS FOR CONSIDERATION:
[Paste candidate stories with estimates — Story ID, title, estimate, platform, dependencies]

TEAM INPUTS / CONSTRAINTS:
[Paste any team constraints — leave, public holidays, parallel work, on-call duties]

CONSTRAINTS:
- Account for ceremony time: planning (2h), daily standups, review, retrospective
- Leave 15-20% capacity buffer for unplanned work and bug fixes
- Stories with unmet dependencies must be flagged — do not include them in recommended scope
- Platform split must be realistic — iOS and Android effort tracked separately

OUTPUT FORMAT:
SPRINT PLANNING BRIEF
Project: [Name] | Sprint: [N] | Dates: [DD/MM/YYYY — DD/MM/YYYY]
Sprint Goal: [Proposed goal]

TEAM CAPACITY:
| Team Member / Role | Platform | Available Days | Story Points Available |
|---|---|---|---|
| [Role] | iOS/Android/QA/BA | [N days] | [N points] |
Total Capacity: [N story points] | After 15% buffer: [N story points]

RECOMMENDED SPRINT SCOPE:
| Story ID | Title | Platform | Estimate | Dependencies | Ready? |
|---|---|---|---|---|---|
| [ID] | [Title] | iOS/Android/Both | [N pts] | [ID or None] | ✅ Yes / ❌ No |

Total Recommended Points: [N] | iOS: [N] | Android: [N] | QA: [N]
Capacity Utilisation: [N]% (target: 80-85%)

NOT READY — BLOCKED STORIES:
| Story ID | Title | Blocker | Owner to Resolve | ETA |
|---|---|---|---|---|
| [ID] | [Title] | [What is missing] | [Role] | [Date or Sprint N+1] |

DEPENDENCY MAP:
  [Story ID] must complete before → [Story ID]
  [Story ID] requires backend → [Story ID / API endpoint]
  (or "No blocking dependencies in recommended scope")

SPRINT RISKS:
| Risk | Impact | Mitigation |
|---|---|---|
| [Risk to sprint goal] | High/Med/Low | [Mitigation] |

QUESTIONS FOR PLANNING CEREMONY:
  - [Open question the team must answer during planning]
  - [Story needing discussion or re-estimation]
```

---

## 8.4 | Meeting Minutes & Action Items

**When to use:** Any project meeting — requirements session, sprint review, stakeholder call, architecture review — convert raw notes or transcript into structured minutes with clear action items.

```
ROLE:
You are a Project Manager or BA capturing formal meeting minutes for a
Native iOS/Android mobile application project meeting.

CONTEXT:
Project: [Project Name]
Meeting Type: [Requirements | Sprint Review | Stakeholder Update | Architecture Review | Incident Review | Other]
Date: [DD/MM/YYYY]
Time: [HH:MM — HH:MM TZ]
Facilitator: [Role]
Attendees: [List roles — not names unless consent given]
Meeting Goal: [What the meeting was supposed to achieve]
Meeting Goal Achieved: Yes | Partially | No

TASK:
Using the raw notes or transcript below, produce formal meeting minutes.
Evaluate the ENTIRE input before writing any section — do not summarise as you read.
Capture: decisions made, action items, open questions, and deferred topics.
Every action item must have a clear owner, a deliverable, and a due date.
Action items without a named owner are not action items — they are wishes.
Flag any decision that contradicts a previous decision or existing documentation.
Do NOT include conversational filler or repeated points — distil to substance only.

RAW NOTES / TRANSCRIPT:
[Paste raw meeting notes or transcript here]

CONSTRAINTS:
- Discussion summary must be neutral — do not editorialize or favour one position
- Decisions must be clearly separated from discussions — not every discussion is a decision
- Conflicting decisions must be flagged — do not silently pick one
- Open questions must reference who is responsible for finding the answer
- Minutes must be suitable for sharing with all attendees and absentees

OUTPUT FORMAT:
MEETING MINUTES
Project: [Name] | Meeting: [Type] | Date: [DD/MM/YYYY]
Facilitator: [Role] | Note-taker: [Role]
Attendees: [Role list]
Meeting Goal: [Goal] | Goal Achieved: Yes | Partially | No

AGENDA ITEMS COVERED:
  1. [Topic]
  2. [Topic]

DISCUSSION SUMMARY:
[Topic 1]:
  [Neutral summary of discussion — key points only, no filler]

[Topic 2]:
  [Neutral summary]

DECISIONS MADE:
  | # | Decision | Made By | Date Effective |
  |---|---|---|---|
  | 1 | [Clear decision statement] | [Role] | Immediate / [DD/MM/YYYY] |

CONFLICTS / CONTRADICTIONS FLAGGED:
  - [Decision or direction that contradicts existing documentation or previous decisions]
  (or "None identified")

ACTION ITEMS:
  | # | Action | Owner | Due Date | Priority |
  |---|---|---|---|---|
  | 1 | [Specific deliverable] | [Role] | [DD/MM/YYYY] | High/Med/Low |

OPEN QUESTIONS (unresolved — need follow-up):
  | Question | Owner to Answer | Due By |
  |---|---|---|
  | [Question] | [Role] | [DD/MM/YYYY] |

DEFERRED TOPICS (not discussed — carry to next meeting):
  - [Topic — reason for deferral]
  (or "None")

NEXT MEETING:
  Date: [DD/MM/YYYY] | Type: [Meeting type] | Key Agenda Items: [List]
  (or "No follow-up meeting scheduled")

Distribution: [List roles who should receive these minutes]
```

---

## 8.5 | New Team Member Onboarding Guide

**When to use:** A new developer, QA engineer, BA, or PM joins the project — generate a tailored first-week guide so they are productive faster and ask fewer repeated questions.

```
ROLE:
You are a Project Manager and Solution Architect creating a new team member
onboarding guide for a Native iOS/Android mobile application project.

CONTEXT:
Project: [Project Name]
New Team Member Role: iOS Developer | Android Developer | QA Engineer | BA | PM | Backend Developer | DevOps
Start Date: [DD/MM/YYYY]
Current Sprint: [Sprint Number]
Current Project Phase: [Discovery | Development | UAT | Release]
Team Size: [N people]
Experience Level of New Member: [Junior | Mid-level | Senior]

TASK:
Generate a structured first-week onboarding guide tailored to the role and experience
level specified above. Cover: project context, team structure, tools and access,
codebase/process orientation, and a day-by-day first week plan.
Tailor depth to experience level — a senior hire needs context and decisions,
a junior hire needs step-by-step guidance.
Every access request must specify who to ask — "get access to X" with no owner is not actionable.

PROJECT CONTEXT TO INCLUDE:
[Paste project overview, tech stack summary, team structure, or architecture notes here]

CONSTRAINTS:
- Day-by-day plan must be realistic — do not pack 3 days of reading into Day 1
- Every tool listed must include: what it is used for and who grants access
- Do not include information not relevant to the specified role
- Pair/buddy assignments must be specified by role — not left as "ask your manager"
- Include one "quick win" task the new member can complete in their first week

OUTPUT FORMAT:
ONBOARDING GUIDE
Project: [Name] | Role: [Role] | Start Date: [DD/MM/YYYY]
Experience Level: [Junior/Mid/Senior] | Current Sprint: [N]

WELCOME & PROJECT OVERVIEW:
[3-4 sentence plain-English summary of what the project is, where it is in its lifecycle,
and what the new team member's primary contribution will be]

TEAM STRUCTURE:
| Role | Responsibility | Point of Contact For |
|---|---|---|
| [Role] | [What they do] | [What to ask them about] |

TOOLS & ACCESS (request in this order — each has dependencies):
| Tool | Purpose | Access Granted By | Day to Request |
|---|---|---|---|
| [Tool] | [What it's used for] | [Role to ask] | Day 1/2/3 |

CODEBASE / PROCESS ORIENTATION:
[Role-specific orientation — what to read, what to run, what to understand first]

  For iOS Developer: [Repository structure, architecture pattern, key files to read]
  For Android Developer: [Module structure, Gradle setup, key files to read]
  For QA: [Test suite location, how to run tests, environment setup]
  For BA: [JIRA board structure, story template, who to shadow]
  For PM: [Project tracker, reporting cadence, stakeholder map]

FIRST WEEK PLAN:
Day 1 — Orientation:
  - [ ] [Task — e.g., Meet the team, complete HR onboarding]
  - [ ] [Task — e.g., Request tool access listed above]
  - [ ] [Task — e.g., Read project README and architecture overview]

Day 2 — Environment Setup:
  - [ ] [Task — follow Environment Setup Runbook: Section 7.4]
  - [ ] [Task — e.g., Run the app locally / on simulator]

Day 3 — Codebase / Process Deep Dive:
  - [ ] [Task — e.g., Walk through codebase with buddy: [Role]]
  - [ ] [Task — e.g., Attend sprint standup and sprint review]

Day 4 — First Contribution:
  - [ ] [Task — e.g., Pick up starter ticket: [JIRA-ID]]
  - [ ] [Task — e.g., Raise first PR / test case / story]

Day 5 — Consolidation:
  - [ ] [Task — e.g., Retrospective on first week with buddy]
  - [ ] [Task — e.g., Document any gaps found in this onboarding guide]

QUICK WIN TASK:
  Story / Task: [JIRA ID — a well-defined, low-risk starter task]
  Why This: [Why this task is a good first contribution for this role and experience level]
  Buddy Support: [Role who will support this task]

BUDDY ASSIGNMENT:
  Buddy Role: [Role]
  Check-in Cadence: Daily (Week 1) → Weekly (Month 1)
  Buddy Responsibilities: [What the buddy is expected to help with]

END OF WEEK 1 CHECKLIST:
  [ ] All tool access granted and verified
  [ ] Environment set up and app running locally
  [ ] First contribution submitted (PR / story / test case)
  [ ] Attended at least one sprint ceremony
  [ ] Know who to ask for: technical help | process questions | business context
```

---

## 8.6 | Post-Sprint Metrics Report

**When to use:** End of every sprint — generate a data-driven sprint metrics report for team health tracking, velocity trending, and stakeholder visibility.

```
ROLE:
You are a Project Manager producing a post-sprint metrics report for a
Native iOS/Android mobile application project.

CONTEXT:
Project: [Project Name]
Sprint: [Sprint Number]
Sprint Dates: [DD/MM/YYYY — DD/MM/YYYY]
Sprint Goal: [What the sprint aimed to achieve]
Sprint Goal Met: Yes | Partially | No — [reason if partial or no]
Audience: Internal team | Leadership | Client | All

TASK:
Using the sprint data provided below, produce a complete post-sprint metrics report.
Calculate all metrics from the data provided — do not fabricate or estimate numbers
not present in the input.
Identify trends by comparing to the previous sprint data if provided.
Flag any metric that indicates a team health concern — do not bury warning signals
in positive framing.
Provide one concrete recommendation based on the metrics — not a list of generic advice.

SPRINT DATA:
[Paste JIRA sprint report, burndown data, defect counts, velocity data here]

PREVIOUS SPRINT DATA (for trend comparison):
[Paste previous sprint metrics — or "Not available — first sprint report"]

CONSTRAINTS:
- Every metric must show: this sprint value, previous sprint value (if available), and trend
- Trend must be: Improving | Stable | Declining — not just a number
- Carry-over stories must be listed individually — not summarised as a count
- Do not present a declining metric positively — be factual and direct
- One recommendation only — the most impactful action based on the data

OUTPUT FORMAT:
POST-SPRINT METRICS REPORT
Project: [Name] | Sprint: [N] | Dates: [DD/MM/YYYY — DD/MM/YYYY]
Sprint Goal: [Goal] | Goal Status: Met | Partially Met | Not Met

═══════════════════════════════════════
VELOCITY & DELIVERY
═══════════════════════════════════════
| Metric | This Sprint | Previous Sprint | Trend |
|---|---|---|---|
| Story Points Committed | [N] | [N] | Improving/Stable/Declining |
| Story Points Completed | [N] | [N] | Improving/Stable/Declining |
| Completion Rate | [N]% | [N]% | Improving/Stable/Declining |
| Stories Completed | [N] | [N] | Improving/Stable/Declining |
| Stories Carried Over | [N] | [N] | Improving/Stable/Declining |

CARRY-OVER STORIES:
| Story ID | Title | Reason for Carry-Over | Points |
|---|---|---|---|
| [ID] | [Title] | [Reason] | [N] |
(or "No carry-over — all committed stories completed")

═══════════════════════════════════════
QUALITY
═══════════════════════════════════════
| Metric | This Sprint | Previous Sprint | Trend |
|---|---|---|---|
| Bugs Raised During Sprint | [N] | [N] | Improving/Stable/Declining |
| Bugs Resolved During Sprint | [N] | [N] | Improving/Stable/Declining |
| Bugs Carried Over (unresolved) | [N] | [N] | Improving/Stable/Declining |
| Critical/High Bugs Raised | [N] | [N] | Improving/Stable/Declining |
| Escaped Defects (found post-sprint) | [N] | [N] | Improving/Stable/Declining |

═══════════════════════════════════════
TEAM HEALTH INDICATORS
═══════════════════════════════════════
| Indicator | Status | Notes |
|---|---|---|
| Blockers Resolved Within 24h | Yes/No/Partial | [N blockers — avg resolution time] |
| Unplanned Work % of Sprint | [N]% | [Acceptable <20% | Needs attention >20%] |
| Ceremonies Attended | [N]% attendance | [Any missed ceremonies] |
| Action Items from Last Retro | [N] Done / [N] Total | [Carried over: list IDs] |

HEALTH FLAGS: ⚠️ [Any metric indicating a concern — or "No health flags this sprint"]

═══════════════════════════════════════
PLATFORM SPLIT
═══════════════════════════════════════
| Platform | Points Completed | Bugs Raised | Carry-Over |
|---|---|---|---|
| iOS | [N] | [N] | [N] |
| Android | [N] | [N] | [N] |
| Backend | [N] | [N] | [N] |

═══════════════════════════════════════
TOP RECOMMENDATION
═══════════════════════════════════════
Based on this sprint's metrics, the single highest-impact action for Sprint [N+1] is:

[One concrete, specific recommendation derived directly from the data]
Owner: [Role responsible]
Expected Impact: [What metric this should improve and by how much]

═══════════════════════════════════════
SPRINT HEALTH SUMMARY
═══════════════════════════════════════
Overall Sprint Health: 🟢 Good | 🟡 Needs Attention | 🔴 Concerning
Velocity Trend (3-sprint): [Improving | Stable | Declining]
Quality Trend (3-sprint): [Improving | Stable | Declining]
Ready for Sprint [N+1] Planning: Yes | Yes with actions | No — [reason]
```

---

---

# APPENDIX — PROMPT QUALITY STANDARDS

> All 36 prompts in this library follow these non-negotiable standards.
> When creating new prompts for this project, apply every rule below.

| Standard | Rule |
|---|---|
| Role Definition | Every prompt opens with a clear, specific ROLE statement |
| Context Injection | Project name, sprint, platform always provided via `[brackets]` |
| Full Evaluation | Multi-item tasks always state: "evaluate ALL items — do not skip any" |
| Independent Evaluation | Multi-rule tasks always state: "evaluate each criterion independently" |
| One Entry Per Finding | Violations and findings are never grouped — each gets its own entry |
| No Fabrication Guard | Every prompt includes "do not fabricate/invent" instruction |
| Scope Boundary | Every prompt defines what is explicitly OUT of scope |
| Structured Output | Every prompt has a labelled, explicit output format |
| Missing Info Handling | Prompts specify what to do when input is incomplete |
| Verification Pass | Complex analysis prompts include a re-check instruction |
| Platform Awareness | iOS/Android differences called out wherever behaviour diverges |
| Honest Output | Prompts explicitly require negative findings to be reported — no positive spin |
| Actionable Owners | Every action item, recommendation, and risk must have a named role owner |

---

*Document: Section 8 — Cross-Role Prompts | Project Prompt Library*
*This is the final document in the library.*
*Library Owner: [PM / BA Lead] | Last Updated: [DD/MM/YYYY] | Next Review: [DD/MM/YYYY]*

---

## FULL LIBRARY INDEX

| Section | Role | Prompts | Document |
|---|---|---|---|
| 1 | Business Analyst | Story Creation, JIRA Gap Analysis, RTM, CR Impact | Section 1 |
| 2 | Project Manager | WSR, DSR, Sprint Retro, Risk Register, Client Email | Section 2 |
| 3 | QA / Tester | Test Cases, Bug Report, Regression Prioritization, UAT Sign-off, Accessibility Audit | Section 3 |
| 4 | Developer iOS/Android | Code Generation, Code Review, PR Description, Tech Debt Log | Section 4 |
| 5 | Backend Developer | API Contract, Error Code Standards, DB Migration Review | Section 5 |
| 6 | Solution Architect | ADR, Tech Spike Report, Capacity Assessment | Section 6 |
| 7 | DevOps Engineer | Pipeline Failure, YAML Generation, Release Notes, Runbook, Incident Report | Section 7 |
| 8 | Cross-Role | Dev→QA Handover, Go/No-Go Checklist, Sprint Planning, Meeting Minutes, Onboarding, Post-Sprint Metrics | Section 8 |
| **Total** | **7 Roles + Cross-Role** | **36 Prompts** | **8 Documents** |
