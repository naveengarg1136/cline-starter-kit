---
name: debug
description: Debug issues systematically. Use when user reports a bug, error, or unexpected behavior. Focus on root cause analysis and efficient debugging.
---

# Debug Skill

Systematic debugging to find and fix issues quickly.

## Trigger Phrases

- "debug this error"
- "why is this happening"
- "something is wrong"
- "this doesn't work"
- "error message"

## Process

### 1. Reproduce the Issue
- What are the exact steps?
- What's the expected behavior?
- What's the actual behavior?
- Can you isolate it?

### 2. Gather Information
```
- Error messages (exact text)
- Stack traces
- Recent changes (git diff)
- Environment (dev/prod)
- Frequency (always/sometimes)
```

### 3. Hypothesis Formation
- List 2-3 possible causes
- Rank by likelihood
- Start with simplest first

### 4. Test Hypotheses
- Add logging/prints
- Check relevant files
- Verify assumptions

### 5. Fix and Verify
- Make minimal fix
- Test the fix
- Check for side effects

## Debugging Tools

### By Error Type

| Error Type | First Check |
|------------|-------------|
| TypeError | Undefined/null values, missing imports |
| SyntaxError | Missing brackets, quotes, semicolons |
| ReferenceError | Typos, missing variable declarations |
| Network Error | URL, CORS, auth headers |
| Auth Error | Token expiry, permissions |

### Quick Checks

1. **Check logs first** - Often tells you the exact issue
2. **Recent changes** - `git diff HEAD~1`
3. **Dependencies** - Did a package update?
4. **Environment** - Are env vars set correctly?

## Output Format

```
## Debug Report

### Issue
[One sentence description]

### Root Cause
[What's causing the problem]

### Fix
[What changed and why]

### Verification
[How to confirm it's fixed]

### Prevention
[How to avoid this in the future]
```

## Efficiency Tips

- Don't read entire codebase
- Search for error message text
- Check git history for recent changes
- Use console.log strategically
- Isolate the problem first
