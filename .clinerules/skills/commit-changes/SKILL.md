---
name: commit-changes
description: Commit staged changes with conventional commit messages. Use when user asks to commit, create a commit, or save changes to git. Handles staging, commit message generation, and pushing.
---

# Commit Changes Skill

Automates git commits with conventional commit messages following project standards.

## Trigger Phrases

- "commit the changes"
- "create a commit"
- "commit and push"
- "save my changes"

## Process

### 1. Check Git Status
```bash
git status
```

### 2. Review Changes
- If files are staged: review diff with `git diff --staged`
- If files are unstaged: review diff with `git diff`

### 3. Stage Files (if needed)
```bash
# Stage specific files (preferred)
git add path/to/file1 path/to/file2

# Avoid git add . to prevent committing unrelated changes
```

### 4. Generate Commit Message

Use Conventional Commits format:
```
<type>[optional scope]: <description>

[optional body]

[optional footer]
```

**Types:** feat, fix, docs, style, refactor, test, chore, perf, build, ci, revert

**Examples:**
- `feat(auth): add password reset email`
- `fix(api): handle timeout in user list endpoint`
- `docs(readme): add setup instructions`
- `refactor(store): extract user slice to its own file`

### 5. Commit
```bash
git commit -m "type(scope): description"
```

### 6. Push (if requested)
```bash
git push origin <branch-name>
```

## Conventions

- First line max 72 characters
- Imperative mood: "add feature" not "added feature"
- Reference issues in footer: "Closes #123"
- No secrets, API keys, or sensitive data in commits

## Safety Checks

- [ ] No `.env` files staged
- [ ] No `node_modules/` staged
- [ ] No sensitive data in diff
- [ ] Branch is not `main` (create feature branch if needed)
