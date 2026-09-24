# Core Protocol

## Context Discipline (Critical for Free API Tiers)

- Never paste full files into chat. Use `@` mentions instead.
- If a request fails with `err_free_prompt_cap`, the prompt is too large. Do NOT retry.
  - Use `/newtask` to summarize and start fresh.
  - Break the task into smaller pieces.
  - Read fewer files at once.
- Prefer patches and diffs over full-file rewrites.
- Run `/smol` when context window shows >50% full.
- Keep `.clineignore` aggressive: exclude `node_modules/`, `dist/`, `build/`, lock files, logs, and caches.
