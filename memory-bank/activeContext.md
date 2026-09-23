# Active Context Template

> **Purpose:** The "what now" file. Tracks the current focus, recent changes, open questions, and next steps. This file should be **updated frequently** — after every task or session.

---

## Current Focus

```
[What is the primary area of work right now?
 Example:
 "Building the user authentication module — implementing JWT-based login,
 registration, and password reset flows."
]
```

---

## Recent Changes

```
[List the most recent changes to the project. Keep the last 5–10 items.

 Format: [Date] [Short description of change]

 Example:
 - [2024-06-10] Created user registration endpoint with Zod validation
 - [2024-06-10] Added PostgreSQL schema for users table
 - [2024-06-09] Set up Express server with CORS and rate limiting
 - [2024-06-09] Installed dependencies: express, zod, pg, jsonwebtoken
 - [2024-06-08] Initialized project repository via create-next-app
]
```

---

## Open Questions

```
[List any decisions or issues that need clarification.

 Example:
 - [Q] Should we use email or phone number for login?
 - [Q] Which SMS provider to use for notifications (Twilio vs. AWS SNS)?
 - [Q] Do we need social login (Google, GitHub)?
]
```

---

## Next Steps

```
[Immediate actions to take in the current or next session.

 Example:
 - Implement login endpoint with JWT token generation
 - Add middleware to verify JWT on protected routes
 - Set up test database (PostgreSQL in Docker)
 - Write unit tests for auth service
]
```

---

## In Progress Tasks

```
[List tasks currently being worked on, with status.

 Example:
 - [IN PROGRESS] Design user schema and validation
 - [IN PROGRESS] Implement registration endpoint
 - [BLOCKED]   Login endpoint — waiting on JWT secret decision
 - [DONE]      Set up project structure and dependencies
]
```

---

## Decisions Log

```
[Record key decisions as the project evolves.

 Format: [Date] Decision: [description] — Rationale: [why]

 Example:
 - [2024-06-09] Decision: Use PostgreSQL over Redis for session storage — Rationale: We need persistent relational data and ACID compliance.
 - [2024-06-09] Decision: Use Zod for input validation — Rationale: Type-safe, works seamlessly with TypeScript.
]
```
