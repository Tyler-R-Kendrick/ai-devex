# AI Agent Development Guidelines

This document provides guidelines for AI agents working on this project to ensure consistency and best practices.

## GitHub Copilot Integration

This repository is designed to work with both **GitHub Copilot Coding Agent** and **GitHub Copilot Agent Mode**.

### GitHub Copilot Coding Agent

The GitHub Copilot Coding Agent is an autonomous agent that can execute multi-step tasks by:
- Reading and analyzing code
- Making file changes
- Running commands
- Committing changes
- Using custom agents with handoff patterns

**Usage in this repository:**
```
# Invoke custom agents through Coding Agent
@modernization-planner Create a migration strategy for our monolith

# Agents hand off to each other automatically using YAML handoffs
@spec-generator Generate API specification (can hand off to adr-generator)
```

### GitHub Copilot Agent Mode

GitHub Copilot Agent Mode provides conversational AI assistance with:
- Code suggestions and completions
- Explanation and documentation
- Question answering
- Custom agent interactions

**Usage in this repository:**
```
# Chat with agents for guidance
@architect What pattern should I use for this microservice?

# Get specification help
@spec-generator What should be in my PRD for this feature?

# Research assistance
@research What are best practices for event-driven architecture?
```

### Custom Agent Availability

All 15 custom agents in `.github/agents/` are available in both modes:
- **Coding Agent**: Full autonomous execution with handoffs
- **Agent Mode**: Conversational guidance and suggestions

### Agent Handoff Pattern

Agents use official GitHub Copilot handoff patterns (YAML frontmatter):
```yaml
---
name: agent-name
handoffs:
  - label: Next Step
    agent: other-agent
    prompt: What to pass to next agent
---
```

This enables:
- Multi-agent workflows with control points
- Explicit collaboration between agents
- Guided task decomposition
- User approval at handoff points

## Command Line Interface

**Preference: PowerShell Core**

When suggesting or executing CLI commands, always prefer PowerShell Core over other shells. This ensures cross-platform compatibility and consistency across Windows, macOS, and Linux.

### Examples

✅ **Preferred:**
```powershell
# PowerShell Core commands
dotnet build
dotnet test
dotnet user-secrets set GitHubModels:Token YOUR-TOKEN
Get-ChildItem -Recurse -Filter "*.cs"
```

❌ **Avoid:**
```bash
# Bash-specific commands
find . -name "*.cs"
ls -la
```

## Development Environment

### Dev Container Synchronization

When making changes to the development environment (dependencies, tools, configurations), ensure that the same changes are applied to the dev container configuration.

**Key principle:** Keep the dev container in sync with the development environment to ensure consistency for all developers.

### Changes that require dev container updates:
- Adding or updating package dependencies
- Installing new tools or CLI utilities
- Changing runtime versions or SDKs
- Modifying environment variables or configurations

## Project Scaffolding and File Creation

**Preference: Built-in and Community Standard Tools**

Always prefer using built-in or community-standard tools for project scaffolding and file creation over manual file generation.

### Examples

✅ **Preferred:**
```powershell
# Use dotnet CLI for .NET projects
dotnet new classlib -n MyLibrary
dotnet new console -n MyApp
dotnet new gitignore

# Use npm/yarn for Node.js projects
npm init
npm create vite@latest

# Use cargo for Rust projects
cargo new myapp
```

❌ **Avoid:**
```powershell
# Manually creating project files
New-Item -Path "MyProject.csproj" -ItemType File
# Then manually editing the csproj file
```

### Benefits:
- Ensures correct project structure
- Includes all necessary boilerplate
- Follows community best practices
- Reduces errors and inconsistencies

## Documenting User Corrections

When a user provides corrections or clarifications, document them in a standardized format to inform future interactions.

### Format:

```markdown
## User Clarification

**Date:** YYYY-MM-DD
**Context:** [Brief description of the situation]
**Original Understanding:** [What was initially understood or assumed]
**Correction:** [What the user clarified]
**Impact:** [How this affects the project or future work]
```

### Example:

```markdown
## User Clarification

**Date:** 2025-11-08
**Context:** CLI command preferences for the project
**Original Understanding:** Bash commands were acceptable for cross-platform development
**Correction:** PowerShell Core is the preferred shell for all CLI commands in this project
**Impact:** All documentation and examples should use PowerShell Core syntax. Dev container should include PowerShell Core.
```

## Project-Specific Guidelines

### This Project (AI Chat with Custom Data)

This is an AI chat application built with:
- **Framework:** ASP.NET Core (.NET 9.0)
- **AI Provider:** GitHub Models (via OpenAI API)
- **Vector Store:** Custom JSON-based implementation
- **Database:** SQLite (for ingestion cache)
- **UI:** Blazor Server with Razor Components

### Key Configuration

The application requires a GitHub personal access token:
```powershell
dotnet user-secrets set GitHubModels:Token YOUR-TOKEN
```

### Common Commands

```powershell
# Build the project
dotnet build

# Run the application
dotnet run --project ChatApp

# Add a new package
dotnet add ChatApp package PackageName

# Create user secrets
dotnet user-secrets init --project ChatApp
dotnet user-secrets set Key Value --project ChatApp
```

## Best Practices

1. **Minimal Changes:** Make the smallest possible changes to achieve the goal
2. **Existing Patterns:** Follow existing code patterns and conventions in the repository
3. **Testing:** Validate changes with existing test infrastructure
4. **Documentation:** Update relevant documentation when making changes
5. **Security:** Never commit secrets or sensitive data to source control
6. **Dependencies:** Check for vulnerabilities when adding new dependencies

## Specification-Driven Development

### GitHub Spec Kit

This repository leverages **GitHub Spec Kit** for Spec-Driven Development (SDD) - a methodology where specifications are executable artifacts that generate code.

**Installation:**
```powershell
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
```

**SDD Workflow:**
```powershell
# 1. Define project principles (first time only)
/speckit.constitution

# 2. Specify WHAT to build (technology-agnostic)
/speckit.specify

# 3. Clarify ambiguities (optional)
/speckit.clarify

# 4. Plan HOW to implement (technology-specific)
/speckit.plan

# 5. Break down into tasks
/speckit.tasks

# 6. Generate implementation
/speckit.implement

# 7. Validate quality
/speckit.analyze
/speckit.checklist
```

**Key Principles:**
- Keep `spec.md` technology-agnostic (problems, not solutions)
- Make success criteria measurable
- Let specifications drive implementation
- Maintain bidirectional sync between specs and code

**Resources:**
- Comprehensive guide: `copilot-instructions/github-spec-kit.md`
- Spec-generator integration: `.github/agents/spec-generator.md`

### Integration with Custom Agents

Spec Kit complements the custom agents:
- **spec-generator**: Generates formal specifications (PRDs, BRDs, TRDs) that Spec Kit can use
- **knowledge-generator**: Collaborates with Spec Kit's `/speckit.clarify` to resolve ambiguities
- **architect**: Provides patterns that inform `/speckit.plan` decisions
- **adr-generator**: Documents architectural decisions made during `/speckit.plan`

Use Spec Kit when you want AI to generate implementation from specs. Use custom agents when you need expert guidance, analysis, or documentation.

## References

- [.NET CLI Documentation](https://learn.microsoft.com/en-us/dotnet/core/tools/)
- [PowerShell Core Documentation](https://learn.microsoft.com/en-us/powershell/)
- [ASP.NET Core Documentation](https://learn.microsoft.com/en-us/aspnet/core/)
