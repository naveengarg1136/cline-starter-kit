# Memory Bank System

> **INSTRUCTION:** At the start of EVERY task, you MUST read ALL files in the `memory-bank/` directory.

The Memory Bank is your persistent knowledge base for the project. It allows Cline (and you, the developer) to maintain context across sessions, keeping a record of the project's purpose, architecture, decisions, and progress.

---

## Memory Bank Structure

The `memory-bank/` directory contains the following files, each serving a distinct purpose:

| File | Purpose |
|---|---|
| `projectbrief.md` | The foundational summary — project name, core purpose, key goals, target users, and success metrics. |
| `productContext.md` | The "why" — problem statement, user personas, user stories, and feature overview. |
| `activeContext.md` | The "what now" — current focus, recent changes, open questions, and next steps. Updated most frequently. |
| `systemPatterns.md` | The "how" — architecture overview, design patterns, key technical decisions, and component relationships. |
| `techContext.md` | The "what it's built on" — tech stack, dependencies, development environment setup, and deployment process. |
| `progress.md` | The "how far we've come" — completed milestones, current status, known issues, and upcoming work. |

---

## What Belongs In Each File

### projectbrief.md
- **Project Name:** A clear, descriptive name for the project.
- **Core Purpose:** One to three sentences explaining what the project does.
- **Key Goals:** The primary objectives, listed as bullet points.
- **Target Users:** Who will use or benefit from this project.
- **Success Metrics:** How you'll measure success (e.g., performance targets, user adoption, feature completeness).

### productContext.md
- **Problem Statement:** What problem this project solves, ideally in one concise paragraph.
- **User Personas:** Brief profiles of your key user types (name, role, goals, pain points).
- **User Stories:** Short, specific stories written from the user's perspective ("As a [user], I want to [action] so that [benefit]").
- **Feature Overview:** A high-level list of planned and implemented features.

### activeContext.md
- **Current Focus:** What you're actively working on right now.
- **Recent Changes:** A log of the most recent modifications (last 5–10 items).
- **Open Questions:** Any decisions that need to be made or issues that need clarification.
- **Next Steps:** Immediate actions to take in the current or next session.

### systemPatterns.md
- **Architecture Overview:** A description of the overall architecture (e.g., monolith, microservices, client-server).
- **Design Patterns Used:** Any notable patterns (e.g., MVC, repository, factory, observer).
- **Key Technical Decisions:** Important choices and their rationale (e.g., why a particular library was chosen).
- **Component Relationships:** How different parts of the system interact (e.g., data flow, API boundaries).

### techContext.md
- **Tech Stack:** Primary languages, frameworks, and databases.
- **Dependencies:** Key third-party libraries and their purposes.
- **Development Environment Setup:** Steps to get the project running locally (install, configure, run).
- **Deployment Process:** How the project is built and deployed to production/staging.

### progress.md
- **Completed Milestones:** A list of major milestones that have been finished.
- **Current Status:** A summary of the project's current state (e.g., "In active development — 60% of MVP complete").
- **Known Issues:** Bugs, technical debt, or limitations that are currently open.
- **Upcoming Work:** Planned features, refactors, or improvements.

---

## When to Update Each File

| File | When to Update |
|---|---|
| `projectbrief.md` | Once at project inception. Update if goals change significantly. |
| `productContext.md` | Once at project inception. Update when user stories or personas change. |
| `activeContext.md` | **After every task** — update current focus, log recent changes, adjust next steps. |
| `systemPatterns.md` | After architectural or design decisions are made. Update when patterns change. |
| `techContext.md` | When dependencies, setup steps, or the tech stack are modified. |
| `progress.md` | After completing milestones. Track status changes and issues continuously. |

> **Rule:** If a file does not exist, create it with a basic template before proceeding. Never skip reading a file just because it may not exist — always check and create if missing.

---

## Initializing the Memory Bank for a New Project

If you are starting a new project and the `memory-bank/` directory is empty or contains only placeholder content:

1. **Open the `memory-bank/` directory** in your project.
2. **Read the existing template files** (they contain placeholder content with section headers).
3. **Fill in each file** with the relevant information for your project:
   - Use the section headers as a guide.
   - Replace placeholder text with actual project details.
   - Be concise but thorough — aim for 1–2 paragraphs per section.
4. **Save all files.**
5. The memory bank is now initialized and Cline will read it on every task.

> **Note:** You can also run the `setup-new-project.sh` or `setup-new-project.ps1` script to copy the template memory bank files into your project directory, then fill them in manually.

---

## Rules for Keeping Memory Bank Files

1. **Be concise but complete.** Avoid walls of text. Use bullet points, tables, and short paragraphs.
2. **Keep it current.** Regularly update files — especially `activeContext.md` and `progress.md`.
3. **Use clear language.** Avoid overly technical jargon unless it's specific to the project.
4. **Link decisions to outcomes.** In `systemPatterns.md` and `techContext.md`, explain *why* a decision was made, not just what was decided.
5. **Use consistent formatting.** Use Markdown headers, bullet points, and tables for readability.
6. **One topic per file.** Don't overload a single file with unrelated information.
7. **Reference, don't duplicate.** If information already exists in another memory bank file, link or summarize rather than rewrite.
8. **Version your context.** If a major decision changes the architecture, note the date and rationale in the relevant file.

---

## Memory Bank Maintenance Checklist

- [ ] Read ALL memory bank files at the start of EVERY task.
- [ ] Update `activeContext.md` after completing a feature or significant work.
- [ ] Update `progress.md` after reaching a milestone.
- [ ] Update `techContext.md` when adding or upgrading dependencies.
- [ ] Update `systemPatterns.md` when making architectural decisions.
- [ ] Keep entries concise (aim for readability within ~50 lines per file when possible).
