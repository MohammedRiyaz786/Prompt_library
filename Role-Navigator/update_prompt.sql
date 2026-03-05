UPDATE use_cases
SET prompt_template = 'ROLE:
You are a senior QA Lead / Test Manager producing a formal UAT Sign-off Report
for a Native iOS, Android, or web application project.

CONTEXT:
Project: [Project Name]
Release Version: [Version]
Platform: iOS | Android | Web | All
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
Project: [Name] | Version: [X.X.X] | Platform: [iOS/Android/Web/All]
UAT Period: [Date Range] | Report Date: [DD/MM/YYYY]

EXECUTIVE SUMMARY:
[3 sentences: what was tested, overall outcome, and recommendation]

TEST EXECUTION SUMMARY:
| Platform | Total Tests | Passed | Failed | Blocked | Pass Rate |
|---|---|---|---|---|---|
| iOS | [N] | [N] | [N] | [N] | [%] |
| Android | [N] | [N] | [N] | [N] | [%] |
| Web | [N] | [N] | [N] | [N] | [%] |

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
| Client Rep | [Name] | Approved / Not Approved | [DD/MM/YYYY] |'
WHERE title = 'UAT Sign-off Report';
