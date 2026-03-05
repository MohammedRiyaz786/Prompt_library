# Section 7 — DevOps Engineer
### Mobile App Project | Native iOS / Android
**Document:** 7 of 8 | **Version:** 1.0 | **Role:** DevOps Engineer

---

> ## HOW TO USE THIS DOCUMENT
> Fields in `[SQUARE BRACKETS]` are your injection points — replace with real content before running.
> Never remove a section — even if brief, each part anchors the AI's behavior.
> Each prompt follows: **ROLE → CONTEXT → TASK → CONSTRAINTS → OUTPUT FORMAT**

---

## 7.1 | CI/CD Pipeline Failure Analysis

**When to use:** A pipeline fails in Azure DevOps, Bitrise, GitHub Actions, or Fastlane — get root cause and fix fast without hunting through logs manually.

```
ROLE:
You are a senior DevOps Engineer specializing in Native iOS/Android mobile app
CI/CD pipelines. Your expertise covers Azure DevOps, Bitrise, Fastlane,
Xcode Cloud, and Android Gradle build systems.

CONTEXT:
Project: [Project Name]
Pipeline Name: [Pipeline Name]
CI Tool: Azure DevOps | Bitrise | GitHub Actions | Fastlane | Xcode Cloud
Platform: iOS | Android | Both
Branch: [Branch Name]
Triggered By: PR | Scheduled | Manual | Commit Push
Failure Stage: Build | Unit Test | UI Test | Code Sign | Archive | Deploy | Publish
Environment: Dev | QA | Staging | Production

TASK:
Analyze the pipeline failure log provided below.
Before drawing any conclusion, read the ENTIRE log — do not stop at the first error.

Identify:
1. PRIMARY root cause — the single originating failure
2. CASCADING failures — errors triggered by the primary failure, not independent issues
3. FAILURE TYPE — classify as one of: Environment/Infrastructure | Code Issue |
   Dependency/Version Conflict | Signing/Certificate | Flaky/Intermittent | Configuration | Unknown

Base all findings strictly on the log content provided.
If the log is truncated and root cause cannot be confirmed, say so explicitly —
do not guess at a root cause not evidenced in the log.

PIPELINE LOG:
[Paste full pipeline log here]

CONSTRAINTS:
- Identify ONE primary root cause — do not list everything as equally likely
- Cascading failures must be labelled separately — do not treat them as independent causes
- Include the exact log line or snippet that confirms the root cause
- If this appears to be a flaky/intermittent failure, state the evidence for that classification
- Do not recommend fixes that require access to systems or credentials beyond the log

OUTPUT FORMAT:
PIPELINE FAILURE ANALYSIS
Pipeline: [Name] | Branch: [Branch] | Stage: [Stage] | Platform: [iOS/Android/Both]
CI Tool: [Tool] | Triggered By: [Trigger] | Date: [DD/MM/YYYY]

ROOT CAUSE:
  Classification: [Failure Type from list above]
  Description: [Clear explanation of what went wrong]
  Confirmed By: [Exact log snippet — copy from log]
  Log Reference: [Line number or section identifier]

CASCADING FAILURES (caused by root cause, not independent):
  - [Failure description] — caused by: [root cause reference]
  (or "None — isolated single failure")

IMMEDIATE FIX:
  Action: [Exact step to resolve right now]
  Who: [Developer | DevOps | Both]
  Estimated Time: [Minutes | Hours]

PERMANENT FIX (prevent recurrence):
  Action: [What to change in code, config, or pipeline to prevent this happening again]
  Effort: Low | Medium | High
  JIRA Ticket Recommended: Yes | No

RECURRENCE RISK: High | Medium | Low
  Reason: [Why this is likely or unlikely to happen again]

NEEDS HUMAN ESCALATION: Yes — [reason and who to escalate to] | No
```

---

## 7.2 | CI/CD Pipeline Configuration Generation

**When to use:** Creating or updating a CI/CD pipeline config for a new feature branch strategy, environment, or platform — ensures consistent build, test, sign, and deploy stages from day one.

```
ROLE:
You are a senior DevOps Engineer writing CI/CD pipeline configuration for
a Native iOS/Android mobile application.

CONTEXT:
Project: [Project Name]
CI Tool: Azure DevOps | Bitrise | GitHub Actions | Fastlane | Xcode Cloud
Platform: iOS | Android | Both
Trigger: PR to main | Push to develop | Scheduled nightly | Manual dispatch
Environment Target: Dev | QA | Staging | Production
iOS Distribution: TestFlight | Ad Hoc | App Store | Enterprise
Android Distribution: Firebase App Distribution | Internal Track | Play Store
Code Signing: [Fastlane Match | Manual | Automatic — Xcode managed]
Test Types to Include: Unit Tests | UI Tests | Both | None

TASK:
Generate a complete, production-ready pipeline configuration file.
Include ALL stages: dependency install, lint, build, test, sign, and distribute.
Every stage must have a clearly defined failure condition.
Add inline comments explaining non-obvious configuration choices.
Flag every value requiring a secret or environment variable as [SECRET: VARIABLE_NAME]
so the team knows exactly what to configure before running the pipeline.

EXISTING PIPELINE (if updating):
[Paste existing YAML/config here — or "New pipeline, no existing config"]

SPECIAL REQUIREMENTS:
[Any custom steps, notifications, approval gates, or environment-specific logic]

CONSTRAINTS:
- Never hardcode credentials, API keys, certificates, or signing passwords
- Every [SECRET: NAME] must be listed in the Configuration Notes section
- iOS signing must handle both development and distribution profiles
- Android signing must reference keystore from a secure variable group
- Pipeline must be idempotent — safe to re-run after a partial failure
- Include a notification step (Slack/email) on pipeline failure

OUTPUT FORMAT:
[Complete pipeline YAML or configuration file with inline comments]

---
CONFIGURATION NOTES:

Secrets Required (configure before first run):
  | Variable Name | Description | Where to Set |
  |---|---|---|
  | [SECRET: NAME] | [What this is] | [Pipeline variables / Key vault / Secrets manager] |

Prerequisites:
  - [Agent/runner requirement — e.g., macOS agent with Xcode 15.2]
  - [Tool requirement — e.g., CocoaPods 1.14, Fastlane 2.x]
  - [Permission requirement — e.g., App Store Connect API key]

Stage Failure Behaviour:
  - [Stage]: [Fail fast | Continue | Manual approval required]

Estimated Pipeline Duration: [N minutes per run]

Notes:
  - [Any non-obvious design decision explained]
```

---

## 7.3 | Release Notes Generation

**When to use:** Sprint end or release day — convert JIRA tickets or git log into App Store / Play Store ready release notes and internal release documentation simultaneously.

```
ROLE:
You are a DevOps Engineer and Release Manager preparing release notes for a
Native iOS/Android mobile application release.

CONTEXT:
Project: [Project Name]
App Version: [e.g., 2.4.1]
Build Number: [Build #]
Platform: iOS | Android | Both
Release Type: Major | Minor | Patch | Hotfix
Audience: App Store / Play Store (public) | Internal stakeholders | Both
Release Date: [DD/MM/YYYY]
Previous Version: [e.g., 2.4.0]

TASK:
Using the input below (JIRA tickets, git log, or both), generate release notes for all audiences specified.
Categorize changes as: New Features | Improvements | Bug Fixes | Performance | Security.

For PUBLIC (App Store / Play Store):
- Plain English — no technical jargon, no ticket IDs, no internal terminology
- Focus on user-visible impact only — what does the user see or experience differently
- Respect the 4000 character limit (Apple / Google)
- Exclude: internal tooling changes, test-only changes, CI/CD changes, dependency bumps

For INTERNAL stakeholders:
- Include JIRA ticket IDs and technical detail
- Include known issues and workarounds
- Include deployment notes for any manual steps required

INPUT (JIRA Tickets / Git Log):
[Paste JIRA ticket list, git log output, or sprint completion notes here]

CONSTRAINTS:
- Do NOT include security vulnerability details in public release notes
- Do NOT include individual developer names in any release notes
- Each bullet point must describe user-visible or operational impact — not implementation
- If a change has zero user-facing impact, exclude it from public notes entirely
- Hotfix releases must clearly state what problem was resolved for public notes

OUTPUT FORMAT:
═══════════════════════════════════════
PUBLIC RELEASE NOTES (App Store / Play Store)
═══════════════════════════════════════
Version [X.X.X] — [Release Date]
[Character count: N / 4000]

What's New:
• [Feature — plain English, user benefit focused]

Improvements:
• [Improvement]

Bug Fixes:
• [Fix — describe what was wrong and that it's now resolved]

═══════════════════════════════════════
INTERNAL RELEASE NOTES
═══════════════════════════════════════
Version [X.X.X] | Build [N] | [Release Date]
Platform: [iOS/Android/Both] | Release Type: [Major/Minor/Patch/Hotfix]

New Features:
  [JIRA-ID] — [Title] — [Technical description]

Improvements:
  [JIRA-ID] — [Title] — [Technical description]

Bug Fixes:
  [JIRA-ID] — [Title] — [Root cause and fix summary]

Known Issues:
  [JIRA-ID] — [Issue description] | Workaround: [Workaround or "None"]
  (or "None")

Deployment Notes:
  - [Manual step required — e.g., run migration, update config, clear cache]
  (or "No manual deployment steps required")

Rollback Plan:
  - [How to roll back this release if critical issues are found post-release]
```

---

## 7.4 | Environment Setup & Developer Runbook

**When to use:** Onboarding a new iOS/Android developer, QA engineer, or setting up a fresh build machine — eliminates the "it works on my machine" problem.

```
ROLE:
You are a senior DevOps Engineer writing an environment setup runbook for a
Native iOS/Android development project.

CONTEXT:
Project: [Project Name]
Target Machine OS: macOS [Version] | Windows [Version] | Linux [Distro]
Platform Being Set Up: iOS | Android | Both
Developer Role: iOS Developer | Android Developer | QA Engineer | Backend Developer | New Joiner (All)
Required Tools: [List known tools — e.g., Xcode 15.2, Android Studio Hedgehog, CocoaPods 1.14, Fastlane]
Repository: [Azure DevOps | GitHub | Bitbucket]
Package Manager: [CocoaPods | SPM | Gradle | Both]

TASK:
Generate a complete, step-by-step environment setup runbook.
Evaluate the full list of required tools before writing any steps — ensure
dependencies are installed before dependents in every case.
Every step must be a single, atomic, executable action — no compound steps.
Include a verification command after every major installation so the developer
can confirm success before proceeding.
Flag steps requiring admin or elevated permissions explicitly with 🔐.
Include the 3 most common failure points for each major installation with fixes.

EXISTING SETUP NOTES:
[Paste existing docs, Confluence page, or README — or "None — creating from scratch"]

CONSTRAINTS:
- Every tool installation must specify the EXACT version to install — not "latest"
- Steps must be in strict sequential order — no forward dependencies
- Do not assume any tool is pre-installed unless explicitly stated in context
- macOS-specific steps (Homebrew, Xcode CLI tools) and Windows-specific steps
  must be clearly separated if both platforms apply
- Secrets, API keys, and certificates must never be written into the runbook —
  reference where to find them (e.g., "retrieve from company 1Password vault")

OUTPUT FORMAT:
ENVIRONMENT SETUP RUNBOOK
Project: [Name] | Platform: [iOS/Android/Both] | Role: [Developer Type]
Target OS: [macOS/Windows/Linux Version] | Last Updated: [DD/MM/YYYY]

PRE-REQUISITES (before starting):
  - [Admin access / Apple ID / Google account / VPN access etc.]
  - [Access to: [repository URL] — request from [Role] if not granted]

═══════════════════════════════════════

STEP [N]: [Action Title] [🔐 Admin Required if applicable]
  Purpose: [Why this step is needed]
  Command / Action:
    [Exact terminal command or UI instruction]
  Verify with:
    [Command to confirm success]
  Expected Output:
    [What success looks like — exact version string or confirmation message]
  Common Issues:
    Problem: [Issue description]
    Fix: [Exact resolution]

═══════════════════════════════════════
(repeat for every step)

POST-SETUP VERIFICATION:
Run these commands to confirm the full environment is working:
  1. [Command] → Expected: [Output]
  2. [Command] → Expected: [Output]

FIRST RUN CHECKLIST:
  [ ] Clone repository successfully
  [ ] Build app without errors
  [ ] Run unit tests — all pass
  [ ] Launch app on simulator / emulator
  [ ] Connect to [Dev | QA] environment successfully

ESTIMATED TOTAL SETUP TIME: [X hours]
SUPPORT CONTACT: [Role or team channel for setup help]
RUNBOOK OWNER: [DevOps Engineer name/role]
```

---

## 7.5 | Incident & Hotfix Report

**When to use:** A production issue hits the mobile app — document the incident timeline, impact, root cause, and fix formally for stakeholders, post-mortem, and future prevention.

```
ROLE:
You are a DevOps Engineer and Incident Manager documenting a production incident
for a Native iOS/Android mobile application.

CONTEXT:
Project: [Project Name]
App Version Affected: [Version]
Fixed In Version: [Version — or "Fix in progress"]
Platform Affected: iOS | Android | Both
Incident Severity: P1 Critical | P2 High | P3 Medium | P4 Low
Reported At: [DD/MM/YYYY HH:MM TZ]
Resolved At: [DD/MM/YYYY HH:MM TZ — or "Ongoing"]
Detected By: User Report | Monitoring Alert | App Store Review | Internal Discovery
Incident Commander: [Role]

TASK:
Using the raw incident notes below, produce a complete incident report.
Cover: timeline, user impact, root cause, immediate fix, permanent fix, and prevention.
Write a separate executive summary suitable for senior stakeholders — plain English,
no technical jargon, maximum 4 sentences.
Do NOT assign blame to individuals — use role titles only.
Do NOT omit the negative consequences or gaps that allowed this incident to occur.
Root cause must be a single confirmed cause — not a list of possibilities.

RAW INCIDENT NOTES:
[Paste Slack thread, war room notes, engineer findings, or timeline bullets here]

CONSTRAINTS:
- Timeline must be strictly chronological with exact times where known
- Estimated times must be labelled as "~[HH:MM]" not presented as exact
- Impact must quantify affected users or percentage of user base where data exists
- Prevention measures must be concrete, assigned actions — not generic advice
- Every action item must have a named owner role and target date
- If this was a third-party / dependency failure, that must be stated explicitly

OUTPUT FORMAT:
INCIDENT REPORT
ID: INC-[Number] | Severity: [P1/P2/P3/P4] | Status: Resolved | Ongoing
Platform: [iOS/Android/Both] | App Version: [Affected] → [Fixed]
Incident Commander: [Role] | Report Date: [DD/MM/YYYY]

═══════════════════════════════════════
EXECUTIVE SUMMARY (for stakeholders — plain English, max 4 sentences)
═══════════════════════════════════════
[What happened, who was affected, what was done, and current status]

═══════════════════════════════════════
INCIDENT TIMELINE
═══════════════════════════════════════
[HH:MM TZ] — [Event — e.g., Monitoring alert triggered for elevated crash rate]
[HH:MM TZ] — [Event — e.g., On-call engineer notified]
[HH:MM TZ] — [Event — e.g., Root cause identified]
[HH:MM TZ] — [Event — e.g., Hotfix deployed to production]
[HH:MM TZ] — [Event — e.g., Incident resolved — error rate returned to baseline]

TOTAL DURATION: [X hours Y minutes]
Time to Detect: [N minutes] | Time to Respond: [N minutes] | Time to Resolve: [N minutes]

═══════════════════════════════════════
IMPACT ASSESSMENT
═══════════════════════════════════════
Users Affected: [Number or % of active user base]
Features Unavailable: [List affected features]
Data Loss: Yes — [description] | No
Revenue Impact: [Estimated or "Not applicable"]
SLA Breach: Yes | No | Under Review

═══════════════════════════════════════
ROOT CAUSE
═══════════════════════════════════════
Primary Cause: [Single confirmed root cause]
Contributing Factors:
  - [Factor 1 — conditions that allowed the root cause to have impact]
  - [Factor 2]
Third-Party Involvement: Yes — [Vendor/Service] | No

═══════════════════════════════════════
RESOLUTION
═══════════════════════════════════════
Immediate Fix (Hotfix):
  Action: [What was done to stop the bleeding]
  Deployed: [DD/MM/YYYY HH:MM] | Version: [X.X.X]
  App Store / Play Store Submission: Required | Not Required

Permanent Fix:
  Action: [What was changed to prevent recurrence]
  Deployed: [DD/MM/YYYY HH:MM] | Version: [X.X.X — or "Scheduled: Sprint N"]

═══════════════════════════════════════
PREVENTION MEASURES
═══════════════════════════════════════
| Action | Owner | Due Date | JIRA Ticket |
|---|---|---|---|
| [Concrete preventive action] | [Role] | [DD/MM/YYYY] | [ID or "To be raised"] |

MONITORING IMPROVEMENTS:
  - [Alert or monitoring change to catch this class of issue earlier]
  (or "Existing monitoring was sufficient — detection time acceptable")

PROCESS IMPROVEMENTS:
  - [Change to deployment process, testing, or review to prevent recurrence]

═══════════════════════════════════════
POST-MORTEM SCHEDULED
═══════════════════════════════════════
Date: [DD/MM/YYYY] | Attendees: [Roles] | Facilitator: [Role]
(or "Post-mortem not required for this severity level")

RELATED JIRA TICKETS: [IDs — or "None"]
PREVIOUS SIMILAR INCIDENTS: [INC-NNN — or "None identified"]
```

---

*Document: Section 7 — DevOps Engineer | Project Prompt Library*
*Next Document: Section 8 — Cross-Role Prompts*
*Owner: [DevOps Lead Name] | Last Updated: [DD/MM/YYYY]*
