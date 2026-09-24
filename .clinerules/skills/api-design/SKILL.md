---
name: api-design
description: Design REST APIs with proper conventions. Use when user asks to create, design, or implement an API endpoint, REST API, or API routes. Focus on OpenAPI-compatible designs.
---

# API Design Skill

Design RESTful APIs following OpenAPI and project conventions.

## Trigger Phrases

- "create an API endpoint"
- "design a REST API"
- "implement API routes"
- "add an endpoint"

## Process

### 1. Define the Resource
- What resource does this API manage?
- What operations are needed? (CRUD)
- What's the URL structure?

### 2. Design Endpoints

| Method | Path | Purpose |
|--------|------|---------|
| GET | /resources | List resources |
| GET | /resources/:id | Get single resource |
| POST | /resources | Create resource |
| PUT | /resources/:id | Replace resource |
| PATCH | /resources/:id | Update resource |
| DELETE | /resources/:id | Delete resource |

### 3. Define Request/Response Schema

Use Zod for validation:
```typescript
const createResourceSchema = z.object({
  name: z.string().min(1),
  description: z.string().optional(),
});
```

### 4. Response Envelope
```typescript
{
  "data": { ... },
  "meta": { "page": 1, "total": 100 },
  "error": null
}
```

### 5. Error Responses
- 400 Bad Request - Invalid input
- 401 Unauthorized - Missing auth
- 403 Forbidden - No permission
- 404 Not Found - Resource missing
- 500 Internal Server Error - Server error

## Conventions

- Use kebab-case for URLs: `/user-profiles`
- Version APIs: `/api/v1/...`
- Use plural nouns: `/users` not `/user`
- Nest related resources: `/users/:id/posts`
- Filter via query params: `/users?status=active`

## Documentation

After implementation:
- Add endpoint to techContext.md
- Document request/response in API docs
- Add tests for each endpoint
