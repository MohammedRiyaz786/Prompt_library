# Section 5 — Backend Developer
### Mobile App Project | Native iOS / Android
**Document:** 5 of 8 | **Version:** 1.0 | **Role:** Backend Developer

---

> ## HOW TO USE THIS DOCUMENT
> Fields in `[SQUARE BRACKETS]` are your injection points — replace with real content before running.
> Never remove a section — even if brief, each part anchors the AI's behavior.
> Each prompt follows: **ROLE → CONTEXT → TASK → CONSTRAINTS → OUTPUT FORMAT**

---

## 5.1 | API Contract Generation from User Story

**When to use:** Design the full REST API contract needed to support a mobile feature before development begins — ensures mobile and backend teams are aligned before a single line is written.

```
ROLE:
You are a senior Backend Developer designing a REST API to support
a Native iOS/Android mobile application.

CONTEXT:
Project: [Project Name]
Story Title: [Story Title]
Story ID: [JIRA ID]
Auth Method: [JWT | OAuth2 | API Key | None]
Base URL: [https://api.yourproject.com/v1 | TBD]
Data Format: JSON
Backend Stack: [Node.js | Python/Django | Java/Spring | .NET | Other]
Pagination Style: [Limit-Offset | Cursor-Based | Page-Number | None]
Rate Limiting: [Yes — [N] requests/min | No]

TASK:
Design the full API contract required to support the mobile feature in the story below.
For each endpoint define: method, path, auth requirement, request headers,
request body, success response, all error responses, and pagination if applicable.
Evaluate the ENTIRE story and ALL acceptance criteria before designing any endpoint.
Do NOT design endpoints beyond what the story explicitly requires.
Flag any decision that requires mobile team alignment as "Alignment Needed."

USER STORY & ACCEPTANCE CRITERIA:
[Paste story and AC here]

CONSTRAINTS:
- Follow RESTful conventions strictly — correct HTTP verbs, status codes, and resource naming
- Every error response must use a consistent error envelope structure across all endpoints
- Do not use placeholder field names like "foo" or "bar" — use realistic domain-specific names
- Request and response fields must include: name, type, required/optional, and description
- Nullable fields must be explicitly marked as nullable

OUTPUT FORMAT:
API CONTRACT
Feature: [Story Title] | Story: [JIRA ID] | Version: v1 | Auth: [Method]
Base URL: [URL]

---
ENDPOINT [N]:
Method: GET | POST | PUT | PATCH | DELETE
Path: /[resource]/[parameter]
Description: [What this endpoint does in one sentence]
Auth Required: Yes | No

Request Headers:
  Authorization: Bearer {token}
  Content-Type: application/json
  [Any additional headers]

Path Parameters (if applicable):
  {param}: [type] — [description]

Query Parameters (if applicable):
  [param]: [type] — [description] — Required | Optional

Request Body (if applicable):
{
  "fieldName": "[type] — [description] — Required | Optional | Nullable"
}

Success Response [HTTP 2XX]:
{
  "fieldName": "[type] — [description]"
}

Error Responses:
  HTTP 400 Bad Request:
    { "error": "validation_failed", "message": "[description]", "fields": [] }
  HTTP 401 Unauthorized:
    { "error": "unauthorized", "message": "Invalid or expired token" }
  HTTP 403 Forbidden:
    { "error": "forbidden", "message": "Insufficient permissions" }
  HTTP 404 Not Found:
    { "error": "not_found", "message": "[resource] not found" }
  HTTP 429 Too Many Requests:
    { "error": "rate_limited", "message": "Retry after [N] seconds" }
  HTTP 500 Internal Server Error:
    { "error": "server_error", "message": "An unexpected error occurred" }

Pagination (if applicable):
  Style: [Limit-Offset | Cursor | Page-Number]
  Request: { "limit": "integer", "offset": "integer" }
  Response: { "data": [], "total": "integer", "next_cursor": "string | null" }

Caching: [Cache-Control header value — or "No caching"]
Rate Limit: [N requests/min — or "Standard rate limit applies"]
Notes: [Any special behavior, business rule, or mobile-specific consideration]

---
ALIGNMENT NEEDED:
- [Decision or field that mobile + backend must agree on before implementation]
(or "None — contract is self-contained")

CONTRACT SUMMARY:
Total Endpoints: [N]
Auth-Protected Endpoints: [N]
Endpoints Requiring Pagination: [N]
New Database Entities Implied: [List or "None"]
```

---

## 5.2 | API Error Code Standardization

**When to use:** Establishing or auditing consistent error codes and messages across all backend APIs consumed by the mobile app — critical for predictable mobile-side error handling.

```
ROLE:
You are a senior Backend Developer standardizing API error codes and response
structures for a Native iOS/Android mobile application backend.

CONTEXT:
Project: [Project Name]
Backend Stack: [Node.js | Python/Django | Java/Spring | .NET | Other]
Current State: [No standards exist | Partial standards | Full audit of existing codes]
Mobile Platforms Consuming API: iOS | Android | Both
Error Display Strategy: [Mobile shows raw message | Mobile maps codes to UI strings | Both]

TASK:
Using the existing error responses provided below, audit for inconsistencies
and produce a standardized error code catalogue.
Evaluate ALL existing errors before proposing standards — do not standardize
based on a subset of the provided errors.
Group errors by domain (Auth, Validation, Resource, Server, Rate Limiting).
For each error code define: HTTP status, error code string, default message,
mobile handling recommendation, and whether the message is safe to display to end users.
Flag any existing error that exposes internal implementation details as a security risk.

EXISTING ERROR RESPONSES (if auditing):
[Paste existing API error responses here — or "None — creating from scratch"]

NEW ENDPOINTS / DOMAINS TO COVER:
[List new features or domains needing error codes — or "Full audit only"]

CONSTRAINTS:
- Error code strings must be snake_case and domain-prefixed: auth_invalid_token, validation_required_field
- Messages shown to end users must never expose stack traces, DB names, or internal paths
- Every HTTP 5XX error must have a generic user-safe message regardless of internal cause
- Mobile handling recommendation must be one of: Show to user | Map to UI string | Retry | Log only | Escalate

OUTPUT FORMAT:
API ERROR CODE CATALOGUE
Project: [Name] | Version: 1.0 | Date: [DD/MM/YYYY]
Backend Stack: [Stack] | Consuming Platforms: [iOS/Android/Both]

STANDARD ERROR ENVELOPE (all errors must use this structure):
{
  "error": {
    "code": "domain_error_name",
    "message": "Human-readable description",
    "details": [] or null,
    "request_id": "uuid-for-tracing"
  }
}

ERROR CATALOGUE:

AUTH ERRORS (HTTP 401 / 403):
| Code | HTTP | Message | User-Safe | Mobile Handling |
|---|---|---|---|---|
| auth_token_expired | 401 | Session has expired. Please log in again. | Yes | Show to user |
| auth_token_invalid | 401 | Authentication failed. | Yes | Show to user |
| auth_insufficient_permissions | 403 | You do not have permission to perform this action. | Yes | Show to user |
| [additional codes] | | | | |

VALIDATION ERRORS (HTTP 400):
| Code | HTTP | Message | User-Safe | Mobile Handling |
|---|---|---|---|---|
| validation_required_field | 400 | [field] is required. | Yes | Show to user |
| validation_invalid_format | 400 | [field] format is invalid. | Yes | Show to user |
| [additional codes] | | | | |

RESOURCE ERRORS (HTTP 404 / 409 / 410):
| Code | HTTP | Message | User-Safe | Mobile Handling |
|---|---|---|---|---|
| resource_not_found | 404 | The requested resource was not found. | Yes | Show to user |
| resource_conflict | 409 | A conflict occurred. Please try again. | Yes | Retry |
| [additional codes] | | | | |

RATE LIMITING ERRORS (HTTP 429):
| Code | HTTP | Message | User-Safe | Mobile Handling |
|---|---|---|---|---|
| rate_limit_exceeded | 429 | Too many requests. Please wait and try again. | Yes | Retry after header |

SERVER ERRORS (HTTP 500 / 502 / 503):
| Code | HTTP | Message | User-Safe | Mobile Handling |
|---|---|---|---|---|
| server_internal_error | 500 | Something went wrong. Please try again later. | Yes | Log only |
| server_unavailable | 503 | Service temporarily unavailable. | Yes | Show to user |

SECURITY FLAGS (existing errors exposing internal details):
| Original Error | Risk | Recommended Replacement |
|---|---|---|
| [Original message] | Exposes [DB/path/stack] | [Safe replacement] |
(or "None found — all existing errors are safe")

IMPLEMENTATION NOTES:
- [How to implement this catalogue in the backend stack specified]
- [How mobile team should map error codes to UI strings]
```

---

## 5.3 | Database Migration Script Review

**When to use:** A schema change is needed to support a new mobile feature — review the migration for safety, rollback capability, and mobile API compatibility before it runs in any environment.

```
ROLE:
You are a senior Backend Developer reviewing a database migration script
for a mobile application backend.

CONTEXT:
Project: [Project Name]
Database: [PostgreSQL | MySQL | MongoDB | SQLite | Other]
ORM / Migration Tool: [Sequelize | Alembic | Flyway | Liquibase | Raw SQL | Other]
Migration Purpose: [New feature | Bug fix | Performance | Refactor]
Story ID: [JIRA ID]
Target Environment for Next Run: [Dev | QA | Staging | Production]
Estimated Table Size: [e.g., < 10k rows | 100k rows | 1M+ rows]
Downtime Allowed: Yes | No

TASK:
Review the migration script provided below against ALL of the following criteria —
evaluate every criterion independently, do not stop after the first issue found:

1. SAFETY — Will this run without data loss or corruption?
2. ROLLBACK — Is there a complete, tested rollback script?
3. IDEMPOTENCY — Is it safe to run twice if it partially fails?
4. PERFORMANCE — Will it lock tables or cause downtime at the stated table size?
5. MOBILE API COMPATIBILITY — Will existing mobile app versions break after this runs?
6. DATA INTEGRITY — Are constraints, indexes, and foreign keys correctly handled?
7. NAMING CONVENTIONS — Do new tables/columns follow project conventions?

After evaluating all criteria, run a verification pass confirming every criterion was checked.
Flag any issue that would block running this in the target environment.

MIGRATION SCRIPT:
[Paste migration script here]

EXISTING API ENDPOINTS AFFECTED (for compatibility check):
[Paste relevant endpoint contracts or "Not provided — skip compatibility check"]

CONSTRAINTS:
- Each issue gets its own entry — do not group issues from different criteria
- Blocking issues must be resolved before the migration runs in the target environment
- Non-blocking issues must still be documented — do not omit them
- Rollback script must be complete — partial rollbacks are flagged as blocking

OUTPUT FORMAT:
DATABASE MIGRATION REVIEW
Story: [JIRA ID] | Database: [DB] | Target Env: [Env]
Table Size: [Size] | Downtime Allowed: [Yes/No] | Date: [DD/MM/YYYY]

CRITERION-BY-CRITERION FINDINGS:

[N]. [CRITERION NAME]: Pass | Fail | Warning
  Finding: [What was found]
  Risk: High | Medium | Low
  Blocking: Yes | No
  Recommendation: [Concrete action to resolve — or "No action needed"]

(repeat for all 7 criteria)

BLOCKING ISSUES SUMMARY:
| # | Criterion | Issue | Resolution Required |
|---|---|---|---|
| 1 | [Criterion] | [Issue] | [What must be done before this runs] |
(or "No blocking issues — migration is approved to proceed")

NON-BLOCKING ISSUES:
| # | Criterion | Issue | Recommended Action |
|---|---|---|---|
(or "None")

MOBILE COMPATIBILITY VERDICT:
Existing App Versions Affected: Yes | No | Unknown
Backward Compatible: Yes | No
If No — Action Required: [Force update | Versioned API | Feature flag | Other]

OVERALL VERDICT:
✅ Approved — safe to run in [target environment]
⚠️ Approved with conditions — resolve [N] blocking issues first
❌ Rejected — [primary reason]

ROLLBACK SCRIPT REVIEW:
Rollback Provided: Yes | No
Rollback Complete: Yes | No | Partial
Rollback Safe: Yes | No
Notes: [Any rollback-specific concerns]
```

---

*Document: Section 5 — Backend Developer | Project Prompt Library*
*Next Document: Section 6 — Solution Architect*
*Owner: [Backend Lead Name] | Last Updated: [DD/MM/YYYY]*
