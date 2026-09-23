# Security Rules

Security is paramount. These rules apply to all aspects of development, from code writing to deployment. Violating these rules can lead to data breaches, compromised systems, and loss of user trust.

---

## Secrets and Credentials Management

### Never Hardcode Secrets
- **Never** hardcode API keys, passwords, tokens, or other secrets in source code.
- If you accidentally commit a secret, **rotate it immediately** and remove it from history.

```typescript
// ❌ Bad
const API_KEY = "sk-abc123xyz"; // Never do this!

// ✅ Good
const API_KEY = process.env.API_KEY;
```

### Environment Variables for Sensitive Data
- Store all sensitive configuration in environment variables.
- Use `.env` files for local development (these are in `.gitignore`).
- Use a secrets manager (e.g., AWS Secrets Manager, HashiCorp Vault) in production.

### .env Files
- Never commit `.env` files to version control.
- Provide a `.env.example` template with all required keys (values replaced with placeholders).
- Document all environment variables in the README.

```
# .env.example

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/mydb

# API Keys
API_KEY=your_api_key_here
SECRET_TOKEN=your_secret_token_here

# Authentication
JWT_SECRET=your_jwt_secret_here
SESSION_SECRET=your_session_secret_here
```

### .gitignore Must Include
```
.env
.env.local
.env.*.local
```

---

## Input Validation & Sanitization

### Validate All User Inputs
- Treat **all** user input as untrusted.
- Validate input at the entry point (API route, form handler).
- Use validation libraries (e.g., Zod, Joi, Yup) to enforce schemas.

```typescript
// ✅ Good — validate with Zod
import { z } from "zod";

const userSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
  age: z.number().int().min(0).max(150),
});

const result = userSchema.safeParse(req.body);
if (!result.success) {
  return res.status(400).json({ error: "Invalid input" });
}
```

### Sanitize for Output
- When rendering user input in HTML, always escape or sanitize to prevent XSS.
- When building SQL queries, use parameterized queries (never string concatenation).

---

## Database Security

### Use Parameterized Queries
- **Never** concatenate user input into SQL strings.
- Always use parameterized queries / prepared statements.

```typescript
// ❌ Bad — SQL injection risk
const query = `SELECT * FROM users WHERE id = ${userId}`;
await db.query(query);

// ✅ Good — parameterized query
const query = "SELECT * FROM users WHERE id = $1";
await db.query(query, [userId]);
```

### Principle of Least Privilege
- Database users should have the minimum permissions needed.
- Separate read-only and write access where possible.
- Never use `root` or `admin` database accounts in application code.

### Encrypt Sensitive Data at Rest
- Encrypt sensitive fields (e.g., PII, payment data) in the database.
- Never store passwords in plain text — always hash with bcrypt, scrypt, or Argon2.

---

## Authentication & Authorization

### Authentication
- Implement strong authentication mechanisms (OAuth 2.0, OpenID Connect, SSO).
- Enforce password policies (minimum length, complexity).
- Implement account lockout after repeated failed attempts.
- Use multi-factor authentication (MFA) where possible.
- Store passwords only as secure hashes (bcrypt, scrypt, Argon2).

### Authorization
- Implement proper access control checks on every protected endpoint.
- Use role-based (RBAC) or attribute-based (ABAC) authorization.
- Never trust client-side role checks — always verify on the server.
- Return `403 Forbidden` (not `404 Not Found`) when a user is authenticated but unauthorized.

### Session Security
- Use secure, `HttpOnly`, `SameSite=Strict` cookies for sessions.
- Set short session timeouts with refresh token rotation.
- Implement CSRF protection for state-changing operations.

---

## Dependency Security

### Keep Dependencies Updated
- Regularly update dependencies to patch known vulnerabilities.
- Use automated tools (e.g., Dependabot, Renovate) to manage updates.
- Review changelogs before upgrading major versions.

### Audit Dependencies
- Run `npm audit`, `yarn audit`, `pip-audit`, or `safety` in CI pipelines.
- Address all critical and high-severity vulnerabilities before merging.
- Pin dependencies to specific versions where security is critical.

### Review Third-Party Code
- Audit new dependencies before adding them — check their security posture, community activity, and license.
- Prefer dependencies from trusted sources and active maintainers.

---

## Logging & Monitoring

### Never Log Sensitive Information
- Do not log passwords, tokens, API keys, session IDs, PII, or credit card numbers.
- If debugging is needed, use structured logging with redaction.

```typescript
// ❌ Bad
console.log("User login:", { email, password }); // Password is logged!

// ✅ Good
logger.info("User login attempt", { email, success: true });
```

### Log Security Events
- Log authentication attempts (success and failure).
- Log authorization failures.
- Log input validation errors.
- Log system errors and exceptions with stack traces.

### Monitor and Alert
- Set up monitoring and alerting for security-relevant events.
- Watch for unusual patterns (e.g., brute-force login attempts, privilege escalation).

---

## Network & Communication Security

### Use HTTPS Everywhere
- All external communications must use HTTPS/TLS.
- Enforce HTTPS with HSTS (HTTP Strict Transport Security) headers.
- Redirect all HTTP traffic to HTTPS.

### CORS (Cross-Origin Resource Sharing)
- Configure CORS properly — restrict origins to known, trusted domains.
- Never use wildcard (`*`) origins when credentials are involved.

### Security Headers
Set the following headers in all HTTP responses:
- `Content-Security-Policy` (CSP)
- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: DENY` (or `SAMEORIGIN`)
- `Strict-Transport-Security`
- `X-XSS-Protection: 1; mode=block`

---

## OWASP Top 10 Compliance

These rules align with the [OWASP Top 10](https://owasp.org/www-project-top-ten/) security risks:

| OWASP Risk | How We Mitigate |
|---|---|
| A01: Broken Access Control | Enforce server-side authorization checks |
| A02: Cryptographic Failures | Use HTTPS, encrypt data at rest, hash passwords |
| A03: Injection | Parameterized queries, input validation/sanitization |
| A04: Insecure Design | Follow secure design principles, threat modeling |
| A05: Security Misconfiguration | Harden configurations, remove debug info in production |
| A06: Vulnerable & Outdated Components | Regular dependency updates and audits |
| A07: Identity & Authentication Failures | Strong auth, MFA, session management |
| A08: Data Integrity Failures | Sign and verify integrity of data (e.g., JWTs, payloads) |
| A09: Security Logging & Monitoring Failures | Comprehensive, redacted logging |
| A10: SSRF | Validate and sanitize URLs for outbound requests |

---

## Secure Coding Checklist

Before submitting code for review or deployment, verify:

- [ ] No secrets, keys, or passwords in source code
- [ ] All user inputs are validated and sanitized
- [ ] Database queries use parameterized statements
- [ ] Authentication and authorization checks are in place
- [ ] Dependencies are up to date and free of known vulnerabilities
- [ ] No sensitive information in logs
- [ ] HTTPS/TLS is used for all communications
- [ ] Security headers are configured
- [ ] Error messages do not leak stack traces or internal details
- [ ] Rate limiting is implemented for sensitive endpoints
- [ ] CSRF protection is in place for state-changing operations
