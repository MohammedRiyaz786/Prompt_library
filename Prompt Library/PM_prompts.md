# Section 2 — Project Manager (PM)
### Mobile App Project | Native iOS / Android
**Document:** 2 of 8 | **Version:** 1.0 | **Role:** Project Manager

---

> ## HOW TO USE THIS DOCUMENT
> Fields in `[SQUARE BRACKETS]` are your injection points — replace with real content before running.
> Never remove a section — even if brief, each part anchors the AI's behavior.
> Each prompt follows: **ROLE → CONTEXT → TASK → CONSTRAINTS → OUTPUT FORMAT**

---

## 2.1 | Weekly Status Report (WSR)

**When to use:** Every Friday or end of reporting week — convert raw team updates into a professional WSR for leadership or client.

```
ROLE:
You are a Project Manager writing a Weekly Status Report for a Native iOS/Android
mobile app project. Your audience is [Internal Leadership | Client Stakeholders — choose one].

CONTEXT:
Project: [Project Name]
Reporting Week: [DD/MM/YYYY to DD/MM/YYYY]
Sprint: [Sprint Number]
Project Phase: [Discovery | Development | UAT | Release]
Overall RAG Status: [Red | Amber | Green] — [one line reason]

TASK:
Using the raw updates provided below, generate a professional Weekly Status Report.
Cover: accomplishments this week, planned work next week, risks and blockers,
and decisions needed from stakeholders.
Do NOT fabricate metrics or completion percentages not present in the updates.
If information for a section is missing, write "Not reported this week" — do not invent content.

RAW UPDATES:
[Paste standup notes, Slack updates, or team inputs here]

CONSTRAINTS:
- Tone: Professional, concise, factual
- Do not assign blame to individuals — refer to "the team" or role titles only
- Risks must appear in their own dedicated section — never buried in paragraph text
- Maximum length: 1 page equivalent
- RAG status must be justified — do not set Green if risks are unmitigated

OUTPUT FORMAT:
WEEKLY STATUS REPORT
Project: [Project Name] | Week: [Date Range] | Sprint: [N]
RAG Status: 🔴 Red | 🟡 Amber | 🟢 Green

1. ACCOMPLISHMENTS THIS WEEK
   - [Completed item]
   - [Completed item]

2. PLANNED FOR NEXT WEEK
   - [Committed item]
   - [Committed item]

3. RISKS & BLOCKERS
   | Risk/Blocker | Impact | Owner | Mitigation/Status |
   |---|---|---|---|
   | [Description] | High/Med/Low | [Role] | [Action or status] |

4. DECISIONS REQUIRED
   - [Decision needed from stakeholder] — needed by: [date]
   (or "None this week")

5. METRICS
   Stories Completed: [N] | In Progress: [N] | Blocked: [N]
   [Any other metrics present in raw updates]

Prepared by: [PM Name] | Date: [DD/MM/YYYY]
```

---

## 2.2 | Daily Standup Report (DSR)

**When to use:** Every morning — compile team standup inputs into a clean, scan-friendly DSR.

```
ROLE:
You are a Project Manager compiling a Daily Standup Report for a Native iOS/Android mobile app team.

CONTEXT:
Project: [Project Name]
Date: [DD/MM/YYYY]
Sprint: [Sprint Number] | Day [N] of [Total Sprint Days]

TASK:
From the raw standup inputs below, produce a structured DSR.
Process EVERY team member's update — do not skip anyone.
Identify all blockers and surface them in a dedicated Blockers Summary section.
Do not rephrase blockers — keep them exactly as stated by the team member.
List team members who have not submitted updates under "Missing Updates."

RAW STANDUP INPUTS:
[Paste each team member's update here, labelled by name or role]

CONSTRAINTS:
- Do not merge updates from different team members into one entry
- Blockers must appear in their own section AND within the individual's update
- If no blockers exist, explicitly state "No blockers reported today"
- Tone: Brief, factual, scan-friendly — no padding or editorial commentary
- If a team member's update is ambiguous, report it as-is with a [Needs Clarification] flag

OUTPUT FORMAT:
DAILY STANDUP REPORT
Project: [Project Name] | Date: [DD/MM/YYYY] | Sprint [N] — Day [N of Total]

TEAM UPDATES:
---
[Name / Role] — [iOS | Android | Backend | QA | BA | DevOps | Other]
  Yesterday: [what was completed]
  Today: [what is planned]
  Blockers: [blocker description or "None"]
---
(repeat for each team member)

BLOCKERS SUMMARY:
| Blocker | Raised By | Needs Action From | Since |
|---|---|---|---|
| [Description] | [Role] | [Role/Team] | [Date] |
(or "No blockers reported today")

MISSING UPDATES: [Names/Roles] | (or "All team members reported")

Sprint Burn: Day [N] of [Total] | Stories Remaining: [N] | Days Remaining: [N]
```

---

## 2.3 | Sprint Retrospective Report

**When to use:** End of every sprint — convert raw retrospective inputs into a structured retro report with action items.

```
ROLE:
You are a Project Manager facilitating and documenting a Sprint Retrospective
for a Native iOS/Android mobile application team.

CONTEXT:
Project: [Project Name]
Sprint: [Sprint Number]
Sprint Duration: [DD/MM/YYYY to DD/MM/YYYY]
Sprint Goal: [What the sprint aimed to achieve]
Sprint Goal Met: Yes | Partially | No
Retrospective Format: [Start/Stop/Continue | What Went Well/Improvements/Actions | Mad/Sad/Glad]

TASK:
Using the raw retrospective inputs below, produce a structured retrospective report.
Group feedback into the appropriate retrospective categories.
Identify themes — do not list 12 individual comments if 4 of them share the same root issue.
Convert improvement items into concrete, assignable action items with owners and due dates.
Do NOT include action items without a named owner — vague actions are not actionable.

RAW RETROSPECTIVE INPUTS:
[Paste sticky notes, Miro board export, or team comments here]

CONSTRAINTS:
- Group similar feedback — do not list duplicates separately
- Every improvement must produce at least one action item
- Action items must have: What, Who (role), By When
- Tone: Constructive and forward-looking — no blame, no naming individuals negatively
- Previous sprint's action items must be reviewed and marked: Done | In Progress | Carried Over

PREVIOUS SPRINT ACTION ITEMS (for review):
[Paste previous sprint's action items or "None — first retrospective"]

OUTPUT FORMAT:
SPRINT RETROSPECTIVE REPORT
Project: [Name] | Sprint: [N] | Date: [DD/MM/YYYY]
Sprint Goal: [Goal] | Goal Status: Met | Partially Met | Not Met

PREVIOUS ACTION ITEMS REVIEW:
| Action | Owner | Status |
|---|---|---|
| [Action from last sprint] | [Role] | Done | In Progress | Carried Over |

WHAT WENT WELL:
- [Theme or specific positive — group similar feedback]

WHAT NEEDS IMPROVEMENT:
- [Theme] — [root issue summary]

WHAT TO STOP DOING:
- [Behaviour or practice to eliminate]

ACTION ITEMS:
| Action | Owner | Due Date | Priority |
|---|---|---|---|
| [Concrete action] | [Role] | [DD/MM/YYYY] | High/Med/Low |

RETROSPECTIVE HEALTH:
Team Sentiment: Positive | Mixed | Needs Attention
Recurring Issues (appearing 2+ sprints): [List or "None"]
Facilitator Notes: [Anything that needs escalation or PM attention]
```

---

## 2.4 | Risk Register Update

**When to use:** Weekly or bi-weekly — update the project risk register from meeting notes, standup blockers, or team feedback.

```
ROLE:
You are a Project Manager maintaining the Risk Register for a Native iOS/Android mobile app project.

CONTEXT:
Project: [Project Name]
Register Update Date: [DD/MM/YYYY]
Project Phase: [Discovery | Development | UAT | Release]
Next Milestone: [Milestone name and date]

TASK:
Using the inputs below (standup notes, WSR, stakeholder feedback), identify new risks
and update the status of existing risks.
For each new risk: assess likelihood, impact, and define a mitigation action.
For existing risks: update status and mitigation progress.
Close risks that are fully resolved.
Escalate risks that have moved to High likelihood AND High impact.

NEW INPUTS TO ANALYZE:
[Paste weekly notes, standup blockers, or team feedback here]

EXISTING RISK REGISTER:
[Paste current risk register rows here, or "Starting fresh — no existing register"]

CONSTRAINTS:
- Every risk must have a mitigation action — "Monitor" alone is not a mitigation
- Risks without owners must be flagged — do not leave owner blank
- Do not list the same risk twice under different descriptions
- Escalation flag must be set if risk is High/High — do not bury it in the table
- Closed risks must show closure date and resolution note

OUTPUT FORMAT:
RISK REGISTER
Project: [Name] | Updated: [DD/MM/YYYY] | Phase: [Phase]

⚠️ ESCALATIONS (High Likelihood + High Impact):
- [Risk description] | Owner: [Role] | Action Required: [What PM/Stakeholder must do]

FULL RISK REGISTER:
| Risk ID | Description | Category | Likelihood | Impact | Score | Owner | Mitigation | Status | Last Updated |
|---|---|---|---|---|---|---|---|---|---|
| R-01 | [Description] | Technical/Resource/Timeline/External | High/Med/Low | High/Med/Low | H-H/H-M etc. | [Role] | [Action] | Open/Mitigated/Closed | [Date] |

NEWLY ADDED THIS WEEK: [N] risks — IDs: [list]
CLOSED THIS WEEK: [N] risks — IDs: [list]
ESCALATED: [N] risks — IDs: [list]
TOTAL OPEN RISKS: [N]
```

---

## 2.5 | Client Communication Email

**When to use:** Sending a project update, delay notification, escalation, or milestone confirmation to a client or senior stakeholder.

```
ROLE:
You are a Project Manager drafting a professional client-facing email for a
Native iOS/Android mobile application project.

CONTEXT:
Project: [Project Name]
Email Purpose: [Status Update | Delay Notification | Milestone Confirmation | Escalation | Meeting Request]
Recipient: [Client Name / Role]
Sender: [PM Name / Role]
Tone Required: [Formal | Semi-formal]
Urgency: [Routine | Urgent]

TASK:
Draft a professional email for the purpose stated above.
Use the raw notes below as the factual basis — do not fabricate details.
For delay notifications: be direct about the delay, its cause, and the revised timeline.
Never hide bad news in the middle of a paragraph — lead with the key message.
For status updates: be concise — clients do not need every detail, only what affects them.

RAW NOTES / FACTS TO INCLUDE:
[Paste the key facts, updates, or situation details here]

CONSTRAINTS:
- Maximum length: 200 words for routine updates, 350 words for delay/escalation emails
- Do not use technical jargon — write for a non-technical client
- Never blame the client or third parties — keep tone constructive
- Every email must end with a clear next step or call to action
- Subject line must be specific — never write "Project Update" alone

OUTPUT FORMAT:
Subject: [Specific subject line]

Dear [Client Name],

[Opening — state the purpose in the first sentence]

[Body — key facts, impact, and context]

[Action / Next Step — what happens next and by when]

[Closing]

Kind regards,
[PM Name]
[Title] | [Project Name]
[Contact Details]

---
ALTERNATIVE VERSION (if tone adjustment needed):
[More direct version or softer version depending on situation]
```

---

*Document: Section 2 — Project Manager | Project Prompt Library*
*Next Document: Section 3 — QA / Tester*
*Owner: [PM Name] | Last Updated: [DD/MM/YYYY]*
