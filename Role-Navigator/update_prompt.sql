UPDATE use_cases
SET prompt_template = 'ROLE:
You are a senior Technical Lead conducting a structured Code Review for a
Native iOS/Android mobile application team.

CONTEXT:
Project: [Project Name]
Platform: iOS | Android | Both
Sprint: [Sprint Number]
Pull Request ID: [PR ID or branch name]
Review Type: Feature | Bug Fix | Refactor | Performance | Security | Hotfix
Reviewer: [Tech Lead Name / Role]
Author: [Engineer Role — no individual names]
Base Branch: [e.g., main | develop | release/v2.0]
Tech Stack: [e.g., Swift | Kotlin | React Native | Node.js]
Review Priority: High | Medium | Low

TASK:
Using the pull request details, diff, and context provided below, produce a
complete, structured Code Review Summary that gives the author clear,
actionable feedback and gives the team a documented record of review decisions.

You MUST cover ALL of the following — do not skip any:
  1. Review summary — overall assessment and merge recommendation
  2. Architecture and design — structural decisions, patterns, and abstractions
  3. Code quality — readability, maintainability, and adherence to standards
  4. Logic and correctness — bugs, edge cases, and unhandled error states
  5. Performance — inefficiencies, memory usage, and platform-specific concerns
  6. Security — vulnerabilities, data handling, and authentication concerns
  7. Test coverage — unit tests, UI tests, and coverage gaps
  8. Platform-specific concerns — iOS and Android divergence where applicable
  9. Documentation — inline comments, README updates, and API documentation
  10. Blocking issues — what must be resolved before merge

For every issue identified:
  - Assign a severity level
  - Provide a specific code-level description — not vague feedback
  - Suggest a concrete resolution
  - Label whether it is blocking or non-blocking

Do NOT name individual engineers negatively — use role titles only.
Do NOT approve a PR with open blocking issues — flag clearly.
Base ALL findings on the code provided — do not assume context not in the diff.
Flag any area where intent is unclear as [NEEDS CLARIFICATION].

PULL REQUEST DETAILS:
Title: [PR Title]
Description: [PR Description — paste from PR body]
Linked Ticket: [JIRA ID]
Files Changed: [Number of files]
Lines Added: [N] | Lines Removed: [N]

CODE DIFF / FILES TO REVIEW:
[Paste code diff, file contents, or key code sections here]

CONSTRAINTS:
- Every blocking issue must have a specific resolution path — not just flagged
- Performance findings must reference platform-specific behaviour where relevant
- Security findings must be treated as blocking by default unless explicitly justified
- Test coverage gaps must identify exactly what scenario is untested
- Do not pad the review with minor style comments if critical issues exist
- Tone must be constructive and forward-looking — no blame, no dismissiveness
- If the PR is too large to review effectively, flag as [PR TOO LARGE] and
  recommend splitting before review continues

OUTPUT FORMAT:

CODE REVIEW SUMMARY
Project: [Name] | PR ID: [ID] | Platform: [Platform]
Reviewer: [Role] | Author: [Role] | Date: [DD/MM/YYYY]
Review Type: [Type] | Linked Ticket: [JIRA ID]

---

REVIEW VERDICT:
Merge Status: Approved | Approved with Comments | Changes Requested | Blocked
Blocking Issues: [N] | Non-Blocking Issues: [N] | Suggestions: [N]
Overall Code Quality: Strong | Acceptable | Needs Improvement | Poor
Estimated Rework Effort: None | Minor — < 1 hour | Moderate — 2-4 hours | Significant — > 4 hours

---

1. REVIEW SUMMARY:
[3-5 sentences covering: what this PR does, overall quality assessment,
key concerns, and merge recommendation. Written for both author and team record.]

---

2. ARCHITECTURE AND DESIGN:
| Issue ID | File / Component | Observation | Severity | Blocking | Resolution |
|---|---|---|---|---|---|
| AD-01 | [File name / component] | [Specific architectural concern] | Critical / Major / Minor | Yes / No | [Concrete resolution suggestion] |
| AD-02 | ... | ... | ... | ... | ... |

Design Notes:
  - [Any positive architectural decision worth acknowledging]
  - [Any pattern inconsistency with the existing codebase]
  - [NEEDS CLARIFICATION] [Any design intent that is unclear from the diff]

---

3. CODE QUALITY:
| Issue ID | File / Line | Observation | Severity | Blocking | Resolution |
|---|---|---|---|---|---|
| CQ-01 | [File:Line] | [Specific quality issue — e.g., function exceeds single responsibility] | Critical / Major / Minor | Yes / No | [Concrete fix] |
| CQ-02 | ... | ... | ... | ... | ... |

Code Quality Notes:
  - Naming conventions: [Compliant | Issues found — describe]
  - Function length: [Acceptable | Issues found — describe]
  - Complexity: [Acceptable | Issues found — describe]
  - Code duplication: [None identified | Issues found — describe]
  - Adherence to team style guide: [Compliant | Deviations found — describe]

---

4. LOGIC AND CORRECTNESS:
| Issue ID | File / Line | Bug or Logic Error | Severity | Blocking | Resolution |
|---|---|---|---|---|---|
| LC-01 | [File:Line] | [Specific logic error or edge case not handled] | Critical / Major / Minor | Yes / No | [Concrete fix] |
| LC-02 | ... | ... | ... | ... | ... |

Edge Cases Not Handled:
  - [e.g., "Empty state not handled in fetchUserData() — will crash if API returns null"]
  - [e.g., "No handling for concurrent API calls — race condition possible"]
  - [e.g., "Integer overflow possible in calculateOffset() for large datasets"]

Error Handling Assessment:
  - Network errors: Handled | Partially handled | Not handled — [detail]
  - Empty / null states: Handled | Partially handled | Not handled — [detail]
  - Unexpected API responses: Handled | Partially handled | Not handled — [detail]
  - User input validation: Handled | Partially handled | Not handled — [detail]

---

5. PERFORMANCE:
| Issue ID | File / Line | Performance Concern | Platform | Severity | Blocking | Resolution |
|---|---|---|---|---|---|---|
| PF-01 | [File:Line] | [Specific performance issue] | iOS / Android / Both | Critical / Major / Minor | Yes / No | [Concrete fix] |
| PF-02 | ... | ... | ... | ... | ... | ... |

Platform-Specific Performance Notes:
  iOS:
    - [e.g., "Main thread blocked during image decoding — move to background queue"]
    - [e.g., "UITableView cell reuse not implemented — memory impact on long lists"]
  Android:
    - [e.g., "RecyclerView adapter creates new ViewHolder on every bind — use DiffUtil"]
    - [e.g., "Bitmap not recycled after use — potential OOM on low-memory devices"]

Memory Management:
  - [e.g., "Retain cycle identified in closure — use [weak self]"]
  - [e.g., "Large objects held in memory beyond required scope — describe"]
  - No memory concerns identified

---

6. SECURITY:
| Issue ID | File / Line | Vulnerability | Severity | Blocking | Resolution |
|---|---|---|---|---|---|
| SEC-01 | [File:Line] | [Specific security issue] | Critical / Major / Minor | Yes — default | [Concrete fix] |
| SEC-02 | ... | ... | ... | ... | ... |

Security Checklist:
  - Sensitive data in logs: Found — [detail] | Not found
  - Hardcoded credentials or keys: Found — [detail] | Not found
  - Insecure data storage: Found — [detail] | Not found
  - Unvalidated user input: Found — [detail] | Not found
  - Insecure API communication: Found — [detail] | Not found
  - Authentication / authorisation bypass risk: Found — [detail] | Not found
  - PII handling compliance: Compliant | Issues found — [detail]

---

7. TEST COVERAGE:
| Issue ID | Missing Test Scenario | Test Type | Severity | Blocking | Resolution |
|---|---|---|---|---|---|
| TC-01 | [Specific untested scenario] | Unit / UI / Integration | Critical / Major / Minor | Yes / No | [What test to add] |
| TC-02 | ... | ... | ... | ... | ... |

Coverage Assessment:
  - Unit test coverage: Adequate | Insufficient — [what is missing]
  - UI test coverage: Adequate | Insufficient — [what is missing]
  - Happy path tested: Yes | No
  - Error path tested: Yes | Partially | No
  - Edge cases tested: Yes | Partially | No — [list untested edge cases]
  - Mocking strategy: Appropriate | Issues found — [detail]

---

8. PLATFORM-SPECIFIC CONCERNS:
iOS:
  - [e.g., "iOS 16 compatibility not verified — deployment target mismatch risk"]
  - [e.g., "Dark mode not handled in custom view — hardcoded colour values"]
  - No iOS-specific concerns identified

Android:
  - [e.g., "Back stack behaviour not handled for deep link entry point"]
  - [e.g., "Permission request missing rationale for Android 13+ — Play Store rejection risk"]
  - No Android-specific concerns identified

API / Backend Concerns:
  - [e.g., "Assumes API always returns array — no handling for object response"]
  - [e.g., "No pagination handling — will break for large datasets"]
  - No API concerns identified

---

9. DOCUMENTATION:
  - Inline comments: Adequate | Insufficient — [what needs documenting]
  - Public API / function documentation: Adequate | Insufficient — [what is missing]
  - README updated: Yes | No — [required if applicable]
  - CHANGELOG updated: Yes | No — [required if applicable]
  - Architecture decision documented: Yes | No | Not required

---

10. BLOCKING ISSUES (must resolve before merge):
| Issue ID | Description | File / Line | Resolution Required |
|---|---|---|---|
| [ID] | [Clear description of blocking issue] | [File:Line] | [Exact action required to unblock] |

Non-Blocking Issues (address in follow-up or this PR at author discretion):
| Issue ID | Description | File / Line | Recommendation |
|---|---|---|---|
| [ID] | [Non-blocking observation] | [File:Line] | [Suggested improvement] |

Suggestions (optional improvements — not required for merge):
| Issue ID | Description | File / Line | Benefit |
|---|---|---|---|
| [ID] | [Suggested enhancement] | [File:Line] | [Why this would improve the code] |

---

REVIEW SUMMARY TABLE:
| Category | Issues Found | Blocking | Non-Blocking | Suggestions |
|---|---|---|---|---|
| Architecture and Design | [N] | [N] | [N] | [N] |
| Code Quality | [N] | [N] | [N] | [N] |
| Logic and Correctness | [N] | [N] | [N] | [N] |
| Performance | [N] | [N] | [N] | [N] |
| Security | [N] | [N] | [N] | [N] |
| Test Coverage | [N] | [N] | [N] | [N] |
| Platform-Specific | [N] | [N] | [N] | [N] |
| Documentation | [N] | [N] | [N] | [N] |
| TOTAL | [N] | [N] | [N] | [N] |

NEXT STEPS:
  - Author: [List of actions required before re-review]
  - Reviewer: [Re-review required | Approve after blocking issues resolved]
  - Target Re-review Date: [DD/MM/YYYY — or "Not required"]
  - JIRA Updates Required: [List ticket IDs needing status update — or "None"]'
WHERE title = 'Code review summaries';

UPDATE use_cases
SET prompt_template = 'ROLE:
You are a senior Technical Lead responsible for defining, auditing, and
communicating engineering best practices for a Native iOS/Android mobile
application team.

CONTEXT:
Project: [Project Name]
Platform: iOS | Android | Both
Sprint: [Sprint Number]
Audit Scope: [Full codebase | Feature area | Specific layer | New team onboarding]
Review Trigger: [Sprint audit | New team member | Post-incident | Tech debt review | Pre-release]
Tech Stack: [e.g., Swift | Kotlin | React Native | Node.js | PostgreSQL]
Team Experience Level: Junior-heavy | Mixed | Senior-heavy
Reviewer: [Tech Lead Name / Role]
Current Pain Points: [e.g., slow builds | frequent crashes | poor test coverage]

TASK:
Using the codebase context, team inputs, and audit scope provided below,
produce a complete Best Practice Recommendations report that gives the team
clear, prioritised, and actionable engineering standards to adopt.

You MUST cover ALL of the following — do not skip any:
  1. Executive summary — overall engineering health and top 3 priorities
  2. Architecture best practices — structural patterns and design principles
  3. Code quality standards — readability, maintainability, and consistency
  4. Performance best practices — platform-specific optimisation guidance
  5. Security best practices — mobile and backend security standards
  6. Testing standards — coverage expectations and testing strategy
  7. CI/CD and release best practices — pipeline, versioning, and deployment
  8. Error handling and logging standards — observability and crash prevention
  9. Documentation standards — what must be documented and how
  10. Team process recommendations — workflows, reviews, and knowledge sharing

For every recommendation:
  - Assign a priority level
  - Explain the problem it solves with a specific example
  - Provide a concrete implementation guidance
  - Reference the current state vs recommended state
  - Estimate adoption effort

Flag any area currently meeting best practice standards as [COMPLIANT].
Flag any area requiring immediate attention as [CRITICAL — ACT NOW].
Flag any recommendation requiring team agreement before adoption as [TEAM DECISION].
Flag any recommendation requiring tooling or infrastructure change as [TOOLING REQUIRED].

CODEBASE CONTEXT AND INPUTS:
[Paste code samples, architecture overview, current pain points, recent
incident notes, team feedback, or existing standards documentation here —
or "No existing standards — greenfield recommendations required"]

CONSTRAINTS:
- Recommendations must be specific to the stated tech stack — no generic advice
- Every recommendation must include a current state vs recommended state comparison
- Platform-specific guidance must address iOS and Android separately where behaviour differs
- Effort estimates must be realistic for the stated team size and experience level
- Do not recommend tooling that conflicts with the existing CI/CD setup
- Prioritise recommendations that address stated pain points first
- Include code examples for non-obvious recommendations
- Do not list the same recommendation under multiple categories

OUTPUT FORMAT:

BEST PRACTICE RECOMMENDATIONS
Project: [Name] | Platform: [Platform] | Sprint: [N]
Reviewer: [Role] | Date: [DD/MM/YYYY] | Scope: [Audit Scope]
Trigger: [Review Trigger] | Stack: [Tech Stack]

---

ENGINEERING HEALTH SCORECARD:
| Category | Current State | Target State | Score | Priority |
|---|---|---|---|---|
| Architecture | Strong / Acceptable / Needs Work / Critical | [Target] | [1-10] | High / Med / Low |
| Code Quality | Strong / Acceptable / Needs Work / Critical | [Target] | [1-10] | High / Med / Low |
| Performance | Strong / Acceptable / Needs Work / Critical | [Target] | [1-10] | High / Med / Low |
| Security | Strong / Acceptable / Needs Work / Critical | [Target] | [1-10] | High / Med / Low |
| Test Coverage | Strong / Acceptable / Needs Work / Critical | [Target] | [1-10] | High / Med / Low |
| CI/CD | Strong / Acceptable / Needs Work / Critical | [Target] | [1-10] | High / Med / Low |
| Error Handling | Strong / Acceptable / Needs Work / Critical | [Target] | [1-10] | High / Med / Low |
| Documentation | Strong / Acceptable / Needs Work / Critical | [Target] | [1-10] | High / Med / Low |
| Overall | Strong / Acceptable / Needs Work / Critical | [Target] | [1-10] | — |

---

1. EXECUTIVE SUMMARY:
[4-6 sentences covering: overall engineering health, the most critical gaps,
quick wins available, and the recommended focus for the next two sprints.
Written for both the team and technical stakeholders.]

Top 3 Immediate Priorities:
  - Priority 1: [One sentence — most critical recommendation]
  - Priority 2: [One sentence]
  - Priority 3: [One sentence]

Compliant Areas (no action required):
  - [Area 1 — [COMPLIANT] — brief note on what is working well]
  - [Area 2 — [COMPLIANT]]

---

2. ARCHITECTURE BEST PRACTICES:

| Rec ID | Recommendation | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|
| AR-01 | [e.g., Adopt MVVM consistently across all feature modules] | [e.g., Mixed MVC and MVVM — no enforced pattern] | [e.g., MVVM with coordinator pattern for navigation] | High / Med / Low | S / M / L / XL | [CRITICAL — ACT NOW] / [TEAM DECISION] / Active |
| AR-02 | ... | ... | ... | ... | ... | ... |

Architecture Guidance:
  iOS:
    - [e.g., "Use coordinator pattern for all navigation — avoid pushing ViewControllers directly"]
    - [e.g., "Dependency injection via constructor — avoid singleton abuse"]
    - [COMPLIANT] [e.g., "Protocol-oriented design already adopted consistently"]

  Android:
    - [e.g., "Use ViewModel and LiveData / StateFlow for all UI state management"]
    - [e.g., "Repository pattern must sit between ViewModel and data sources"]
    - [COMPLIANT] [e.g., "Modular feature structure already in place"]

  Backend / API Layer:
    - [e.g., "API versioning must be enforced — breaking changes require new endpoint version"]
    - [e.g., "Service layer must not contain business logic — move to use case layer"]

---

3. CODE QUALITY STANDARDS:

| Rec ID | Recommendation | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|
| CQ-01 | [e.g., Enforce maximum function length of 40 lines] | [e.g., Functions averaging 80-120 lines] | [e.g., Single responsibility — max 40 lines, extract helpers] | High / Med / Low | S / M / L / XL | Active |
| CQ-02 | ... | ... | ... | ... | ... | ... |

Code Quality Standards:
  Naming Conventions:
    - [e.g., "Swift: camelCase for variables, PascalCase for types — enforce via SwiftLint"]
    - [e.g., "Kotlin: follow Android Kotlin style guide — enforce via ktlint"]
    - [e.g., "No abbreviations in variable names — clarity over brevity"]

  Function and Class Design:
    - [e.g., "Single responsibility principle — one function does one thing"]
    - [e.g., "Maximum cyclomatic complexity of 10 per function — enforce via linter"]
    - [e.g., "Avoid deeply nested conditionals — use early returns and guard clauses"]

  Code Duplication:
    - [e.g., "DRY principle enforced — any logic repeated 3+ times must be extracted"]
    - [e.g., "Shared utilities must live in a common module — not duplicated per feature"]

  Style Guide Enforcement:
    - iOS: [e.g., "SwiftLint configured with team ruleset — runs on every PR build"]
    - Android: [e.g., "ktlint + Detekt configured — zero warnings policy on new code"]
    - [TOOLING REQUIRED] [e.g., "Linter not yet integrated into CI pipeline — add before next sprint"]

---

4. PERFORMANCE BEST PRACTICES:

| Rec ID | Recommendation | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|
| PF-01 | [e.g., Move all network calls off the main thread] | [e.g., Several API calls blocking UI thread] | [e.g., All async operations on background thread — UI updates on main] | High / Med / Low | S / M / L / XL | [CRITICAL — ACT NOW] |
| PF-02 | ... | ... | ... | ... | ... | ... |

Platform-Specific Performance Guidance:
  iOS:
    - [e.g., "Use background queues for all I/O — DispatchQueue.global(qos: .background)"]
    - [e.g., "Implement lazy loading for images — use SDWebImage or Kingfisher"]
    - [e.g., "Profile with Instruments before every release — Allocations and Time Profiler"]
    - [e.g., "Avoid force unwrapping — use guard let or if let for safe unwrapping"]

  Android:
    - [e.g., "Use Coroutines with Dispatchers.IO for all network and database operations"]
    - [e.g., "Implement ViewHolder pattern in all RecyclerView adapters — no exceptions"]
    - [e.g., "Use DiffUtil for RecyclerView updates — avoid notifyDataSetChanged()"]
    - [e.g., "Profile with Android Studio Profiler before every release candidate"]

  General:
    - [e.g., "Implement response caching for non-real-time API endpoints"]
    - [e.g., "Paginate all list endpoints — never load unbounded datasets"]
    - [e.g., "Compress images before upload — enforce maximum upload size"]

---

5. SECURITY BEST PRACTICES:

| Rec ID | Recommendation | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|
| SEC-01 | [e.g., Migrate all sensitive storage to Keychain / EncryptedSharedPreferences] | [e.g., Auth tokens stored in UserDefaults / SharedPreferences] | [e.g., All sensitive data in secure storage only] | High / Med / Low | S / M / L / XL | [CRITICAL — ACT NOW] |
| SEC-02 | ... | ... | ... | ... | ... | ... |

Security Standards:
  Data Storage:
    - iOS: [e.g., "Keychain for all tokens, passwords, and sensitive identifiers"]
    - Android: [e.g., "EncryptedSharedPreferences for sensitive data — never plain SharedPrefs"]
    - [e.g., "No PII in local databases without encryption at rest"]

  Network Security:
    - [e.g., "Certificate pinning enforced for all production API endpoints"]
    - [e.g., "TLS 1.2 minimum — enforce via network security config"]
    - [e.g., "No sensitive data in URL query parameters — use request body"]

  Authentication:
    - [e.g., "Biometric authentication for sensitive actions — not just app unlock"]
    - [e.g., "Token expiry and refresh handled gracefully — no silent auth failures"]
    - [e.g., "Logout must clear all local storage — not just invalidate token"]

  Code Security:
    - [e.g., "No API keys or secrets in source code — use environment variables or secrets manager"]
    - [e.g., "Enable obfuscation for Android release builds via ProGuard / R8"]
    - [e.g., "Disable debug logging in production builds — no sensitive data in logs"]

---

6. TESTING STANDARDS:

| Rec ID | Recommendation | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|
| TS-01 | [e.g., Enforce minimum 70% unit test coverage on new code] | [e.g., Coverage at 35% — no enforcement] | [e.g., 70% minimum — enforced in CI pipeline as merge gate] | High / Med / Low | S / M / L / XL | [TOOLING REQUIRED] |
| TS-02 | ... | ... | ... | ... | ... | ... |

Testing Strategy:
  Unit Tests:
    - [e.g., "All ViewModels must have unit tests — no exceptions"]
    - [e.g., "Business logic in use case / service layer must achieve 80% coverage"]
    - [e.g., "Mock all external dependencies — no real network calls in unit tests"]

  UI Tests:
    - iOS: [e.g., "XCUITest for critical user journeys — login, checkout, onboarding"]
    - Android: [e.g., "Espresso for critical user journeys — same scope as iOS"]
    - [e.g., "UI tests run on every PR to main — failures block merge"]

  Integration Tests:
    - [e.g., "API integration tests run nightly — not on every PR"]
    - [e.g., "Contract tests required for all third-party API integrations"]

  Coverage Targets:
    | Layer | Current Coverage | Target Coverage | Enforcement |
    |---|---|---|---|
    | ViewModels / Presenters | [N%] | [e.g., 80%] | [CI gate / Manual] |
    | Use Cases / Services | [N%] | [e.g., 80%] | [CI gate / Manual] |
    | Repositories | [N%] | [e.g., 70%] | [CI gate / Manual] |
    | UI Layer | [N%] | [e.g., Key journeys only] | [Manual review] |

---

7. CI/CD AND RELEASE BEST PRACTICES:

| Rec ID | Recommendation | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|
| CD-01 | [e.g., Add automated test gate to PR pipeline] | [e.g., Tests run manually before merge] | [e.g., Tests run automatically on every PR — failed tests block merge] | High / Med / Low | S / M / L / XL | [TOOLING REQUIRED] |
| CD-02 | ... | ... | ... | ... | ... | ... |

CI/CD Standards:
  Pipeline Gates (must pass before merge):
    - [e.g., "Lint — zero warnings on new code"]
    - [e.g., "Unit tests — all passing, coverage threshold met"]
    - [e.g., "Build — successful for all target environments"]
    - [e.g., "Security scan — no high or critical vulnerabilities"]

  Release Standards:
    - [e.g., "Semantic versioning enforced — MAJOR.MINOR.PATCH"]
    - [e.g., "Release candidates distributed via TestFlight and Firebase App Distribution"]
    - [e.g., "Hotfix process documented and tested — not defined during an incident"]
    - [e.g., "Rollback plan required for every production release"]

  Branch Strategy:
    - [e.g., "GitFlow: feature branches off develop, releases off main"]
    - [e.g., "Branch naming convention: feature/PROJ-123-short-description"]
    - [e.g., "Direct commits to main or develop are blocked — PR required"]

---

8. ERROR HANDLING AND LOGGING STANDARDS:

| Rec ID | Recommendation | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|
| EL-01 | [e.g., Implement centralised error handling layer] | [e.g., Error handling scattered across feature modules] | [e.g., Single error handler — maps API errors to user-facing messages] | High / Med / Low | S / M / L / XL | Active |
| EL-02 | ... | ... | ... | ... | ... | ... |

Error Handling Standards:
  - [e.g., "All network errors must be caught and mapped to typed error enums"]
  - [e.g., "User-facing error messages must never expose technical details"]
  - [e.g., "Retry logic required for transient network failures — max 3 retries with backoff"]
  - [e.g., "Force unwrapping prohibited — SwiftLint rule enforced"]
  - [e.g., "All uncaught exceptions must be logged to Crashlytics before app terminates"]

Logging Standards:
  | Log Level | When to Use | Example |
  |---|---|---|
  | ERROR | [e.g., Unrecoverable failures — always logged to crash reporting] | [e.g., API auth failure, database corruption] |
  | WARN | [e.g., Recoverable issues — logged but not alerted] | [e.g., Cache miss, retry attempt] |
  | INFO | [e.g., Key user journey events — analytics] | [e.g., Login success, purchase complete] |
  | DEBUG | [e.g., Development only — stripped from production builds] | [e.g., API request/response bodies] |

  - [e.g., "No PII in any log level — hash user identifiers before logging"]
  - [e.g., "Log retention: ERROR — 90 days | WARN/INFO — 30 days | DEBUG — not retained"]

---

9. DOCUMENTATION STANDARDS:

| Rec ID | Recommendation | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|
| DC-01 | [e.g., Require README for every feature module] | [e.g., No module-level documentation exists] | [e.g., README covering: purpose, setup, dependencies, known limitations] | High / Med / Low | S / M / L / XL | [TEAM DECISION] |
| DC-02 | ... | ... | ... | ... | ... | ... |

Documentation Standards:
  Code Documentation:
    - [e.g., "All public APIs must have inline documentation — no undocumented public interfaces"]
    - [e.g., "Complex algorithms must have a comment explaining the approach — not just the code"]
    - [e.g., "TODO comments must include JIRA ticket ID — orphaned TODOs not permitted"]

  Architecture Documentation:
    - [e.g., "Architecture Decision Records (ADRs) required for all significant design decisions"]
    - [e.g., "Data flow diagrams maintained for all major feature areas"]
    - [e.g., "API contracts documented in OpenAPI / Swagger — updated before implementation"]

  Onboarding Documentation:
    - [e.g., "Setup guide must allow a new engineer to run the app locally within 30 minutes"]
    - [e.g., "Environment configuration documented — no tribal knowledge dependencies"]
    - [e.g., "Known issues and workarounds documented in team wiki"]

---

10. TEAM PROCESS RECOMMENDATIONS:

| Rec ID | Recommendation | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|
| TP-01 | [e.g., Introduce structured tech debt sprint every 4 sprints] | [e.g., Tech debt addressed ad hoc — never prioritised] | [e.g., Dedicated tech debt sprint — items selected by Tech Lead] | High / Med / Low | S / M / L / XL | [TEAM DECISION] |
| TP-02 | ... | ... | ... | ... | ... | ... |

Process Recommendations:
  Code Review Process:
    - [e.g., "All PRs require at least one Tech Lead review before merge"]
    - [e.g., "PR size limit: 400 lines changed — larger PRs must be split"]
    - [e.g., "Review SLA: 24 hours for standard PRs | 4 hours for hotfix PRs"]

  Knowledge Sharing:
    - [e.g., "Fortnightly tech talks — engineer presents a solution or learning"]
    - [e.g., "Pair programming for complex features — not just for onboarding"]
    - [e.g., "Post-incident reviews shared with full team — blameless culture"]

  Tech Debt Management:
    - [e.g., "Tech debt items logged in JIRA with [TECH-DEBT] label — not lost in comments"]
    - [e.g., "Tech Lead reviews debt backlog every sprint — escalates if critical"]
    - [e.g., "Boy Scout Rule: leave code cleaner than you found it on every PR"]

---

ADOPTION ROADMAP:
| Sprint | Focus Area | Recommendations to Adopt | Owner | Success Metric |
|---|---|---|---|---|
| [Sprint N] | [e.g., Security hardening] | [SEC-01, SEC-02, SEC-03] | [Tech Lead] | [e.g., Zero high-severity security findings in next audit] |
| [Sprint N+1] | [e.g., Test coverage] | [TS-01, TS-02] | [Tech Lead + QA Lead] | [e.g., Coverage reaches 70% on new code] |
| [Sprint N+2] | [e.g., CI/CD gates] | [CD-01, CD-02] | [DevOps / Tech Lead] | [e.g., All PRs pass automated gate before review] |

---

RECOMMENDATIONS SUMMARY:
Total Recommendations: [N]
Critical — Act Now: [N] — IDs: [list]
High Priority: [N] — IDs: [list]
Medium Priority: [N] — IDs: [list]
Low Priority: [N] — IDs: [list]
Compliant Areas: [N] — IDs: [list]
Team Decisions Required: [N] — IDs: [list]
Tooling Required: [N] — IDs: [list]
Estimated Total Adoption Effort: [N sprints]

NEXT REVIEW DATE: [DD/MM/YYYY]
OWNER: [Tech Lead Role]
DISTRIBUTION: [Engineering Team | Tech Lead | Product Manager | All]'
WHERE title = 'Best practice recommendations';

UPDATE use_cases
SET prompt_template = 'ROLE:
You are a senior Technical Lead responsible for evaluating, recommending, and
documenting Design Patterns for a Native iOS/Android mobile application team.

CONTEXT:
Project: [Project Name]
Platform: iOS | Android | Both
Sprint: [Sprint Number]
Review Scope: [Full architecture | Specific feature | New module | Refactor]
Review Trigger: [Architecture review | New feature | Performance issue | Tech debt | Onboarding]
Tech Stack: [e.g., Swift | Kotlin | React Native | Node.js | PostgreSQL]
Team Experience Level: Junior-heavy | Mixed | Senior-heavy
Reviewer: [Tech Lead Name / Role]
Current Architecture: [e.g., MVC | MVVM | MVP | VIPER | Clean Architecture]
Known Pain Points: [e.g., tight coupling | untestable code | navigation complexity]

TASK:
Using the codebase context, feature requirements, and architectural inputs
provided below, produce a complete Design Pattern Suggestions report that
gives the team clear, prioritised, and implementation-ready pattern
recommendations tailored to their specific stack and maturity level.

You MUST cover ALL of the following — do not skip any:
  1. Current architecture assessment — strengths, weaknesses, and pattern gaps
  2. Creational patterns — object creation and instantiation recommendations
  3. Structural patterns — composition, interfaces, and module organisation
  4. Behavioural patterns — communication, data flow, and state management
  5. Architectural patterns — app-level structural recommendations
  6. Navigation patterns — routing and screen transition management
  7. Concurrency patterns — async operations and thread safety
  8. Data layer patterns — repository, caching, and persistence strategy
  9. UI patterns — component design, reusability, and state handling
  10. Anti-patterns to eliminate — current practices that must be replaced

For every pattern recommendation:
  - Explain the problem it solves with a specific example from the codebase
  - Provide a concrete before and after implementation comparison
  - Assign a priority and adoption effort
  - Identify which team members need to be involved in adoption
  - Note any risks or trade-offs of adopting the pattern

Flag any pattern already correctly implemented as [COMPLIANT].
Flag any pattern requiring immediate refactor as [CRITICAL — REFACTOR NOW].
Flag any pattern requiring team agreement before adoption as [TEAM DECISION].
Flag any pattern that conflicts with existing architecture as [BREAKING CHANGE].

CODEBASE CONTEXT AND INPUTS:
[Paste architecture overview, code samples, current pain points, feature
requirements, or existing pattern usage here —
or "No existing architecture — greenfield recommendations required"]

CONSTRAINTS:
- Recommendations must be specific to the stated tech stack and platform
- Every pattern must include a platform-specific implementation example
- iOS and Android implementations must be addressed separately where they differ
- Patterns must be appropriate for the stated team experience level
- Do not recommend patterns that introduce unnecessary complexity for the problem
- Before and after examples must use the actual tech stack — not pseudocode
- Do not recommend the same pattern under multiple categories
- Trade-offs must be honest — do not oversell pattern benefits

OUTPUT FORMAT:

DESIGN PATTERN SUGGESTIONS
Project: [Name] | Platform: [Platform] | Sprint: [N]
Reviewer: [Role] | Date: [DD/MM/YYYY] | Scope: [Review Scope]
Current Architecture: [Architecture] | Stack: [Tech Stack]

---

ARCHITECTURE HEALTH SCORECARD:
| Layer | Current Pattern | Recommended Pattern | Health | Priority |
|---|---|---|---|---|
| Presentation | [e.g., MVC — inconsistent] | [e.g., MVVM — consistent] | Strong / Acceptable / Needs Work / Critical | High / Med / Low |
| Navigation | [e.g., Direct VC push] | [e.g., Coordinator pattern] | Strong / Acceptable / Needs Work / Critical | High / Med / Low |
| Business Logic | [e.g., In ViewControllers] | [e.g., Use Case layer] | Strong / Acceptable / Needs Work / Critical | High / Med / Low |
| Data Layer | [e.g., Direct API calls] | [e.g., Repository pattern] | Strong / Acceptable / Needs Work / Critical | High / Med / Low |
| Concurrency | [e.g., Ad hoc threading] | [e.g., Structured concurrency] | Strong / Acceptable / Needs Work / Critical | High / Med / Low |
| Dependency Management | [e.g., Singletons] | [e.g., DI container] | Strong / Acceptable / Needs Work / Critical | High / Med / Low |
| State Management | [e.g., Inconsistent] | [e.g., Unidirectional data flow] | Strong / Acceptable / Needs Work / Critical | High / Med / Low |
| Overall | — | — | Strong / Acceptable / Needs Work / Critical | — |

---

1. CURRENT ARCHITECTURE ASSESSMENT:
[4-6 sentences covering: what patterns are currently in use, where they are
working well, where they are causing pain, and the overall architectural
direction recommended. Written for both the team and technical stakeholders.]

Strengths (keep and build on):
  - [e.g., "[COMPLIANT] Networking layer is well abstracted — URLSession wrapped consistently"]
  - [e.g., "[COMPLIANT] Dependency injection used correctly in service layer"]

Weaknesses (must address):
  - [e.g., "[CRITICAL — REFACTOR NOW] Business logic embedded in ViewControllers — untestable"]
  - [e.g., "Navigation tightly coupled to view layer — makes deep linking fragile"]

Top 3 Pattern Priorities:
  - Priority 1: [Most critical pattern adoption — one sentence]
  - Priority 2: [Second priority — one sentence]
  - Priority 3: [Third priority — one sentence]

---

2. CREATIONAL PATTERNS:

| Rec ID | Pattern | Problem Solved | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|---|
| CP-01 | [e.g., Factory Method] | [e.g., Object creation scattered — inconsistent initialisation] | [e.g., ViewControllers instantiated inline with hardcoded dependencies] | [e.g., Factory methods centralise creation and inject dependencies] | High / Med / Low | S / M / L / XL | [CRITICAL] / Active / [COMPLIANT] |
| CP-02 | [e.g., Builder Pattern] | [e.g., Complex object construction — too many init parameters] | [e.g., Initialisers with 8+ parameters — fragile and unreadable] | [e.g., Builder pattern for complex model construction] | High / Med / Low | S / M / L / XL | Active |
| CP-03 | ... | ... | ... | ... | ... | ... | ... |

Implementation Guidance:
  iOS (Swift):
    - [e.g., "Use static factory methods on ViewControllers — ViewControllerFactory.make()"]
    - [e.g., "Builder pattern using method chaining — URLRequestBuilder().path().method().build()"]
    - [e.g., "Avoid convenience initialisers with optional parameters as a substitute for Builder"]

  Android (Kotlin):
    - [e.g., "Use companion object factory methods — Fragment.newInstance(args)"]
    - [e.g., "Builder pattern via data class copy() for simple cases"]
    - [e.g., "Hilt / Koin for dependency injection — avoid manual factory boilerplate"]

  Before / After Example:
    BEFORE: [Paste or describe current problematic instantiation pattern]
    AFTER:  [Paste or describe recommended factory / builder pattern]

---

3. STRUCTURAL PATTERNS:

| Rec ID | Pattern | Problem Solved | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|---|
| SP-01 | [e.g., Adapter Pattern] | [e.g., Third-party SDK tightly coupled to feature code] | [e.g., Analytics SDK called directly in ViewControllers] | [e.g., AnalyticsAdapter protocol wraps SDK — swappable without feature changes] | High / Med / Low | S / M / L / XL | Active |
| SP-02 | [e.g., Facade Pattern] | [e.g., Complex subsystem exposed directly to UI layer] | [e.g., UI layer calls 4 separate services for a single screen load] | [e.g., DashboardFacade aggregates service calls behind single interface] | High / Med / Low | S / M / L / XL | Active |
| SP-03 | ... | ... | ... | ... | ... | ... | ... |

Implementation Guidance:
  iOS (Swift):
    - [e.g., "Protocol-based adapters for all third-party dependencies — never import SDK in ViewController"]
    - [e.g., "Facade layer in feature module — one entry point per complex subsystem"]
    - [e.g., "Use extensions to add structural behaviour — avoid deep inheritance hierarchies"]

  Android (Kotlin):
    - [e.g., "Interface-based adapters for all third-party SDKs — enables mocking in tests"]
    - [e.g., "Use case classes as facade for multi-repository operations"]
    - [e.g., "Sealed classes for modelling complex structural states"]

  Before / After Example:
    BEFORE: [Describe current tightly coupled structural approach]
    AFTER:  [Describe recommended adapter or facade implementation]

---

4. BEHAVIOURAL PATTERNS:

| Rec ID | Pattern | Problem Solved | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|---|
| BP-01 | [e.g., Observer Pattern] | [e.g., Components tightly coupled for communication] | [e.g., Direct method calls between unrelated modules] | [e.g., Combine / Flow for reactive event streams between layers] | High / Med / Low | S / M / L / XL | Active |
| BP-02 | [e.g., Strategy Pattern] | [e.g., Conditional logic for interchangeable algorithms] | [e.g., Switch statements in ViewModel for different API behaviours] | [e.g., Strategy protocol — inject behaviour at runtime] | High / Med / Low | S / M / L / XL | Active |
| BP-03 | [e.g., Command Pattern] | [e.g., No undo/redo support — actions not encapsulated] | [e.g., Actions executed inline — no history or reversibility] | [e.g., Command objects encapsulate actions — supports undo stack] | High / Med / Low | S / M / L / XL | [TEAM DECISION] |
| BP-04 | ... | ... | ... | ... | ... | ... | ... |

Implementation Guidance:
  iOS (Swift):
    - [e.g., "Combine for reactive data streams — replace delegation chains with publishers"]
    - [e.g., "NotificationCenter only for system-level events — not for feature communication"]
    - [e.g., "Strategy pattern via protocol injection — ViewModel receives strategy at init"]

  Android (Kotlin):
    - [e.g., "StateFlow / SharedFlow for unidirectional data flow from ViewModel to UI"]
    - [e.g., "LiveData for lifecycle-aware UI observation — do not use in non-UI layers"]
    - [e.g., "Strategy pattern via interface injection — consistent with Hilt DI approach"]

  Before / After Example:
    BEFORE: [Describe current tightly coupled communication approach]
    AFTER:  [Describe recommended observer or strategy implementation]

---

5. ARCHITECTURAL PATTERNS:

| Rec ID | Pattern | Problem Solved | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|---|
| AP-01 | [e.g., MVVM] | [e.g., Business logic in views — untestable] | [e.g., MVC with fat ViewControllers] | [e.g., MVVM — ViewModel owns all business logic and state] | High / Med / Low | S / M / L / XL | [CRITICAL — REFACTOR NOW] |
| AP-02 | [e.g., Clean Architecture] | [e.g., No separation between business and data layer] | [e.g., ViewModels call API directly] | [e.g., Use Case layer between ViewModel and Repository] | High / Med / Low | S / M / L / XL | Active |
| AP-03 | ... | ... | ... | ... | ... | ... | ... |

Architecture Layer Responsibilities:
  | Layer | Owns | Must Not Contain | Communicates With |
  |---|---|---|---|
  | UI / View | [e.g., Layout, animations, user input] | [e.g., Business logic, API calls] | [e.g., ViewModel only] |
  | ViewModel / Presenter | [e.g., UI state, user action handling] | [e.g., Android/iOS framework imports] | [e.g., Use Cases only] |
  | Use Case / Interactor | [e.g., Business rules, orchestration] | [e.g., UI state, framework code] | [e.g., Repositories only] |
  | Repository | [e.g., Data source abstraction] | [e.g., Business logic] | [e.g., API service, local DB] |
  | Data Source | [e.g., API calls, database queries] | [e.g., Any logic above data fetching] | [e.g., Repository only] |

---

6. NAVIGATION PATTERNS:

| Rec ID | Pattern | Problem Solved | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|---|
| NP-01 | [e.g., Coordinator Pattern] | [e.g., ViewControllers managing their own navigation] | [e.g., Direct push/present calls inside ViewControllers] | [e.g., Coordinator owns all navigation — VC has no navigation awareness] | High / Med / Low | S / M / L / XL | [CRITICAL — REFACTOR NOW] |
| NP-02 | [e.g., Deep Link Router] | [e.g., No centralised deep link handling] | [e.g., Deep links handled ad hoc per screen] | [e.g., DeepLinkRouter maps URLs to coordinator actions] | High / Med / Low | S / M / L / XL | Active |
| NP-03 | ... | ... | ... | ... | ... | ... | ... |

Navigation Implementation Guidance:
  iOS (Swift):
    - [e.g., "AppCoordinator owns root navigation — child coordinators per feature"]
    - [e.g., "ViewControllers communicate intent to coordinator via delegate or closure"]
    - [e.g., "No direct ViewController imports across feature modules"]

  Android (Kotlin):
    - [e.g., "Jetpack Navigation Component for all in-app navigation"]
    - [e.g., "Single Activity architecture — fragments managed by NavController"]
    - [e.g., "Deep links registered in nav graph — not handled in Activity"]

---

7. CONCURRENCY PATTERNS:

| Rec ID | Pattern | Problem Solved | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|---|
| CC-01 | [e.g., Structured Concurrency] | [e.g., Unmanaged threads — race conditions and leaks] | [e.g., Ad hoc DispatchQueue usage — no task cancellation] | [e.g., Swift Concurrency async/await with structured task hierarchy] | High / Med / Low | S / M / L / XL | [CRITICAL — REFACTOR NOW] |
| CC-02 | ... | ... | ... | ... | ... | ... | ... |

Concurrency Implementation Guidance:
  iOS (Swift):
    - [e.g., "Adopt Swift Concurrency — async/await for all new async code"]
    - [e.g., "Actor model for shared mutable state — eliminates data races"]
    - [e.g., "Task cancellation must be handled — check Task.isCancelled in long operations"]
    - [e.g., "MainActor for all UI updates — no manual DispatchQueue.main.async"]

  Android (Kotlin):
    - [e.g., "Kotlin Coroutines for all async operations — no raw threads or AsyncTask"]
    - [e.g., "viewModelScope for ViewModel coroutines — auto-cancelled on ViewModel clear"]
    - [e.g., "Dispatchers.IO for I/O — Dispatchers.Default for CPU-intensive work"]
    - [e.g., "Flow for reactive streams — StateFlow for UI state"]

---

8. DATA LAYER PATTERNS:

| Rec ID | Pattern | Problem Solved | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|---|
| DL-01 | [e.g., Repository Pattern] | [e.g., Data sources accessed directly from ViewModels] | [e.g., API calls made in ViewModel — no abstraction] | [e.g., Repository abstracts data source — ViewModel never knows source type] | High / Med / Low | S / M / L / XL | [CRITICAL — REFACTOR NOW] |
| DL-02 | [e.g., Cache-aside Pattern] | [e.g., No caching — repeated API calls for same data] | [e.g., Every screen load triggers fresh API call] | [e.g., Repository checks cache before network — TTL per data type] | High / Med / Low | S / M / L / XL | Active |
| DL-03 | ... | ... | ... | ... | ... | ... | ... |

Data Layer Implementation Guidance:
  - [e.g., "Repository interface defined in domain layer — implementation in data layer"]
  - [e.g., "Single source of truth — local database is source, API populates it"]
  - [e.g., "Cache invalidation strategy defined per entity type — not ad hoc"]
  - [e.g., "Offline-first approach — app functional without network for cached data"]

---

9. UI PATTERNS:

| Rec ID | Pattern | Problem Solved | Current State | Recommended State | Priority | Effort | Status |
|---|---|---|---|---|---|---|---|
| UI-01 | [e.g., Component-based UI] | [e.g., UI code duplicated across screens] | [e.g., Same button style reimplemented per screen] | [e.g., Shared component library — single source of truth for UI elements] | High / Med / Low | S / M / L / XL | Active |
| UI-02 | [e.g., State-driven UI] | [e.g., UI state managed with multiple boolean flags] | [e.g., isLoading, isEmpty, isError flags managed separately] | [e.g., Sealed ViewState class — Loading, Success, Empty, Error] | High / Med / Low | S / M / L / XL | [CRITICAL — REFACTOR NOW] |
| UI-03 | ... | ... | ... | ... | ... | ... | ... |

UI Pattern Implementation Guidance:
  iOS (Swift):
    - [e.g., "SwiftUI: single source of truth via @StateObject and @ObservedObject"]
    - [e.g., "UIKit: ViewState enum drives all UI updates from ViewModel"]
    - [e.g., "Reusable views in shared UIComponents module — no per-screen duplication"]

  Android (Kotlin):
    - [e.g., "Compose: remember and State hoisting for component state management"]
    - [e.g., "XML: sealed UiState class — ViewModel exposes StateFlow of UiState"]
    - [e.g., "Design system components in shared :ui module — enforced via module dependency rules"]

---

10. ANTI-PATTERNS TO ELIMINATE:

| Anti-Pattern ID | Anti-Pattern | Why It Is Harmful | Where Found | Replacement Pattern | Priority | Effort |
|---|---|---|---|---|---|---|
| BAD-01 | [e.g., Massive ViewController / Activity] | [e.g., Untestable, violates SRP, merge conflicts] | [e.g., HomeViewController — 1,200 lines] | [e.g., MVVM + Coordinator] | High / Med / Low | S / M / L / XL |
| BAD-02 | [e.g., Singleton abuse] | [e.g., Hidden dependencies, untestable, global state] | [e.g., UserManager.shared used in 40+ files] | [e.g., Dependency injection — inject via constructor] | High / Med / Low | S / M / L / XL |
| BAD-03 | [e.g., God object] | [e.g., Single class owns too many responsibilities] | [e.g., AppManager handles auth, analytics, and config] | [e.g., Split into AuthService, AnalyticsService, ConfigService] | High / Med / Low | S / M / L / XL |
| BAD-04 | [e.g., Hardcoded dependencies] | [e.g., Cannot unit test — no seam for mocking] | [e.g., APIClient instantiated inside Repository init] | [e.g., Protocol injection — pass APIClientProtocol at init] | High / Med / Low | S / M / L / XL |
| BAD-05 | ... | ... | ... | ... | ... | ... |

Anti-Pattern Elimination Roadmap:
  | Sprint | Anti-Pattern to Eliminate | Affected Files | Owner | Success Metric |
  |---|---|---|---|---|
  | [Sprint N] | [BAD-01 — Massive ViewController] | [List files] | [Tech Lead] | [e.g., No ViewController exceeds 300 lines] |
  | [Sprint N+1] | [BAD-02 — Singleton abuse] | [List files] | [Tech Lead] | [e.g., Zero singleton usage in feature modules] |

---

ADOPTION ROADMAP:
| Sprint | Focus Area | Patterns to Adopt | Owner | Success Metric |
|---|---|---|---|---|
| [Sprint N] | [e.g., Architecture foundation] | [AP-01, AP-02, NP-01] | [Tech Lead] | [e.g., All new features use MVVM + Coordinator] |
| [Sprint N+1] | [e.g., Data layer] | [DL-01, DL-02] | [Tech Lead] | [e.g., Zero direct API calls from ViewModels] |
| [Sprint N+2] | [e.g., Concurrency] | [CC-01] | [Tech Lead] | [e.g., All new async code uses Swift Concurrency / Coroutines] |
| [Sprint N+3] | [e.g., UI consistency] | [UI-01, UI-02] | [Tech Lead + Designer] | [e.g., Shared component library covers 80% of UI elements] |

---

PATTERN SUGGESTIONS SUMMARY:
Total Recommendations: [N]
Critical — Refactor Now: [N] — IDs: [list]
High Priority: [N] — IDs: [list]
Medium Priority: [N] — IDs: [list]
Low Priority: [N] — IDs: [list]
Compliant Areas: [N] — IDs: [list]
Anti-Patterns to Eliminate: [N] — IDs: [list]
Breaking Changes: [N] — IDs: [list]
Team Decisions Required: [N] — IDs: [list]
Estimated Total Adoption Effort: [N sprints]

NEXT REVIEW DATE: [DD/MM/YYYY]
OWNER: [Tech Lead Role]
DISTRIBUTION: [Engineering Team | Tech Lead | Product Manager | All]'
WHERE title = 'Design pattern suggestions';

UPDATE use_cases
SET prompt_template = 'ROLE:
You are a senior Technical Lead responsible for designing and delivering
structured Technical Mentoring Guidance for engineers on a Native iOS/Android
mobile application team.

CONTEXT:
Project: [Project Name]
Platform: iOS | Android | Both
Sprint: [Sprint Number]
Mentee Role: Junior Engineer | Mid-level Engineer | Senior Engineer | New Team Member
Mentoring Trigger: [Onboarding | Performance gap | Skill development | Promotion readiness | Post-incident]
Tech Stack: [e.g., Swift | Kotlin | React Native | Node.js | PostgreSQL]
Team Experience Level: Junior-heavy | Mixed | Senior-heavy
Mentor: [Tech Lead Name / Role]
Mentee Experience: [Years of experience and current skill areas]
Current Strengths: [e.g., strong UI skills | good problem solver | fast learner]
Development Areas: [e.g., architecture understanding | testing | code quality | communication]
Mentoring Duration: [e.g., 4 weeks | 1 sprint | 3 months]
Mentoring Format: [1-on-1 sessions | Pair programming | Code review feedback | All]

TASK:
Using the mentee profile, team context, and development goals provided below,
produce a complete, structured Technical Mentoring Guidance plan that gives
both the mentor and mentee a clear, measurable path for skill development.

You MUST cover ALL of the following — do not skip any:
  1. Mentee assessment — current skill level, strengths, and development gaps
  2. Mentoring objectives — measurable goals for the mentoring period
  3. Learning path — structured progression by skill area and week
  4. Core technical topics — specific concepts to cover per session
  5. Hands-on exercises — practical tasks tied to real sprint work
  6. Code review guidance — how to give and receive constructive feedback
  7. Architecture and design learning — pattern comprehension milestones
  8. Soft skills development — communication, estimation, and collaboration
  9. Progress checkpoints — how to measure growth and adjust the plan
  10. Graduation criteria — what success looks like at the end of the period

For every guidance item:
  - Assign a priority and learning stage
  - Provide specific resources, exercises, or examples
  - Define a measurable outcome — not just a topic covered
  - Identify the mentoring format best suited to the topic
  - Note prerequisites before the topic can be effectively taught

Flag any skill area requiring immediate attention as [PRIORITY — ADDRESS NOW].
Flag any topic where mentee has shown strength as [STRENGTH — BUILD ON THIS].
Flag any topic requiring external training or resources as [EXTERNAL RESOURCE NEEDED].
Flag any area where mentor needs to demonstrate live as [LIVE DEMO REQUIRED].

MENTEE PROFILE AND INPUTS:
[Paste mentee background, recent code review feedback, performance notes,
self-assessment, or onboarding observations here —
or "New mentee — no prior assessment available"]

CONSTRAINTS:
- Guidance must be specific to the stated tech stack and platform
- Learning path must be realistic for the mentoring duration stated
- Exercises must connect to real sprint work — not isolated academic tasks
- Progress metrics must be objective — not based on mentor perception alone
- Do not overwhelm a junior engineer with senior-level concepts prematurely
- Soft skills must be treated as equal priority to technical skills
- Every session topic must have a clear outcome — not just a discussion agenda
- Mentoring plan must be adjustable — include review points to course correct

OUTPUT FORMAT:

TECHNICAL MENTORING GUIDANCE
Project: [Name] | Platform: [Platform] | Sprint: [N]
Mentor: [Role] | Mentee: [Role] | Date: [DD/MM/YYYY]
Mentoring Period: [Start Date] to [End Date]
Trigger: [Mentoring Trigger] | Format: [Mentoring Format]

---

MENTEE SKILL SCORECARD:
| Skill Area | Current Level | Target Level | Gap | Priority |
|---|---|---|---|---|
| [e.g., Swift / Kotlin fundamentals] | Beginner / Developing / Proficient / Advanced | [Target] | Large / Medium / Small | High / Med / Low |
| [e.g., Architecture patterns] | Beginner / Developing / Proficient / Advanced | [Target] | Large / Medium / Small | High / Med / Low |
| [e.g., Unit testing] | Beginner / Developing / Proficient / Advanced | [Target] | Large / Medium / Small | High / Med / Low |
| [e.g., Code review participation] | Beginner / Developing / Proficient / Advanced | [Target] | Large / Medium / Small | High / Med / Low |
| [e.g., Debugging and profiling] | Beginner / Developing / Proficient / Advanced | [Target] | Large / Medium / Small | High / Med / Low |
| [e.g., API integration] | Beginner / Developing / Proficient / Advanced | [Target] | Large / Medium / Small | High / Med / Low |
| [e.g., Performance optimisation] | Beginner / Developing / Proficient / Advanced | [Target] | Large / Medium / Small | High / Med / Low |
| [e.g., Technical communication] | Beginner / Developing / Proficient / Advanced | [Target] | Large / Medium / Small | High / Med / Low |
| [e.g., Sprint planning participation] | Beginner / Developing / Proficient / Advanced | [Target] | Large / Medium / Small | High / Med / Low |
| Overall Readiness | Beginner / Developing / Proficient / Advanced | [Target] | Large / Medium / Small | — |

---

1. MENTEE ASSESSMENT:
[4-6 sentences covering: current skill level, standout strengths, most
critical development gaps, and overall readiness assessment. Written
to be shared with the mentee as a constructive starting point.]

Strengths to Build On:
  - [STRENGTH — BUILD ON THIS] [e.g., "Strong UI instincts — consistently produces clean layouts"]
  - [STRENGTH — BUILD ON THIS] [e.g., "Proactive in standups — communicates blockers early"]
  - [STRENGTH — BUILD ON THIS] [e.g., "Fast learner — adopts feedback from code reviews quickly"]

Development Gaps to Address:
  - [PRIORITY — ADDRESS NOW] [e.g., "Architecture understanding — writing business logic in ViewControllers"]
  - [PRIORITY — ADDRESS NOW] [e.g., "Testing — no unit tests written independently yet"]
  - [e.g., "Estimation accuracy — consistently underestimates by 50%"]
  - [e.g., "Code review participation — reads reviews but rarely comments"]

---

2. MENTORING OBJECTIVES:
| Objective ID | Objective | Skill Area | Target Date | Success Metric | Priority |
|---|---|---|---|---|---|
| OBJ-01 | [e.g., "Write unit tests independently for all new ViewModel code"] | [e.g., Testing] | [DD/MM/YYYY] | [e.g., PRs include unit tests without prompting from reviewer] | High / Med / Low |
| OBJ-02 | [e.g., "Understand and apply MVVM consistently"] | [e.g., Architecture] | [DD/MM/YYYY] | [e.g., Code review feedback contains zero architecture violations] | High / Med / Low |
| OBJ-03 | [e.g., "Participate actively in code reviews"] | [e.g., Collaboration] | [DD/MM/YYYY] | [e.g., Leaves at least 2 constructive comments per PR reviewed] | High / Med / Low |
| OBJ-04 | [e.g., "Estimate sprint stories within 20% accuracy"] | [e.g., Planning] | [DD/MM/YYYY] | [e.g., Story point estimates within 20% of actual effort for 3 consecutive sprints] | Med / Low |
| OBJ-05 | ... | ... | ... | ... | ... |

---

3. LEARNING PATH:
[Structured week-by-week progression — adjust to mentoring duration]

| Week | Focus Area | Topics | Format | Outcome | Prerequisites |
|---|---|---|---|---|---|
| Week 1 | [e.g., Foundations and codebase orientation] | [e.g., Project structure, coding standards, git workflow] | [e.g., Walkthrough session + self-directed exploration] | [e.g., Can navigate codebase independently and submit a PR following team standards] | [e.g., Dev environment set up] |
| Week 2 | [e.g., Architecture fundamentals] | [e.g., MVVM pattern, separation of concerns, dependency injection] | [e.g., Pair programming + code review] | [e.g., Can identify MVVM layers in existing code and explain responsibilities of each] | [e.g., Week 1 complete] |
| Week 3 | [e.g., Testing fundamentals] | [e.g., Unit testing, mocking, XCTest / JUnit] | [e.g., Pair programming + hands-on exercise] | [e.g., Writes unit tests independently for simple ViewModel logic] | [e.g., Architecture understanding from Week 2] |
| Week 4 | [e.g., API integration and error handling] | [e.g., Repository pattern, error states, offline handling] | [e.g., Hands-on task on real sprint story] | [e.g., Implements API integration with full error handling independently] | [e.g., Weeks 1-3 complete] |
| Week 5 | [e.g., Performance and debugging] | [e.g., Instruments / Android Profiler, memory management, crash analysis] | [e.g., Live demo + guided debugging session] | [e.g., Can identify and resolve a performance issue using profiling tools] | [e.g., Week 4 complete] |
| Week 6 | [e.g., Code review and communication] | [e.g., How to give feedback, technical writing, estimation] | [e.g., Observed code review + 1-on-1 coaching] | [e.g., Submits a code review with at least 3 constructive, specific comments] | [e.g., Active in at least 5 PRs as reviewer] |

---

4. CORE TECHNICAL TOPICS:

| Topic ID | Topic | Description | Platform | Session Type | Est. Duration | Prerequisite | Status |
|---|---|---|---|---|---|---|---|
| TT-01 | [e.g., Swift / Kotlin language fundamentals] | [e.g., Optionals, closures, generics, protocols / interfaces] | iOS / Android / Both | [e.g., Self-directed + Q&A session] | [e.g., 3 hours] | [e.g., None] | Not Started / In Progress / Complete |
| TT-02 | [e.g., MVVM pattern deep dive] | [e.g., ViewModel responsibilities, data binding, state management] | iOS / Android / Both | [e.g., Pair programming on real feature] | [e.g., 2 hours] | [e.g., TT-01] | Not Started / In Progress / Complete |
| TT-03 | [e.g., Dependency injection] | [e.g., Constructor injection, protocol mocking, DI containers] | iOS / Android / Both | [e.g., Live demo + hands-on refactor] | [e.g., 2 hours] | [e.g., TT-02] | Not Started / In Progress / Complete |
| TT-04 | [e.g., Unit testing and mocking] | [e.g., XCTest / JUnit, mock protocols, test structure, AAA pattern] | iOS / Android / Both | [e.g., Pair programming on existing untested code] | [e.g., 3 hours] | [e.g., TT-03] | Not Started / In Progress / Complete |
| TT-05 | [e.g., Async programming] | [e.g., Swift Concurrency / Kotlin Coroutines, async/await, error propagation] | iOS / Android / Both | [e.g., Live demo + exercise] | [e.g., 2 hours] | [e.g., TT-02] | Not Started / In Progress / Complete |
| TT-06 | [e.g., Networking and API integration] | [e.g., URLSession / Retrofit, Codable / Gson, error handling, retries] | iOS / Android / Both | [e.g., Hands-on sprint task] | [e.g., 2 hours] | [e.g., TT-05] | Not Started / In Progress / Complete |
| TT-07 | [e.g., Local persistence] | [e.g., CoreData / Room, migration strategy, when to cache] | iOS / Android / Both | [e.g., Guided implementation] | [e.g., 2 hours] | [e.g., TT-06] | Not Started / In Progress / Complete |
| TT-08 | [e.g., Performance profiling] | [e.g., Instruments / Android Studio Profiler, memory leaks, frame drops] | iOS / Android / Both | [e.g., Live demo — [LIVE DEMO REQUIRED]] | [e.g., 1.5 hours] | [e.g., TT-02] | Not Started / In Progress / Complete |
| TT-09 | [e.g., Security fundamentals] | [e.g., Keychain / EncryptedSharedPreferences, certificate pinning, data sanitisation] | iOS / Android / Both | [e.g., Code review + discussion] | [e.g., 1.5 hours] | [e.g., TT-06] | Not Started / In Progress / Complete |
| TT-10 | [e.g., CI/CD and release process] | [e.g., Pipeline stages, code signing, TestFlight / Firebase distribution] | iOS / Android / Both | [e.g., Walkthrough session] | [e.g., 1 hour] | [e.g., TT-01] | Not Started / In Progress / Complete |

---

5. HANDS-ON EXERCISES:

| Exercise ID | Title | Skill Targeted | Connected to Sprint Work | Deliverable | Success Criteria | Difficulty |
|---|---|---|---|---|---|---|
| EX-01 | [e.g., "Refactor a ViewController into MVVM"] | [e.g., Architecture] | [Yes — PROJ-123 | No — standalone] | [e.g., PR submitted with ViewModel extracted and unit tested] | [e.g., All business logic removed from VC — PR approved without architecture comments] | Beginner / Intermediate / Advanced |
| EX-02 | [e.g., "Write unit tests for an existing ViewModel"] | [e.g., Testing] | [Yes — PROJ-145] | [e.g., 10 unit tests covering happy path and error states] | [e.g., Tests pass in CI — coverage above 70% on that ViewModel] | Beginner / Intermediate / Advanced |
| EX-03 | [e.g., "Implement an API integration using Repository pattern"] | [e.g., Architecture + Networking] | [Yes — PROJ-167] | [e.g., Repository with protocol, implementation, and mock for testing] | [e.g., ViewModel has no knowledge of data source type] | Intermediate / Advanced |
| EX-04 | [e.g., "Profile and fix a slow screen load"] | [e.g., Performance] | [Yes — identified in sprint review] | [e.g., Before and after Instruments trace with explanation] | [e.g., Screen load time reduced by at least 30%] | Intermediate / Advanced |
| EX-05 | [e.g., "Conduct a full code review on a peer PR"] | [e.g., Code review + communication] | [Yes — next available PR] | [e.g., Written review with categorised findings] | [e.g., At least 3 specific, constructive comments — approved by Tech Lead] | Beginner / Intermediate |

---

6. CODE REVIEW GUIDANCE:

Giving Feedback — Standards for the Mentee:
  - [e.g., "Every comment must explain why — not just what to change"]
  - [e.g., "Use severity labels: Blocking | Suggestion | Question — never ambiguous"]
  - [e.g., "Lead with what is working well before raising issues"]
  - [e.g., "Reference team standards or documentation — not personal preference"]
  - [e.g., "Ask questions rather than make demands for non-blocking issues"]

Receiving Feedback — How to Process Review Comments:
  - [e.g., "Respond to every comment — even if just acknowledging it"]
  - [e.g., "Ask for clarification on blocking comments before reworking"]
  - [e.g., "Do not take review comments personally — separate code from identity"]
  - [e.g., "Understand the why behind every blocking comment — not just the fix"]
  - [e.g., "Request a follow-up discussion for comments that reveal a knowledge gap"]

Code Review Progression Milestones:
  | Milestone | Description | Target Week | Status |
  |---|---|---|---|
  | [M1] | [e.g., Reads and understands all comments on own PRs] | [Week 1-2] | Not Started / In Progress / Complete |
  | [M2] | [e.g., Leaves at least one question or comment on peer PRs] | [Week 2-3] | Not Started / In Progress / Complete |
  | [M3] | [e.g., Identifies a blocking issue in a peer PR independently] | [Week 3-4] | Not Started / In Progress / Complete |
  | [M4] | [e.g., Conducts a full structured review without Tech Lead prompting] | [Week 5-6] | Not Started / In Progress / Complete |

---

7. ARCHITECTURE AND DESIGN LEARNING:

Progressive Architecture Understanding:
  Stage 1 — Read and navigate (Week 1-2):
    - [e.g., "Identify all layers in the existing architecture — draw a simple diagram"]
    - [e.g., "Trace a single API call from UI to network layer — document the path"]
    - [e.g., "Identify one example of each: ViewModel, Repository, Use Case in the codebase"]

  Stage 2 — Understand and explain (Week 2-3):
    - [e.g., "Explain to mentor why business logic must not live in the View layer"]
    - [e.g., "Identify two places in the codebase where the architecture is violated"]
    - [e.g., "Describe how dependency injection makes code more testable — with an example"]

  Stage 3 — Apply independently (Week 3-5):
    - [e.g., "Implement a new feature following MVVM — no architecture feedback from Tech Lead"]
    - [e.g., "Write a use case class that orchestrates two repository calls"]
    - [e.g., "Design a simple architecture diagram for a new feature before implementation"]

  Stage 4 — Critique and improve (Week 5-6):
    - [e.g., "Identify a pattern violation in a peer PR and explain the impact"]
    - [e.g., "Propose a refactor for an existing module with justification"]
    - [EXTERNAL RESOURCE NEEDED] [e.g., "Read: Clean Architecture by Robert Martin — chapters 1-5"]

---

8. SOFT SKILLS DEVELOPMENT:

| Skill | Current Gap | Guidance | Exercise | Target Outcome | Target Week |
|---|---|---|---|---|---|
| [e.g., Technical communication] | [e.g., Struggles to explain technical decisions verbally] | [e.g., Prepare a 5-minute explanation of a technical decision before each 1-on-1] | [e.g., Present the architecture of a feature they built to the team] | [e.g., Can clearly explain a technical decision to a non-technical stakeholder] | [Week 4] |
| [e.g., Estimation] | [e.g., Consistently underestimates complexity] | [e.g., Break stories into subtasks before estimating — estimate each subtask] | [e.g., Re-estimate last 5 completed stories and compare to actuals] | [e.g., Estimates within 20% of actuals for 3 consecutive sprints] | [Week 3] |
| [e.g., Asking for help] | [e.g., Spends too long blocked before escalating] | [e.g., 30-minute rule — if stuck for 30 minutes, ask for help] | [e.g., Track and log blockers in standup — no silent blockers] | [e.g., No blocker lasts more than half a day without being raised] | [Week 1] |
| [e.g., Proactive communication] | [e.g., Does not raise risks until deadline missed] | [e.g., Share progress updates in standup even when no blockers] | [e.g., Send a daily end-of-day message to mentor — what was done, what is next, any concerns] | [e.g., Team is never surprised by a missed estimate or delayed delivery] | [Week 1] |

---

9. PROGRESS CHECKPOINTS:

| Checkpoint | Week | Format | Topics to Review | Adjustment Trigger |
|---|---|---|---|---|
| CP-01 | [Week 1 end] | [1-on-1 — 30 minutes] | [e.g., Codebase orientation complete? Dev environment stable? Any blockers to address?] | [e.g., If environment not stable — pause learning plan until resolved] |
| CP-02 | [Week 2 end] | [1-on-1 + code review] | [e.g., Architecture understanding — can explain MVVM layers? First PR quality assessment] | [e.g., If architecture still unclear — add one more pair programming session before Week 3] |
| CP-03 | [Week 4 end] | [Structured review — 1 hour] | [e.g., Testing progress, API integration exercise complete, soft skills check] | [e.g., If testing still not independent — bring in additional pair programming resource] |
| CP-04 | [Week 6 end] | [Formal assessment — 1 hour] | [e.g., Full objective review against OBJ-01 through OBJ-05, graduation criteria check] | [e.g., If graduation criteria not met — extend mentoring period with revised focus] |

Progress Metrics (objective — not perception-based):
  - [e.g., "Number of PRs approved without architecture feedback — track per sprint"]
  - [e.g., "Percentage of stories with unit tests included — track per sprint"]
  - [e.g., "Estimation accuracy — compare estimated vs actual story points per sprint"]
  - [e.g., "Code review participation — number of comments left per sprint"]
  - [e.g., "Blocker duration — average time from blocked to escalated"]

---

10. GRADUATION CRITERIA:

The mentee is considered to have successfully completed the mentoring period when:

Technical Criteria:
  | Criterion | Evidence Required | Met By |
  |---|---|---|
  | [e.g., Applies MVVM independently] | [e.g., 3 consecutive PRs with zero architecture feedback] | [DD/MM/YYYY] |
  | [e.g., Writes unit tests without prompting] | [e.g., All PRs include unit tests for new ViewModel code] | [DD/MM/YYYY] |
  | [e.g., Handles API integration independently] | [e.g., Completes an API integration story without pair support] | [DD/MM/YYYY] |
  | [e.g., Debugs and resolves issues independently] | [e.g., Resolves a production bug without Tech Lead intervention] | [DD/MM/YYYY] |
  | [e.g., Participates actively in code reviews] | [e.g., Leaves meaningful comments on 5+ PRs per sprint] | [DD/MM/YYYY] |

Soft Skills Criteria:
  | Criterion | Evidence Required | Met By |
  |---|---|---|
  | [e.g., Estimation accuracy] | [e.g., Within 20% of actuals for 3 consecutive sprints] | [DD/MM/YYYY] |
  | [e.g., Proactive communication] | [e.g., Zero missed escalations in final 2 weeks] | [DD/MM/YYYY] |
  | [e.g., Technical communication] | [e.g., Presents a feature architecture clearly in sprint review] | [DD/MM/YYYY] |

Post-Graduation Next Steps:
  - [e.g., "Move to unsupported feature delivery — Tech Lead available for consult only"]
  - [e.g., "Begin mentoring a more junior team member within 2 sprints"]
  - [e.g., "Set 90-day goals for next growth area — proposed by mentee, agreed with Tech Lead"]
  - [EXTERNAL RESOURCE NEEDED] [e.g., "Enrol in advanced iOS / Android course — recommended list provided separately"]

---

MENTORING PLAN SUMMARY:
Mentoring Period: [Start Date] to [End Date] — [N weeks]
Total Sessions Planned: [N]
Core Topics: [N]
Hands-on Exercises: [N]
Objectives: [N]
Checkpoints: [N]
Priority — Address Now Items: [N] — Topics: [list]
External Resources Required: [N] — Topics: [list]
Live Demos Required: [N] — Topics: [list]
Graduation Target Date: [DD/MM/YYYY]

MENTOR NOTES:
  - [Any observation about mentee learning style that should shape delivery]
  - [Any team context that affects the mentoring approach]
  - [Any prerequisite the mentor must prepare before sessions begin]

NEXT SESSION DATE: [DD/MM/YYYY]
OWNER: [Tech Lead / Mentor Role]
DISTRIBUTION: [Mentor | Mentee | Engineering Manager]'
WHERE title = 'Technical mentoring guidance';
