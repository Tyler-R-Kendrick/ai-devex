# GitHub Spec Kit (specify-cli) v0.0.79+ Guidance

When working with GitHub Spec Kit (specify-cli) v0.0.79+:

## Current Recommended Version
- Use: v0.0.79+ (Latest from main branch)
- Installation: `uv tool install specify-cli --from git+https://github.com/github/spec-kit.git`
- Type: Python CLI tool (NOT an npm package)
- Pin to: Git URL in project documentation

## Primary Use Cases
GitHub Spec Kit is best used for:
1. Spec-Driven Development (SDD) - specifications as primary artifacts that generate code
2. Transforming natural language requirements into working implementations using AI agents
3. Maintaining synchronization between specifications and code
4. Orchestrating multiple specification types (PRDs, TRDs, OpenAPI, Gherkin)
5. Generating implementation plans from technology-agnostic requirements

## Core Philosophy: Spec-Driven Development (SDD)

Spec Kit inverts traditional development workflows:
- **Traditional:** Code first → Generate specs after (specs become stale)
- **Spec-Driven:** Specifications first → Generate code from specs (specs stay current)

Key Principles:
- Specifications are living documents that evolve with code
- AI agents transform specs into implementations
- Continuous validation ensures spec-code consistency
- One feature = one branch = one spec

## Slash Commands Workflow

### Required Command Order

Use slash commands in this sequence for best results:

```
1. /speckit.constitution  (ALWAYS START HERE - defines project principles)
2. /speckit.specify       (what to build - technology-agnostic)
3. /speckit.clarify       (optional - resolve ambiguities before planning)
4. /speckit.plan          (how to build - technical implementation)
5. /speckit.tasks         (actionable task breakdown)
6. /speckit.implement     (execute all tasks)
7. /speckit.analyze       (periodic consistency checks)
8. /speckit.checklist     (generate requirement validation tests)
```

### Command Details

#### `/speckit.constitution` - Project Principles (FIRST STEP)
**Purpose:** Establish project-wide principles, constraints, and standards

**When to use:** At the very start of every project, before any other spec work

**Generates:** Project constitution document

**Example use:**
```
/speckit.constitution
Create a constitution for an e-commerce platform with:
- Security-first approach for payment data
- WCAG 2.1 AA accessibility compliance
- Mobile-first responsive design
- API-first architecture
```

**Best Practice:** Define clear, measurable principles
**Avoid:** Vague principles like "be fast" - use "API responses under 200ms p95"

---

#### `/speckit.specify` - Define Requirements (SECOND STEP)
**Purpose:** Create technology-agnostic Product Requirements Document (PRD)

**When to use:** After constitution, when defining what to build

**Generates:** `spec.md` (PRD)

**Example use:**
```
/speckit.specify
Build a user authentication system with:
- Email/password login
- OAuth 2.0 social login (Google, GitHub)
- Password reset via email
- Session management
- Success criteria: 99.9% uptime, <500ms login time
```

**Best Practice:** Keep technology-agnostic, focus on WHAT not HOW
```markdown
✅ DO: "User login persists across browser sessions"
❌ DON'T: "Use JWT tokens in localStorage with Express sessions"
```

**Avoid:** Mentioning specific frameworks, libraries, or implementation details

---

#### `/speckit.clarify` - Resolve Ambiguities (OPTIONAL)
**Purpose:** Ask clarifying questions about requirements before implementation planning

**When to use:** When spec.md has ambiguities, before running /speckit.plan

**Example use:**
```
/speckit.clarify
Questions about the authentication spec:
- Should session timeout be configurable per user?
- What's the rate limit for login attempts?
- Do we need multi-factor authentication?
```

**Best Practice:** Use this to resolve ambiguities proactively
**Avoid:** Skipping this when requirements are unclear - saves rework later

---

#### `/speckit.plan` - Technical Implementation Plan (THIRD STEP)
**Purpose:** Create Technical Requirements Document (TRD) with implementation details

**When to use:** After spec.md is complete and clarified

**Generates:** `plan.md` (TRD)

**Example output includes:**
- Technology stack selection (framework, database, etc.)
- Architecture diagram and component breakdown
- API endpoint definitions
- Data model schemas
- Security implementation approach
- Testing strategy

**Best Practice:** Plan should bridge spec's WHAT to implementation's HOW
```markdown
Spec (technology-agnostic): "User login persists across sessions"
Plan (technology-specific): "Implement using JWT with Redis session store"
```

**Avoid:** Creating plan before spec is finalized - leads to misalignment

---

#### `/speckit.tasks` - Task Breakdown (FOURTH STEP)
**Purpose:** Generate actionable task list from plan.md

**When to use:** After plan.md is complete, before implementation

**Generates:** Task files with specific implementation steps

**Example tasks:**
```
1. Set up database schema for users table
2. Implement password hashing with bcrypt
3. Create POST /api/auth/login endpoint
4. Add OAuth 2.0 provider integration
5. Write unit tests for authentication service
```

**Best Practice:** Tasks should be small, testable, and independent
**Avoid:** Vague tasks like "implement authentication" - break down further

---

#### `/speckit.implement` - Execute Tasks (FIFTH STEP)
**Purpose:** AI-driven implementation of all tasks from /speckit.tasks

**When to use:** After tasks are generated and reviewed

**Generates:** Working code implementing the specification

**Best Practice:** Review generated code for:
- Security vulnerabilities
- Test coverage
- Code quality standards
- Alignment with constitution and spec

**Avoid:** Blindly accepting generated code - always review critically

---

#### `/speckit.analyze` - Consistency Check (ONGOING)
**Purpose:** Validate alignment across all specification artifacts

**When to use:** 
- After implementation
- Before merging features
- Periodically during development
- When specifications change

**Checks for:**
- Spec-to-implementation alignment
- Plan-to-code consistency
- API spec matches implementation
- Data model matches database schema
- Tests cover specification requirements

**Best Practice:** Run this regularly, not just at the end
```bash
# Good practice: run after major changes
/speckit.implement
# ... code generated ...
/speckit.analyze  # Check consistency immediately
```

**Avoid:** Only checking consistency at PR time - catch drift early

---

#### `/speckit.checklist` - Validation Tests (FINAL STEP)
**Purpose:** Generate acceptance criteria and validation tests

**When to use:** After implementation to validate requirements are met

**Generates:** Test checklist based on spec.md success criteria

**Example checklist:**
```markdown
- [ ] User can log in with email/password
- [ ] Login persists across browser sessions
- [ ] Invalid credentials show error message
- [ ] Password reset email sends within 30 seconds
- [ ] API response time < 500ms for p95
```

**Best Practice:** Use generated checklist for manual QA and acceptance testing
**Avoid:** Treating this as the only testing - complement with automated tests

## Generated Artifacts Structure

Spec Kit generates and maintains these files:

```
project/
├── spec.md                    # PRD from /speckit.specify (technology-agnostic)
├── plan.md                    # TRD from /speckit.plan (technology-specific)
├── contracts/
│   └── api-spec.json         # OpenAPI specification
├── data-model.md             # Database schemas and data structures
├── quickstart.md             # Gherkin feature scenarios
└── .speckit/
    └── tasks/                # Task breakdown from /speckit.tasks
```

### Artifact Relationships

```
Constitution (principles)
    ↓
Spec.md (WHAT - technology-agnostic requirements)
    ↓
Plan.md (HOW - technical design)
    ↓         ↓              ↓
API Spec  Data Model  Feature Scenarios
    ↓         ↓              ↓
    Implementation Code
         ↓
    Validation Tests
```

## Installation and Setup

### Prerequisites
- Python 3.8+ installed
- uv package manager: `pip install uv` or `curl -LsSf https://astral.sh/uv/install.sh | sh`

### Installation
```bash
# Install spec-kit as a uv tool
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git

# Verify installation
specify --version  # Should show v0.0.79+
```

### Configuration
Spec Kit works with GitHub Copilot slash commands in VS Code or GitHub.com:
- No additional configuration needed
- Commands available in Copilot chat interface
- Works in any repository with slash command support

## Recommended Usage Patterns

### Pattern 1: New Feature Development
For adding a new feature to existing project:

```bash
# 1. Create feature branch
git checkout -b feature/user-notifications

# 2. Define requirements (technology-agnostic)
/speckit.specify
Create a real-time notification system for users with:
- In-app notification center
- Email notifications for critical events
- Notification preferences per user
- Mark as read/unread functionality
- Success criteria: notifications delivered within 5 seconds

# 3. Clarify ambiguities if needed
/speckit.clarify
- What email service should we use?
- Should notifications be stored permanently or expire?
- Do we need push notifications for mobile?

# 4. Create technical plan
/speckit.plan

# 5. Generate tasks
/speckit.tasks

# 6. Implement
/speckit.implement

# 7. Validate consistency
/speckit.analyze

# 8. Generate acceptance tests
/speckit.checklist
```

**Best Practice:** One feature per branch with its own spec.md
**Avoid:** Multiple features in one spec - keeps changes focused

---

### Pattern 2: New Project Setup
For starting a new project from scratch:

```bash
# 1. Initialize repository
mkdir my-project && cd my-project
git init

# 2. Establish project principles FIRST
/speckit.constitution
Create constitution for a SaaS product with:
- Cloud-native architecture (containerized, scalable)
- Security: SOC 2 Type II compliance
- Performance: API p99 < 500ms
- Observability: Structured logging, distributed tracing
- Testing: 80%+ code coverage

# 3. Define initial requirements
/speckit.specify
Build MVP with user management and subscription billing

# 4. Create implementation plan
/speckit.plan

# 5-8. Continue with tasks, implement, analyze, checklist
```

**Best Practice:** Constitution establishes constraints for all future specs
**Avoid:** Starting without constitution - leads to inconsistent decisions

---

### Pattern 3: Refactoring with Spec Kit
For bringing existing code under spec-driven development:

```bash
# 1. Document existing system
/speckit.specify
Document the existing authentication system:
- Current: Session-based auth with cookies
- Supports: Email/password, remember me
- Issues: Sessions not distributed, no OAuth

# 2. Define desired state
/speckit.specify
Enhance authentication to support:
- Distributed session storage
- OAuth 2.0 providers
- JWT tokens for API access
- Backward compatibility with existing sessions

# 3. Create migration plan
/speckit.plan

# 4. Execute with validation
/speckit.tasks
/speckit.implement
/speckit.analyze  # Ensures new implementation meets spec
```

**Best Practice:** Use /speckit.analyze to validate refactoring meets requirements
**Avoid:** Refactoring without spec - loses track of requirements

## Integration with Specifications

Spec Kit orchestrates multiple specification types:

### PRD (Product Requirements Document)
- **Generated by:** `/speckit.specify`
- **File:** `spec.md`
- **Purpose:** WHAT to build (technology-agnostic)
- **Contains:** User stories, success criteria, functional requirements
- **Technology mentions:** ❌ None - stay agnostic

### TRD (Technical Requirements Document)
- **Generated by:** `/speckit.plan`
- **File:** `plan.md`
- **Purpose:** HOW to build (technology-specific)
- **Contains:** Architecture, tech stack, API design, data models
- **Technology mentions:** ✅ Specific frameworks, databases, services

### OpenAPI Specification
- **Generated in:** `contracts/api-spec.json`
- **Purpose:** API contract definition
- **Contains:** Endpoints, request/response schemas, authentication
- **Use:** API documentation, client generation, contract testing

### Data Models
- **Generated as:** `data-model.md`
- **Purpose:** Database schema and data structure definitions
- **Contains:** Tables, fields, relationships, constraints
- **Use:** Database migrations, ORM configuration

### Gherkin Features
- **Generated in:** `quickstart.md`
- **Purpose:** Behavior-driven feature scenarios
- **Contains:** Given-When-Then test scenarios
- **Use:** Acceptance testing, behavior documentation

## Best Practices

### Constitution Guidelines
```markdown
✅ DO: Make principles specific and measurable
"API responses must be under 200ms at p95"

❌ DON'T: Use vague principles
"The system should be fast"
```

### Specification Guidelines
```markdown
✅ DO: Focus on user outcomes and success criteria
"Users can complete checkout in under 60 seconds"

❌ DON'T: Prescribe implementation details
"Use React hooks and Redux for state management"
```

### Technology Agnostic Specifications
In `spec.md`, describe WHAT, not HOW:

```markdown
✅ GOOD spec.md (technology-agnostic):
"The system must authenticate users and maintain session state 
across multiple devices. Sessions should expire after 30 days 
of inactivity."

❌ BAD spec.md (technology-specific):
"Implement JWT authentication with Express.js middleware, storing 
tokens in Redis with 30-day TTL using ioredis client."
```

Technology decisions belong in `plan.md`, not `spec.md`.

### Living Documents
Specs evolve with your code:

```bash
# Feature request changes requirements
# 1. Update spec.md first
/speckit.specify
Update authentication to add biometric support

# 2. Regenerate plan
/speckit.plan

# 3. Update tasks and implement
/speckit.tasks
/speckit.implement

# 4. Validate consistency
/speckit.analyze  # Ensures all artifacts still align
```

**Best Practice:** Spec changes trigger plan/code updates
**Avoid:** Updating code without updating spec - leads to drift

### Version Control
```bash
✅ DO: Commit all spec artifacts to git
git add spec.md plan.md contracts/ data-model.md quickstart.md
git commit -m "Add user notification feature spec"

✅ DO: Review spec changes in PRs
# Reviewers see both spec and implementation changes

❌ DON'T: Gitignore spec files
# Specs are primary artifacts, must be versioned
```

## Common Pitfalls to Avoid

### ❌ DON'T: Skip the Constitution Step
```bash
# Bad: Start with /speckit.specify immediately
/speckit.specify  # Without constitution

# Good: Always start with constitution
/speckit.constitution
# ... define principles ...
/speckit.specify
```
**Why:** Constitution provides constraints and principles that guide all future specs

---

### ❌ DON'T: Mention Specific Frameworks in spec.md
```markdown
# Bad spec.md:
"Build a REST API using Express.js with MongoDB and JWT authentication"

# Good spec.md:
"Build a REST API for user management that authenticates users 
and persists data reliably with 99.9% uptime"
```
**Why:** Technology choices should be in plan.md, allowing flexibility to change stack without rewriting requirements

---

### ❌ DON'T: Try to Install via npm
```bash
# Wrong:
npm install specify-cli  # Package doesn't exist

# Correct:
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
```
**Why:** Spec Kit is a Python tool, not a Node.js package

---

### ❌ DON'T: Create Plan Before Clarifying Requirements
```bash
# Bad: Unclear spec → immediate planning
/speckit.specify
# ... vague requirements ...
/speckit.plan  # Will make assumptions

# Good: Clarify first
/speckit.specify
# ... requirements ...
/speckit.clarify  # Resolve ambiguities
# ... answer questions ...
/speckit.plan  # Now plan with clarity
```
**Why:** Planning on unclear requirements leads to rework and misalignment

---

### ❌ DON'T: Skip Periodic /speckit.analyze
```bash
# Bad: Only check at the end
/speckit.implement
# ... weeks of development ...
/speckit.analyze  # Discovers major drift

# Good: Check regularly
/speckit.implement task-1
/speckit.analyze  # Check after each major milestone
/speckit.implement task-2
/speckit.analyze  # Catch drift early
```
**Why:** Early detection of spec-code drift is easier to fix

---

### ❌ DON'T: Multiple Features in One Spec
```bash
# Bad: Monolithic spec
/speckit.specify
Build authentication, notifications, billing, and admin panel

# Good: Focused specs per feature
git checkout -b feature/authentication
/speckit.specify
Build authentication system

git checkout -b feature/notifications
/speckit.specify
Build notification system
```
**Why:** Focused specs are easier to review, test, and maintain

---

### ❌ DON'T: Ignore Generated Artifacts
```bash
# Bad: Only keep spec.md
git add spec.md
# Ignore plan.md, contracts/, data-model.md

# Good: Track all artifacts
git add spec.md plan.md contracts/ data-model.md quickstart.md
```
**Why:** All artifacts form complete specification that validates together

## Workflow Integration

### With CI/CD
```yaml
# .github/workflows/spec-validation.yml
name: Spec Validation
on: [pull_request]

jobs:
  validate-spec:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install uv
        run: pip install uv
      - name: Install spec-kit
        run: uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
      - name: Analyze spec-code consistency
        run: specify analyze
```

**Best Practice:** Automate spec validation in CI
**Avoid:** Manual-only validation - easy to forget

### With Code Reviews
```markdown
# PR Template
## Specification Changes
- [ ] spec.md updated with new requirements
- [ ] plan.md reflects technical approach
- [ ] /speckit.analyze passes
- [ ] /speckit.checklist items verified

## Implementation
- [ ] Code matches plan.md
- [ ] Tests cover spec.md success criteria
- [ ] API changes reflected in contracts/api-spec.json
```

**Best Practice:** Review specs and code together
**Avoid:** Reviewing code without checking spec alignment

## Security Best Practices

### Specification Security
```markdown
✅ DO: Include security requirements in spec.md
"User passwords must be hashed with industry-standard algorithms"
"API must rate-limit requests to prevent abuse"
"PII must be encrypted at rest"

✅ DO: Define security in constitution
"All data transmission must use TLS 1.3+"
"Follow OWASP Top 10 guidelines"
```

### Implementation Security
- Review generated code for security vulnerabilities
- Ensure sensitive data is not logged or exposed
- Validate authentication and authorization logic
- Check for injection vulnerabilities (SQL, XSS, etc.)

### Artifact Security
```bash
✅ DO: Review generated OpenAPI specs for exposure
# Check contracts/api-spec.json for sensitive endpoints

❌ DON'T: Commit secrets in spec files
# No API keys, passwords, or tokens in spec.md or plan.md
```

## Troubleshooting

### Issue: Slash commands not working
**Symptom:** `/speckit.specify` does nothing in Copilot chat

**Solutions:**
1. Ensure you're using GitHub Copilot Chat (VS Code extension or GitHub.com)
2. Verify spec-kit is installed: `specify --version`
3. Check that you're in a git repository
4. Restart VS Code or refresh GitHub.com

---

### Issue: Generated code doesn't match spec
**Symptom:** `/speckit.implement` produces incorrect implementation

**Solutions:**
1. Run `/speckit.analyze` to identify misalignment
2. Check that plan.md correctly interprets spec.md
3. Clarify ambiguous requirements with `/speckit.clarify`
4. Regenerate plan: `/speckit.plan`

---

### Issue: Spec artifacts out of sync
**Symptom:** `spec.md` and `plan.md` contradict each other

**Solutions:**
1. Run `/speckit.analyze` to detect inconsistencies
2. Update spec.md first, then regenerate plan.md
3. Use version control to track when divergence occurred
4. Establish practice of updating spec before code

## Migration from Traditional Development

### From Code-First to Spec-Driven

**Step 1: Document current state**
```bash
/speckit.specify
Document existing authentication system:
- Email/password login
- Session-based state management
- Password reset functionality
```

**Step 2: Create constitution for future work**
```bash
/speckit.constitution
Establish principles for all new features:
- API-first design
- Mobile responsive
- 80% test coverage
```

**Step 3: New features use full SDD workflow**
```bash
# All new work follows spec-driven approach
/speckit.constitution
/speckit.specify
/speckit.plan
/speckit.tasks
/speckit.implement
```

**Best Practice:** Start with constitution + spec for new features, gradually document existing features

## Resources

- **GitHub Spec Kit Repository:** https://github.com/github/spec-kit
- **Installation Tool (uv):** https://github.com/astral-sh/uv
- **Spec-Driven Development Principles:** See repository documentation
- **OpenAPI Specification:** https://spec.openapis.org/oas/latest.html
- **Gherkin Reference:** https://cucumber.io/docs/gherkin/reference/

## Quick Reference Card

```
WORKFLOW ORDER:
1. /speckit.constitution → Define project principles (FIRST!)
2. /speckit.specify      → What to build (technology-agnostic)
3. /speckit.clarify      → Resolve ambiguities (optional)
4. /speckit.plan         → How to build (technology-specific)
5. /speckit.tasks        → Break down into tasks
6. /speckit.implement    → Generate code
7. /speckit.analyze      → Validate consistency (run often!)
8. /speckit.checklist    → Acceptance criteria

REMEMBER:
✅ One feature = one branch = one spec
✅ spec.md = WHAT (no tech specifics)
✅ plan.md = HOW (with tech stack)
✅ Always start with constitution
✅ Keep specs in version control
✅ Run /speckit.analyze regularly

AVOID:
❌ Frameworks in spec.md
❌ Skipping constitution
❌ npm install (use uv tool install)
❌ Multiple features per spec
❌ Only checking consistency at the end
```

---

*Last Updated: 2025-11-08*
*Based on: GitHub Spec Kit v0.0.79+*
*Tool Type: Python CLI for Spec-Driven Development*
*Security Status: Active development - verify latest version before use*
