# System Patterns Template

> **Purpose:** The "how it works" file. Documents the architecture, design patterns, and key technical decisions.

---

## Architecture Overview

**Cline Starter Kit Architecture:**

```
┌─────────────────────────────────────────────────────────────┐
│                      VS Code + Cline                         │
├─────────────────────────────────────────────────────────────┤
│  .clinerules/          │  Skills/ (on-demand)               │
│  ├─ 00-core-protocol   │  ├─ architect                      │
│  ├─ 00-memory-bank     │  ├─ commit-changes                 │
│  ├─ 01-coding-std      │  ├─ quick-fix                      │
│  ├─ 02-testing         │  ├─ code-review                    │
│  ├─ 03-git-workflow    │  ├─ api-design                     │
│  └─ 04-security        │  ├─ debug                          │
│                        │  └─ test-gen                       │
├─────────────────────────────────────────────────────────────┤
│                   MCP Servers (tools)                        │
│  ├─ filesystem     - File operations                        │
│  ├─ memory         - Persistent knowledge graph             │
│  ├─ sequential-thk - Structured problem solving             │
│  ├─ git            - Git operations                         │
│  └─ fetch          - Web content fetching                   │
├─────────────────────────────────────────────────────────────┤
│              Memory Bank (persistent context)                │
│  projectbrief → productContext → activeContext              │
│  systemPatterns → techContext → progress                    │
└─────────────────────────────────────────────────────────────┘
```

---

## Design Patterns Used

- **Progressive Loading:** Skills load only when triggered (~100 tokens idle, ~5k when active)
- **Knowledge Graph:** MCP memory server stores entities, relations, observations
- **Memory Bank:** Structured markdown files for project context persistence
- **On-Demand Context:** Only read files when needed, not at startup

---

## Key Technical Decisions

| Decision | Rationale |
|----------|-----------|
| MCP Memory Server | Persistent knowledge graph reduces token usage by 95% |
| Skills over Rules | Skills load on-demand; rules always consume context |
| Sequential Thinking MCP | Better reasoning quality for complex problems |
| File-based Memory Bank | Human-readable, version-controlled, easy to update |

---

## Component Relationships

```
User Request → Cline
              ↓
     Check Memory Bank (500 tokens)
              ↓
     Trigger Skill if relevant
              ↓
     Use MCP Tools for operations
              ↓
     Update Memory Bank
```

---

## Token Efficiency Flow

1. **Startup:** Read memory-bank/ (~500 tokens) instead of codebase (~10k+ tokens)
2. **Task:** Load skill only if relevant (~5k tokens) instead of all rules
3. **Operations:** Use MCP tools (output only) instead of reading full files
4. **Memory:** Store knowledge in MCP memory graph for future sessions

---

## Testing Strategy

- Manual testing with slash commands: `/architect`, `/commit-changes`, etc.
- Verify MCP servers connect in Cline panel
- Test memory persistence across sessions
