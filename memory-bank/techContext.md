# Tech Context Template

> **Purpose:** The "what it's built on" file. Documents the tech stack, dependencies, and how to set up and deploy the project.

---

## Tech Stack

- **AI Provider:** OpenRouter (multiple models via single API)
- **Router:** Omniroute for intelligent model selection
- **IDE:** VS Code with Cline extension
- **MCP Servers:** filesystem, memory, sequential-thinking, git, fetch
- **Language:** TypeScript 5.x
- **Runtime:** Node.js 20.x

---

## Key Dependencies

```
[List the most important libraries and their purposes.

 Example:
 - express: Web framework for building the API
 - cors: Enable/disable CORS for API routes
 - zod: Schema-based input validation
 - prisma: ORM for database interactions
 - jsonwebtoken: JWT creation and verification
 - bcrypt: Password hashing
 - winston: Structured logging
 - stripe: Payment processing integration
 - twilio: SMS notification service
 - axios: HTTP client for external API calls
 - dotenv: Environment variable loading
]
```

---

## Development Environment Setup

```
[Step-by-step instructions for setting up the project locally.

 Example:

 Prerequisites:
 - Node.js v20+ installed
 - PostgreSQL 15+ running locally
 - Redis running locally
 - Docker & Docker Compose (recommended)

 Steps:
 1. Clone the repository:
    git clone https://github.com/username/project-name.git
    cd project-name

 2. Install dependencies:
    npm install

 3. Copy environment file and configure:
    cp .env.example .env.local
    (fill in your local values)

 4. Start the database and cache (using Docker Compose):
    docker-compose up -d db redis

 5. Apply database migrations:
    npx prisma migrate dev

 6. Start the development server:
    npm run dev

 7. The API is now available at http://localhost:3000

 Optional: Use `npm run dev:watch` for auto-restart on file changes.
]
```

---

## Available Scripts

```
[List the npm/package.json scripts and their purpose.

 Example:
 - npm run dev          — Start the development server
 - npm run build        — Build the project for production
 - npm run start        — Start the production server
 - npm test             — Run all tests
 - npm run test:watch   — Run tests in watch mode
 - npm run test:coverage — Generate test coverage report
 - npm run lint         — Run ESLint
 - npm run format       — Format code with Prettier
 - npm run db:migrate   — Apply database migrations
 - npm run db:studio    — Open Prisma Studio
]
```

---

## Deployment Process

```
[Document the steps to deploy the project.

 Example:

 Environment Variables:
   Set the following in the deployment environment:
   - DATABASE_URL
   - REDIS_URL
   - JWT_SECRET
   - STRIPE_SECRET_KEY
   - TWILIO_AUTH_TOKEN

 Deployment Steps:
 1. Build the project:
    npm run build

 2. Build and push Docker image:
    docker build -t myorg/project-name:latest .
    docker push myorg/project-name:latest

 3. Deploy to the server:
    ssh deploy@server
    docker pull myorg/project-name:latest
    docker-compose -f docker-compose.prod.yml up -d

 4. Run pending migrations:
    npx prisma migrate deploy

 5. Verify the deployment:
    - Check health endpoint: curl https://api.project-name.com/health
    - Monitor logs: docker logs -f app
]
```

---

## Infrastructure (Optional)

```
[Document the infrastructure, if applicable.

 Example:
 - Cloud Provider: AWS
 - Compute: EC2 Auto Scaling Group (t3.medium)
 - Load Balancer: Application Load Balancer (HTTPS)
 - Database: RDS PostgreSQL (multi-AZ)
 - Cache: ElastiCache Redis
 - Storage: S3 (user uploads)
 - CDN: CloudFront
 - DNS: Route 53
 - Monitoring: CloudWatch, Sentry
]
```

---

## Environment Variables Reference

```
[Document all required and optional environment variables.

 Example:
 | Variable           | Required | Default | Description            |
 |---------------------|----------|---------|------------------------|
 | DATABASE_URL       | Yes      | -       | PostgreSQL connection string |
 | REDIS_URL          | Yes      | -       | Redis connection string |
 | JWT_SECRET         | Yes      | -       | Secret for signing JWTs |
 | PORT               | No       | 3000    | Server port |
 | NODE_ENV           | No       | development | Environment (dev/prod/test) |
 | LOG_LEVEL          | No       | info    | Logging level (error/warn/info/debug) |
]
```
