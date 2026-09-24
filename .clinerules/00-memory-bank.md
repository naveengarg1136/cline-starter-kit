# Memory Bank System for Persistent Context

> **Purpose:** Reduces token consumption by storing project knowledge in structured files that persist across sessions.

---

## How It Works

Instead of re-reading the entire codebase each session, Cline:
1. Reads the memory-bank/ files (6 small files, ~500 tokens total)
2. Has full context from previous sessions
3. Only reads specific files when needed

---

## Memory Bank Files

| File | Purpose | Token Cost |
|------|---------|------------|
| `projectbrief.md` | Project name, goals, users | ~50 tokens |
| `productContext.md` | Problem, personas, stories | ~50 tokens |
| `activeContext.md` | Current focus, recent changes | ~100 tokens |
| `systemPatterns.md` | Architecture, patterns | ~100 tokens |
| `techContext.md` | Tech stack, dependencies | ~100 tokens |
| `progress.md` | Milestones, status | ~100 tokens |

---

## Token Savings

**Without Memory Bank:**
- Re-read 50+ files per session = 10,000+ tokens

**With Memory Bank:**
- Read 6 files per session = 500 tokens
- **95% reduction in context tokens**

---

## MCP Memory Server Integration

The `memory` MCP server provides a knowledge graph for storing:
- User preferences
- Project decisions
- Recurring patterns
- API keys and configurations (non-sensitive)

Use these MCP tools:
- `create_entities` - Store new knowledge
- `create_relations` - Link concepts
- `add_observations` - Add facts to entities
- `search_nodes` - Find relevant knowledge
- `read_graph` - Get full context

---

## Rules

1. **Read memory-bank/ at start of EVERY task**
2. **Update activeContext.md after completing tasks**
3. **Use MCP memory for user preferences and patterns**
4. **Keep entries concise (under 50 lines per file)**
5. **Never duplicate information across files**

---

## Efficiency Tips

- Use `@` mentions instead of pasting file contents
- Run `/smol` when context > 50%
- Use `err_free_prompt_cap` → `/newtask` immediately
- Prefer MCP tools over shell commands
