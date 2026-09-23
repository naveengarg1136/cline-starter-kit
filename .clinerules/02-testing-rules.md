# Testing Rules

Testing is a critical part of software development. Every feature, bug fix, or refactor must be accompanied by appropriate tests. These rules define the testing standards for all projects using this Cline Starter Kit.

---

## Core Testing Principles

### Every New Feature Must Have Tests
- No feature is considered complete until it has test coverage.
- If a feature is added without tests, it will not be merged.

### Test Business Logic and Utilities
- Write unit tests for all functions that contain business logic, calculations, data transformations, or utility algorithms.
- Pure functions are the easiest to test — favor them.

### Test API Endpoints and Data Operations
- Write integration tests for API endpoints, database queries, and external service interactions.
- Use a separate test database or in-memory database (e.g., SQLite for testing) to avoid polluting production data.

### Mock External Dependencies — Not Internal Modules
- Mock external services (APIs, third-party SDKs, cloud services, email providers, payment gateways).
- **Do not mock** internal modules — test them through their real interface. Mocking internal modules hides bugs and makes tests fragile.

```typescript
// ✅ Good — mock the external API, test the internal function
jest.mock("axios");
import axios from "axios";
import { fetchUserData } from "@/services/user";

test("fetchUserData parses API response correctly", async () => {
  axios.get.mockResolvedValue({ data: { id: 1, name: "Alice" } });
  ...
});

// ❌ Bad — do not mock your own internal modules
jest.mock("@/services/user");
```

---

## Test File Naming and Location

| Language | Naming Convention | Example |
|---|---|---|
| JavaScript / TypeScript | `*.test.ts` / `*.test.tsx` / `*.spec.ts` | `user-service.test.ts` |
| Python | `*_test.py` | `user_service_test.py` |
| Go | `*_test.go` | `user_service_test.go` |
| Java (JUnit) | `*Test.java` | `UserServiceTest.java` |

### File Location
- Test files should live **alongside the source file** they test, following the same module structure.
- Example:
  ```
  src/
  ├── services/
  │   ├── user-service.ts
  │   └── user-service.test.ts
  ├── utils/
  │   ├── format-date.ts
  │   └── format-date.test.ts
  ```

---

## Test Structure

### Arrange-Act-Assert (AAA) Pattern

Structure every test using the AAA pattern:

```typescript
test("should return user profile when valid ID is provided", async () => {
  // Arrange
  const userId = 123;
  const expectedUser = { id: 123, name: "Alice" };
  mockApi.getUser.mockResolvedValue(expectedUser);

  // Act
  const result = await getUserProfile(userId);

  // Assert
  expect(result).toEqual(expectedUser);
  expect(mockApi.getUser).toHaveBeenCalledWith(userId);
});
```

1. **Arrange:** Set up inputs, mocks, and preconditions.
2. **Act:** Execute the function or action being tested.
3. **Assert:** Verify the expected outcome using assertions.

---

## Test Naming

### Descriptive Test Names
- Test names should describe the **expected behavior**, not the implementation.
- Use `should`, `it should`, or `when ... then ...` patterns.

```typescript
// ✅ Descriptive
test("should throw an error when userId is missing");
test("should format date as YYYY-MM-DD");
test("should return empty array when user has no posts");

// ❌ Vague
test("handles empty input");
test("formatDate works");
test("test getUser");
```

### Group Tests with `describe`
- Use `describe` blocks to group related tests logically.

```typescript
describe("formatDate", () => {
  test("should return formatted date in YYYY-MM-DD format", () => { ... });
  test("should throw an error for invalid date strings", () => { ... });
  test("should handle different time zones correctly", () => { ... });
});
```

---

## Test Coverage

### Aim for Meaningful Coverage, Not 100%
- Strive for thorough coverage of business-critical paths.
- It's better to have 80% meaningful coverage than 100% coverage with meaningless tests.
- Focus on testing edge cases, error paths, and boundary conditions.

### Edge Cases to Test
- Empty or null inputs
- Invalid or malformed inputs
- Boundary values (e.g., max/min, first/last item in a list)
- Concurrent or race conditions (where applicable)
- Authentication and authorization failures

---

## Test Categories

| Category | What to Test | Tools / Frameworks |
|---|---|---|
| Unit Tests | Functions, utilities, class methods | Jest, Vitest, Mocha, PyTest, JUnit, xUnit |
| Integration Tests | API endpoints, database queries, service interactions | Supertest, Cypress, PyTest, Postman/Newman |
| End-to-End (E2E) | Full user flows through the UI | Cypress, Playwright, Selenium |

---

## Test Data Management

### Use Fixtures or Factories
- Create reusable test data fixtures or factory functions to avoid hardcoding values everywhere.
- Example: `createTestUser()`, `mockApiResponse()`.

### Faker Libraries
- Use faker libraries (e.g., `@faker-js/faker`, `faker` for Python) to generate realistic test data.

### Database State
- Always clean up or reset database state between tests.
- Use `beforeEach`/`afterEach` hooks to set up and tear down test data.

---

## Running Tests

### Run Tests Before Completing Any Task
- All relevant tests must pass before a task is marked complete.
- Fix any failing tests before committing your changes.

### Continuous Integration
- Configure CI to run tests automatically on every PR and push to `main`.
- Fail the CI pipeline if any tests fail.

---

## Test Performance

- Tests should be fast — aim for sub-second individual test execution.
- Run unit tests in parallel where possible.
- Use `--watch` mode during development for rapid feedback.
