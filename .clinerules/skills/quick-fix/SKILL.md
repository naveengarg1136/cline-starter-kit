---
name: quick-fix
description: Fast bug fixes and small changes. Use when user reports a bug, error, or asks for a quick fix. Optimized for speed over thoroughness.
---

# Quick Fix Skill

Rapid bug fixing and small corrections optimized for speed.

## Trigger Phrases

- "fix this bug"
- "quick fix for"
- "this is broken"
- "error when I"
- "small change"

## Process

### 1. Identify the Issue
- Read error message or user description
- Locate relevant code (search, not full read)
- Understand the expected vs actual behavior

### 2. Minimal Fix
- Change only what's necessary
- Don't refactor surrounding code
- Don't add features

### 3. Verify
- Run tests if available
- Check for related issues
- Ensure fix doesn't break other functionality

### 4. Document
- Update activeContext.md with fix
- Add comment if non-obvious

## Rules

1. **Scope Limitation** - Fix only the reported issue
2. **No Refactoring** - Don't improve surrounding code
3. **Preserve Behavior** - Don't change existing functionality
4. **Test Fix** - Verify the fix works before declaring done

## Common Fix Patterns

### Null/Undefined Errors
```typescript
// Before
const value = obj.prop.nested;

// After
const value = obj?.prop?.nested;
```

### Type Errors
```typescript
// Before
function process(data) { ... }

// After
function process(data: unknown) {
  if (!isValid(data)) throw new Error("Invalid data");
  ...
}
```

### Off-by-One Errors
```typescript
// Before
for (let i = 0; i <= arr.length; i++)

// After
for (let i = 0; i < arr.length; i++)
```

## Efficiency

- Search for error message in codebase
- Read only the file with the error
- Make the smallest possible change
- Run minimal verification
