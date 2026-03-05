# Section 6 — Solution Architect (SA)
### Mobile App Project | Native iOS / Android
**Document:** 6 of 8 | **Version:** 1.0 | **Role:** Solution Architect

---

> ## HOW TO USE THIS DOCUMENT
> Fields in `[SQUARE BRACKETS]` are your injection points — replace with real content before running.
> Never remove a section — even if brief, each part anchors the AI's behavior.
> Each prompt follows: **ROLE → CONTEXT → TASK → CONSTRAINTS → OUTPUT FORMAT**

---

## 6.1 | Architecture Decision Record (ADR)

**When to use:** Documenting any significant technical decision — auth strategy, offline sync, push notifications, third-party SDK adoption, state management approach — so future team members understand why decisions were made.

```
ROLE:
You are a Solution Architect documenting an Architecture Decision Record (ADR)
for a Native iOS/Android mobile application project.

CONTEXT:
Project: [Project Name]
ADR Number: [ADR-001 | ADR-002 | etc.]
Decision Topic: [e.g., Offline data sync strategy | Push notification provider | Auth approach | State management]
Decision Date: [DD/MM/YYYY]
Decision Makers: [Names or roles — e.g., SA, Tech Lead, Product Owner]
Status: Proposed | Accepted | Deprecated | Superseded by [ADR-NNN]
Platforms Affected: iOS | Android | Both | Backend | All

TASK:
Using the discussion points and options provided below, produce a complete ADR.
Present ALL options considered fairly and completely before stating the decision.
Do NOT frame options in a way that makes the chosen option obviously superior —
present each option's strengths and weaknesses objectively.
Include consequences of the chosen option — both positive AND negative.
Do NOT omit negative consequences or risks of the chosen approach.
If this ADR supersedes a previous decision, explain what changed.

DISCUSSION INPUT:
[Paste meeting notes, Slack thread, engineering discussion, or bullet points here]

CONSTRAINTS:
- Remain neutral when presenting options — no option should appear unfairly framed
- Consequences must include risks — an ADR with only positive consequences is incomplete
- Language must be clear for both technical and non-technical stakeholders
- Every follow-up action must have a named owner and target date or sprint
- If the decision is still Proposed, list what is needed to move it to Accepted

OUTPUT FORMAT:
ARCHITECTURE DECISION RECORD
ADR-[Number]: [Decision Title]
Date: [DD/MM/YYYY] | Status: [Status] | Project: [Project Name]
Platforms: [iOS | Android | Both | All]

1. CONTEXT
[Why this decision was needed — the problem being solved and the forces at play]

2. OPTIONS CONSIDERED

Option A — [Name]:
  Description: [What this option involves technically]
  Pros:
    - [Strength]
    - [Strength]
  Cons:
    - [Weakness or risk]
    - [Weakness or risk]
  Effort: Low | Medium | High
  iOS Impact: [Specific impact]
  Android Impact: [Specific impact]

Option B — [Name]:
  Description: [What this option involves technically]
  Pros:
    - [Strength]
  Cons:
    - [Weakness or risk]
  Effort: Low | Medium | High
  iOS Impact: [Specific impact]
  Android Impact: [Specific impact]

Option C — [Name] (if applicable):
  (same structure)

3. DECISION
Chosen Option: [Option Name]
Rationale: [Why this option was selected — reference the specific pros that outweighed the cons]
Deciding Factors: [The 2-3 key reasons that tipped the decision]

4. CONSEQUENCES

Positive:
  - [Concrete benefit]
  - [Concrete benefit]

Negative / Risks:
  - [Risk or tradeoff introduced by this decision]
  - [Risk or tradeoff]

Neutral:
  - [Side effect with no clear positive or negative valence]

5. COMPLIANCE & STANDARDS
  Security Impact: [Yes — [detail] | None]
  Privacy Impact: [Yes — [detail] | None]
  Platform Guidelines (HIG / Material): [Compliant | Review needed — [detail]]
  Third-Party Dependencies Introduced: [List or "None"]

6. FOLLOW-UP ACTIONS
  | Action | Owner | Due Date / Sprint |
  |---|---|---|
  | [Concrete next step] | [Role] | [DD/MM/YYYY or Sprint N] |

7. REVIEW DATE
  [Date when this decision should be revisited — especially relevant for Proposed status]

RELATED ADRs: [ADR-NNN: [Title] — or "None"]
```

---

## 6.2 | Technical Spike Report

**When to use:** A spike story is complete — document findings, conclusions, and recommendations so the team can make an informed implementation decision.

```
ROLE:
You are a Solution Architect documenting the outcome of a technical spike
for a Native iOS/Android mobile application project.

CONTEXT:
Project: [Project Name]
Spike Story ID: [JIRA ID]
Spike Title: [e.g., "Investigate offline-first data sync options"]
Spike Duration: [N days | N sprint points]
Sprint: [Sprint Number]
Investigator(s): [Roles — e.g., iOS Lead, SA]
Question Being Answered: [The single question this spike was designed to answer]
Decision Deadline: [DD/MM/YYYY — when the team must decide to proceed]

TASK:
Using the investigation notes below, produce a complete technical spike report.
The report must answer the spike's central question definitively — "it depends"
is not an acceptable conclusion unless every dependency is explicitly listed with
the criteria needed to resolve each one.
Document what was tried, what worked, what did not work, and what was learned.
End with a concrete recommendation the team can act on immediately.
Do NOT pad the report with background information not relevant to the spike question.

INVESTIGATION NOTES / FINDINGS:
[Paste raw investigation notes, POC results, benchmark data, or developer findings here]

CONSTRAINTS:
- Conclusion must directly answer the spike question — do not bury it at the end
- Every recommendation must be actionable — no vague suggestions
- Risks discovered during the spike must be documented even if they do not affect the recommendation
- Proof of concept results must include: what was tested, environment, outcome, and limitations
- If the spike revealed the question needs to be reframed, state the revised question explicitly

OUTPUT FORMAT:
TECHNICAL SPIKE REPORT
Spike: [JIRA ID] | Title: [Spike Title]
Sprint: [N] | Investigators: [Roles] | Date: [DD/MM/YYYY]

SPIKE QUESTION:
[The exact question this spike was designed to answer]

CONCLUSION (lead with this):
[Direct answer to the spike question — 2-3 sentences maximum]
Feasibility: Feasible | Feasible with constraints | Not feasible
Recommended Path: [One clear recommendation]

INVESTIGATION SUMMARY:

What Was Investigated:
  - [Approach or option 1 explored]
  - [Approach or option 2 explored]

Proof of Concept Results:
  | Approach | Environment | Outcome | Key Limitation |
  |---|---|---|---|
  | [Approach] | [iOS 17 / Android 14 / Both] | Pass/Fail/Partial | [Limitation] |

Key Findings:
  - [Finding 1 — factual, based on investigation]
  - [Finding 2]

What Did NOT Work:
  - [Approach tried that failed] — Reason: [Why it failed]
  (or "All investigated approaches were viable")

RISKS DISCOVERED:
  | Risk | Likelihood | Impact | Mitigation |
  |---|---|---|---|
  | [Risk] | High/Med/Low | High/Med/Low | [Mitigation action] |
  (or "No new risks identified")

DEPENDENCIES & OPEN QUESTIONS:
  - [Dependency or question that must be resolved before proceeding]
  (or "None — recommendation can be acted on immediately")

RECOMMENDED NEXT STEPS:
  | Action | Owner | Sprint / Due Date |
  |---|---|---|
  | [Concrete next action] | [Role] | [Sprint N or DD/MM/YYYY] |

STORIES TO RAISE:
  - [Story title implied by spike findings — or "No new stories required"]

ESTIMATED IMPLEMENTATION EFFORT (based on spike findings):
  iOS: [S | M | L | XL] | Android: [S | M | L | XL] | Backend: [S | M | L | XL | N/A]
  Confidence in Estimate: High | Medium | Low — [reason if low]
```

---

## 6.3 | Capacity & Scalability Assessment

**When to use:** A new feature, user growth milestone, or infrastructure change requires assessing whether the backend can support the mobile app at scale — before problems occur in production.

```
ROLE:
You are a Solution Architect performing a capacity and scalability assessment
for the backend infrastructure supporting a Native iOS/Android mobile application.

CONTEXT:
Project: [Project Name]
Assessment Trigger: [New feature launch | User growth milestone | Infrastructure change | Pre-release review]
Current User Base: [N active users]
Expected User Growth: [e.g., 2x in 6 months | Peak load of N concurrent users on launch day]
Platform: iOS | Android | Both
Backend Stack: [Node.js | Python | Java/Spring | .NET | Other]
Infrastructure: [AWS | Azure | GCP | On-premise | Hybrid]
Current Architecture: [Monolith | Microservices | Serverless | Other]

TASK:
Using the system information and metrics provided below, assess whether the current
backend can support the projected load from the mobile app.
Evaluate ALL of the following dimensions independently — do not skip any:
  1. API throughput — requests per second at peak load
  2. Database capacity — read/write load, connection pooling, query performance
  3. Authentication & session management — token volume at scale
  4. Push notification delivery — volume and latency at scale
  5. File / media storage & CDN — bandwidth and storage growth
  6. Mobile-specific concerns — polling frequency, payload size, battery impact
  7. Failure modes — what breaks first under load, and graceful degradation strategy

After evaluating all dimensions, run a verification pass confirming every dimension was assessed.
For each dimension: state current capacity, projected demand, gap (if any), and remediation.

CURRENT SYSTEM METRICS & ARCHITECTURE NOTES:
[Paste current infrastructure details, APM metrics, database specs, or architecture diagrams description here]

PROJECTED LOAD SCENARIOS:
[Paste expected traffic scenarios — e.g., "10,000 concurrent users on launch day" or "2x current DAU in 3 months"]

CONSTRAINTS:
- Base all assessments on the metrics and architecture provided — do not fabricate numbers
- If data for a dimension is not provided, state "Insufficient data — assessment not possible" for that dimension
- Recommendations must be prioritized: address bottlenecks before optimization
- Cost impact of recommendations must be noted where significant
- Mobile-specific concerns (battery drain from polling, payload size on cellular) must not be omitted

OUTPUT FORMAT:
CAPACITY & SCALABILITY ASSESSMENT
Project: [Name] | Trigger: [Trigger] | Date: [DD/MM/YYYY]
Current Users: [N] | Projected Peak: [N] | Growth Horizon: [Timeframe]

DIMENSION-BY-DIMENSION ASSESSMENT:

[N]. [DIMENSION NAME]
  Current Capacity: [Metric or "Not measured"]
  Projected Demand: [Metric at target scale]
  Gap: None | [Specific shortfall]
  Risk: High | Medium | Low | Insufficient Data
  Recommendation: [Concrete action — or "No action required"]
  Estimated Effort: Low | Medium | High
  Cost Impact: [None | Low | Significant — brief note]

(repeat for all 7 dimensions)

BOTTLENECK PRIORITY ORDER:
1. [Highest risk dimension — fix first]
2. [Second priority]
3. [Continue as needed]

REMEDIATION PLAN:
| Action | Dimension | Owner | Target Date | Effort | Cost Impact |
|---|---|---|---|---|---|
| [Concrete action] | [Dimension] | [Role] | [DD/MM/YYYY] | S/M/L | None/Low/Significant |

LOAD TESTING RECOMMENDATION:
Recommended Before: [Launch | Next major release | Immediately]
Scenarios to Test: [List critical load scenarios]
Suggested Tool: [k6 | JMeter | Locust | Artillery | Other]
Mobile Client Simulation: [Required | Not required] — [reason]

OVERALL READINESS:
✅ Ready for projected scale — no critical gaps
⚠️ Conditionally ready — address [N] High-risk items before [date/milestone]
❌ Not ready — [primary blocker] must be resolved before scaling

ARCHITECTURE CHANGES RECOMMENDED:
[List any structural changes needed — e.g., introduce caching layer, move to microservices]
(or "No architectural changes required — configuration and scaling sufficient")
```

---

*Document: Section 6 — Solution Architect | Project Prompt Library*
*Next Document: Section 7 — DevOps Engineer*
*Owner: [SA Name] | Last Updated: [DD/MM/YYYY]*
