# AI Agent Development Guidelines

This document provides guidelines for AI agents working on this project to ensure consistency and best practices.

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

## References

- [.NET CLI Documentation](https://learn.microsoft.com/en-us/dotnet/core/tools/)
- [PowerShell Core Documentation](https://learn.microsoft.com/en-us/powershell/)
- [ASP.NET Core Documentation](https://learn.microsoft.com/en-us/aspnet/core/)
