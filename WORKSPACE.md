# VS Code Workspace Configuration

This workspace is configured with Model Context Protocol (MCP) servers to enhance GitHub Copilot Chat capabilities.

## MCP Servers Configured

### 1. Playwright MCP Server
Provides browser automation capabilities through Playwright.

**Package:** `@modelcontextprotocol/server-playwright`

**Features:**
- Browser automation
- Web scraping
- UI testing capabilities
- Screenshot and PDF generation

### 2. GitHub MCP Server
Provides access to GitHub repositories, issues, pull requests, and more.

**Package:** `@modelcontextprotocol/server-github`

**Features:**
- Repository management
- Issue and PR operations
- Code search
- GitHub API integration

**Setup Required:**
1. Create a GitHub Personal Access Token at https://github.com/settings/tokens
2. Set the environment variable:
   ```powershell
   $env:GITHUB_TOKEN = "ghp_your_token_here"
   ```
   Or on Linux/Mac:
   ```bash
   export GITHUB_TOKEN="ghp_your_token_here"
   ```

### 3. Microsoft Docs/Learn Server
Provides access to Microsoft documentation using the fetch MCP server.

**Package:** `@modelcontextprotocol/server-fetch`

**Features:**
- Fetch content from learn.microsoft.com
- Access official Microsoft documentation
- Query docs.microsoft.com resources

**Configuration:**
- Restricted to `learn.microsoft.com` and `docs.microsoft.com` domains for security

## Getting Started

### 1. Install MCP Servers

The MCP servers will be automatically installed when first used through `npx`. However, you can pre-install them globally:

```powershell
npm install -g @modelcontextprotocol/server-playwright
npm install -g @modelcontextprotocol/server-github
npm install -g @modelcontextprotocol/server-fetch
```

### 2. Configure GitHub Token

For the GitHub MCP server to work, you need to set up your GitHub token:

```powershell
# Windows/PowerShell
$env:GITHUB_TOKEN = "ghp_your_token_here"

# Or add to your PowerShell profile for persistence:
# Add-Content $PROFILE "`n`$env:GITHUB_TOKEN = 'ghp_your_token_here'"
```

### 3. Open the Workspace

Open the workspace file in VS Code:

```powershell
code ai-devex.code-workspace
```

### 4. Install Recommended Extensions

VS Code will prompt you to install recommended extensions. Accept the prompt to install:
- GitHub Copilot
- GitHub Copilot Chat
- C# Dev Kit
- C# for VS Code
- Windows AI Studio
- Prompty
- Markdown Lint

## Using MCP Servers with GitHub Copilot Chat

Once configured, you can use the MCP servers in GitHub Copilot Chat:

1. Open Copilot Chat (Ctrl+I or Cmd+I)
2. The MCP servers will be available as context sources
3. Ask questions like:
   - "Using Playwright, navigate to example.com and take a screenshot"
   - "Using GitHub, show me recent issues in this repository"
   - "Using Microsoft Docs, explain how ASP.NET Core dependency injection works"

## Workspace Features

### Build and Debug Tasks

The workspace includes pre-configured tasks:
- **Build:** Build the ChatApp project
- **Publish:** Publish the ChatApp project for deployment
- **Watch:** Run the app with hot reload

### Launch Configuration

Press F5 to start debugging the ChatApp with automatic browser launch.

## Troubleshooting

### MCP Server Not Working

1. **Check Node.js Installation:**
   ```powershell
   node --version
   npm --version
   ```

2. **Verify GitHub Token:**
   ```powershell
   # PowerShell
   $env:GITHUB_TOKEN

   # Bash
   echo $GITHUB_TOKEN
   ```

3. **Check VS Code Output:**
   - Open Output panel (Ctrl+Shift+U)
   - Select "GitHub Copilot Chat" from dropdown
   - Look for MCP-related errors

### Extensions Not Loading

1. Reload VS Code: Ctrl+Shift+P → "Developer: Reload Window"
2. Check extension install status in Extensions panel
3. Ensure you have the latest VS Code version

## Security Notes

- **GitHub Token:** Never commit your GitHub token to source control
- **Environment Variables:** Use environment variables for sensitive data
- **Domain Restrictions:** The Microsoft Docs server is restricted to official Microsoft domains
- **Token Scopes:** Only grant necessary permissions to your GitHub token

## References

- [Model Context Protocol Specification](https://spec.modelcontextprotocol.io/)
- [MCP Servers Repository](https://github.com/modelcontextprotocol/servers)
- [VS Code Multi-Root Workspaces](https://code.visualstudio.com/docs/editor/multi-root-workspaces)
- [GitHub Copilot Documentation](https://docs.github.com/copilot)
