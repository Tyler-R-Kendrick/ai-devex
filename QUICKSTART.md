# Quick Start: AI DevEx Workspace

## Opening the Workspace

```powershell
# Open in VS Code
code ai-devex.code-workspace
```

## First Time Setup

### 1. Install Recommended Extensions
When you open the workspace, VS Code will prompt you to install recommended extensions. Click "Install All" or install them manually:
- GitHub Copilot
- GitHub Copilot Chat  
- C# Dev Kit
- C# for VS Code
- Windows AI Studio
- Prompty
- Markdown Lint

### 2. Configure GitHub Token (Required for GitHub MCP Server)

**Windows (PowerShell):**
```powershell
$env:GITHUB_TOKEN = "ghp_your_token_here"
```

**Linux/Mac (Bash):**
```bash
export GITHUB_TOKEN="ghp_your_token_here"
```

**Create Token:** https://github.com/settings/tokens

### 3. Configure ChatApp (Optional for running the app)

```powershell
cd ChatApp
dotnet user-secrets set GitHubModels:Token YOUR-TOKEN
```

## Using MCP Servers in Copilot Chat

Once configured, open Copilot Chat (Ctrl+I or Cmd+I on Mac) and try:

### Playwright Examples
```
Using Playwright, navigate to github.com and take a screenshot
Using Playwright, test if the page loads correctly
```

### GitHub Examples
```
Using GitHub, show me recent issues in this repository
Using GitHub, search for code using "dotnet" in this org
Using GitHub, create a summary of the latest PR
```

### Microsoft Docs Examples
```
Using Microsoft Docs, explain ASP.NET Core middleware
Using Microsoft Docs, what's new in .NET 9?
Using Microsoft Docs, how do I use dependency injection?
```

## Building and Running

### From VS Code
- Press `F5` to build and debug
- Or use Terminal → Run Build Task (Ctrl+Shift+B)

### From Command Line
```powershell
# Build
dotnet build ChatApp/ChatApp.csproj

# Run
dotnet run --project ChatApp

# Run with hot reload
dotnet watch run --project ChatApp
```

## Workspace Features

### Configured MCP Servers
✓ **Playwright** - Browser automation and testing  
✓ **GitHub** - Repository and API access  
✓ **Microsoft Docs** - Documentation queries  

### Configured Settings
✓ Format on save enabled  
✓ .NET build/bin folders excluded from view  
✓ Default solution set to ChatApp  

### Configured Tasks
✓ Build task (Ctrl+Shift+B)  
✓ Publish task  
✓ Watch task (hot reload)  

### Launch Configurations
✓ .NET Core web debugging with auto browser launch

## Troubleshooting

### MCP Servers Not Working
1. Ensure Node.js is installed: `node --version`
2. Check GitHub token is set: `echo $env:GITHUB_TOKEN`
3. Restart VS Code
4. Check Output panel: View → Output → "GitHub Copilot Chat"

### Build Errors
1. Restore packages: `dotnet restore ChatApp/ChatApp.csproj`
2. Clean build: `dotnet clean ChatApp/ChatApp.csproj`
3. Check .NET version: `dotnet --version` (should be 9.0+)

## More Information

See [WORKSPACE.md](WORKSPACE.md) for detailed documentation.
