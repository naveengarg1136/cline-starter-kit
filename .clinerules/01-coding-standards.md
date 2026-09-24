# Coding Standards

These coding standards apply to all projects built with this Cline Starter Kit. Following them ensures consistency, readability, and maintainability across codebases.

---

## Naming Conventions

| Type | Convention | Example |
|---|---|---|
| Variables | `camelCase` | `const userName = "Alice"` |
| Functions / Methods | `camelCase` | `function calculateTotal(items) { ... }` |
| Classes / Constructors | `PascalCase` | `class UserAccount { ... }` |
| React Components | `PascalCase` | `function UserProfile() { ... }` |
| Constants | `SCREAMING_SNAKE_CASE` | `const MAX_RETRY_ATTEMPTS = 3` |
| Boolean variables | `camelCase` (prefixed with `is`, `has`, `can`, `should`) | `const isLoading = true`, `const hasPermission = false` |
| Enums | `PascalCase` (members in `SCREAMING_SNAKE_CASE`) | `enum UserRole { ADMIN = "admin", EDITOR = "editor" }` |
| Interfaces (TypeScript) | `PascalCase` (prefixed with `I` is discouraged; prefer no prefix) | `interface User { name: string }` |
| Types / Type aliases | `PascalCase` | `type ApiResponse<T> = ...` |
| Hooks (React) | `camelCase`, prefixed with `use` | `function useFetchData() { ... }` |
| Event handlers | `camelCase`, prefixed with `handle` | `function handleButtonClick() { ... }` |

> **Note:** If the project uses a specific language (e.g., Python, Go, Rust), follow the community conventions for that language while keeping the spirit of these rules (consistency, clarity, descriptiveness).

---

## File Naming Conventions

| File Type | Convention | Example |
|---|---|---|
| General source files | `kebab-case` | `user-service.ts`, `data-processor.py` |
| React components | `kebab-case` for filename, `PascalCase` for component name | `user-profile.tsx` containing `UserProfile` |
| Test files | Same as source, with `.test` or `_test` suffix | `user-service.test.ts`, `user_service_test.py` |
| Configuration files | `kebab-case` or as per tool convention | `eslint.config.js`, `pyproject.toml` |
| Utility / helper files | `kebab-case` | `format-date.ts`, `validation-helpers.py` |

> **Rule:** File names should be descriptive and indicate the file's purpose. Avoid names like `utils.ts` or `helpers.py` — prefer `auth-utils.ts`, `date-helpers.py`.

---

## Code Organization Principles

### Single Responsibility Principle (SRP)
- Every function, class, or module should have **one clear purpose**.
- If a function grows beyond its core responsibility, split it into smaller, composable functions.

### DRY — Don't Repeat Yourself
- Extract repeated logic into reusable functions, hooks, or utilities.
- Avoid copy-pasting code; if you find yourself typing the same thing twice, refactor.

### Separation of Concerns
- **UI components** should not contain business logic.
- **Business logic** should be in services, hooks, or separate modules.
- **Data fetching** should be centralized (e.g., in API clients or service layers).
- **Configuration** should be externalized (environment variables, config files).

### Module Structure (Example)
```
src/
├── components/    # Reusable UI components
├── hooks/         # Custom React hooks
├── services/      # API clients and data-fetching logic
├── stores/        # State management (if applicable)
├── utils/         # Pure utility/helper functions
├── types/         # TypeScript type definitions
├── styles/        # Global styles, themes, design tokens
├── assets/        # Images, icons, fonts
├── pages/ or app/ # Route-level components (if applicable)
└── App.tsx        # Root component
```

---

## Comment Guidelines

### Explain "Why", Not "What"
- ✅ Good: `// Using a Set to deduplicate IDs before fetching`
- ❌ Avoid: `// Create a new Set from the array` (obvious from the code)

### JSDoc for Public Functions
- All exported functions, classes, and methods must have JSDoc (or language-appropriate docstring) comments.
- Include `@param`, `@returns`, and `@throws` (as applicable).

```typescript
/**
 * Fetches user data from the API.
 * @param userId - The unique identifier of the user.
 * @param options - Optional fetch configuration.
 * @returns A promise that resolves to the user data.
 * @throws {NotFoundError} if the user does not exist.
 */
export async function fetchUser(userId: number, options?: RequestInit): Promise<User> {
  ...
}
```

### Inline Comments
- Use inline comments sparingly — only to clarify non-obvious logic.
- Remove or update comments that are no longer accurate.
- TODO and FIXME comments should include a clear description and (optionally) an issue tracker link.

---

## Error Handling Patterns

### Always Handle Errors Explicitly
- Never let exceptions go unhandled. Use `try/catch` blocks where errors are expected (e.g., API calls, file I/O).
- If an error is caught and intentionally ignored, add a comment explaining why.

### Never Swallow Exceptions Silently
```typescript
// ❌ Bad
try {
  riskyOperation();
} catch (e) {
  // silently ignored
}

// ✅ Good
try {
  riskyOperation();
} catch (error) {
  console.error("Failed to perform risky operation:", error);
  // Re-throw, provide a fallback, or handle gracefully
}
```

### Use Specific Error Types
- Create custom error classes for domain-specific failures (e.g., `ValidationError`, `AuthenticationError`).
- Include relevant context (e.g., which field failed validation).

### Graceful Degradation
- When a dependency fails, provide a fallback or degrade gracefully rather than crashing.
- Log errors with enough context for debugging but never log sensitive data.

---

## Import Ordering

Imports must follow this order (with blank lines between groups):

1. **External libraries** (e.g., `react`, `lodash`, `axios`)
2. **Internal modules / services** (e.g., `src/services/auth`, `src/utils/date`)
3. **Relative imports** (e.g., `../components/Button`, `./styles`)

```typescript
// 1. External libraries
import React, { useState, useEffect } from "react";
import _ from "lodash";
import axios from "axios";

// 2. Internal modules
import { authService } from "@/services/auth";
import { formatDate } from "@/utils/date";

// 3. Relative imports
import { Button } from "../components/Button";
import "./styles.css";
```

> **Rule:** Keep import lists alphabetized within each group. Tools like `eslint-plugin-import` or `isort` (Python) can enforce this automatically.

---

## Function Length and Structure

### Maximum Function Length
- **Aim for functions under 50 lines.** If a function exceeds this, consider breaking it down.
- If a function is complex, extract parts into well-named helper functions.

### Early Returns Over Nested Conditionals
```typescript
// ❌ Nested
function processUser(user: User): string {
  if (user) {
    if (user.isActive) {
      if (user.permissions.includes("admin")) {
        return "Admin panel";
      } else {
        return "User dashboard";
      }
    }
  }
  return "Access denied";
}

// ✅ Early returns
function processUser(user?: User): string {
  if (!user) return "Access denied";
  if (!user.isActive) return "Access denied";
  if (user.permissions.includes("admin")) return "Admin panel";
  return "User dashboard";
}
```

### Pure Functions Preference
- Prefer pure functions (no side effects) for business logic and utilities.
- Impure functions (e.g., I/O, network calls) should be clearly separated and named as such.

---

## Code Formatting

- Use a formatter (e.g., Prettier for JavaScript/TypeScript, `black` for Python).
- Use a linter (e.g., ESLint, `ruff`, `pylint`) and fix all warnings.
- Maintain consistent indentation (2 spaces for JS/TS, 4 spaces for Python).
- Use semicolons in JavaScript/TypeScript (unless the project explicitly omits them with a formatter rule).
- Use double quotes for strings (configurable, but be consistent).

---

## Output Discipline

- Return only what completes the task. No long preambles or task restatements.
- Summarize noisy output. Do not paste raw logs, full test outputs, or stack traces unless requested.
- Prefer minimal patches over full-file rewrites.
- When explaining, be concise. Code first, explanation second.
