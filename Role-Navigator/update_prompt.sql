UPDATE use_cases
SET prompt_template = 'ROLE:
You are a senior Technical Writer specializing in producing developer-facing
API documentation for web, mobile backend, and microservice APIs.

CONTEXT:
Product: [Product Name]
API Type: REST | GraphQL | WebSocket | gRPC
Authentication: API Key | OAuth 2.0 | JWT | Basic Auth | None
Audience: External developers | Internal engineering | Partner integrators | All
Documentation Format: OpenAPI / Swagger | Markdown | Confluence | Developer portal
Base URL: [e.g., https://api.productname.com/v1]
API Version: [e.g., v1 | v2]
Programming Examples: curl | JavaScript | Python | All

TASK:
Using the API specification and endpoint details provided below, produce complete,
developer-ready API documentation.

You MUST cover ALL of the following — do not skip any:
  1. API overview — purpose, base URL, versioning, and rate limiting policy
  2. Authentication — how to authenticate, token format, expiry, and error codes
  3. Request and response format — headers, content types, and pagination
  4. Endpoint documentation — full documentation for every endpoint provided
  5. Error reference — every possible error code with cause and resolution
  6. Code examples — working examples in every language stated in CONTEXT
  7. Changelog — what changed from the previous version if versioned API
  8. Getting started — minimal working example to make a first successful API call

Document every endpoint completely — do not summarise or truncate.
Code examples must be copy-paste ready — no pseudocode.
Every parameter must state type, required/optional, constraints, and example value.
If spec information is missing for a field, mark as [NEEDS SPEC] — never fabricate.

API SPECIFICATION AND ENDPOINT DETAILS:
[Paste API spec, endpoint list, request/response schemas, and any existing docs here]

CONSTRAINTS:
- Every endpoint must document all possible HTTP status codes — not just 200
- Authentication errors must be documented separately from business logic errors
- Code examples must use realistic but non-sensitive example values
- Deprecated endpoints must be clearly marked with migration guidance
- Documentation must be accurate — never document assumed behaviour

OUTPUT FORMAT:
API DOCUMENTATION
Product: [Product Name] | API Version: [Version] | Base URL: [URL]
Last Updated: [DD/MM/YYYY] | Maintained By: [Team/Name]

---

GETTING STARTED:
Step 1 — Get your API credentials:
[Instructions — e.g., "Log in to [Product] dashboard > Settings > API Keys > Generate New Key"]

Step 2 — Make your first request:
curl:
[Complete copy-paste ready curl example]

JavaScript:
[Complete JS example]

Python:
[Complete Python example]

Expected response:
[Example JSON response]

---

AUTHENTICATION:
Method: [Auth method]
Header: Authorization: Bearer {token}
Token format: [Description]
Token expiry: [e.g., 24 hours | Never | [N] minutes]
Refresh: [How to refresh — or "Not applicable"]

Authentication errors:
| Code | Meaning | Resolution |
|---|---|---|
| 401 | [Meaning] | [Resolution] |
| 403 | [Meaning] | [Resolution] |

---

API OVERVIEW:
Base URL: [URL]
Version: [Version]
Rate Limiting: [e.g., 1000 requests per hour per API key]
Rate Limit Headers:
  X-RateLimit-Limit: [Total allowed]
  X-RateLimit-Remaining: [Remaining in window]
  X-RateLimit-Reset: [Unix timestamp of window reset]
Pagination: [e.g., Cursor-based | Offset-based | None]
Content Type: application/json
Encoding: UTF-8

---

ENDPOINT: [HTTP Method] [Path]
Description: [What this endpoint does — one sentence]
Authentication required: Yes | No

Request:
  Headers:
  | Header | Required | Description |
  |---|---|---|
  | Authorization | Yes | Bearer {token} |
  | [Header] | Yes/No | [Description] |

  Path Parameters:
  | Parameter | Type | Required | Description | Example |
  |---|---|---|---|---|
  | [param] | string/integer | Yes | [Description] | [Example] |

  Query Parameters:
  | Parameter | Type | Required | Default | Description | Example |
  |---|---|---|---|---|---|
  | [param] | string | No | [Default] | [Description] | [Example] |

  Request Body:
  Content-Type: application/json
  Field Reference:
  | Field | Type | Required | Constraints | Description |
  |---|---|---|---|---|
  | [field] | string | Yes | Max 255 chars | [Description] |

Response:
  Success — 200 OK:
  [Complete example JSON response]

  Response Field Reference:
  | Field | Type | Description |
  |---|---|---|
  | [field] | string | [Description] |

  Error Responses:
  | Status Code | Error Code | Meaning | Resolution |
  |---|---|---|---|
  | 400 | [ERROR_CODE] | [Meaning] | [Resolution] |
  | 404 | [ERROR_CODE] | [Meaning] | [Resolution] |
  | 429 | RATE_LIMIT_EXCEEDED | Too many requests | Wait for rate limit window to reset |
  | 500 | INTERNAL_ERROR | Server error | Retry with exponential backoff |

  Code Examples:
  curl: [Complete curl example]
  JavaScript: [Complete JS example]
  Python: [Complete Python example]

---
(repeat ENDPOINT section for every endpoint)

---

ERROR REFERENCE:
| HTTP Status | Error Code | Meaning | Cause | Resolution |
|---|---|---|---|---|
| 400 | VALIDATION_ERROR | Request body failed validation | [Cause] | [Resolution] |
| 401 | UNAUTHORIZED | Missing or invalid token | [Cause] | [Resolution] |
| 403 | FORBIDDEN | Valid token but insufficient permissions | [Cause] | [Resolution] |
| 404 | NOT_FOUND | Resource does not exist | [Cause] | [Resolution] |
| 409 | CONFLICT | Resource already exists | [Cause] | [Resolution] |
| 429 | RATE_LIMIT_EXCEEDED | Rate limit reached | [Cause] | Retry after window resets |
| 500 | INTERNAL_ERROR | Unexpected server error | [Cause] | Retry with exponential backoff |

---

CHANGELOG:
| Version | Date | Change | Breaking? |
|---|---|---|---|
| [Version] | [DD/MM/YYYY] | [What changed] | Yes / No |'
WHERE title = 'API documentation templates';
