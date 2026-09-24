---
name: code-review
description: Perform a thorough code review of changes. Use when user asks for a review, check code quality, or analyze changes for issues, security vulnerabilities, or improvements.
---

# Code Review Skill

Systematic code review for quality, security, and best practices.

## Trigger Phrases

- "review the code"
- "check my changes"
- "code review this"
- "any issues with this code?"

## Review Checklist

### 1. Code Quality
- [ ] Follows naming conventions (camelCase, PascalCase, etc.)
- [ ] Functions under 50 lines
- [ ] No nested conditionals (use early returns)
- [ ] DRY principle followed
- [ ] Proper error handling

### 2. Security
- [ ] No hardcoded secrets or API keys
- [ ] Input validation with Zod/Joi
- [ ] Parameterized queries (no SQL injection)
- [ ] Proper authentication/authorization checks
- [ ] No sensitive data in logs

### 3. Performance
- [ ] No N+1 queries
- [ ] Efficient data structures
- [ ] Proper indexing (database)
- [ ] Caching where appropriate

### 4. Testing
- [ ] Unit tests for business logic
- [ ] Edge cases covered
- [ ] Tests are meaningful (not just coverage)

### 5. Documentation
- [ ] JSDoc for public functions
- [ ] Comments explain "why" not "what"
- [ ] README updated if needed

## Output Format

```
## Code Review Summary

### ✅ Passed
- [List of items that passed]

### ⚠️ Warnings
- [List of non-critical issues]

### ❌ Issues
- [List of critical issues that must be fixed]

### 💡 Suggestions
- [Optional improvements]

### Recommendation
[APPROVE / REQUEST CHANGES / BLOCK]
```

## Token Efficiency

- Focus on changed lines, not entire files
- Use `git diff` output
- Summarize findings, don't paste full code
