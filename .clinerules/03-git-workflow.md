# Git Workflow

This document defines the Git workflow, commit conventions, branching strategy, and pull request guidelines for all projects using this Cline Starter Kit.

---

## Commit Conventions

We follow [Conventional Commits](https://www.conventionalcommits.org/) for all commit messages. This ensures a clear, consistent history and enables automated tooling (changelogs, semantic versioning).

### Commit Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer]
```

### Commit Types

| Type | When to Use | Example |
|---|---|---|
| `feat` | A new feature | `feat(auth): add password reset email` |
| `fix` | A bug fix | `fix(api): handle timeout in user list endpoint` |
| `docs` | Documentation changes only | `docs(readme): add setup instructions` |
| `style` | Changes that do not affect logic (formatting, whitespace, semicolons) | `style(components): reformat Button component` |
| `refactor` | Code restructuring, no behavior change | `refactor(store): extract user slice to its own file` |
| `test` | Adding or fixing tests | `test(user-service): add missing edge case tests` |
| `chore` | Maintenance tasks, tooling, CI config | `chore(deps): bump eslint to v9.0.0` |
| `perf` | Performance improvements | `perf(parser): improve regex performance by 30%` |
| `build` | Build system, external dependencies | `build(webpack): update webpack config` |
| `ci` | CI configuration changes | `ci(workflow): add caching to test jobs` |
| `revert` | Reverts a previous commit | `revert: revert "feat(api): add experimental endpoint"` |

### Additional Commit Rules

- **Write in imperative mood:** Use "Add feature" not "Added feature" or "Adds feature."
  - ✅ `feat(auth): add login page`
  - ❌ `feat(auth): added login page`
- **Limit the first line to 72 characters or fewer.**
- **Cap the body at 72 characters per line.**
- **Reference issues in the footer using a keyword.**
  ```
  fix(auth): handle expired tokens gracefully

  Previously, expired tokens caused a silent redirect loop.
  Now, users are redirected to the login page with an
  informative message.

  Closes #123
  Fixes PROJ-456
  ```

---

## Branching Strategy

### Branch Naming Convention

Use descriptive branch names with the following format:

```
<type>/<short-description>
```

| Branch Type | Purpose | Example |
|---|---|---|
| `feature/desc` | New feature development | `feature/user-authentication` |
| `fix/desc` | Bug fixes | `fix/login-redirect-loop` |
| `hotfix/desc` | Urgent production fixes | `hotfix/critical-security-patch` |
| `refactor/desc` | Code refactoring | `refactor/extract-api-client` |
| `docs/desc` | Documentation updates | `docs/update-readme` |
| `chore/desc` | Maintenance tasks | `chore/update-dependencies` |

### Branch Creation Guidelines

- **Always branch from `main`** (or `develop` if using Git Flow) for new work.
- **Never commit directly to `main`.** All changes must go through a pull request.
- **Keep branches focused** — one branch, one feature or fix.
- **Use short, descriptive names** — avoid generic names like `patch-1` or `fix`.

### Branch Cleanup

- Delete branches after they are merged to keep the repository clean.
- Most Git hosts (GitHub, GitLab, Bitbucket) can auto-delete branches on merge.

---

## Pull Request Workflow

### Before Creating a PR

1. **Run all tests** — ensure every test passes.
2. **Run the linter and formatter** — ensure code is clean and consistent.
3. **Squash your commits** (if multiple) into clear, atomic commits using `git rebase`.
4. **Ensure your branch is up to date** with the target branch (`main` or `develop`).

### PR Requirements

- **PR title should match the primary commit's Conventional Commit format.**
- **PR description must include:**
  - A clear summary of what this PR does.
  - The problem it solves (if a bug fix).
  - Any breaking changes (if applicable).
  - Screenshots or steps to reproduce (for UI changes).
  - Linked issue(s) (e.g., `Closes #123`).

### PR Review Guidelines

- **Keep PRs focused and small** — ideally under 400 lines of diff.
- **Review promptly** — reviewers should respond within 24 hours.
- **No self-merges** — all PRs must be approved by at least one other team member.
- **Resolve all review comments** before merging.

---

## Merging

### Merge Methods

| Method | When to Use | Description |
|---|---|---|
| **Squash and Merge** | Most PRs | Combines all commits into one clean commit on `main`. Keeps history linear. |
| **Rebase and Merge** | When commit history is already clean | Applies commits on top of the target branch without a merge commit. |
| **Merge Commit** | Rare — for large features | Creates a explicit merge commit. Preserves full history but adds clutter. |

> **Default:** Use **Squash and Merge** for all PRs. Use **Merge Commit** only when explicitly required (e.g., for long-running features that need to track sub-commits).

---

## Tagging and Releasing

- **Use semantic versioning** (e.g., `v1.2.3`).
- **Create a tag at the point of release.**
- **Release on the `main` branch** via a GitHub Release.
- **Never tag `develop`, feature, or hotfix branches.**

---

## Daily Workflow Cheatsheet

```bash
# 1. Ensure your local main is up to date
git checkout main
git pull origin main

# 2. Create a new feature branch
git checkout -b feature/my-new-feature

# 3. Do your work, commit frequently
git add .
git commit -m "feat(api): add my new endpoint"

# 4. Push your branch
git push -u origin feature/my-new-feature

# 5. Create a PR on GitHub — review, address feedback

# 6. After merge, clean up
git checkout main
git pull origin main
git branch -d feature/my-new-feature
```

---

## Conflict Resolution

- **Always resolve conflicts on your local branch** before requesting review.
- **Prefer `git rebase` over `git merge`** to keep history linear.
- When in doubt, ask for help during code review rather than making assumptions.
