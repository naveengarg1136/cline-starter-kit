# Cline Starter Kit

A comprehensive starter kit template repository containing optimized Cline configuration, rules, memory bank structure, and helper scripts. Use this as a foundation for all your future Cline-powered projects.

---

## Table of Contents

- [What Is This?](#what-is-this)
- [Quick Start](#quick-start)
- [Using as a GitHub Template](#using-as-a-github-template)
- [Setting Up Existing Projects](#setting-up-existing-projects)
- [Folder Structure](#folder-structure)
- [Memory Bank System](#memory-bank-system)
- [Cline Rules](#cline-rules)
- [Updating the Kit](#updating-the-kit)
- [License](#license)

---

## What Is This?

The **Cline Starter Kit** is a pre-configured repository template that gives you everything you need to start coding with [Cline](https://cline.bot) — the AI coding assistant that works right in your editor.

Inside, you'll find:

- **Cline Rules (`.clinerules/`)** — Standardized instructions that guide Cline's behavior across coding standards, testing, git workflow, security, and memory bank usage.
- **Memory Bank Templates (`memory-bank/`)** — A structured set of Markdown files that help Cline maintain context and project knowledge across sessions.
- **MCP Settings (`mcp-settings/`)** — A template configuration for Model Context Protocol servers (filesystem, git, fetch, browser, etc.).
- **Helper Scripts (`scripts/`)** — Bash and PowerShell scripts to quickly set up new projects with your Cline configuration.
- **Ignore Files** — `.gitignore` and `.clineignore` to keep your projects clean and secure.

---

## Quick Start

1. **Create a new repository from this template** (see [Using as a GitHub Template](#using-as-a-github-template)).
2. **Open the project in VS Code** with the Cline extension installed.
3. **Customize the memory bank files** to describe your project.
4. **Update the MCP settings** in `mcp-settings/cline_mcp_settings.json`.
5. **Start coding!** Cline will automatically read `.clinerules/` and `memory-bank/` on every task.

---

## Using as a GitHub Template

This repository is designed to be used as a **GitHub Template Repository**. This means you can create new repositories pre-populated with all these files in one click.

### Steps:

1. Go to the repository on GitHub.
2. Click the green **"Code"** button, then select the **"Use this template"** tab.
3. Choose **"Create a new repository"** (or "Open in a Codespace" if you prefer).
4. Select the owner and name for your new repository.
5. Choose whether the new repository should be **public** or **private**.
6. Click **"Create repository from template"**.
7. Clone your new repository locally:
   ```bash
   git clone https://github.com/<your-username>/<your-new-repo>.git
   cd <your-new-repo>
   ```
8. Open the project in VS Code, install the Cline extension, and start using it immediately.

> **Tip:** Because this is a template repository, you can update it over time. Just make changes to this repo and re-export or copy updated files to existing projects. See [Updating the Kit](#updating-the-kit) for details.

---

## Setting Up Existing Projects

Already have a project? You can copy just the parts you need using the helper scripts.

### Bash (macOS / Linux):

```bash
bash /path/to/starter-kit/scripts/setup-new-project.sh /path/to/your/project
```

### PowerShell (Windows):

```powershell
powershell -File /path/to/starter-kit/scripts/setup-new-project.ps1 -TargetDir /path/to/your/project
```

If no target directory is provided, the script defaults to the **current working directory**.

The scripts will copy:

- `.clinerules/` — All Cline rule files
- `memory-bank/` — All memory bank templates (you'll update these for your project)
- `.clineignore` — Cline ignore patterns
- `mcp-settings/cline_mcp_settings.json` — MCP configuration (⚠️ **you'll need to update file paths inside**)

After running the script, review the copied files and customize them for your project.

---

## Folder Structure

```
Cline-Starter-Kit/
├── README.md                    # This file
├── .gitignore                   # Standard ignore patterns for Node.js, Python, etc.
├── .clineignore                 # Cline-specific ignore patterns
├── .clinerules/                 # Cline behavioral rules (read by Cline on every task)
│   ├── 00-memory-bank.md        # Instructions for the Memory Bank system
│   ├── 01-coding-standards.md   # Naming, structure, and code quality standards
│   ├── 02-testing-rules.md      # Testing requirements and conventions
│   ├── 03-git-workflow.md       # Git commit, branch, and PR conventions
│   └── 04-security-rules.md     # Security best practices
├── memory-bank/                 # Project context files (templates)
│   ├── projectbrief.md          # Project purpose, goals, and success metrics
│   ├── productContext.md        # Problem statement, user personas, feature overview
│   ├── activeContext.md         # Current focus, recent changes, next steps
│   ├── systemPatterns.md        # Architecture, design patterns, technical decisions
│   ├── techContext.md           # Tech stack, dependencies, environment setup
│   └── progress.md              # Completed milestones, known issues, upcoming work
├── mcp-settings/                # MCP server configurations
│   └── cline_mcp_settings.json  # JSON config for filesystem, git, fetch, browser MCP servers
└── scripts/                     # Helper scripts for setup
    ├── setup-new-project.sh     # Bash setup script (macOS/Linux)
    └── setup-new-project.ps1    # PowerShell setup script (Windows)
```

### What Each Folder Does

| Folder | Purpose |
|---|---|
| `.clinerules/` | Contains Markdown files that Cline reads automatically at the start of every task. These act as persistent instructions. |
| `memory-bank/` | A structured knowledge base for your project. Cline reads these files to maintain context across sessions. |
| `mcp-settings/` | Configuration files for Model Context Protocol servers that extend Cline's capabilities (filesystem access, git operations, web fetching, etc.). |
| `scripts/` | Helper scripts to bootstrap new projects with your Cline configuration. |

---

## Memory Bank System

The **Memory Bank** is a critical component of this starter kit. It's a structured set of Markdown files that provide persistent context for Cline.

### File Purposes

| File | Purpose |
|---|---|
| `projectbrief.md` | The foundational summary of the project — its name, purpose, goals, users, and success metrics. |
| `productContext.md` | The "why" — problem statement, user personas, and user stories that drive the project. |
| `activeContext.md` | The "what's happening now" — current focus, recent changes, open questions, and next steps. |
| `systemPatterns.md` | The "how it works" — architecture, design patterns, and key technical decisions. |
| `techContext.md` | The "what it's built on" — tech stack, dependencies, and development environment setup. |
| `progress.md` | The "what's done and what's next" — completed milestones, known issues, and upcoming work. |

### How Cline Uses the Memory Bank

> **Important:** Cline's `.clinerules/00-memory-bank.md` file contains the instruction: *"At the start of EVERY task, you MUST read ALL files in the memory-bank/ directory."*

This ensures Cline always has full context about your project before taking any action.

### Initializing the Memory Bank for New Projects

When starting a new project from this template, the memory bank files contain placeholder content. You should:

1. Open each file in the `memory-bank/` directory.
2. Replace the placeholder content with your project's actual information.
3. Keep entries concise but complete — focus on the most important details.

Cline will update these files as it works on your project (when properly configured).

---

## Cline Rules

The `.clinerules/` directory contains numbered Markdown files (ordered by priority) that provide instructions to Cline:

| File | Topic |
|---|---|
| `00-memory-bank.md` | How and when to use the Memory Bank system |
| `01-coding-standards.md` | Naming conventions, file structure, code quality |
| `02-testing-rules.md` | Testing requirements and conventions |
| `03-git-workflow.md` | Commit conventions, branching, and PR etiquette |
| `04-security-rules.md` | Security best practices and guidelines |

Cline reads all files in `.clinerules/` automatically. The numeric prefix ensures they're loaded in the intended order.

---

## Updating the Kit

This starter kit is designed to evolve. Here's how to keep it up to date:

### Updating This Template Repository

1. Make your changes to any file in this repository.
2. Commit and push to the template repository (usually `main` branch).
3. The updated version will be available for all new projects created from this template.

### Syncing Updates to Existing Projects

Since GitHub template repositories don't automatically sync updates to existing projects, you have a few options:

- **Manual Copy:** Copy updated files from this starter kit into your project directory.
- **Git Subtree/Submodule:** (Advanced) Add this starter kit as a submodule or subtree, allowing you to merge updates.
- **Re-run Scripts:** Use the setup scripts to copy updated files (they overwrite existing files).

> **Recommendation:** If you want automatic updates, consider forking this repository instead of using it as a template. You can then rebase your project-specific changes on top of starter kit updates.

---

## License

This starter kit is provided as a resource for the Cline community. You're free to use, modify, and distribute it as you see fit. No warranty is provided.

---

*Made with ❤️ for the Cline community.*
