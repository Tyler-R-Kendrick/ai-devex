# AI DevEx - AI Chat Application

An AI chat application with custom data support, built with ASP.NET Core and Blazor, featuring GitHub Copilot integration with Model Context Protocol (MCP) servers.

## Features

- **AI Chat with Custom Data** - Chat with AI models using your own data
- **GitHub Models Integration** - Powered by GitHub Models API
- **Vector Store** - Custom JSON-based vector storage
- **SQLite Database** - Efficient data ingestion caching
- **Blazor UI** - Modern, responsive web interface
- **MCP Server Support** - Enhanced GitHub Copilot capabilities

## Getting Started

### Quick Start

1. **Open the Workspace:**
   ```powershell
   code ai-devex.code-workspace
   ```

2. **Configure GitHub Token for MCP:**
   ```powershell
   $env:GITHUB_TOKEN = "ghp_your_token"
   ```

3. **Configure GitHub Models Token:**
   ```powershell
   cd ChatApp
   dotnet user-secrets set GitHubModels:Token YOUR-TOKEN
   ```

4. **Run the Application:**
   ```powershell
   dotnet run --project ChatApp
   ```

For detailed setup instructions, see [QUICKSTART.md](QUICKSTART.md).

## VS Code Workspace with MCP Servers

This repository includes a pre-configured VS Code workspace with three MCP servers for enhanced GitHub Copilot Chat capabilities:

### 🎭 Playwright MCP Server
Browser automation, web scraping, and UI testing capabilities.

### 🐙 GitHub MCP Server  
Access GitHub repositories, issues, PRs, and code search directly through Copilot Chat.

### 📚 Microsoft Docs MCP Server
Query Microsoft Learn and official documentation for .NET, Azure, and more.

**Learn more:** [WORKSPACE.md](WORKSPACE.md)

## Project Structure

```
ai-devex/
├── ChatApp/                    # Main ASP.NET Core application
│   ├── Components/            # Blazor components
│   ├── Services/              # Business logic and AI services
│   └── wwwroot/               # Static files
├── .devcontainer/             # Dev container configuration
├── ai-devex.code-workspace    # VS Code workspace with MCP servers
├── WORKSPACE.md               # Workspace documentation
├── QUICKSTART.md              # Quick start guide
└── agents.md                  # AI agent guidelines
```

## Documentation

- **[QUICKSTART.md](QUICKSTART.md)** - Quick start guide for the workspace and MCP servers
- **[WORKSPACE.md](WORKSPACE.md)** - Detailed workspace and MCP server documentation  
- **[agents.md](agents.md)** - Guidelines for AI agents working on this project
- **[ChatApp/README.md](ChatApp/README.md)** - ChatApp-specific documentation

## Requirements

- **.NET 9.0 SDK** or later
- **Node.js** (for MCP servers via npx)
- **VS Code** with recommended extensions
- **GitHub Personal Access Token** (for GitHub Models and MCP)

## MCP Server Usage Examples

With the workspace open and MCP servers configured, try these in Copilot Chat:

```
Using Playwright, navigate to example.com and take a screenshot

Using GitHub, show me recent issues in this repository

Using Microsoft Docs, explain ASP.NET Core middleware
```

## Building and Testing

```powershell
# Build the project
dotnet build ChatApp/ChatApp.csproj

# Run with hot reload
dotnet watch run --project ChatApp

# Run in VS Code
Press F5 (Debug → Start Debugging)
```

## Development Environment

### Dev Container

This project includes a dev container configuration with:
- .NET 9.0 SDK
- PowerShell Core
- Azure CLI
- GitHub CLI
- Docker-in-Docker

Open in dev container: Command Palette → "Dev Containers: Reopen in Container"

### VS Code Workspace

The workspace includes:
- Pre-configured MCP servers for Copilot Chat
- Build and debug tasks
- Recommended extensions
- Optimized .NET settings

## Contributing

When contributing to this project:

1. Follow the guidelines in [agents.md](agents.md)
2. Use PowerShell Core for CLI commands
3. Keep dev container in sync with environment changes
4. Make minimal, focused changes
5. Test with existing infrastructure

## Security

- Never commit secrets or tokens to source control
- Use .NET User Secrets for sensitive configuration
- Use environment variables for MCP server tokens
- Review [WORKSPACE.md](WORKSPACE.md) for security best practices

## License

See the [LICENSE](LICENSE) file for details.

## Learn More

- [GitHub Models](https://github.com/marketplace/models)
- [Model Context Protocol](https://spec.modelcontextprotocol.io/)
- [ASP.NET Core Documentation](https://learn.microsoft.com/aspnet/core)
- [Blazor Documentation](https://learn.microsoft.com/aspnet/core/blazor)
