---
name: test-gen
description: Generate tests for existing code. Use when user asks to add tests, write tests, or increase test coverage. Focus on meaningful tests over coverage metrics.
---

# Test Generation Skill

Generate meaningful tests following project conventions.

## Trigger Phrases

- "add tests for this"
- "write unit tests"
- "increase test coverage"
- "test this function"

## Process

### 1. Analyze the Code
- What does it do?
- What are the inputs/outputs?
- What are the edge cases?
- What can fail?

### 2. Identify Test Cases

```typescript
describe('functionName', () => {
  // Happy path
  test('should return expected result for valid input', () => {});

  // Edge cases
  test('should handle empty input', () => {});
  test('should handle null/undefined', () => {});
  test('should handle boundary values', () => {});

  // Error cases
  test('should throw for invalid input', () => {});
  test('should handle errors gracefully', () => {});
});
```

### 3. Write Tests (AAA Pattern)

```typescript
test('should calculate total correctly', () => {
  // Arrange
  const items = [{ price: 10 }, { price: 20 }];

  // Act
  const result = calculateTotal(items);

  // Assert
  expect(result).toBe(30);
});
```

### 4. Run Tests
```bash
npm test -- --coverage
```

## Test Types

| Type | When to Use |
|------|-------------|
| Unit | Pure functions, utilities |
| Integration | API endpoints, DB queries |
| E2E | User flows |

## What to Test

- ✅ Business logic
- ✅ Edge cases
- ✅ Error handling
- ✅ Data transformations
- ❌ Third-party libraries
- ❌ Simple getters/setters

## Conventions

- File: `source.test.ts` next to source
- Name: `should [expected behavior] when [condition]`
- Mock external dependencies
- One assertion per test when possible

## Token Efficiency

- Don't read test framework docs
- Use project's existing test patterns
- Copy structure from existing tests
