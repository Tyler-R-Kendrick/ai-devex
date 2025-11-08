# AI DevEx - AI-Driven Developer Experience Tools

A comprehensive toolkit for AI-powered software development, modernization, and specification-driven development featuring 15 specialized GitHub Copilot agents and integration with GitHub Spec Kit.

## Overview

This repository provides:
- **15 Custom GitHub Copilot Agents** for comprehensive code modernization
- **Specification-Driven Development** workflow with GitHub Spec Kit integration
- **AI Chat Application** demonstrating custom data integration
- **VS Code Workspace with MCP Servers** for enhanced GitHub Copilot Chat
- **Development Environment** with pre-configured dev container

## 🤖 GitHub Copilot Agents

The repository includes 15 specialized agents designed for both **GitHub Copilot Coding Agent** and **GitHub Copilot Agent Mode**. These agents work together to provide end-to-end support for modernization projects.

### Agent Categories

#### Modernization Orchestration (3 agents)
- **modernization-legacy-modeler** - Analyze and model legacy systems
- **modernization-desired-state-modeler** - Define target architecture
- **modernization-planner** - Create migration strategies and roadmaps

#### Knowledge Management (3 agents)
- **knowledge-modeler** - Design knowledge structures and storage
- **knowledge-retriever** - Search and surface relevant information
- **knowledge-generator** - Create documentation through collaboration

#### Specification & Documentation (6 agents)
- **spec-generator** - Generate formal specifications (PRDs, BRDs, TRDs, OpenAPI, Gherkin)
- **adr-generator** - Create Architecture Decision Records
- **tool-documentation** - Manage tool knowledge and Copilot instructions
- **deps-documentation** - Manage dependency knowledge and security
- **copilot-instructions** - Generate Copilot instruction prompts
- **prompt-engineer** - Apply prompt engineering best practices

#### Architecture & Technical Guidance (3 agents)
- **architect** - Provide architecture patterns and migration paths
- **research** - Conduct research with quality evaluation
- **setup-planner** - Analyze tools and plan installation

### Using the Agents

#### In GitHub Copilot Chat (VS Code, GitHub.com, etc.)
```
@modernization-planner Create a migration strategy from our PHP monolith to microservices
```

#### In GitHub Copilot Coding Agent
The agents are available through GitHub Copilot's coding agent interface with handoff patterns for multi-agent workflows.

**Learn more**: See [.github/agents/README.md](.github/agents/README.md) for detailed documentation.

## 📋 Specification-Driven Development

This repository demonstrates **Spec-Driven Development (SDD)** using GitHub Spec Kit - a methodology where specifications are executable artifacts that generate code, not just documentation.

### What is Spec-Driven Development?

Traditional development treats code as truth and specs as documentation. SDD inverts this:
- **Specifications** become the primary artifact
- **Code** serves specifications
- **AI agents** generate implementations from specs
- **Continuous validation** keeps specs and code synchronized

### GitHub Spec Kit

[GitHub Spec Kit](https://github.com/github/spec-kit) is a Python CLI toolkit that implements SDD workflows:

```bash
# Install
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git

# Initialize project
specify init my-project --ai copilot

# SDD Workflow
./speckit.constitution  # Define project principles
./speckit.specify       # Define WHAT to build
./speckit.plan          # Define HOW to implement
./speckit.tasks         # Break down into tasks
./speckit.implement     # Generate code
```

**Learn more**: See [copilot-instructions/github-spec-kit.md](copilot-instructions/github-spec-kit.md) for comprehensive guidance.

## 🖥️ VS Code Workspace with MCP Servers

This repository includes a pre-configured VS Code workspace with three Model Context Protocol (MCP) servers for enhanced GitHub Copilot Chat capabilities:

### 🎭 Playwright MCP Server
Browser automation, web scraping, and UI testing capabilities.

### 🐙 GitHub MCP Server  
Access GitHub repositories, issues, PRs, and code search directly through Copilot Chat.

### 📚 Microsoft Docs MCP Server
Query Microsoft Learn and official documentation for .NET, Azure, and more.

### Quick Start with Workspace

```powershell
# Open the workspace
code ai-devex.code-workspace

# Configure GitHub token for MCP
$env:GITHUB_TOKEN = "ghp_your_token"

# Start using MCP servers in Copilot Chat
# Examples:
# - Using Playwright, navigate to example.com and take a screenshot
# - Using GitHub, show me recent issues in this repository
# - Using Microsoft Docs, explain ASP.NET Core middleware
```

**Learn more**: See [WORKSPACE.md](WORKSPACE.md) and [QUICKSTART.md](QUICKSTART.md) for detailed documentation.

## 💬 AI Chat Application

The `ChatApp` directory contains a sample AI chat application built with:
- **Framework**: ASP.NET Core (.NET 9.0)
- **AI Provider**: GitHub Models (via OpenAI API)
- **Vector Store**: Custom JSON-based implementation
- **Database**: SQLite (for ingestion cache)
- **UI**: Blazor Server with Razor Components

### Running the Chat App

```powershell
# Set up GitHub Models token
dotnet user-secrets set GitHubModels:Token YOUR-TOKEN --project ChatApp

# Build and run
dotnet build
dotnet run --project ChatApp
```

**Learn more**: See [ChatApp/README.md](ChatApp/README.md)

## 🐳 Development Environment

### Dev Container

The repository includes a fully-featured dev container with:
- **Base**: Microsoft Universal Image
- **Features**: Docker-in-Docker, Azure Developer CLI, GitHub CLI, PowerShell Core, .NET 10
- **Extensions**: GitHub Copilot, AI Toolkit, Prompty, Markdown Lint
- **Tools**: uv (Python), .NET Aspire CLI, GitHub Spec Kit

#### Using with GitHub Codespaces
1. Click "Code" → "Create codespace on main"
2. Wait for container initialization
3. All tools pre-installed and ready

#### Using with VS Code Dev Containers
1. Install [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. Open repository in VS Code
3. Press F1 → "Dev Containers: Reopen in Container"

**Learn more**: See [.devcontainer/README.md](.devcontainer/README.md)

## 📚 Documentation

### For Developers
- **[agents.md](agents.md)** - AI agent development guidelines
- **[.github/agents/](/.github/agents/)** - Agent documentation and architecture
- **[copilot-instructions/](copilot-instructions/)** - GitHub Copilot instruction prompts
- **[WORKSPACE.md](WORKSPACE.md)** - VS Code workspace and MCP server documentation
- **[QUICKSTART.md](QUICKSTART.md)** - Quick reference for workspace and MCP servers

### For Agents (AI)
- **[.github/agents/QUICK_REFERENCE.md](.github/agents/QUICK_REFERENCE.md)** - Quick reference for agents
- **[.github/agents/ARCHITECTURE.md](.github/agents/ARCHITECTURE.md)** - System architecture

## 🚀 Quick Start

### For Code Modernization
```bash
# Clone repository
git clone https://github.com/Tyler-R-Kendrick/ai-devex.git
cd ai-devex

# Open in Codespaces or Dev Container

# Start modernization workflow
@modernization-planner Analyze our legacy system and create migration plan
```

### For Specification-Driven Development
```bash
# Install Spec Kit
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git

# Create new project
specify init my-feature --ai copilot

# Follow SDD workflow
./speckit.constitution
./speckit.specify
./speckit.plan
./speckit.tasks
./speckit.implement
```

### For AI Chat Development
```powershell
# Set up GitHub Models token
dotnet user-secrets set GitHubModels:Token YOUR-TOKEN --project ChatApp

# Run application
dotnet run --project ChatApp
```

### For Enhanced Copilot Chat with MCP Servers
```powershell
# Open workspace
code ai-devex.code-workspace

# Set GitHub token
$env:GITHUB_TOKEN = "ghp_your_token"

# Use MCP servers in Copilot Chat
# Ctrl+I or Cmd+I to open chat
```

## 🛠️ Technology Stack

- **Languages**: C# (.NET 9/10), Python 3.11+, PowerShell Core
- **AI Platforms**: GitHub Models, GitHub Copilot, Model Context Protocol (MCP)
- **Development**: VS Code, GitHub Codespaces, Dev Containers
- **Tools**: GitHub Spec Kit, .NET Aspire CLI, Azure Developer CLI
- **Package Managers**: dotnet, uv, npm

## 🤝 Contributing

Contributions are welcome! This repository demonstrates best practices for:
- AI-assisted development workflows
- Specification-driven development
- Custom GitHub Copilot agent creation
- Development environment standardization

### Adding New Agents

1. Create agent file in `.github/agents/[agent-name].md`
2. Use YAML frontmatter with `handoffs` field
3. Document agent responsibilities and capabilities
4. Update `.github/agents/README.md` with agent information

### Adding Copilot Instructions

1. Create instruction file in `copilot-instructions/[tool-name].md`
2. Follow format in `copilot-instructions/README.md`
3. Include version information, examples, and DO/DON'T patterns
4. Keep timestamp and security status current

## 📖 Best Practices

### Command Line
- **Prefer PowerShell Core** for cross-platform compatibility
- Use built-in tools (`dotnet new`, `npm init`) over manual file creation

### Development Environment
- Keep dev container in sync with development environment
- Apply changes to both local and container configurations

### Documentation
- Document user corrections in standardized format
- Update relevant docs when making changes
- Include examples and references

### Security
- Never commit secrets to source control
- Use `dotnet user-secrets` for sensitive configuration
- Use environment variables for MCP server tokens
- Check dependencies for vulnerabilities before adding

## 📄 License

This project demonstrates various open-source tools and practices. See individual component licenses:
- GitHub Spec Kit: [MIT License](https://github.com/github/spec-kit/blob/main/LICENSE)
- .NET: [MIT License](https://github.com/dotnet/runtime/blob/main/LICENSE.TXT)

## 🔗 Resources

- **GitHub Spec Kit**: https://github.com/github/spec-kit
- **GitHub Models**: https://docs.github.com/github-models
- **GitHub Copilot**: https://github.com/features/copilot
- **Model Context Protocol**: https://spec.modelcontextprotocol.io/
- **.NET Aspire**: https://learn.microsoft.com/dotnet/aspire
- **Dev Containers**: https://containers.dev

## 🆘 Support

For questions or issues:
1. Check the [documentation](.github/agents/README.md)
2. Review [agents.md](agents.md) for guidelines
3. Open an issue on GitHub
4. Consult agent-specific documentation in `.github/agents/`

---

**Built with ❤️ using GitHub Copilot and AI-assisted development practices**
