# Active Context Template

> **Purpose:** The "what now" file. Tracks the current focus, recent changes, open questions, and next steps. This file should be **updated frequently** — after every task or session.

---

## Current Focus

Production-grade setup for Cline + Omniroute + OpenRouter with MCP servers, skills, and hooks for token efficiency.

---

## Recent Changes

- [2026-09-24] Created 7 skills: architect, commit-changes, quick-fix, code-review, api-design, debug, test-gen
- [2026-09-24] Configured MCP servers: filesystem, memory, sequential-thinking, git, fetch
- [2026-09-24] Updated .clinerules/00-memory-bank.md with MCP memory integration
- [2026-09-23] Added Output Discipline section to .clinerules/01-coding-standards.md
- [2026-09-23] Created .clinerules/00-core-protocol.md with Context Discipline rules

---

## Open Questions

```markdown
- [Q] Need to add BRAVE_API_KEY for web search capability?
- [Q] Should we add postgres MCP server for database projects?
```

---

## Next Steps

- Test MCP servers are connected in Cline
- Verify skills trigger correctly with slash commands
- Add project-specific memory entities using MCP memory tools

---

## In Progress Tasks

- [DONE] Production-grade MCP configuration
- [DONE] Skills creation (7 skills)
- [DONE] Memory bank integration
- [TODO] Test the setup with real tasks

---

## Decisions Log

- [2026-09-24] Decision: Use MCP memory server for persistent knowledge — Rationale: Reduces token usage by storing context across sessions
- [2026-09-24] Decision: Use skills instead of rules for task-specific guidance — Rationale: Skills load on-demand, saving ~2000 tokens per inactive skill
