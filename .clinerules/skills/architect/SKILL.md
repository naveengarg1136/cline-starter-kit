---
name: architect
description: Design and plan features or architecture. Use when user asks to design, plan, architect, or structure a feature. Focus on design decisions before implementation.
---

# Architect Skill

Design and planning for features, systems, and architecture.

## Trigger Phrases

- "design a feature"
- "plan the architecture"
- "how should I structure"
- "architect a solution"
- "what's the best approach"

## Process

### 1. Understand Requirements
- What problem does this solve?
- Who are the users?
- What are the constraints?
- What's the timeline?

### 2. Explore Options
- List 2-3 approaches
- Compare trade-offs
- Consider team expertise
- Consider maintenance cost

### 3. Recommend Approach
- Explain rationale
- Identify risks
- Define success criteria

### 4. Document Decisions
- Update systemPatterns.md
- Update techContext.md if new dependencies
- Record decision in activeContext.md

## Output Format

```markdown
## Architecture Proposal

### Problem
[1-2 sentences]

### Options Considered

#### Option A: [Name]
- Pros: ...
- Cons: ...
- Complexity: Low/Medium/High

#### Option B: [Name]
- Pros: ...
- Cons: ...
- Complexity: Low/Medium/High

### Recommendation
[Option X] because [rationale]

### Implementation Steps
1. ...
2. ...
3. ...

### Risks & Mitigations
- Risk: ... → Mitigation: ...

### Dependencies
- [List any new packages or services needed]
```

## Design Principles

1. **YAGNI** - Don't build what you don't need
2. **KISS** - Keep it simple
3. **SOLID** - Single responsibility, open/closed, etc.
4. **12-Factor App** - For cloud-native applications

## Documentation Updates

After design is approved:
- Add patterns to systemPatterns.md
- Add dependencies to techContext.md
- Update progress.md with new milestone

## Token Efficiency

- Don't read implementation files
- Focus on interfaces and contracts
- Use diagrams sparingly
- Reference existing patterns
